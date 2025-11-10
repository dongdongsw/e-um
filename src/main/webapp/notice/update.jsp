<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title></title>
  <link rel="stylesheet" href="../css/notice.css">
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
</head>
<body class="notice-page">
  <div class="notice-container">
    <h1 class="notice-title">공지사항 수정</h1>

    <form method="post" action="update.jsp">
      <label for="title">제목</label>
      <input type="text" id="title" name="title" placeholder="공지 제목을 입력하세요" required>

      <label for="content">내용</label>
      <textarea id="content" name="content" placeholder="공지 내용을 입력하세요" required></textarea>

      <div class="btn-wrap">
        <button type="button" class="btn btn-cancel" onclick="javascript:history.back()">취소</button>
        <button type="submit" class="btn">수정</button>
      </div>
    </form>
  </div>
</body>
</html>