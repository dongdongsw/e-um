<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>공지사항 수정</title>
  <link rel="stylesheet" href="../css/simplebar.css">
  <link rel="stylesheet" href="../css/feather.css">
  <link rel="stylesheet" href="../css/daterangepicker.css">
  <link rel="stylesheet" href="../css/app-light.css" id="lightTheme">
  <link rel="stylesheet" href="../css/app-dark.css" id="darkTheme" disabled>
<style>
  .notice-content {
      min-height: 400px;
      padding: 20px;
      background-color: #f8f9fa;
      border-radius: 8px;
    }
   input[type="file"] {
      display: block;
      margin-top: 10px;
    }
</style>
</head>

<body class="light">
  <main role="main" class="main-content">
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-12">
          <h2 class="h3 mb-3 page-title">공지사항 수정</h2>
          <form method="post" action="admin_notice_update_ok.eum">
            <input type="hidden" name="n_id" value="${vo.n_id}">
            <div class="card shadow mb-4">
              <div class="card-body">
                <!-- 제목 -->
                <div class="form-group">
                  <label for="n_title"><strong>제목</strong></label>
                  <input type="text" id="n_title" name="n_title" class="form-control" 
                         value="${vo.n_title}" placeholder="공지 제목을 입력하세요" required>
                </div>
                <!-- 내용 -->
                <div class="form-group mt-4">
                  <label for="n_content"><strong>내용</strong></label>
                  <textarea id="n_content" name="n_content" class="form-control" rows="22" required>${vo.n_content}</textarea>
                </div>
              <!-- 버튼 -->
              <div class="card-footer">
                <div class="d-flex justify-content-between">
                  <button type="button" class="btn btn-secondary" onclick="location.href='admin_notice_list.eum'">
                    <i class="fe fe-list fe-16 mr-2"></i>목록으로
                  </button>
                  <div>
                    <button type="submit" class="btn btn-outline-primary mr-2">
                      <i class="fe fe-save fe-16 mr-2"></i>저장
                    </button>
                    <button type="button" class="btn btn-outline-danger" onclick="location.href='admin_notice_detail.eum?n_id=${vo.n_id}'">
                      <i class="fe fe-x fe-16 mr-2"></i>취소
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </form>
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