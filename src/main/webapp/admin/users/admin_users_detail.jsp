<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>

 /* 리뷰 탭 내용 높이 고정 + 내부 스크롤 */
  #home .container-fluid {
    max-height: 700px;   /* 원하는 높이 */
  }

  /* 카드 높이 일정하게 맞추기 (선택사항) */
  #home .card {
  	min-height: 230px;
    height: auto;       /* 카드 높이 고정 */
    
  }

  #home .card-body {
    overflow: hidden;
  }
  
  /* 리뷰 내용 기본 스타일 (3줄 제한) */
  .review-content {
    display: -webkit-box;
    -webkit-line-clamp: 3;       /* 표시할 최대 줄 수 */
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    transition: all 0.3s ease;
    cursor: pointer;
  }

  /* 펼쳐진 상태 */
  .review-content.expanded {
    -webkit-line-clamp: unset;
    overflow: visible;
  }

  /* “더보기” 텍스트 버튼 */
  .more-toggle {
    color: #007bff;
    font-size: 13px;
    cursor: pointer;
    display: inline-block;
    margin-top: 5px;
  }
  .more-toggle:hover {
    text-decoration: underline;
  }
</style>
<script>
document.addEventListener("DOMContentLoaded", () => {
  // 모든 리뷰 본문을 순회
  document.querySelectorAll(".review-content").forEach(content => {
    const toggle = content.nextElementSibling; // 더보기 버튼(span)

    // 실제 텍스트 길이 판단 (100자 이상이면 버튼 표시)
    if (content.textContent.trim().length > 100) {
      toggle.style.display = "inline-block";
    } else {
      toggle.style.display = "none"; // 짧으면 숨김
    }
  });
});

function toggleContent(el) {
  // 클릭된 요소가 span이면 바로 위의 p 선택
  const content = el.previousElementSibling?.classList.contains('review-content')
    ? el.previousElementSibling
    : el.classList.contains('review-content')
    ? el
    : null;

  if (!content) return;

  content.classList.toggle('expanded');

  // "더보기" ↔ "접기" 전환
  if (content.classList.contains('expanded')) {
    el.textContent = "접기";
  } else {
    el.textContent = "더보기";
  }
}
</script>


