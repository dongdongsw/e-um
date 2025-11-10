<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>공지사항 작성</title>
  <link rel="stylesheet" href="../css/notice.css">
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
</head>
<body class="notice-page">
  <div class="notice-container">
    <h1 class="notice-title">공지사항 작성</h1>

    <!-- ✅ JSP에서는 Controller로 데이터 전송 -->
    <form method="post" action="insert_ok.eum">
     <!--  <input type="hidden" name="u_id" value="admin"> -->

      <label for="title">제목</label>
      <input type="text" id="title" name="n_title" placeholder="공지 제목을 입력하세요" required>

      <label for="content">내용</label>
      <textarea id="content" name="n_content" placeholder="공지 내용을 입력하세요" required></textarea>

      <div class="btn-wrap">
        <!-- ✅ 취소 시 다시 JSP로 돌아감 -->
        <button type="button" class="btn btn-cancel" onclick="javascript:history.back()">취소</button>
        <button type="submit" class="btn">등록</button>
      </div>
    </form>
  </div>
</body>
</html>