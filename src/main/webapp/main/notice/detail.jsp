<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title></title>
  <link rel="stylesheet" href="notice.css">
  <!-- <style>
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
    .notice-date {
      color: #999;
      font-size: 14px;
      margin-bottom: 30px;
    }
    .notice-content {
      font-size: 16px;
      line-height: 1.8;
      color: #444;
      white-space: pre-line;
    }
    .btn-back {
      display: inline-block;
      background: #7453fc;
      color: white;
      padding: 10px 18px;
      border-radius: 6px;
      text-decoration: none;
      margin-top: 40px;
      text-align: right;
    }
    .btn-back:hover {
      background: #5334d0;
    }
    .btn-update {
      display: inline-block;
      background: #7453fc;
      color: white;
      padding: 10px 18px;
      border-radius: 6px;
      text-decoration: none;
      margin-top: 40px;
      text-align: right;
    }
    .btn-update:hover {
      background: #5334d0;
    }
    .btn-move{
      text-align: right;
    }
  </style> -->
</head>
<body>
  <div class="notice-container">
    <h1 class="notice-title">[안내] 11월 정기 점검 일정</h1>
    <div class="notice-date">작성일 : 2025.11.07</div>
    <div class="notice-content">
      안정적인 서비스 제공을 위해 정기 점검이 진행됩니다.
      점검 시간 동안 일시적으로 서비스 이용이 제한될 수 있습니다.

      점검 일시: 11월 10일(월) 00:00 ~ 06:00
      점검 내용: 서버 업그레이드 및 보안 패치
    </div>
   <div class="btn-move">
	<a href="update.jsp" class="btn-update">수정</a>
    <a href="list.jsp" class="btn-back">목록</a>
    </div>
  </div>
</body>
</html>
