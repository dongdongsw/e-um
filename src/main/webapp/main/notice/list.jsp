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
      font-size: 28px;
      font-weight: 700;
      color: #7453fc;
      border-bottom: 3px solid #7453fc;
      padding-bottom: 15px;
      margin-bottom: 40px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      font-size: 15px;
    }
    th, td {
      border-bottom: 1px solid #ddd;
      padding: 14px 10px;
      text-align: left;
    }
    th {
      background-color: #f4f0ff;
      color: #5334d0;
    }
    tr:hover {
      background-color: #f8f5ff;
      cursor: pointer;
    }
    .btn-write {
      display: inline-block;
      background: #7453fc;
      color: white;
      padding: 8px 15px;
      border-radius: 6px;
      text-decoration: none;
      float: right;
      margin-top: -15px;
      margin-bottom: 10px;
    }
    .btn-write:hover {
      background: #5334d0;
    }
  </style> -->
</head>
<body>
  <div class="notice-container">
    <h1 class="notice-title">공지사항</h1>
    <a href="insert.jsp" class="btn-write">글쓰기</a>
    <table>
      <thead>
        <tr>
          <th style="width:60px;">번호</th>
          <th>제목</th>
          <th style="width:150px;">작성일</th>
        </tr>
      </thead>
      <tbody>
        <tr onclick="location.href='detail.jsp?no=1'">
          <td>1</td>
          <td>[안내] 11월 정기 점검 일정</td>
          <td>2025.11.07</td>
        </tr>
        <tr onclick="location.href='detail.jsp?no=2'">
          <td>2</td>
          <td>[업데이트] 신규 결제 기능 추가</td>
          <td>2025.10.31</td>
        </tr>
        <tr onclick="location.href='detail.jsp?no=3'">
          <td>3</td>
          <td>[공지] 추석 연휴 고객센터 운영 안내</td>
          <td>2025.09.10</td>
        </tr>
        <tr onclick="location.href='detail.jsp?no=1'">
          <td>1</td>
          <td>[안내] 11월 정기 점검 일정</td>
          <td>2025.11.07</td>
        </tr>
        <tr onclick="location.href='detail.jsp?no=1'">
          <td>1</td>
          <td>[안내] 11월 정기 점검 일정</td>
          <td>2025.11.07</td>
        </tr>
        <tr onclick="location.href='detail.jsp?no=1'">
          <td>1</td>
          <td>[안내] 11월 정기 점검 일정</td>
          <td>2025.11.07</td>
        </tr>
        <tr onclick="location.href='detail.jsp?no=1'">
          <td>1</td>
          <td>[안내] 11월 정기 점검 일정</td>
          <td>2025.11.07</td>
        </tr>
        <tr onclick="location.href='detail.jsp?no=1'">
          <td>1</td>
          <td>[안내] 11월 정기 점검 일정</td>
          <td>2025.11.07</td>
        </tr>
        <tr onclick="location.href='detail.jsp?no=1'">
          <td>1</td>
          <td>[안내] 11월 정기 점검 일정</td>
          <td>2025.11.07</td>
        </tr>
        <tr onclick="location.href='detail.jsp?no=1'">
          <td>1</td>
          <td>[안내] 11월 정기 점검 일정</td>
          <td>2025.11.07</td>
        </tr>
      </tbody>
    </table>

    
  </div>
</body>
</html>
