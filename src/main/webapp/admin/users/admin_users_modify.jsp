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

  /* 카드 높이 일정하게 맞추기 (선택사항) */
  #home .card {
  	min-height: 230px;
    height: auto;       /* 카드 높이 고정 */
    
  }

  #home .card-body {
    overflow: hidden;
  }
 /* 리뷰 내용 영역 (기본: 3줄만 보이기) */
.review-content-wrapper {
  max-height: 120px;                /* 기본 표시 높이 */
  overflow: hidden;
  position: relative;
  transition: max-height 0.4s ease;
}

/* 펼쳐진 상태 */
.review-content-wrapper.expanded {
  max-height: 1000px;               /* 충분히 큰 높이 */
  overflow: visible;
}

/* 본문 텍스트 */
.review-content {
  display: -webkit-box;
  -webkit-line-clamp: 4;            /* 기본 표시 줄 수 */
  -webkit-box-orient: vertical;
  overflow: hidden;
  text-overflow: ellipsis;
  margin-bottom: 10px;
  cursor: pointer;
}

/* 펼쳐진 상태에서는 줄 제한 해제 */
.review-content.expanded {
  -webkit-line-clamp: unset;
}

/* 이미지 영역 */
.review-images {
  display: none;
  margin-top: 10px;
  flex-wrap: wrap;
  gap: 5px;
}
.review-images img {
  width: 80px;
  height: 80px;
  border-radius: 6px;
  object-fit: cover;
  border: 1px solid #eee;
}

/* 펼쳐진 상태일 때만 표시 */
.review-content-wrapper.expanded .review-images {
  display: flex;
}

/* 더보기 버튼 */
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
        