<main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
             
                <div class="col-md-15 mb-13">
                  <div class="card shadow">
                    <div class="card-body">
                      <ul class="nav nav-tabs mb-3" id="myTab" role="tablist">
                        
                        <li class="nav-item">
                          <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="true">Profile</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="false">Review</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Order</a>
                        </li>
                      </ul>
                      <div class="tab-content" id="myTabContent">
                        
                        <!-- 프로필 정보 -->
                        <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab"> 
                        	
			                  <div class="row mt-5 align-items-center">
			                    <div class="col-md-3 text-center mb-5">
			                      <div class="avatar avatar-xl">
			                        <img src="${users_vo.u_profileimg_url }" alt="..." class="avatar-img rounded-circle">
			                      </div>
			                    </div>
			                    <div class="col">
			                      <div class="row align-items-center">
			                        <div class="col-md-7">
			                          <h4 class="mb-1">일련변호  : ${users_vo.u_id }</h4>
			                          <h4 class="mb-1">닉네임   : ${users_vo.u_nickname }</h4>
			                       
			                        </div>
			                      </div>
			                      
			                    </div>
			                  </div>
			                  <hr class="my-4">
			                  <div class="card-deck">
				                <!--  -->
				                <div class="card shadow mb-4">
				                  <div class="card-header">
				                    <strong class="card-title">기본 정보</strong>
				                  </div>
				                  <div class="card-body">
				                    <form>
				                      <div class="form-row">
				                        <div class="form-group col-md-6">
				                          <label for="inputEmail4">Email</label>
				                          <p class="form-control-plaintext">${users_vo.u_email}</p>
				                        </div>
				                        <div class="form-group col-md-6">
				                          <label for="inputPassword4">phone</label>
				                          <p class="form-control-plaintext">${users_vo.u_phone}</p>
				                        </div>
				                      </div>
				                      
				                      <!-- 주소 & 성별 -->
				                      <div class="form-row">
					                      <div class="form-group col-md-6">
					                        <label for="inputAddress">Address</label>
					                        <p class="form-control-plaintext">${users_vo.u_loc}</p>
					                      </div>
				                        <!-- 성별 -->
								        <div class="form-group col-md-6">
								          <label class="text small d-block">성별</label>
								          <c:choose>
								            <c:when test="${users_vo.u_gender eq '남'}">
								              <span class="form-control-plaintext">남성</span>
								            </c:when>
								            <c:when test="${users_vo.u_gender eq '여'}">
								              <span class="form-control-plaintext">여성</span>
								            </c:when>
								            <c:otherwise>
								              <span class="badge badge-secondary">정보 없음</span>
								            </c:otherwise>
								          </c:choose>
								        </div>
							         </div>
							         
							         <!-- 활동 상태&생년월일 -->
				                      <div class="form-row">
				                      	<div class="form-group col-md-6">
					                        <label for="inputAddress">활동 상태</label>
					                        <p class="form-control-plaintext">${users_vo.u_status}</p>
					                    </div>
					                    <div class="form-group col-md-6">
					                        <label for="inputAddress">생년월일</label>
					                        <p class="form-control-plaintext">
												<fmt:formatDate value="${users_vo.u_birth}" pattern="yyyy-MM-dd" />
											</p>
					                    </div>
				                      </div>
				                      
				                      <!-- 가입일&수정일 -->
				                      <div class="form-row">
				                      	<div class="form-group col-md-6">
					                        <label for="inputAddress">가입일</label>
					                        <p class="form-control-plaintext">
												<fmt:formatDate value="${users_vo.u_createat}" pattern="yyyy-MM-dd" />
											</p>
					                    </div>
					                    <div class="form-group col-md-6">
					                        <label for="inputAddress">수정일</label>
					                        <p class="form-control-plaintext">
												<fmt:formatDate value="${users_vo.u_updateat}" pattern="yyyy-MM-dd" />
											</p>
					                    </div>
				                      </div>
				                      
				                    </form>
				                  </div>
				                </div>
				                
				                <div class="card shadow mb-4">
				                  <div class="card-header">
				                    <strong class="card-title">계정 정보</strong>
				                  </div>
				                  <div class="card-body">
				                    <form>
				                      <div class="form-row">
				                        <div class="form-group col-md-6">
				                          <label for="inputEmail4">Id</label>
				                          <p class="form-control-plaintext">${users_vo.u_loginid}</p>
				                        </div>
				                        <div class="form-group col-md-6">
				                          <label for="inputPassword4">Password</label>
        								  <p class="form-control-plaintext text-muted">********</p>
				                        </div>
				                      </div>
				                      	<br><br>
				                       <h6 class="text-muted mb-3"><i class="fe fe-settings mr-1 text-secondary"></i> 사용자 설정</h6>
								        <div class="form-row">
					                      <!-- 푸시 알림 -->
								        <div class="col-md-3 mb-3">
								          <label class="text-muted small d-block">푸시 알림</label>
								          <c:choose>
								            <c:when test="${users_vo.u_push_noti eq 'Y'}">
								              <span class="badge badge-success">ON</span>
								            </c:when>
								            <c:otherwise>
								              <span class="badge badge-danger">OFF</span>
								            </c:otherwise>
								          </c:choose>
								        </div>
					                      <!-- 이메일 알림 -->
								        <div class="col-md-3 mb-3">
								          <label class="text-muted small d-block">이메일 알림</label>
								          <c:choose>
								            <c:when test="${users_vo.u_email_noti eq 'Y'}">
								              <span class="badge badge-success">ON</span>
								            </c:when>
								            <c:otherwise>
								              <span class="badge badge-danger">OFF</span>
								            </c:otherwise>
								          </c:choose>
								        </div>
								
								        <!-- SMS 알림 -->
								        <div class="col-md-3 mb-3">
								          <label class="text-muted small d-block">SMS 알림</label>
								          <c:choose>
								            <c:when test="${users_vo.u_sms_noti eq 'Y'}">
								              <span class="badge badge-success">ON</span>
								            </c:when>
								            <c:otherwise>
								              <span class="badge badge-danger">OFF</span>
								            </c:otherwise>
								          </c:choose>
								        </div>
				                      </div>
				                    </form>
				                  </div>
				                </div>
                        	</div>
                        </div>
                        
                        <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab"> 
						        <div class="container-fluid">
						          <div class="row justify-content-center">
						            <div class="col-12">
						              <div class="row align-items-center my-4">
						                <div class="col">
						                  <h2 class="h3 mb-0 page-title">Review</h2>
						                </div>
						                <div class="col-auto">
						                  <button type="button" class="btn btn-secondary"><span class="fe fe-trash fe-12 mr-2"></span>Delete</button>
						                  <button type="button" class="btn btn-primary"><span class="fe fe-filter fe-12 mr-2"></span>Create</button>
						                </div>
						              </div>
						              <div class="row">
						              <!-- 리뷰 가데이터 -->
						              <c:forEach var="r_list" items="${review_list }">
						                <div class="col-md-3">
						                  <div class="card shadow mb-4">
						                    <div class="card-body text-center">
						                      
						                      <div class="card-text my-2 text-left">
						                      
						                        <strong class="card-title my-0">리뷰 점수 ${r_list.b_review_score } </strong>
						                        <p class="small text-muted mb-0 review-content" onclick="toggleContent(this)">
												  ${r_list.b_review_content}
												</p>
												<c:forEach var="img" items="${r_list.imageList}">
										        <img src="${img.r_image_url}" alt="리뷰 이미지" style="width:100px; height:100px;">
										      </c:forEach>
												<span class="more-toggle" onclick="toggleContent(this)">더보기</span>

						                      </div>
						                    </div> <!-- ./card-text -->
						                    <div class="card-footer">
						                      <div class="row align-items-center justify-content-between">
						                        <div class="col-auto">
						                          <small>
						                            <span class="dot dot-lg bg-success mr-3"></span> 작성일 ${ r_list.b_review_createdat} </small>
						                        </div>
						                        <div class="col-auto">
						                          
						                          <div class="file-action">
						                            <button type="button" class="btn btn-link dropdown-toggle more-vertical p-0 text-muted mx-auto" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						                              <span class="text-muted sr-only">Action</span>
						                            </button>
						                            <div class="dropdown-menu m-2">
						                              <a class="dropdown-item" href="#"><i class="fe fe-delete fe-12 mr-4"></i>Delete</a>
						                            </div>
						                          </div>
						                        </div>
						                      </div>
						                    </div> <!-- /.card-footer -->
						                  </div>
						                  
						                </div> <!-- .col -->
						                </c:forEach>
						                
						               
						              </div> <!-- .row -->
						            
						              
						              <nav aria-label="Table Paging" class="my-3">
					                     <ul class="pagination justify-content-end mb-0">
					                        <c:if test="${startPage > 1 }">
					                          <li class="page-item">
					                          	<a class="page-link" href="../admin/admin_users_detail.eum?page=${startPage-1 }&u_id=${users_vo.u_id}#home">&lt;</a>
					                          </li>
					                        </c:if>
					                        <c:forEach var="i" begin="${startPage }" end="${endPage }">
					                          <li class="page-item ${i==curpage?'active':'' }" >
					                          	<a class="page-link" href="../admin/admin_users_detail.eum?page=${i }&u_id=${users_vo.u_id}#home">${i }</a>
					                          </li>
					                        </c:forEach>  
					                        <c:if test="${endPage < totalpage }">
					                          <li class="page-item">
					                          <a class="page-link" href="../admin/admin_users_detail.eum?page=${endPage+1 }&u_id=${users_vo.u_id}#home">&gt;</a>
					                          </li>
					                        </c:if>
					                      </ul>
						                <!-- <ul class="pagination justify-content-end mb-0">
						                  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
						                  <li class="page-item active"><a class="page-link" href="#">1</a></li>
						                  <li class="page-item"><a class="page-link" href="#">2</a></li>
						                  <li class="page-item"><a class="page-link" href="#">3</a></li>
						                  <li class="page-item"><a class="page-link" href="#">Next</a></li>
						                </ul> -->
						              </nav>
						              
						            </div> <!-- .col-12 -->
						          </div> <!-- .row -->
						        </div> <!-- .container-fluid -->
						        <div class="modal fade modal-notif modal-slide" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
						          <div class="modal-dialog modal-sm" role="document">
						            <div class="modal-content">
						              <div class="modal-header">
						                <h5 class="modal-title" id="defaultModalLabel">Notifications</h5>
						                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						                  <span aria-hidden="true">&times;</span>
						                </button>
						              </div>
						              <div class="modal-body">
						                <div class="list-group list-group-flush my-n3">
						                  <div class="list-group-item bg-transparent">
						                    <div class="row align-items-center">
						                      <div class="col-auto">
						                        <span class="fe fe-box fe-24"></span>
						                      </div>
						                      <div class="col">
						                        <small><strong>Package has uploaded successfull</strong></small>
						                        <div class="my-0 text-muted small">Package is zipped and uploaded</div>
						                        <small class="badge badge-pill badge-light text-muted">1m ago</small>
						                      </div>
						                    </div>
						                  </div>
						                  <div class="list-group-item bg-transparent">
						                    <div class="row align-items-center">
						                      <div class="col-auto">
						                        <span class="fe fe-download fe-24"></span>
						                      </div>
						                      <div class="col">
						                        <small><strong>Widgets are updated successfull</strong></small>
						                        <div class="my-0 text-muted small">Just create new layout Index, form, table</div>
						                        <small class="badge badge-pill badge-light text-muted">2m ago</small>
						                      </div>
						                    </div>
						                  </div>
						                  <div class="list-group-item bg-transparent">
						                    <div class="row align-items-center">
						                      <div class="col-auto">
						                        <span class="fe fe-inbox fe-24"></span>
						                      </div>
						                      <div class="col">
						                        <small><strong>Notifications have been sent</strong></small>
						                        <div class="my-0 text-muted small">Fusce dapibus, tellus ac cursus commodo</div>
						                        <small class="badge badge-pill badge-light text-muted">30m ago</small>
						                      </div>
						                    </div> <!-- / .row -->
						                  </div>
						                  <div class="list-group-item bg-transparent">
						                    <div class="row align-items-center">
						                      <div class="col-auto">
						                        <span class="fe fe-link fe-24"></span>
						                      </div>
						                      <div class="col">
						                        <small><strong>Link was attached to menu</strong></small>
						                        <div class="my-0 text-muted small">New layout has been attached to the menu</div>
						                        <small class="badge badge-pill badge-light text-muted">1h ago</small>
						                      </div>
						                    </div>
						                  </div> <!-- / .row -->
						                </div> <!-- / .list-group -->
						              </div>
						              <div class="modal-footer">
						                <button type="button" class="btn btn-secondary btn-block" data-dismiss="modal">Clear All</button>
						              </div>
						            </div>
						          </div>
						        </div>
						        <div class="modal fade modal-shortcut modal-slide" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
						          <div class="modal-dialog" role="document">
						            <div class="modal-content">
						              <div class="modal-header">
						                <h5 class="modal-title" id="defaultModalLabel">Shortcuts</h5>
						                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						                  <span aria-hidden="true">&times;</span>
						                </button>
						              </div>
						              <div class="modal-body px-5">
						                <div class="row align-items-center">
						                  <div class="col-6 text-center">
						                    <div class="squircle bg-success justify-content-center">
						                      <i class="fe fe-cpu fe-32 align-self-center text-white"></i>
						                    </div>
						                    <p>Control area</p>
						                  </div>
						                  <div class="col-6 text-center">
						                    <div class="squircle bg-primary justify-content-center">
						                      <i class="fe fe-activity fe-32 align-self-center text-white"></i>
						                    </div>
						                    <p>Activity</p>
						                  </div>
						                </div>
						                <div class="row align-items-center">
						                  <div class="col-6 text-center">
						                    <div class="squircle bg-primary justify-content-center">
						                      <i class="fe fe-droplet fe-32 align-self-center text-white"></i>
						                    </div>
						                    <p>Droplet</p>
						                  </div>
						                  <div class="col-6 text-center">
						                    <div class="squircle bg-primary justify-content-center">
						                      <i class="fe fe-upload-cloud fe-32 align-self-center text-white"></i>
						                    </div>
						                    <p>Upload</p>
						                  </div>
						                </div>
						                <div class="row align-items-center">
						                  <div class="col-6 text-center">
						                    <div class="squircle bg-primary justify-content-center">
						                      <i class="fe fe-users fe-32 align-self-center text-white"></i>
						                    </div>
						                    <p>Users</p>
						                  </div>
						                  <div class="col-6 text-center">
						                    <div class="squircle bg-primary justify-content-center">
						                      <i class="fe fe-settings fe-32 align-self-center text-white"></i>
						                    </div>
						                    <p>Settings</p>
						                  </div>
						                </div>
						              </div>
						            </div>
						          </div>
						        </div>
						        </div>
						        
                        
                        <!-- 결제 내역 탭 -->
                        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab"> 
                        <h6 class="mb-3">Last payment</h6>
			              <table class="table table-borderless table-striped">
			                <thead>
			                  <tr role="row">
			                    <th>ID</th>
			                    <th>Purchase Date</th>
			                    <th>Total</th>
			                    <th>Payment</th>
			                    <th>Status</th>
			                    <th>결제상태 변경</th>
			                    <th>Action</th>
			                  </tr>
			                </thead>
			                <tbody>
				                <c:forEach begin="1" end="14">
				                  <tr>
				                    <th scope="col">1331</th>
				                    <td>2020-12-26 01:32:21</td>
				                    <td>$16.9</td>
				                    <td>Paypal</td>
				                    <td><span class="dot dot-lg bg-warning mr-2"></span>Due</td>
				                    <td>
		                              <div class="form-group mb-3">
				                        <select class="form-control" id="example-select">
				                          <option>결제완료</option>
				                          <option>결제중</option>
				                          <option>결제취소</option>
				                          <option>환불완료</option>
				                        </select>
				                      </div>
		                            </td>
				                    <td>
				                      <div class="dropdown">
				                        <button class="btn btn-sm dropdown-toggle more-vertical" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				                          <span class="text-muted sr-only">Action</span>
				                        </button>
				                        <div class="dropdown-menu dropdown-menu-right">
				                          <a class="dropdown-item" href="#">Edit</a>
				                          <a class="dropdown-item" href="#">Remove</a>
				                          <a class="dropdown-item" href="#">Assign</a>
				                        </div>
				                      </div>
				                    </td>
				                  </tr>
				                </c:forEach>
			                </tbody>
			              </table>
              			</div>
                      </div>
                    </div>
                  </div>
                </div>
              </div> <!-- .row-->
              
              
            
              
            </div> <!-- /.col-12 -->
          </div> <!-- .row -->
        <!-- .container-fluid -->
        <div class="modal fade modal-notif modal-slide" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="defaultModalLabel">Notifications</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <div class="list-group list-group-flush my-n3">
                  <div class="list-group-item bg-transparent">
                    <div class="row align-items-center">
                      <div class="col-auto">
                        <span class="fe fe-box fe-24"></span>
                      </div>
                      <div class="col">
                        <small><strong>Package has uploaded successfull</strong></small>
                        <div class="my-0 text-muted small">Package is zipped and uploaded</div>
                        <small class="badge badge-pill badge-light text-muted">1m ago</small>
                      </div>
                    </div>
                  </div>
                  <div class="list-group-item bg-transparent">
                    <div class="row align-items-center">
                      <div class="col-auto">
                        <span class="fe fe-download fe-24"></span>
                      </div>
                      <div class="col">
                        <small><strong>Widgets are updated successfull</strong></small>
                        <div class="my-0 text-muted small">Just create new layout Index, form, table</div>
                        <small class="badge badge-pill badge-light text-muted">2m ago</small>
                      </div>
                    </div>
                  </div>
                  <div class="list-group-item bg-transparent">
                    <div class="row align-items-center">
                      <div class="col-auto">
                        <span class="fe fe-inbox fe-24"></span>
                      </div>
                      <div class="col">
                        <small><strong>Notifications have been sent</strong></small>
                        <div class="my-0 text-muted small">Fusce dapibus, tellus ac cursus commodo</div>
                        <small class="badge badge-pill badge-light text-muted">30m ago</small>
                      </div>
                    </div> <!-- / .row -->
                  </div>
                  <div class="list-group-item bg-transparent">
                    <div class="row align-items-center">
                      <div class="col-auto">
                        <span class="fe fe-link fe-24"></span>
                      </div>
                      <div class="col">
                        <small><strong>Link was attached to menu</strong></small>
                        <div class="my-0 text-muted small">New layout has been attached to the menu</div>
                        <small class="badge badge-pill badge-light text-muted">1h ago</small>
                      </div>
                    </div>
                  </div> <!-- / .row -->
                </div> <!-- / .list-group -->
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-block" data-dismiss="modal">Clear All</button>
              </div>
            </div>
          </div>
        </div>
        