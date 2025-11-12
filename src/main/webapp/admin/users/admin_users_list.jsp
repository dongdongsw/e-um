<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	 <main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <div class="row">
              
                <!-- Small table -->
                <div class="col-md-12 my-4">
                  <h2 class="h4 mb-1">사용자 리스트</h2>
                  <p class="mb-3">Additional table rendering with vertical border, rich content formatting for cell</p>
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
                            <button class="btn btn-primary float-right ml-3" type="button">Add more +</button>
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
                            <th>닉네임</th>
                            <th>주소</th>
                            <th>연락처</th>
                            <th class="w-24">email</th>
                            <th>수정 날짜</th>
                            <th>회원 상태</th>
                            <th>Action</th>
                          </tr>
                        </thead>
                        <tbody>
                          <!-- 가데이터 -->
                          <%-- <c:forEach begin="1" end="8"> --%>
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
                                <img src="${users.u_profileimg_url }" alt="..." class="avatar-img rounded-circle">
                              </div>
                            </td>
                            <td>
                            	<a href="../admin/admin_users_detail.eum?u_id=${users.u_id }">
                              		<p class="mb-0 text-muted"><strong>${users.u_nickname }</strong></p>
                              		<small class="mb-0 text-muted">id:${users.u_loginid }</small>
                              	</a>
                            </td>
                            <td>
                              <p class="mb-0 text-muted">${users.u_loc }</p>
                              <small class="mb-0 text-muted"></small>
                            </td>
                            <td>
                              <p class="mb-0 text-muted"><a href="#" class="text-muted">(+82)${users.u_phone }</a></p>
                              <small class="mb-0 text-muted"></small>
                            </td>
                            <td class="w-24"><small class="text-muted">${users.u_email }</small></td>
                            <td class="text-muted">
                            	<fmt:formatDate value="${users.u_updateat}" pattern="yyyy-MM-dd" />
							</td>
							<td>
                              <div class="form-group mb-3">
		                        <select class="form-control" id="example-select">
		                          <option>활동</option>
		                          <option>경고 처리</option>
		                          <option>정지 처리</option>
		                          <option>탈퇴 처리</option>
		                        </select>
		                      </div>
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
                          
                         <!--  <tr>
                            <td>
                              <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="2786">
                                <label class="custom-control-label" for="2786"></label>
                              </div>
                            </td>
                            <td>
                              <div class="avatar avatar-md">
                                <img src="./assets/avatars/face-1.jpg" alt="..." class="avatar-img rounded-circle">
                              </div>
                            </td>
                            <td>
                              <p class="mb-0 text-muted"><strong>Leblanc, Yoshio V.</strong></p>
                              <small class="mb-0 text-muted">2786</small>
                            </td>
                            <td>
                              <p class="mb-0 text-muted">Fringilla Ornare Placerat Consulting</p>
                              <small class="mb-0 text-muted">287-8300 Nisl. St</small>
                            </td>
                            <td>
                              <p class="mb-0 text-muted"><a href="#" class="text-muted">(899) 881-3833</a></p>
                              <small class="mb-0 text-muted">Papua New Guinea</small>
                            </td>
                            <td class="w-25"><small class="text-muted"> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</small></td>
                            <td class="text-muted">04/05/2019</td>
                            <td><button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="text-muted sr-only">Action</span>
                              </button>
                              <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="#">Edit</a>
                                <a class="dropdown-item" href="#">Remove</a>
                                <a class="dropdown-item" href="#">Assign</a>
                              </div>
                            </td>
                          </tr> -->
                          
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
        
        
    