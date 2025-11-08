<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title></title>
  <link rel="stylesheet" href="notice.css">
</head>
<body>
  <div class="notice-container">
    <h1 class="notice-title">공지사항 글쓰기</h1>

    <form method="post" action="insert.do">
      <label for="title">제목</label>
      <input type="text" id="title" name="title" placeholder="공지 제목을 입력하세요" required>

      <label for="content">내용</label>
      <textarea id="content" name="content" placeholder="공지 내용을 입력하세요" required></textarea>

      <div class="btn-wrap">
        <button type="button" class="btn btn-cancel" onclick="location.href='list.jsp'">취소</button>
        <button type="submit" class="btn">등록</button>
      </div>
    </form>
  </div>
</body>
</html>
