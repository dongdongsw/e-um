<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title></title>
  <link rel="stylesheet" href="notice.css">
 <!--  <style>
    @charset "UTF-8";
    body {
      font-family: 'Pretendard', 'Noto Sans KR', sans-serif;
      background-color: #faf9ff;
      margin: 0;
      padding: 0;
    }

    .notice-container {
      width: 900px;
      margin: 60px auto;
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.05);
      padding: 40px;
    }

    .notice-title {
      font-size: 26px;
      font-weight: 700;
      color: #7453fc;
      border-bottom: 3px solid #7453fc;
      padding-bottom: 15px;
      margin-bottom: 30px;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    label {
      font-weight: 600;
      margin-top: 15px;
      margin-bottom: 8px;
      color: #5334d0;
      font-size: 15px;
    }

    input[type="text"],
    textarea {
      font-size: 15px;
      padding: 12px;
      border: 1px solid #ddd;
      border-radius: 6px;
      outline: none;
      transition: 0.2s;
    }

    input[type="text"]:focus,
    textarea:focus {
      border-color: #7453fc;
      box-shadow: 0 0 0 3px rgba(116, 83, 252, 0.1);
    }

    textarea {
      height: 250px;
      resize: vertical;
      line-height: 1.6;
    }

    .btn-wrap {
      margin-top: 30px;
      display: flex;
      justify-content: flex-end;
      gap: 10px;
    }

    .btn {
      background: #7453fc;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 6px;
      font-size: 15px;
      cursor: pointer;
      transition: 0.2s;
    }

    .btn:hover {
      background: #5334d0;
    }

    .btn-cancel {
      background: #bbb;
    }

    .btn-cancel:hover {
      background: #999;
    }
  </style> -->
</head>
<body>
  <div class="notice-container">
    <h1 class="notice-title">공지사항 수정</h1>

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
