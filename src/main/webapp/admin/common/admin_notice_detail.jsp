<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>공지사항</title>

  <!-- 💡 Tiny Dashboard CSS 연결 -->
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
      padding: 20px;
      background-color: #f8f9fa;
      border-radius: 8px;
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
            <div class="card-header">
              <div class="d-flex justify-content-between align-items-center">
                <h4 class="mb-0">${vo.n_title }</h4>
                <span class="badge badge-success">공개</span>
              </div>
            </div>
            <div class="card-body">
              <!-- 작성자 정보 -->
              <div class="row mb-3 pb-3 border-bottom">
                <div class="col-md-6">
                  <small class="text-muted">작성자</small>
                  <p class="mb-0"><strong>관리자</strong></p>
                </div>
                <div class="col-md-6 text-md-right">
                  <small class="text-muted">${vo.n_createdAt }</small>
                </div>
              </div>

              <!-- 공지사항 내용 -->
              <div class="notice-content">${vo.n_content }</div>

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
            <div class="card-footer">
              <div class="d-flex justify-content-between">
                <button type="button" class="btn btn-secondary" onclick="location.href='admin_notice_list.eum'">
                  <i class="fe fe-list fe-16 mr-2"></i>목록으로
                </button>
                <div>
                  <button type="button" class="btn btn-outline-primary mr-2" onclick="location.href='admin_notice_update.eum?n_id=${vo.n_id}'">
                    <i class="fe fe-edit fe-16 mr-2"></i>수정
                  </button>
                  <button type="button" class="btn btn-outline-danger">
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
</body>
</html>