<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>공지사항</title>
  <link rel="stylesheet" href="notice.css">
</head>
<p>list size = ${fn:length(list)}</p>
<c:forEach var="vo" items="${list}">
  <p>${vo.n_id} / ${vo.n_title}</p>
</c:forEach>
<body>
  <!-- ========== 헤더 영역 ========== -->
  <header class="notice-header">
    <nav class="main-nav">
      <div class="logo">
        <a href="../main.eum">
          <img src="../list/eum_logo.png" alt="로고">
        </a>
      </div>

      <ul class="nav" style="margin-left: 1300px;">
  <li class="right-item"><a href="contact.do">문의하기</a></li>
  <%-- <c:choose>
    <c:when test="${not empty sessionScope.user}">
      <li><a href="mypage.do">${sessionScope.user.u_name} 님</a></li>
      <li><a href="logout.do">로그아웃</a></li>
    </c:when>
  </c:choose> --%>
</ul>

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

  <!-- ========== 푸터 영역 ========== -->
  <footer class="footer">
    <div class="footer__addr">
      <h1 class="footer__logo">Something</h1>
      <h2>Contact</h2>
      <address>
        5534 Somewhere In. The World 22193-10212<br>
        <a class="footer__btn" href="mailto:example@gmail.com">Email Us</a>
      </address>
    </div>

    <ul class="footer__nav">
      <li class="nav__item">
        <h2 class="nav__title">Media</h2>
        <ul class="nav__ul">
          <li><a href="#">Online</a></li>
          <li><a href="#">Print</a></li>
          <li><a href="#">Alternative Ads</a></li>
        </ul>
      </li>

      <li class="nav__item nav__item--extra">
        <h2 class="nav__title">Technology</h2>
        <ul class="nav__ul nav__ul--extra">
          <li><a href="#">Hardware Design</a></li>
          <li><a href="#">Software Design</a></li>
          <li><a href="#">Digital Signage</a></li>
          <li><a href="#">Automation</a></li>
          <li><a href="#">Artificial Intelligence</a></li>
          <li><a href="#">IoT</a></li>
        </ul>
      </li>

      <li class="nav__item">
        <h2 class="nav__title">Legal</h2>
        <ul class="nav__ul">
          <li><a href="#">Privacy Policy</a></li>
          <li><a href="#">Terms of Use</a></li>
          <li><a href="#">미</a></li>
        </ul>
      </li>
    </ul>

    <div class="legal">
      <p>&copy; 2025 Something. All rights reserved.</p>
      <div class="legal__links">
        <span>Made with <span class="heart">♥</span> remotely from Anywhere</span>
      </div>
    </div>
  </footer>


</body>
</html>
