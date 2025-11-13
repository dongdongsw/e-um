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

</style>
	 <main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <div class="row">
                <!-- Small table -->
                <div class="col-md-12 my-4">
                  <h2 class="h4 mb-1">셀러 리스트</h2>
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
                            <th>셀러 이름</th>
                            <th>사업자번호</th>
                            <th>연락처</th>
                            <th class="w-24">email</th>
                            <th>가입일</th>
                            <th>셀러 상태</th>
                            <th></th>
                          </tr>
                        </thead>
                        <tbody>
                          <!-- 가데이터 -->
                          <c:forEach var="sellers_list" items="${sellers_list }">
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
						        <c:when test="${not empty sellers_list.u_s_profileimg_url}">
						          <img src="${sellers_list.u_s_profileimg_url}"  alt="프로필 이미지" class="avatar-img rounded-circle">
						        </c:when>
						        <c:otherwise>
									<img src="/e-umProject/admin/img/defaut_profile.jpg" alt="준비중" class="avatar-img rounded-circle">
						        </c:otherwise>
						      </c:choose>
                              </div>
                              
                            </td>
                            <td>
                            	<a href="../admin/admin_seller_detail.eum?u_s_id=${sellers_list.u_s_id}">
                              		<p class="mb-0 text-muted"><strong>${sellers_list.u_s_com }</strong></p>
                              		<small class="mb-0 text-muted">${sellers_list.u_s_id }</small>
                              	</a>
                            </td>
                            <td>
                              <p class="mb-0 text-muted">${sellers_list.u_s_biz_no}</p>
                            </td>
                            <td>
                              <p class="mb-0 text-muted"><a href="#" class="text-muted">${sellers_list.user.u_phone }</a></p>
                            </td>
                            <td class="w-24"><small class="text-muted">${sellers_list.user.u_email }</small></td>
                            <td class="text-muted">
							  <fmt:formatDate value="${sellers_list.u_createat}" pattern="yyyy-MM-dd" />
							</td>
                            <td>
							  <div class="form-group mb-3">
							    <select class="form-control" id="example-select">
							      <option value="active" ${sellers_list.user.u_status eq 'active' ? 'selected' : ''}>활동</option>
							      <option value="warning">경고 처리</option>
							      <option value="inactive" ${sellers_list.user.u_status eq 'inactive' ? 'selected' : ''}>정지 처리</option>
							      <option value="deleted">탈퇴 처리</option>
							    </select>
							  </div>
							</td>

                            <td><button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="text-muted sr-only">Action</span>
                              </button>
                              <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="../admin/admin_seller_detail.eum?u_s_id=${sellers_list.u_s_id}">상세보기</a>
                                <a class="dropdown-item" href="#">삭제</a>
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
                </div> <!-- customized table -->
              </div> <!-- end section -->
            </div> <!-- .col-12 -->
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
        
        
    