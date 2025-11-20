<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>공지사항 작성</title>
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
          <h2 class="h3 mb-3 page-title">공지사항 작성</h2>
          <!-- 공지사항 작성 -->
          <div class="card shadow mb-4">
            <div class="card-body">
              <form method="post" action="admin_notice_insert_ok.eum">
                <div class="form-group mb-3">
                  <label for="title"><strong>제목</strong></label>
                  <input type="text" id="title" name="n_title" placeholder="공지 제목을 입력하세요" required>
                </div>
                <div class="form-group mb-3">
                  <label for="content"><strong>내용</strong></label>
                  <textarea id="content" name="n_content" placeholder="공지 내용을 입력하세요" required></textarea>
                </div>
				<!-- 첨부 파일 -->
                <div class="form-group mb-3">
                  <label for="upload"><strong>첨부파일</strong></label>
                  <input type="file" id="upload" name="uploadFile" class="form-control" multiple style="height: 50px">
                  <small class="form-text text-muted">※ 여러 파일을 업로드하려면 Ctrl(또는 Command) 키를 누르고 선택하세요.</small>
                </div>
                <div class="btn-wrap">
                  <button type="button" class="btn btn-cancel" onclick="javascript:history.back()">취소</button>
                  <button type="submit" class="btn btn-primary">등록</button>
                </div>
              </form>
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