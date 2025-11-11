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

  <!-- 💜 검색창 placeholder 스타일 -->
  <style>
    input[type="search"]:focus::placeholder {
      color: transparent;
      transition: color 0.2s ease;
    }
  </style>
</head>

<body class="light">

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
                  type="search" placeholder="검색어를 입력하세요"
                  style="text-align: center;" aria-label="Search">
              </div>
              <button type="button" class="btn" data-toggle="modal" data-target=".modal-slide">
                <span class="fe fe-filter fe-16 text-muted"></span>
              </button>
              <button type="button" class="btn">
                <span class="fe fe-refresh-ccw fe-16 text-muted"></span>
              </button>
            </div>
          </div>

          <!-- 모달(필터) -->
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
                    <!-- 예시 필터 -->
                    <div class="form-group my-4">
                      <p class="mb-2"><strong>Regions</strong></p>
                      <select class="form-control">
                        <option>Seoul</option>
                        <option>Busan</option>
                        <option>Incheon</option>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn mb-2 btn-primary btn-block">Apply</button>
                  <button type="button" class="btn mb-2 btn-secondary btn-block" data-dismiss="modal">Close</button>
                </div>
              </div>
            </div>
          </div>

          <!-- 테이블 -->
          <table class="table border table-hover bg-white">
            <thead>
              <tr>
                <th><input type="checkbox" id="all"></th>
                <th>ID</th>
                <th>작성일</th>
                <th>제목</th>
                <th>작성자</th>
                <th>상태</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="i" begin="1" end="10">
                <tr onclick="location.href='../notice/detail.eum'" style="cursor:pointer;">
                  <td><input type="checkbox"></td>
                  <td>${i}</td>
                  <td>2025-11-11</td>
                  <td>공지사항 테스트 ${i}</td>
                  <td>관리자</td>
                  <td><span class="dot dot-lg bg-success mr-2"></span></td>
                </tr>
              </c:forEach>
            </tbody>
          </table>

          <!-- 페이지네이션 -->
          <nav aria-label="Table Paging" class="my-3">
            <ul class="pagination justify-content-end mb-0">
              <li class="page-item"><a class="page-link" href="#">Prev</a></li>
              <li class="page-item active"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
          </nav>

        </div>
      </div>
    </div>
  </main>

  <!-- 💡 JS 파일들 (Bootstrap 작동용) -->
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
