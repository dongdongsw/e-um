<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <style>
    input[type="search"]:focus::placeholder {
      color: transparent;
      transition: color 0.2s ease;
    }
     .pagination {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 8px;
  margin-top: 35px;
  padding: 12px 0;
  font-family: 'Pretendard', 'Noto Sans KR', sans-serif;
}

/* 기본 숫자 버튼 */
 .pagination a {
  display: inline-flex;
  justify-content: center;
  align-items: center;
  width: 36px;
  height: 36px;
  border-radius: 10px;
  font-size: 15px;
  font-weight: 500;
  text-decoration: none;
  color: #8f82ff; /* ✅ 기본은 연보라색 글씨 */
  transition: all 0.25s ease;
  background-color: transparent;
}

/* hover 시 */
.pagination a:hover {
  background-color: #7453fc;
  color: #fff;
  box-shadow: 0 3px 8px rgba(116, 83, 252, 0.25);
}

/* ✅ 현재 선택된 페이지 (active) */
 .pagination strong {
  display: inline-flex;
  justify-content: center;
  align-items: center;
  width: 36px;
  height: 36px;
  border-radius: 10px;
  font-size: 15px;
  font-weight: 600;
  text-decoration: none;
  background-color: #7453fc; /* 보라색 배경 */
  color: #fff !important; /* ✅ 반드시 흰색으로 표시 */
  box-shadow: 0 4px 12px rgba(116, 83, 252, 0.35);
}

/* 화살표 (<, >) */
 .pagination a:first-child,
.pagination a:last-child {
  font-size: 18px;
  width: 30px;
  height: 30px;
  line-height: 30px;
  border-radius: 8px;
  color: #b2a8ff;
}
/* 화살표 hover 시 */
.pagination a:first-child:hover,
 .pagination a:last-child:hover {
  background-color: #7453fc;
  color: #fff;
}

  </style>
