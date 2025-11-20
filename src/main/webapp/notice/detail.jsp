<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<link rel="stylesheet" href="notice.css">
</head>
<body class="notice-page">
	<div class="header-text" style="height: 140px; background-color: #fff;"></div>
	<div class="notice-container">
		<div class="notice-title detail">${vo.n_title}</div>
		<div class="info-row">
			<div class="info-item">
				<span class="info-label">작성일</span> <span class="info-value">
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