<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="notice.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
</head>
<body class="notice-page">
	<div class="header-text" style="height: 150px; background-color: #fff;"></div>
	<div class="notice-container">
		<h1 class="notice-title">
			<span>공지사항</span>
		</h1>
		<table>
			<thead>
				<tr>
					<th style="width: 17%;">번호</th>
					<th style="width: 68%">제목</th>
					<th style="width: 15%">작성자</th>
					<th style="width: 10%;">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${list}">
					<tr onclick="location.href='../notice/detail.eum?n_id=${vo.n_id}'">
						<td>${vo.n_id}</td>
						<td>${vo.n_title}<c:if test="${vo.n_createdAt == today}">
								<sup style="color: red; font-weight: bold;">NEW</sup>
							</c:if>
						</td>
						<td>관리자</td>
						<td><fmt:formatDate value="${vo.n_createdAt}"
								pattern="yyyy.MM.dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 페이지네이션 -->
		<div class="pagination">
			<c:if test="${startPage > 1}">
				<a href="list.eum?page=${startPage - 10}">&laquo;</a>
			</c:if>
			<c:if test="${curpage > 1}">
				<a href="list.eum?page=${curpage - 1}">&lt;</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:choose>
					<c:when test="${i == curpage}">
						<strong style="color: #7453fc;">${i}</strong>
					</c:when>
					<c:otherwise>
						<a href="list.eum?page=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${curpage < totalpage}">
				<a href="list.eum?page=${curpage + 1}">&gt;</a>
			</c:if>
			<c:if test="${endPage < totalpage}">
				<a href="list.eum?page=${startPage + 10}">&raquo;</a>
			</c:if>
		</div>
	</div>
</body>
</html>