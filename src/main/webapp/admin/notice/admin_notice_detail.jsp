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
<style>
    input[type="search"]:focus::placeholder {
      color: transparent;
      transition: color 0.2s ease;
    }
    .notice-content {
      min-height: 400px;
      padding: 30px;
      background-color: #f8f9fa;
      border-radius: 8px;
      font-size: 1.05rem;
      line-height: 1.8;
      color: #333;
    }
    .notice-title {
      font-size: 2rem;
      font-weight: 700;
      color: #1a1a1a;
      line-height: 1.5;
      margin-bottom: 0.5rem;
      padding-right: 10px;
      letter-spacing: -0.5px;
    }
    .notice-header {
      padding: 2rem 1.5rem;
      background: #ffffff;
      border-bottom: 3px solid #4e73df;
    }
    .title-label {
      display: inline-block;
      font-size: 0.875rem;
      font-weight: 600;
      color: #4e73df;
      background: #e8eeff;
      padding: 0.25rem 0.75rem;
      border-radius: 4px;
      margin-bottom: 0.75rem;
      letter-spacing: 0.5px;
    }
    .date-info {
      text-align: right;
      padding: 1rem 0;
      color: #6c757d;
      font-size: 0.9rem;
    }
</style>
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
              <!-- 첨부파일 (선택사항) -->
              <div class="mt-4 pt-3 border-top">
                <h6 class="mb-3">첨부파일</h6>
                <ul class="list-unstyled">
                  <li class="mb-2">
                    <i class="fe fe-file-text fe-16 mr-2"></i>
                    <a href="#" class="text-primary">공지사항_첨부파일.pdf</a>
                    <small class="text-muted ml-2">(1.2MB)</small>
                  </li>
                  <li class="mb-2">
                    <i class="fe fe-image fe-16 mr-2"></i>
                    <a href="#" class="text-primary">이미지.jpg</a>
                    <small class="text-muted ml-2">(856KB)</small>
                  </li>
                </ul>
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
          <!-- 이전글/다음글 -->
          <div class="card shadow">
            <div class="card-body p-0">
              <ul class="list-group list-group-flush">
                <li class="list-group-item d-flex justify-content-between align-items-center" style="cursor:pointer;" onclick="location.href='../notice/detail.eum?id=2'">
                  <div>
                    <i class="fe fe-chevron-up fe-16 mr-2 text-muted"></i>
                    <span class="text-muted">이전글</span>
                    <span class="ml-3">이전 공지사항 제목</span>
                  </div>
                  <small class="text-muted">2025-11-10</small>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center" style="cursor:pointer;" onclick="location.href='../notice/detail.eum?id=4'">
                  <div>
                    <i class="fe fe-chevron-down fe-16 mr-2 text-muted"></i>
                    <span class="text-muted">다음글</span>
                    <span class="ml-3">다음 공지사항 제목</span>
                  </div>
                  <small class="text-muted">2025-11-12</small>
                </li>
              </ul>
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