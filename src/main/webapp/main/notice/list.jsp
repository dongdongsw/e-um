<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>공지사항</title>
  <link rel="stylesheet" href="notice.css">
</head>

<body>

  <!-- ========== 헤더 영역 ========== -->
  <header class="notice-header">
    <nav class="main-nav">
      <div class="logo">
        <a href="main.do">
          <img src="../list/eum_logo.png" alt="로고">
        </a>
      </div>

      <ul class="nav">
  <li class="right-item"><a href="contact.do">문의하기</a></li>
  <c:choose>
    <c:when test="${not empty sessionScope.user}">
      <li><a href="mypage.do">${sessionScope.user.u_name} 님</a></li>
      <li><a href="logout.do">로그아웃</a></li>
    </c:when>
  </c:choose>
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
      </tbody>
    </table>
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
