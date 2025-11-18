<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*, *:before, *:after {
  box-sizing: border-box;
}

html {
  font-size: 100%;
}

body {
  font-family: acumin-pro, system-ui, sans-serif;
  margin: 0;
  display: grid;
  grid-template-rows: auto 1fr auto;
  font-size: 14px;
  background-color: #f4f4f4;
  align-items: start;
  min-height: 100vh;
}

.footer {
  display: flex;
  flex-wrap: wrap;
  padding: 30px 30px 20px 30px;
  color: #2f2f2f;
  background-color: #fff;
  border-top: 1px solid #e5e5e5;
}

.footer > * {
  flex: 1 100%;
}

.footer__addr {
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  margin-right: -130px; /* nav와 간격 */
  min-height: 100%;
  flex: 0 0 auto;  /* 추가: addr은 좌측 크기만 차지 */
}

.footer__logo {
  font-family: 'Pacifico', cursive;
  font-weight: 400;
  text-transform: lowercase;
  font-size: 1.5rem;
}

.footer__addr h2 {
  margin-top: 1.3em;
  font-size: 15px;
  font-weight: 400;
}

.nav__title {
  font-weight: 400;
  font-size: 15px;
  color: #2f2f2f;
}

.footer address {
  font-style: normal;
  color: #999;
}

.footer__btn {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 36px;
  max-width: max-content;
  background-color: rgb(33, 33, 33, 0.07);
  border-radius: 100px;
  color: #2f2f2f;
  line-height: 0;
  margin: 0.6em 0;
  font-size: 1rem;
  padding: 0 1.3em;
}

.footer ul {
  list-style: none;
  padding-left: 0;
}

.footer li {
  line-height: 2em;
}

.footer a {
  text-decoration: none;
}

.footer__nav {
  display: flex;
  flex-wrap: wrap;
  gap: 1.25em; /* nav_item 간격 유지 */
  margin-left: 0; /* addr쪽으로 붙임 */
  
}

.footer__nav > * {
  flex: 1 50%;
  margin-right: 1.25em;
}

.nav__ul a {
  color: #999;
}

.nav__ul--extra {
  column-count: 2;
  column-gap: 1.25em;
}

.legal {
  display: flex;
  flex-wrap: wrap;
  color: #999;
}

.legal__links {
  display: flex;
  align-items: center;
}

.heart {
  color: #2f2f2f;
}

@media screen and (min-width: 24.375em) {
  .legal .legal__links {
    margin-left: auto;
  }
}

@media screen and (min-width: 40.375em) {
  .footer__nav > * {
    flex: 1;
  }

  .nav__item--extra {
    flex-grow: 2;
  }

  .nav__item:last-child h2.nav__title:nth-of-type(2) {
    margin-top: 2em;
  }

  .footer__addr {
    flex: 1 0px;
  }

  .footer__nav {
    flex: 2 0px;
  }
}

.sist-logo {
  margin-top: 0px;
  margin-left: 7px;
  width: 80px;
  height: 80px;
}

.intro-eum {
  margin-top: auto;
  margin-left: 5px;
  font-style: normal;
  color: #999;
}
</style>
</head>
<body>



 <footer class="footer">
  <div class="footer__addr">
  
    <div class="sist-logo">
      <img src="../images/sist.png">
    </div>
    <div class="intro-eum">Copyright @2025 1조 이음(E-UM)프로젝트</div>
    <address>
      <a class="footer__btn" href="https://github.com/dongdongsw/e-um">Git Hub</a>
    </address>
  </div>
  
  <ul class="footer__nav">
    <li class="nav__item">
      <h2 class="nav__title">회원</h2>

      <ul class="nav__ul">
        <li>
          <a href="#">List1</a>
        </li>

        <li>
          <a href="#">List2</a>
        </li>
            
        <li>
          <a href="#">List3</a>
        </li>
        
        <li>
          <a href="#">List4</a>
        </li>
        
        <li>
          <a href="#">List5</a>
        </li>
      </ul>
    </li>
    
    <li class="nav__item">
      <h2 class="nav__title">회원</h2>
      
      <ul class="nav__ul">
        <li>
          <a href="#">회원가입</a>
        </li>
        
        <li>
          <a href="#">로그인</a>
        </li>
        
        <li>
          <a href="#">마이페이지</a>
        </li>
      </ul>
    </li>
    
    <li class="nav__item">
      <h2 class="nav__title">셀러</h2>
      
      <ul class="nav__ul">
        <li>
          <a href="#">셀러등록</a>
        </li>
        
        <li>
          <a href="#">셀러페이지</a>
        </li>
      </ul>
    </li>
    
    <li class="nav__item">
      <h2 class="nav__title">관리자</h2>
      
      <ul class="nav__ul">
        <li>
          <a href="#">관리자페이지</a>
        </li>
      </ul>
      
      <h2 class="nav__title">게시판</h2>
      
      <ul class="nav__ul">
        <li>
          <a href="#">공지사항</a>
        </li>
      </ul>
    </li>
  </ul>
  
  <div class="legal">  
    <div class="legal__links">
      <span>Made by. 서동현 김민석 이철우 이수현 지은표</span>
    </div>
  </div>
</footer>
</body>
</html>