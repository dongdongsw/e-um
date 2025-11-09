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
</head>

<body class="notice-page">
 
  <%-- <c:choose>
    <c:when test="${not empty sessionScope.user}">
      <li><a href="mypage.do">${sessionScope.user.u_name} 님</a></li>
      <li><a href="logout.do">로그아웃</a></li>
    </c:when>
  </c:choose> --%>
 

      <div class="menu-trigger">
        <span></span>
      </div>
    </nav>
  </header>

  <!-- ========== 공지사항 리스트 영역 ========== -->
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
        <!-- DB에서 불러온 list 출력 -->
        <c:forEach var="vo" items="${list}">
          <tr onclick="location.href='../notice/detail.do?n_id=${vo.n_id}'">
            <td>${vo.n_id}</td>
            <td>
              ${vo.n_title}
              <!-- 오늘 날짜면 NEW 표시 -->
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
    <div class="pagination" style="margin-top:20px; text-align:center;">
      <c:if test="${startPage > 1}">
        <a href="list.do?page=${startPage - 1}">&lt;</a>
      </c:if>

      <c:forEach var="i" begin="${startPage}" end="${endPage}">
        <c:choose>
          <c:when test="${i == curpage}">
            <strong style="color:#7453fc;">${i}</strong>
          </c:when>
          <c:otherwise>
            <a href="list.do?page=${i}">${i}</a>
          </c:otherwise>
        </c:choose>
      </c:forEach>

      <c:if test="${endPage < totalpage}">
        <a href="list.do?page=${endPage + 1}">&gt;</a>
      </c:if>
    </div>
  </div>

 


</body>
</html>
