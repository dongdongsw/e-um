<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>

 /* 리뷰 탭 내용 높이 고정 + 내부 스크롤 */
  #home .container-fluid {
    max-height: 700px;   /* 원하는 높이 */
  }
  
  #profile {
    height: 650px;  /* 고정 높이 */
}
	
	.profile-header {
    min-height: 150px;   /* 원하는 높이로 조절 가능 */
    display: flex;
    align-items: center;
}


  /* 카드 높이 일정하게 맞추기 (선택사항) */
  #home .card {
  	min-height: 230px;
    height: auto;       /* 카드 높이 고정 */
    
  }

  #home .card-body {
    overflow: hidden;
  }
  
.td-title {
    white-space: nowrap;
    max-width: 180px;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>

	<main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
                <div class="col-md-15 mb-13">
                  <div class="card shadow">
                    <div class="card-body ">
                      <ul class="nav nav-tabs mb-3" id="myTab" role="tablist">
                        <li class="nav-item">
                          <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="true">Profile</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Order</a>
                        </li>
                      </ul>
                      <div class="tab-content" id="myTabContent">
                        <!-- 프로필 정보 -->
                        <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab"> 
                        	<div class="d-flex justify-content-end">
							    <a href="../admin/admin_users_detail.eum?u_id=${seller_vo.u_id }" class="btn mb-2 btn-info">회원 정보</a>
							    
							</div>
			                  <div class="row mt-5 align-items-center profile-header">

			                    <div class="col-md-3 text-center mb-5">
			                      <div class="avatar avatar-xl">
			                        <img src="${seller_vo.u_s_profileimg_url }" alt="..." class="avatar-img rounded-circle">
			                      </div>
			                    </div>
			                    <div class="col">
			                      <div class="row align-items-center">
			                        <div class="col-md-7">
			                          <h4 class="mb-1">일련변호  : ${seller_vo.u_s_id }</h4>
			                          <h4 class="mb-1">닉네임   : ${seller_vo.u_s_com }</h4>
			                        </div>
			                      </div>
			                    </div>
			                  </div>
			                  <hr class="my-4">
			                  <div class="card-deck">
			                  
			                  	  <!-- 기본 정보 -->
					              <div class="col-md-4">
					                <div class="card shadow mb-6">
					                  <div class="card-header">
					                    <strong class="card-title">셀러 기본 정보</strong>
					                  </div>
					                  <div class="card-body">
					                    <form>
					                      <div class="form-row">
					                        <div class="form-group col-md-6">
						                        <label for="inputEmail4">사업자 번호</label>
						                        <c:if test="${seller_vo.u_s_biz_no == null}">
						                        	<p class="form-control-plaintext">없음</p>
						                        </c:if>
						                        <c:if test="${seller_vo.u_s_biz_no != null}">
						                          	<p class="form-control-plaintext">${seller_vo.u_s_biz_no}</p>
						                        </c:if>
						                        </div>
						                        <div class="form-group col-md-6">
						                        	<label for="inputAddress">활동 지역</label>
							                        <p class="form-control-plaintext">${seller_vo.u_s_zone}</p>
						                        </div>
					                        </div>
					                      
									         <!-- 활동 상태&생년월일 -->
						                      <div class="form-row">
						                      	<div class="form-group col-md-6">
							                        <label for="inputAddress">경력</label>
							                        <p class="form-control-plaintext">
							                        	<c:if test="${seller_vo.u_s_carrer > 0 }">
							                        		${seller_vo.u_s_carrer}년
							                        	</c:if>	
							                        	<c:if test="${seller_vo.u_s_carrer <= 0 }">
							                        		0년
							                        	</c:if>
													</p>
							                    </div>
						                      	<div class="form-group col-md-6">
							                        <label for="inputAddress"></label>
							                        <p class="form-control-plaintext"></p>
							                    </div>
							                    
					                      </div>
					                      
					                      <!-- 가입일&수정일 -->
					                      <div class="form-row">
					                      	<div class="form-group col-md-6">
						                        <label for="inputAddress">가입일</label>
						                        <p class="form-control-plaintext">
													<fmt:formatDate value="${seller_vo.u_createat}" pattern="yyyy-MM-dd" />
												</p>
						                    </div>
						                    <div class="form-group col-md-6">
						                        <label for="inputAddress">수정일</label>
						                        <p class="form-control-plaintext">
													<fmt:formatDate value="${seller_vo.u_updateat}" pattern="yyyy-MM-dd" />
												</p>
						                    </div>
					                      </div>
					                    </form>
					                  </div>
					                </div>
				                </div>
				                
				                <!-- 컨텐츠 목록 -->
				          		<div class="col-md-8 d-flex" >
					       			<div class="card shadow mb-8 my-10">
					                    <div class="card-body d-flex flex-column">
					                      <h5 class="card-title">컨텐츠 목록</h5>
						                      <table class="table table-hover">
						                        <thead>
						                          <tr >
						                            <th>ID</th>
						                            <th>title</th>
						                            <th>카테고리</th>
						                            <th>수업방식</th>
						                            <th>생성일</th>
						                            <th>Status</th>
						                            <th></th>
						                          </tr>
						                        </thead>
						                        <tbody>
						                          <c:forEach var="board_list" items="${board_list }">
							                          <tr>
							                            <td class="td-title">${board_list.b_id }</td>
							                            <td class="td-title">${board_list.b_title }</td>
							                            <td class="td-title">${board_list.b_type }</td>
							                            <td class="td-title">${board_list.b_prod_on_off}</td>
							                            <td class="td-title">
							                            	<fmt:formatDate value="${board_list.b_createdat }" pattern="yyyy-MM-dd" />
							                            </td>
							                            <td>
														    <span class="badge badge-pill badge-warning"
														          style="font-size: 12px; padding: 4px 8px;">
														        <c:if test="${board_list.b_status == active}">
														            활동중
														        </c:if>
														        <c:if test="${board_list.b_status != active}">
														            비활동
														        </c:if>
														    </span>
														</td>
							                            <!-- <td><span class="badge badge-pill badge-success">Success</span></td> -->
							                            <!-- <td><span class="badge badge-pill badge-danger">Danger</span></td> -->
							                            <td> 
							                            	<a href="../admin/admin_contents_detail?b_id=${board_list.b_id }" class="btn btn-danger" 
															   style="padding: 2px 6px; font-size: 12px;">
															    바로가기
															</a>
							                            </td>
							                          </tr>
							                       </c:forEach>
						                        </tbody>
						                      </table>
						                      <nav aria-label="Table Paging" class="mb-0 text-muted mt-auto">
							                     <ul class="pagination justify-content-end mb-0">
							                        <c:if test="${startPage > 1 }">
							                          <li class="page-item">
							                          	<a class="page-link" href="../admin/admin_sellers_list.eum?page=${startPage-1 }">&lt;</a>
							                          </li>
							                        </c:if>
							                        <c:forEach var="i" begin="${startPage }" end="${endPage }">
							                          <li class="page-item ${i==curpage?'active':'' }" >
							                          	<a class="page-link" href="../admin/admin_sellers_list.eum?page=${i }">${i }</a>
							                          </li>
							                        </c:forEach>  
							                        <c:if test="${endPage < totalpage }">
							                          <li class="page-item">
							                          <a class="page-link" href="../admin/admin_sellers_list.eum?page=${endPage+1 }">&gt;</a>
							                          </li>
							                        </c:if>
							                     </ul>
							                   </nav>
						                    </div>
						                  </div>
					                  </div>    
		                        	</div>
		                        </div>
	                        
                        <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab"> 
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
        