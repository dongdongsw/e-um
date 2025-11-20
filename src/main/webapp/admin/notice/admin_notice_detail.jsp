<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>공지사항</title>
  <link rel="stylesheet" href="../css/simplebar.css">
  <link rel="stylesheet" href="../css/feather.css">
  <link rel="stylesheet" href="../css/daterangepicker.css">
  <link rel="stylesheet" href="../css/app-light.css" id="lightTheme">
  <link rel="stylesheet" href="../css/app-dark.css" id="darkTheme" disabled>
  <link rel="stylesheet" href="../admin/notice/admin_notice.css">
</head>
<body class="light">
  <main role="main" class="main-content">
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-12">
          <h2 class="h3 mb-3 page-title">공지사항 상세보기</h2>
          <!-- 상세 정보 카드 -->
          <div class="card shadow mb-4">
            <div class="card-header notice-header">
              <div class="d-flex justify-content-between align-items-start">
                <h4 class="notice-title">${vo.n_title }</h4>
              </div>
            </div>
            <div class="card-body">
              <!-- 공지사항 내용 -->
              <div class="notice-content">${vo.n_content }</div>
              <!-- 작성 날짜 -->
              <div class="date-info">
				<i class="fe fe-calendar fe-14 mr-1"></i>
				 <fmt:formatDate value="${vo.n_createdAt}" pattern="yyyy-MM-dd" />
			  </div>
            </div>
            <!-- 하단 버튼 -->
            <div class="card-footer">
              <div class="d-flex justify-content-between">
                <button type="button" class="btn btn-secondary" onclick="location.href='admin_notice_list.eum'">
                  <i class="fe fe-list fe-16 mr-2"></i>목록으로
                </button>
                <div>
                  <button type="button" class="btn btn-outline-primary mr-2" onclick="location.href='admin_notice_update.eum?n_id=${vo.n_id}'">
                    <i class="fe fe-edit fe-16 mr-2"></i>수정
                  </button>
                  <button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#deleteModal">
                    <i class="fe fe-trash-2 fe-16 mr-2"></i>삭제
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
  <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="deleteModalLabel">공지사항 삭제</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="닫기">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          정말로 이 공지사항을 삭제하시겠습니까?
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
  <script src="../js/simplebar.min.js"></script>
  <script src="../js/moment.min.js"></script>
  <script src="../js/daterangepicker.js"></script>
  <script src="../js/jquery.stickOnScroll.js"></script>
  <script src="../js/tinycolor-min.js"></script>
  <script src="../js/config.js"></script>
  <script src="../js/apps.js"></script>

  <script>
  $(function() {
    $('#confirmDelete').on('click', function() {
      location.href = 'admin_notice_delete_ok.eum?n_id=${vo.n_id}';
    });
  });
  </script>
</body>
</html>