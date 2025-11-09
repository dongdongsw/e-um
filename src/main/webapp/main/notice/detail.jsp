<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title></title>
  <link rel="stylesheet" href="notice.css">
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
  <script type="text/javascript">
  $(function() {
      // ✅ 삭제버튼 클릭 시 모달 표시
      $("#delSpan").click(function() {
        $(".modal-overlay").fadeIn(150);
      });

      // ✅ 취소버튼 클릭 시 모달 닫기
      $("#cancelBtn").click(function() {
        $(".modal-overlay").fadeOut(150);
      });

      // ✅ 확인버튼 클릭 시 삭제 요청
      $("#confirmBtn").click(function() {
        const n_id = "${vo.n_id}";
        location.href = "delete_ok.do?n_id=" + n_id;
      });
    });
  </script>
</head>
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
  <div class="notice-container">
    <h1 class="notice-title">[안내] 11월 정기 점검 일정</h1>
    <div class="notice-date">작성일 : 2025.11.07</div>
    <div class="notice-content">
      안정적인 서비스 제공을 위해 정기 점검이 진행됩니다.
      점검 시간 동안 일시적으로 서비스 이용이 제한될 수 있습니다.

      점검 일시: 11월 10일(월) 00:00 ~ 06:00
      점검 내용: 서버 업그레이드 및 보안 패치
      점검 내용: 서버 업그레이드 및 보안 패치
      점검 내용: 서버 업그레이드 및 보안 패치
      점검 내용: 서버 업그레이드 및 보안 패치
      점검 내용: 서버 업그레이드 및 보안 패치
      점검 내용: 서버 업그레이드 및 보안 패치
      점검 내용: 서버 업그레이드 및 보안 패치
      점검 내용: 서버 업그레이드 및 보안 패치
    </div>
   <div class="btn-move">
	<a href="update.jsp" class="btn-update">수정</a>
	<span id="delSpan" class="btn-delete">삭제</span>
    <a href="list.jsp" class="btn-back">목록</a>
    </div>
  </div>
   <!-- ✅ 삭제 확인 모달창 -->
  <div class="modal-overlay">
    <div class="modal-box">
      <h3>정말 삭제하시겠습니까?</h3>
      <div class="modal-btns">
        <button id="confirmBtn" class="btn-confirm">확인</button>
        <button id="cancelBtn" class="btn-cancel">취소</button>
      </div>
    </div>
  </div>
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
        <li>
          <a href="#">Online</a>
        </li>

        <li>
          <a href="#">Print</a>
        </li>
            
        <li>
          <a href="#">Alternative Ads</a>
        </li>
      </ul>
    </li>
    
    <li class="nav__item nav__item--extra">
      <h2 class="nav__title">Technology</h2>
      
      <ul class="nav__ul nav__ul--extra">
        <li>
          <a href="#">Hardware Design</a>
        </li>
        
        <li>
          <a href="#">Software Design</a>
        </li>
        
        <li>
          <a href="#">Digital Signage</a>
        </li>
        
        <li>
          <a href="#">Automation</a>
        </li>
        
        <li>
          <a href="#">Artificial Intelligence</a>
        </li>
        
        <li>
          <a href="#">IoT</a>
        </li>
      </ul>
    </li>
    
    <li class="nav__item">
      <h2 class="nav__title">Legal</h2>
      
      <ul class="nav__ul">
        <li>
          <a href="#">Privacy Policy</a>
        </li>
        
        <li>
          <a href="#">Terms of Use</a>
        </li>
        
        <li>
          <a href="#">미</a>
        </li>
      </ul>
    </li>
  </ul>
  
  <div class="legal">
    <p>&copy; 2019 Something. All rights reserved.</p>
    
    <div class="legal__links">
      <span>Made with <span class="heart">♥</span> remotely from Anywhere</span>
    </div>
  </div>
</footer>
</body>
</html>
