<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.avatar-md {
  width: 50px;
  height: 50px;
  overflow: hidden;
  border-radius: 50%;
}

.avatar-md .avatar-img {
  width: 100%;
  height: 100%;
  object-fit: cover;      
  border-radius: 50%;   
  display: block;
}

.text-normal {
    color: #4a4a4a !important;
}

</style>
	 <main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <div class="row">
              
                <!-- Small table -->
                <div class="col-md-12 my-1">
                  <h2 class="h4 mb-1">사용자 리스트</h2>
                  <p class="mb-3"> </p>
                  <div class="card shadow">
                    <div class="card-body">
                      <div class="toolbar row mb-3">
                        <div class="col">
                          <form class="form-inline">
                            <div class="form-row">
                              <div class="form-group col-auto">
                                <label for="search" class="sr-only">Search</label>
                                <input type="text" class="form-control" id="search" value="" placeholder="Search">
                              </div>
                              <div class="form-group col-auto ml-3">
                                <label class="my-1 mr-2 sr-only" for="inlineFormCustomSelectPref">Status</label>
                                <select class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
                                  <option selected>Choose...</option>
                                  <option value="1">Processing</option>
                                  <option value="2">Success</option>
                                  <option value="3">Pending</option>
                                  <option value="3">Hold</option>
                                </select>
                              </div>
                            </div>
                          </form>
                        </div>
                        <div class="col ml-auto">
                          <div class="dropdown float-right">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="actionMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Action </button>
                            <div class="dropdown-menu" aria-labelledby="actionMenuButton">
                              <a class="dropdown-item" href="#">Export</a>
                              <a class="dropdown-item" href="#">Delete</a>
                              <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                          </div>
                        </div>
                      </div>
                      
                      <!-- table -->
                      <table class="table table-borderless table-hover">
                        <thead>
                          <tr>
                            <td>
                              <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="all2">
                                <label class="custom-control-label" for="all2"></label>
                              </div>
                            </td>
                            <th></th>
                            <th><strong>NO</strong></th>
                            <th><strong>닉네임</strong></th>
                            <th><strong>ID</strong></th>
                            <th><strong>주소</strong></th>
                            <th><strong>연락처</strong></th>
                            <th class="w-24"><strong>email</strong></th>
                            <th><strong>최근 수정일</strong></th>
                            <th><strong></strong></th>
                            <th></th>
                          </tr>
                        </thead>
                        <tbody>
                        
                        
                          <c:forEach var="users" items="${ users_list}">
                          <tr>
                            <td>
                              <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="2474">
                                <label class="custom-control-label" for="2474"></label>
                              </div>
                            </td>
                            
                            <td>
                              <div class="avatar avatar-md">
                                 <c:choose>
							        <c:when test="${not empty users.u_profileimg_url}">
							           <img src="${users.u_profileimg_url }" alt="..." class="avatar-img rounded-circle">
							        </c:when>
							        <c:otherwise>
										<img src="/e-umProject/admin/img/defaut_profile.png" alt="준비중" class="avatar-img rounded-circle">
							        </c:otherwise>
							      </c:choose>
                              </div>
                            </td>
                            
                            <td>
                            	<a href="../admin/admin_users_detail.eum?u_id=${users.u_id }">
                              		<p class="mb-0 text-normal">${users.u_id }</p>
                              	</a>
                            </td>
                            
                            <td>
                            	<a href="../admin/admin_users_detail.eum?u_id=${users.u_id }">
                              		<p class="mb-0 text-normal">${users.u_nickname }</p>
                              	</a>
                            </td>
                            
                            <td>
                            	<p class="mb-0 text-normal">${users.u_loginid }</p>
                            </td>
                            
                            <td>
                              <p class="mb-0 text-normal">${users.u_loc }</p>
                              <small class="mb-0 text-normal"></small>
                            </td>
                            
                            <td>
                              <p class="mb-0 text-normal"><a href="../admin/admin_users_detail.eum?u_id=${users.u_id }" class="text-normal">(+82)${users.u_phone }</a></p>
                              <small class="mb-0 text-normal"></small>
                            </td>
                            
                            <td class="w-24">
                            	<small class="text-normal">
                            		${users.u_email }
                            	</small>
                            </td>
                            
                            <td class="text-normal">
                            	<fmt:formatDate value="${users.u_updateat}" pattern="yyyy-MM-dd" />
							</td>
							
							<td>
							    <c:choose>
							        <c:when test="${users.u_status == 'active'}">
							        	<span class="dot dot-lg bg-primary mr-2"></span>
							        </c:when>
							
							        <c:when test="${users.u_status == 'warning'}">
							        	<span class="dot dot-lg bg-warning mr-2"></span>
							        </c:when>
							
							        <c:when test="${users.u_status == 'inactive'}">
							        	<span class="dot dot-lg bg-danger mr-2"></span>
							        </c:when>
							
							        <c:otherwise>
							            <span class="badge badge-secondary p-2" style="font-size:14px;">알수없음</span>
							        </c:otherwise>
							    </c:choose>
							</td>


                            <td>
                              <button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="text-muted sr-only">Action</span>
                              </button>
                              <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="../admin/admin_users_detail.eum?u_id=${users.u_id }">프로필</a>
                                <a class="dropdown-item" href="../admin/admin_users_modify.eum?u_id=${users.u_id }">수정하기</a>
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
                          	<a class="page-link" href="../admin/admin_users_list.eum?page=${startPage-1 }">&lt;</a>
                          </li>
                        </c:if>
                        <c:forEach var="i" begin="${startPage }" end="${endPage }">
                          <li class="page-item ${i==curpage?'active':'' }" >
                          	<a class="page-link" href="../admin/admin_users_list.eum?page=${i }">${i }</a>
                          </li>
                        </c:forEach>  
                        <c:if test="${endPage < totalpage }">
                          <li class="page-item">
                          <a class="page-link" href="../admin/admin_users_list.eum?page=${endPage+1 }">&gt;</a>
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
        
        
    