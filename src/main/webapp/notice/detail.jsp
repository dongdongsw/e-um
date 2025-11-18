<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<link rel="stylesheet" href="notice.css">

<style>
body {
  background: #f5f5f5;
}

.notice-container {
  width: 1000px;
  margin: 100px auto 100px;
  background: white;
  border-radius: 10px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.08);
}

/* 정보 영역 */
.info-row {
  display: flex;
  background: #fafafa;
  border-bottom: 1px solid #e5e5e5;
}

.info-item {
  flex: 1;
  padding: 15px 40px;
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 14px;
}

.info-item:not(:last-child) {
  border-right: 1px solid #e5e5e5;
}

.info-label {
  font-weight: 600;
  color: #7453fc;
  min-width: 60px;
}

.info-value {
  color: #666;
}

/* 내용 영역 */
.notice-body {
  padding: 50px 40px;
  min-height: 400px;
  background: white;
}
.notice-title.detail {
  word-break: break-word;   /* 단어 단위로 줄바꿈 */
  white-space: normal;      /* 자동 줄바꿈 허용 */
  line-height: 1.6;
}
.notice-content {
  font-size: 16px;
  line-height: 1.9;
  color: #333;
  white-space: pre-line;
}

/* 하단 버튼 영역 */
.notice-footer {
  padding: 25px 40px;
  background: #fafafa;
  border-top: 1px solid #e5e5e5;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.btn-group {
  display: flex;
  gap: 10px;
}

.btn {
  padding: 12px 28px;
  font-weight: 600;
  font-size: 14px;
  border-radius: 6px;
  text-decoration: none;
  transition: all 0.2s;
  display: inline-block;
}

.btn-list {
  background: #6c757d;
  color: white;
}

.btn-list:hover {
  background: #5a6268;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(108, 117, 125, 0.3);
}
</style>
</head>

<body class="notice-page">
<div class="header-text" style="height:140px; background-color:#fff;"></div>

  <div class="notice-container">

    <div class="notice-title detail">${vo.n_title}</div>

    <div class="info-row">
      <div class="info-item">
        <span class="info-label">작성일</span>
        <span class="info-value">
          <fmt:formatDate value="${vo.n_createdAt}" pattern="yyyy.MM.dd" />
        </span>
      </div>
    </div>

    <!-- 본문 내용 -->
    <div class="notice-body">
      <div class="notice-content">${vo.n_content}</div>
    </div>

    <!-- 하단 버튼 -->
    <div class="notice-footer">
      <div></div>
      <div class="btn-group">
        <a href="list.eum" class="btn btn-list">목록</a>
      </div>
    </div>

  </div>

</body>
</html>