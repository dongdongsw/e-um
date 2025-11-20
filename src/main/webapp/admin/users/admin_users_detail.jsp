<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="css/admin-users-detail.css">

<script>
document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll(".review-content-wrapper").forEach(wrapper => {
    const text = wrapper.querySelector(".review-content");
    const toggle = wrapper.querySelector(".more-toggle");
    const imageContainer = wrapper.querySelector(".review-images");

    if (!text || !toggle) return;

    const hasImages = imageContainer?.dataset.hasImg === "true";


    const isOverflowing = text.scrollHeight > text.clientHeight;

    if (isOverflowing || hasImages) {
      toggle.style.display = "inline-block";
    } else {
      toggle.style.display = "none";
    }


    if (!wrapper.classList.contains("expanded") && imageContainer) {
      imageContainer.style.display = "none";
    }
  });
});

function toggleContent(el) {
  const wrapper = el.closest(".review-content-wrapper");
  const imageContainer = wrapper.querySelector(".review-images");
  const text = wrapper.querySelector(".review-content");

  wrapper.classList.toggle("expanded");
  const expanded = wrapper.classList.contains("expanded");

  // 이미지 토글
  if (imageContainer && imageContainer.dataset.hasImg === "true") {
    imageContainer.style.display = expanded ? "flex" : "none";
  }

  // 텍스트 줄 수 토글
  if (expanded) {
    text.style.webkitLineClamp = "unset";
  } else {
    text.style.webkitLineClamp = "3";
  }

  // 버튼 텍스트 전환
  el.textContent = expanded ? "접기" : "더보기";
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
                        	<div class="d-flex justify-content-end">
                        				
                        	 <c:choose>
						        <c:when test="${users_vo.u_status == 'active'}">
						            <span class="status-label status-active mr-2">회원 활동</span>
						        </c:when>
						
						        <c:when test="${users_vo.u_status == 'warning'}">
						        	<span class="status-label status-warning  mr-2">회원 경고</span>
						        </c:when>
						
						        <c:when test="${users_vo.u_status == 'inactive'}">
						            <span class="status-label status-inactive  mr-2" style="font-size:14px;">회원 정지</span>
						        </c:when>
						
						        <c:otherwise>
						            <span class="status-label tatus-active mr-2" style="font-size:14px;">알수없음</span>
						        </c:otherwise>
						    </c:choose>
							    <div class="dropdown">
								    <button class="btn btn-light mb-1 dropdown-toggle" type="button" id="userActionMenu"
								            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								        더보기
								    </button>
								
								    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userActionMenu">
								
								        <!-- 회원 활동 상태로 변경 -->
								        <c:if test="${users_vo.u_status ne 'active'}">
								            <a class="dropdown-item" 
								               href="admin_users_status.eum?u_id=${users_vo.u_id}&status=active">
								               회원 활동
								            </a>
								        </c:if>
								
								        <!-- 회원 정지 상태로 변경 -->
								        <c:if test="${users_vo.u_status ne 'inactive'}">
								            <a class="dropdown-item" 
								               href="admin_users_status.eum?u_id=${users_vo.u_id}&status=inactive">
								               회원 정지
								            </a>
								        </c:if>
								
								        <!-- 회원 경고 상태로 변경 -->
								        <c:if test="${users_vo.u_status ne 'warning'}">
								            <a class="dropdown-item" 
								               href="admin_users_status.eum?u_id=${users_vo.u_id}&status=warning">
								               회원 경고
								            </a>
								        </c:if>
								
								        <div class="dropdown-divider"></div>
								
								        <!-- 회원 삭제 (항상 표시) -->
								        <a class="dropdown-item text-danger" href="../admin/admin_users_delete.eum?u_id=${users_vo.u_id }">
								            회원 삭제
								        </a>
								
								    </div>
								</div>

							</div>

			                  <div class="row mt-5 align-items-center">
			                    <div class="col-md-3 text-center mb-5">
			                      <div class="avatar avatar-xl">
			                        <c:choose>
							        <c:when test="${not empty users_vo.u_profileimg_url }">
							          <img src="${users_vo.u_profileimg_url }" alt="..." class="avatar-img rounded-circle">
							        </c:when>
							        <c:otherwise>
										<img src="/e-umProject/admin/img/defaut_profile.png" alt="준비중" class="avatar-img rounded-circle">
							        </c:otherwise>
							      </c:choose>
			                        
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
			                  <hr class="my-4 ">
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
				                      <div class="form-group col-md-6 status-field">
									
									    
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
						             
						              <div class="row">
						              
						               <!-- 리뷰 없을 때 -->
									    <c:if test="${empty review_list}">
									        <div class="col-12 text-center py-5">
									            <p class="text-muted" style="font-size:16px;"><strong>📭 사용자가 작성한 리뷰가 없습니다.</strong></p>
									        </div>
									    </c:if>
						              
						              <!-- 리뷰 가데이터 -->
						              <c:forEach var="r_list" items="${review_list}">
										  <div class="col-md-3">
										    <div class="card shadow mb-4">
										      <div class="card-body text-left">
										        <strong class="card-title d-block mb-2">⭐ 리뷰 점수 ${r_list.b_review_score}</strong>
										        <div class="review-content-wrapper">
										          <p class="review-content">${r_list.b_review_content}</p>
										           <c:set var="hasImage" value="false" />
														<c:forEach var="img" items="${r_list.imageList}">
														  <c:if test="${img.r_image_url ne null and img.r_image_url ne ''}">
														    <c:set var="hasImage" value="true" />
														  </c:if>
														</c:forEach>
														<c:if test="${hasImage eq true}">
														  <div class="review-images" data-has-img="true" style="display:none;">
														    <c:forEach var="img" items="${r_list.imageList}">
														      <c:if test="${img.r_image_url ne null and img.r_image_url ne ''}">
														        <img src="${img.r_image_url}" alt="리뷰 이미지">
														      </c:if>
														    </c:forEach>
														  </div>
														</c:if>
										          <span class="more-toggle" onclick="toggleContent(this)">더보기</span>
										        </div>
										      </div>
										      <div class="card-footer d-flex justify-content-between align-items-center">
												  <small class="text-muted">작성일 ${r_list.b_review_createdat}</small>
												  <div class="file-action dropdown">
												    <button type="button" class="btn btn-link p-0 text-muted" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												      <i class="fe fe-more-vertical"></i>
												    </button>
												    <div class="dropdown-menu dropdown-menu-right m-2">
												      <a class="dropdown-item" href="../admin/admin_review_delete.eum?u_id=${users_vo.u_id}&b_review_id=${r_list.b_review_id}&redirect=user_detail"><i class="fe fe-delete fe-12 mr-2"></i>리뷰 삭제</a>
												    </div>
												  </div>
												</div>
										    </div>
										  </div>
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
					                          	<a class="page-link " href="../admin/admin_users_detail.eum?page=${i }&u_id=${users_vo.u_id}#home">${i }</a>
					                          </li>
					                        </c:forEach>  
					                        <c:if test="${endPage < totalpage }">
					                          <li class="page-item">
					                          <a class="page-link" href="../admin/admin_users_detail.eum?page=${endPage+1 }&u_id=${users_vo.u_id}#home">&gt;</a>
					                          </li>
					                        </c:if>
					                      </ul>
						               
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
						        
						        </div>
						        
                        
                        <!-- 결제 내역 탭 -->
                        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab"> 
                        	<c:if test="${empty orders_list}"> 
			                		<div class="col-12 text-center py-5"> 
			                			<p class="text-muted" style="font-size:16px;">
			                				<strong>📭 사용자의 거래내역이 없습니다.</strong>
			                			</p> 
			                		</div> 
			                	</c:if>
			                
			                <c:if test="${not empty orders_list}">
			              <table class="table border table-hover bg-white orders-table">

			                <thead>
			                  <tr role="row">
			                    <th>
			                      <div class="custom-control custom-checkbox">
			                        <input type="checkbox" class="custom-control-input" id="all">
			                        <label class="custom-control-label" for="all"></label>
			                      </div>
			                    </th>
			                    <th><strong>ID</strong></th>
			                    <th><strong>판매자</strong></th>
			                    <th><strong>금액</strong></th>
			                    <th><strong>구매일</strong></th>
			                    <th><strong>주문상태</strong></th>
			                    <th><strong>주문번호</strong></th>
			                    <th><strong>결제번호</strong></th>
			                    <th><strong>결제방법</strong></th>
			                    <th><strong>결제상태</strong></th>
			                    <th><strong>환불</strong></th>
			                    <th></th>
			                  </tr>
			                </thead>
			                <tbody>
			                  <c:forEach var="orders_list" items="${orders_list }"> 
			                  <tr>
			                    <td class="align-center">
			                      <div class="custom-control custom-checkbox">
			                        <input type="checkbox" class="custom-control-input">
			                        <label class="custom-control-label"></label>
			                      </div>
			                    </td>
			                    <td class="text-normal">${orders_list.o_id }</td>
			                    <td>
			                    	<a href="../admin/admin_seller_detail.eum?u_s_id=${orders_list.bopvo.bvo.usvo.u_s_id }">
			                    		${orders_list.bopvo.bvo.usvo.u_s_com }
			                    	</a>
			                    </td>
			                    <td class="text-normal">${orders_list.o_total_price }</td>
			                    <td class="text-normal">
			                    	<fmt:formatDate value="${orders_list.o_createdat}" pattern="yyyy-MM-dd" />
			                    </td>
			                    <td class="text-normal">${orders_list.o_status }</td>
			                    <td class="text-normal">${orders_list.pvo.merchant_uid }</td>
			                    <td class="text-normal">${orders_list.pvo.pay_id }</td>
			                    <td class="text-normal">${orders_list.pvo.pay_method }</td>
			                    <td class="text-normal">${orders_list.pvo.status}</td>
			                    <td class="text-normal">
								    <c:if test="${orders_list.pvo.rfvo.rf_status != null}">
								        <button class="btn btn-warning btn-refund"
										    data-rfid="${orders_list.pvo.rfvo.rf_id}"
										    data-reason="${orders_list.pvo.rfvo.rf_reason}"
										    data-amount="${orders_list.pvo.rfvo.rf_amount}"
										    data-status="${orders_list.pvo.rfvo.rf_status}"
										    data-opage="${Ocurpage}"
										    data-uid="${users_vo.u_id }"
										    data-requested="<fmt:formatDate value='${orders_list.pvo.rfvo.rf_requestedat}' pattern='yyyy-MM-dd HH:mm'/>"
										    data-completed="<fmt:formatDate value='${orders_list.pvo.rfvo.rf_completedat}' pattern='yyyy-MM-dd HH:mm'/>">
										    환불보기
										</button>
			
								    </c:if>
								</td>
			
			
			                    
			                    <td>
			                      <div class="dropdown">
			                        <button class="btn btn-sm dropdown-toggle more-vertical" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                          <span class="text-muted sr-only">Action</span>
			                        </button>
			                        <div class="dropdown-menu dropdown-menu-right">
			                          <a class="dropdown-item" href="#">Remove</a>
			                        </div>
			                      </div>
			                    </td>
			                  </tr>
			                  </c:forEach>
			                </c:if>
			                 
			                </tbody>
			              </table>
			              <nav aria-label="Table Paging" class="my-3">
				                <ul class="pagination justify-content-end mb-0">
				                   <c:if test="${OstartPage > 1 }">
				                     <li class="page-item">
				                     	<a class="page-link" href="../admin/admin_users_detail.eum?Opage=${OstartPage-1 }&u_id=${users_vo.u_id}#contact">&lt;</a>
				                     </li>
				                   </c:if>
				                   <c:forEach var="i" begin="${OstartPage }" end="${OendPage }">
				                     <li class="page-item ${i==Ocurpage?'active':'' }" >
				                     	<a class="page-link" href="../admin/admin_users_detail.eum?Opage=${i }&u_id=${users_vo.u_id}#contact">${i }</a>
				                     </li>
				                   </c:forEach>  
				                   <c:if test="${OendPage < Ototalpage }">
				                     <li class="page-item">
				                     <a class="page-link" href="../admin/admin_users_detail.eum?Opage=${OendPage+1 }&u_id=${users_vo.u_id}#contact">&gt;</a>
				                     </li>
				                   </c:if>
				                   </ul>
				              </nav>
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
  
<!-- 환불 상세 모달 -->
<div class="modal fade" id="refundModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-md" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title">환불 상세 정보</h5>
        <button type="button" class="close" data-dismiss="modal">
          <span>&times;</span>
        </button>
      </div>

     <form method="post" action="../admin/admin_refund_users_status.eum">
      <div class="modal-body">

        <!-- 숨겨진 값 (rf_id, page 값 전달용) -->
        <input type="hidden" name="rf_id" id="rf-id">
		<input type="hidden" name="Opage" id="rf-opage">
		<input type="hidden" name="u_id" id="rf-uid">
		
        <p><strong>환불 상태:</strong> 
          <select name="rf_status" id="rf-status-select" class="form-control">
            <option value="환불취소">환불취소</option>
            <option value="환불접수">환불접수</option>
            <option value="환불완료">환불완료</option>
          </select>
        </p>

        <p><strong>환불 금액:</strong> <span id="rf-amount"></span></p>
        <p><strong>환불 사유:</strong> <span id="rf-reason"></span></p>
        <p><strong>요청일:</strong> <span id="rf-requested"></span></p>
        <p><strong>완료일:</strong> <span id="rf-completed"></span></p>

      </div>

      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">변경 저장</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
      </form>

    </div>
  </div>
</div>


<script>
$(document).on("click", ".btn-refund", function () {

    $("#rf-id").val($(this).data("rfid"));
    $("#rf-reason").text($(this).data("reason"));
    $("#rf-amount").text($(this).data("amount"));
    $("#rf-requested").text($(this).data("requested"));
    $("#rf-completed").text($(this).data("completed"));

    $("#rf-uid").val($(this).data("uid"));
    $("#rf-opage").val($(this).data("opage"));

    const status = $(this).data("status");
    $("#rf-status-select").val(status);  

    $("#refundModal").modal("show");
});
$(document).ready(function () {
    // URL에 hash(#contact / #home) 가 있는 경우 해당 탭 활성화
    let hash = window.location.hash;

    if (hash) {
        $('#myTab a[href="' + hash + '"]').tab('show');
    }

    // 탭 클릭 시 hash 업데이트 (뒤로가기 등 브라우저 히스토리 효과)
    $('#myTab a').on('shown.bs.tab', function (e) {
        history.replaceState(null, null, e.target.hash);
    });
});
</script>
        