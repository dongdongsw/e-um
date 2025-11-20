<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="css/admin-seller.css">


	 <main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <div class="row">
                <!-- Small table -->
                <div class="col-md-12 my-1">
                  <div class="d-flex justify-content-between align-items-center mb-2">
	                <div class="page-header-custom">
					    <h2>Seller_List</h2>
					    <p>등록된 모든 셀러 정보를 확인할 수 있습니다.</p>
					</div>
				      <form class="form" method="get" action="admin_sellers_list.eum">
					    <button type="submit">
					        <svg width="17" height="16" fill="none" xmlns="http://www.w3.org/2000/svg">
					            <path d="M7.667 12.667A5.333 5.333 0 107.667 2a5.333 5.333 0 000 10.667zM14.334 14l-2.9-2.9"
					                stroke="currentColor"
					                stroke-width="1.333"
					                stroke-linecap="round"
					                stroke-linejoin="round" />
					        </svg>
					    </button>
					
					    <input class="input"
					           type="text"
					           name="keyword"
					           placeholder="Search..."
					           value="${keyword}" />
					
					    <button type="reset" class="reset">
					        <svg xmlns="http://www.w3.org/2000/svg"
					             fill="none"
					             viewBox="0 0 24 24"
					             stroke="currentColor"
					             stroke-width="2">
					            <path stroke-linecap="round"
					                  stroke-linejoin="round"
					                  d="M6 18L18 6M6 6l12 12" />
					        </svg>
					    </button>
					
					</form>
				</div>
                  <div class="card shadow">
                    <div class="card-body">
                      <!-- table -->
                      <table class="table table-borderless table-hover">
                        <thead>
                          <tr>
                            <th></th>
                            <th></th>
                            <th class="text-dark"><strong>NO</strong></th>
                            <th class="text-dark"><strong>셀러 이름</strong></th>
                            <th class="text-normal"><strong>사업자번호</strong></th>
                            <th class="text-normal"><strong>연락처</strong></th>
                            <th class="w-24 text-normal"><strong>email</strong></th>
                            <th class="text-normal"><strong>가입일</strong></th>
                            <th class="text-normal"><strong></strong></th>
                            <th></th>
                          </tr>
                        </thead>
                        <tbody>
                         
                          <c:forEach var="sellers_list" items="${sellers_list }">
                          <tr>
                            <td></td>
                            
                            <td>
                              <div class="avatar avatar-md">
                                <c:choose>
						        <c:when test="${not empty sellers_list.u_s_profileimg_url}">
						          <img src="${sellers_list.u_s_profileimg_url}"  alt="프로필 이미지" class="avatar-img rounded-circle">
						        </c:when>
						        <c:otherwise>
									<img src="/e-umProject/admin/img/defaut_profile.png" alt="준비중" class="avatar-img rounded-circle">
						        </c:otherwise>
						      </c:choose>
                              </div>
                              
                            </td> 
                            
                            <td>
                            	<p class="mb-0 text-normal">${sellers_list.u_s_id }</p>
                            </td>
                            
                            <td>
                            	<a href="../admin/admin_seller_detail.eum?u_s_id=${sellers_list.u_s_id}">
                              		<p class="mb-0 text-normal">${sellers_list.u_s_com }</p>
                              	</a>
                            </td>
                            <td>
                              <p class="mb-0 text-normal">${sellers_list.u_s_biz_no}</p>
                            </td>
                            <td>
                              <p class="mb-0 text-normal"><a href="../admin/admin_seller_detail.eum?u_s_id=${sellers_list.u_s_id}" class="text-normal">${sellers_list.user.u_phone }</a></p>
                            </td>
                            <td class="w-24"><small class="text-normal">${sellers_list.user.u_email }</small></td>
                            <td class="text-normal">
							  <fmt:formatDate value="${sellers_list.u_createat}" pattern="yyyy-MM-dd" />
							</td>
                            
							<td>
							    <c:choose>
							        <c:when test="${sellers_list.user.u_status == 'active'}">
							        	<span class="dot dot-lg bg-primary mr-2"></span>
							        </c:when>
							
							        <c:when test="${sellers_list.user.u_status == 'warning'}">
							        	<span class="dot dot-lg bg-warning mr-2"></span>
							        </c:when>
							
							        <c:when test="${sellers_list.user.u_status == 'inactive'}">
							        	<span class="dot dot-lg bg-danger mr-2"></span>
							        </c:when>
							
							        <c:otherwise>
							            <span class="badge badge-secondary p-2" style="font-size:14px;">알수없음</span>
							        </c:otherwise>
							    </c:choose>
							</td>
                            <td><button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="text-muted sr-only">Action</span>
                              </button>
                              <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="../admin/admin_seller_detail.eum?u_s_id=${sellers_list.u_s_id}">상세보기</a>
                                <a class="dropdown-item" href="../admin/admin_seller_delete.eum?page=${curpage}&u_s_id=${sellers_list.u_s_id}&keyword=${keyword}">삭제</a>
                              </div>
                            </td>
                          </tr>
                          </c:forEach>
                          
                        </tbody>
                      </table>
                      <nav aria-label="Table Paging" class="mb-0 text-muted">
                        <ul class="pagination justify-content-end mb-0">
                        <c:if test="${startPage > 1 }">
                          <li class="page-item">
                          	<a class="page-link" href="../admin/admin_sellers_list.eum?page=${startPage-1 }&keyword=${keyword}">&lt;</a>
                          </li>
                        </c:if>
                        <c:forEach var="i" begin="${startPage }" end="${endPage }">
                          <li class="page-item ${i==curpage?'active':'' }" >
                          	<a class="page-link" href="../admin/admin_sellers_list.eum?page=${i }&keyword=${keyword}">${i }</a>
                          </li>
                        </c:forEach>  
                        <c:if test="${endPage < totalpage }">
                          <li class="page-item">
                          <a class="page-link" href="../admin/admin_sellers_list.eum?page=${endPage+1 }&keyword=${keyword}">&gt;</a>
                          </li>
                        </c:if>
                        </ul>
                      </nav>
                    </div>
                  </div>
                </div> <!-- customized table -->
              </div> <!-- end section -->
            </div> <!-- .col-12 -->
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
        
<script type="text/javascript">

document.querySelector(".form .reset").addEventListener("click", function(e){
    e.preventDefault();  

    const input = document.querySelector(".input");
    input.value = "";
    input.focus();
});


</script>
    