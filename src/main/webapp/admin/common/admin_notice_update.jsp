<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>공지사항 수정</title>

  <!-- 💡 Tiny Dashboard CSS -->
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
          <h2 class="h3 mb-3 page-title">공지사항 수정</h2>

          <form method="post" action="admin_notice_update_ok.eum">
            <input type="hidden" name="n_id" value="${vo.n_id}">
            
            <div class="card shadow mb-4">
              <div class="card-header">
                <div class="d-flex justify-content-between align-items-center">
                  <h4 class="mb-0">공지사항 수정하기</h4>
                  <span class="badge badge-success">공개</span>
                </div>
              </div>

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
                  <textarea id="notice_content" name="n_content" class="form-control" rows="20" required>${vo.n_content}</textarea>
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
                    <button type="reset" class="btn btn-outline-danger" onclick="javascript:history.back()">
                      <i class="fe fe-x fe-16 mr-2"></i>취소
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </form>
             <!-- 첨부파일 -->
                <%-- <div class="form-group mt-4">
                  <label for="uploadFile"><strong>첨부파일 (선택)</strong></label>
                  <input type="file" id="uploadFile" name="uploadFile" class="form-control-file">
                  <c:if test="${not empty vo.filename}">
                    <p class="mt-2 text-muted">
                      현재 파일: 
                      <a href="../upload/${vo.filename}" class="text-primary">${vo.filename}</a>
                    </p>
                  </c:if>
                </div>
              </div> --%>
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