</head>
<body>
	<main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <h2 class="h3 mb-3 page-title">공지사항</h2>
              <!-- 검색 -->
              <div class="row mb-4 items-align-center">
				  <div class="col-12 d-flex align-items-center justify-content-end">
				    <div class="position-relative mr-3" style="width: 300px;">
				      <span class="fe fe-search position-absolute text-muted" style="top: 8px; left: 14px;"></span>
				      <input
				        class="form-control form-control-sm bg-white rounded-pill pl-5"
				        type="search" placeholder="검색어를 입력하세요" style="text-align: center;" aria-label="Search">
				    </div>
				    <button type="button" class="btn" data-toggle="modal" data-target=".modal-slide">
				      <span class="fe fe-filter fe-16 text-muted"></span>
				    </button>
				    <button type="button" class="btn">
				      <a href="admin_notice_insert.eum"><span class="fe fe-edit fe-16 text-muted"></span></a>
				    </button>
				  </div>
				</div>
              <!-- 필터 -->
              <div class="modal fade modal-slide" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="defaultModalLabel">Filters</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="fe fe-x fe-12"></i>
                      </button>
                    </div>
                    <div class="modal-body">
                      <div class="p-2">
                        <div class="form-group my-4">
                          <p class="mb-2"><strong>Regions</strong></p>
                          <select class="form-control select2-multi" id="multi-select2">
                            <optgroup label="Mountain Time Zone">
                              <option value="AZ">Arizona</option>
                              <option value="WY">Wyoming</option>
                            </optgroup>
                            <optgroup label="Central Time Zone">
                              <option value="TN">Tennessee</option>
                              <option value="WI">Wisconsin</option>
                            </optgroup>
                          </select>
                        </div>
                        <div class="form-group my-4">
                          <p class="mb-2">
                            <strong>Payment</strong>
                          </p>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck1">
                            <label class="custom-control-label" for="customCheck1">Paypal</label>
                          </div>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck2">
                            <label class="custom-control-label" for="customCheck2">Credit Card</label>
                          </div>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck1-1" checked>
                            <label class="custom-control-label" for="customCheck1-1">Wire Transfer</label>
                          </div>
                        </div>
                        <div class="form-group my-4">
                          <p class="mb-2">
                            <strong>Types</strong>
                          </p>
                          <div class="custom-control custom-radio">
                            <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input">
                            <label class="custom-control-label" for="customRadio1">End users</label>
                          </div>
                          <div class="custom-control custom-radio">
                            <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input" checked>
                            <label class="custom-control-label" for="customRadio2">Whole Sales</label>
                          </div>
                        </div>
                        <div class="form-group my-4">
                          <p class="mb-2">
                            <strong>Completed</strong>
                          </p>
                          <div class="custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" id="customSwitch1">
                            <label class="custom-control-label" for="customSwitch1">Include</label>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn mb-2 btn-primary btn-block">Apply</button>
                      <button type="button" class="btn mb-2 btn-secondary btn-block">Reset</button>
                    </div>
                  </div>
                </div>
              </div>
              
              
              <!-- 테이블 컬럼 -->
              <table class="table border table-hover bg-white">
                <thead>
                  <tr role="row">
                    <th style="width: 50px;">
                      <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="all">
                        <label class="custom-control-label" for="all"></label>
                      </div>
                    </th>
                    <th style="width: 80px;">번호</th>
                    <th>제목</th>
                    <th style="width: 150px;">작성일</th>
                    <th style="width: 80px;">Action</th>
                  </tr>
                </thead>
                <tbody>
                  <!-- 테이블 데이터 -->
                   <c:forEach var="vo" items="${list}">
	                  <tr>
	                    <td class="align-center">
	                      <div class="custom-control custom-checkbox">
	                        <input type="checkbox" class="custom-control-input" id="check${i}" onclick="event.stopPropagation();">
	                        <label class="custom-control-label" for="check${i}"></label>
	                      </div>
	                    </td>
	                    <td>${vo.n_id }</td>
	                    <td onclick="location.href='admin_notice_detail.eum?n_id=${vo.n_id}'" style="cursor:pointer;">${vo.n_title }</td>
	                    <td>
			              <fmt:formatDate value="${vo.n_createdAt}" pattern="yyyy.MM.dd" />
			            </td>
	                    <td>
	                      <div class="dropdown">
	                        <button class="btn btn-sm dropdown-toggle more-vertical" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                          <span class="text-muted sr-only">Action</span>
	                        </button>
	                        <div class="dropdown-menu dropdown-menu-right">
	                          <a class="dropdown-item" onclick="location.href='admin_notice_update.eum?n_id=${vo.n_id}'">수정</a>
	                          <a class="dropdown-item" href="#">삭제</a>
	                        </div>
	                      </div>
	                    </td>
	                  </tr>
                  </c:forEach>
                </tbody>
              </table>
              
              <!-- pagenations -->
                 <div class="pagination" style="margin-top:20px; text-align:center;">
				  <c:if test="${startPage > 1}">
				    <a href="admin_notice_list.eum?page=${startPage - 10}">&laquo;</a>
				  </c:if>
				  <c:if test="${curpage > 1}">
				    <a href="admin_notice_list.eum?page=${curpage - 1}">&lt;</a>
				  </c:if>
				  <c:forEach var="i" begin="${startPage}" end="${endPage}">
				    <c:choose>
				      <c:when test="${i == curpage}">
				        <strong style="color:#7453fc;">${i}</strong>
				      </c:when>
				      <c:otherwise>
				        <a href="admin_notice_list.eum?page=${i}">${i}</a>
				      </c:otherwise>
				    </c:choose>
				  </c:forEach>
				  <c:if test="${curpage < totalpage}">
				    <a href="admin_notice_list.eum?page=${curpage + 1}">&gt;</a>
				  </c:if>
				  <c:if test="${endPage < totalpage}">
				    <a href="admin_notice_list.eum?page=${startPage + 10}">&raquo;</a>
				  </c:if>
				</div>
            </div>
          </div> 
        </div> 
        </main>
        <script src="../js/jquery.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>