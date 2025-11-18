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
    
    button a {
      text-decoration: none !important;
    }
    
    /* 삭제 & 작성 아이콘 hover 효과 */
    .btn:hover {
      background-color: #d4d4d4;
      border-radius: 8px;
      transition: background-color 0.2s ease;
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
      color: #888; 
      transition: all 0.25s ease;
      background-color: transparent;
    }

    .pagination a:hover {
      background-color: #d4d4d4;
      color: #333;
      box-shadow: 0 3px 8px rgba(0, 0, 0, 0.15);
    }

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
      background-color: #d4d4d4; 
      color: #333 !important; 
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
    }

    /* 화살표 */
    .pagination a:first-child,
    .pagination a:last-child {
      font-size: 18px;
      width: 30px;
      height: 30px;
      line-height: 30px;
      border-radius: 8px;
      color: #999;
    }
    
    .pagination a:first-child:hover,
    .pagination a:last-child:hover {
      background-color: #d4d4d4;
      color: #333;
    }
    .table a {
  color: #212529 !important;   /* 번호와 동일한 컬러 */
  text-decoration: none !important; /* 밑줄 제거 */
}
</style>
</head>
<body>
	<main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <h2 class="h3 mb-3 page-title" style="font-size: 35px">공지사항</h2>
              <!-- 검색 -->
               <div class="row mb-4 items-align-center">
				  <div class="col-12 d-flex align-items-center justify-content-between">
				    <div class="position-relative" style="width: 350px;">
				      <span class="fe fe-search position-absolute text-muted" style="top: 8px; left: 14px;"></span>
				      <input
				        class="form-control form-control-sm bg-white rounded-pill pl-5"
				        type="search" placeholder="검색어를 입력하세요" style="text-align: center;" aria-label="Search">
				    </div>
				    <!-- 전체 삭제  -->
				    <div style="margin-top: 10px;">
				      <button type="button" class="btn" data-toggle="modal" data-target="#deleteModal">
				        <span class="fe fe-trash-2 fe-16 text-muted"></span>
				      </button>
				      <a href="admin_notice_insert.eum">
				      <button type="button" class="btn">
				        <span class="fe fe-edit fe-16 text-muted"></span>
				      </button>
				      </a>
				    </div>
				  </div>
				</div>
              <!-- 테이블 -->
              <table class="table border table-hover bg-white">
                <thead>
                  <tr role="row">
                    <th style="width: 50px;">
                      <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="all">
                        <label class="custom-control-label" for="all"></label>
                      </div>
                    </th>
                    <th style="width: 8%;">번호</th>
                    <th style="width: 59%;">제목</th>
                    <th style="width: 13%;">작성자</th>
                    <th style="width: 10%;">작성일</th>
                    <th style="width: 10%;">Action</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="vo" items="${list}">
	                  <tr>
	                    <td class="align-center">
	                      <div class="custom-control custom-checkbox">
	                        <input type="checkbox" class="custom-control-input" id="check${vo.n_id}" value="${vo.n_id}" onclick="event.stopPropagation();">
	                        <label class="custom-control-label" for="check${vo.n_id}"></label>
	                      </div>
	                    </td>
	                    <td>${vo.n_id}</td>
	                    <td style="cursor:pointer;" onclick="location.href='../admin/admin_notice_detail.eum?n_id=${vo.n_id}'">${vo.n_title}</td>
	                    <td style="padding-left: -160px;">관리자</td>
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
	                          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#deleteModal" data-id="${vo.n_id}">삭제</a>
	                        </div>
	                      </div>
	                    </td>
	                  </tr>
                  </c:forEach>
                </tbody>
              </table>
              <!-- 페이지네이션 -->
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
    <!-- 삭제 확인 -->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="deleteModalLabel">공지사항 삭제</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="닫기">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body" id="deleteMessage">
            <!-- 메시지가 JS로 동적으로 변경됨 -->
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            <button type="button" class="btn btn-danger" id="confirmDelete">삭제</button>
          </div>
        </div>
      </div>
    </div>
    
    <script src="../js/jquery.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script>
    $(function() {
      // 전체 선택
      $("#all").on("change", function() {
        const isChecked = $(this).is(":checked");
        $("input[type='checkbox'][id^='check']").prop("checked", isChecked);
      });

      $("input[type='checkbox'][id^='check']").on("change", function() {
        const total = $("input[type='checkbox'][id^='check']").length;
        const checked = $("input[type='checkbox'][id^='check']:checked").length;
        $("#all").prop("checked", total === checked);
      });

      // 삭제 모달 창
      $('#deleteModal').on('show.bs.modal', function() {
        const checkedBoxes = $("input[type='checkbox'][id^='check']:checked");
        const deleteBtn = $('#confirmDelete');
        const messageBox = $('#deleteMessage');

        if (checkedBoxes.length === 0) {
          messageBox.text("삭제할 공지사항을 선택해주세요.");
          deleteBtn.prop('disabled', true);
        } else {
          messageBox.text("정말로 선택한 공지사항을 삭제하시겠습니까?");
          deleteBtn.prop('disabled', false);
        }
      });

      // 삭제
      $('#confirmDelete').on('click', function() {
        const checkedBoxes = $("input[type='checkbox'][id^='check']:checked");
        if (checkedBoxes.length > 0) {
          const ids = checkedBoxes.map(function() { return $(this).val(); }).get();
          location.href = 'admin_notice_delete_ok.eum?n_id=' + ids.join(',');
        }
      });
    });
    </script>
</body>
</html>