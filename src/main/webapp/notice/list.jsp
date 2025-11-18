<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>공지사항</title>
  <link rel="stylesheet" href="notice.css">
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
  <style type="text/css">
   .notice-page {
  font-family: 'Pretendard', 'Noto Sans KR', sans-serif;
  background-color: #fff;
  margin: 0;
  padding: 0;
}

 .notice-page .notice-container {
  width: 900px;
  margin: 80px auto 60px auto;
  background: #fff;
  border-radius: 10px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.05);
  padding: 40px;
}

 .notice-page .notice-title {
  font-weight: 700;
  color: #7453fc;
  border-bottom: 3px solid #7453fc;
  padding-bottom: 15px;
  margin-bottom: 30px;
}

 .notice-page .search-box {
  display: flex;
  justify-content: right;
  align-items: center;
  margin-bottom: 25px;
}
 .notice-page .search-input {
  width: 300px;
  padding: 8px 15px 8px 35px;
  border-radius: 25px;
  border: 1px solid #ddd;
  outline: none;
  text-align: center;
  transition: all 0.2s ease;
}
 .notice-page .search-input:focus {
  border-color: #7453fc;
  box-shadow: 0 0 0 3px rgba(116, 83, 252, 0.15);
}
 .notice-page .search-box .fe-search {
  position: absolute;
  margin-left: 10px;
  color: #aaa;
  pointer-events: none;
}

 .notice-page .btn,
 .notice-page .btn-back,
 .notice-page .btn-update,
 .notice-page .btn-delete {
  background: #7453fc;
  color: white;
  border: none;
  padding: 10px 18px;
  border-radius: 6px;
  font-size: 15px;
  cursor: pointer;
  transition: 0.2s;
  text-decoration: none;
  display: inline-block;
}

 .notice-page .btn:hover {
  background: #5334d0;
}

 .notice-page table {
  width: 100%;
  border-collapse: collapse;
  font-size: 15px;
}
 .notice-page th,
 .notice-page td {
  border-bottom: 1px solid #ddd;
  padding: 14px 10px;
  text-align: left;
}
 .notice-page th {
  background-color: #f4f0ff;
  color: #5334d0;
}
 .notice-page tr:hover {
  background-color: #f8f5ff;
  cursor: pointer;
}

.notice-page .pagination {
  margin-top: 30px;
  display: flex;
  justify-content: center;
  gap: 8px;
  font-size: 15px;
}
input[type="search"]:focus::placeholder {
      color: transparent;
      transition: color 0.2s ease;
    }
     .pagination {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 8px;
  margin-top: 35px;
  padding: 12px 0;
  font-family: 'Pretendard', 'Noto Sans KR', sans-serif;
}
  </style>
</head>

<body class="notice-page">
 <div class="header-text" style="height: 120px;  background-color: #fff;"></div>

  <!-- ========== 공지사항 리스트 영역 ========== -->
  <div class="notice-container">
    <h1 class="notice-title">공지사항</h1>

    <div class="search-box" style="position: relative;">
      <span class="fe fe-search"></span>
      <input type="search" class="search-input" placeholder="검색어를 입력하세요" aria-label="Search">
    </div>

    <table>
      <thead>
        <tr>
          <th style="width:60px;">번호</th>
          <th>제목</th>
          <th style="width:150px;">작성일</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="vo" items="${list}">
          <tr onclick="location.href='../notice/detail.eum?n_id=${vo.n_id}'">
            <td>${vo.n_id}</td>
            <td>
              ${vo.n_title}
              <c:if test="${vo.n_createdAt == today}">
                <sup style="color:red; font-weight:bold;">NEW</sup>
              </c:if>
            </td>
            <td>
              <fmt:formatDate value="${vo.n_createdAt}" pattern="yyyy.MM.dd" />
            </td>
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
            <strong style="color:#7453fc;">${i}</strong>
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