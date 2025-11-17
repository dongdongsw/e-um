<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 
---------------------------------------------
Header Style
--------------------------------------------- 
*/
body {
 background-color: #f7f7f7;
}
.background-header {
  background-color: #fff !important;
  height: 70px!important;
  position: fixed!important;
  top: 0!important;
  left: 0;
  right: 0;
  box-shadow: 0px 0px 10px rgba(0,0,0,0.15)!important;
  -webkit-transition: all .5s ease 0s;
  -moz-transition: all .5s ease 0s;
  -o-transition: all .5s ease 0s;
  transition: all .5s ease 0s;
}

.header-area {
  background-color: transparent;
  position: absolute;
  height: 70px;
  top: 30px;
  left: 0;
  right: 0;
  z-index: 100;
}

.header-area .main-nav {
  min-height: 80px;
  background: transparent;
  display: flex;
  padding: 15px 30px;
  border-radius: 50px;
  overflow: visible !important;
}

.background-header .main-nav {
  padding: 0px;
  background-color: transparent;
}

.header-area .main-nav .logo {
  flex-basis: 30%;
  -webkit-transition: all 0.3s ease 0s;
  -moz-transition: all 0.3s ease 0s;
  -o-transition: all 0.3s ease 0s;
  transition: all 0.3s ease 0s;
}

.header-area .main-nav .logo img {
  width: 223px;
}

.background-header .main-nav .logo {
  margin-top: 8px;
}

.background-header .main-nav .logo img {
  width: 180px;
}

.header-area .main-nav .nav {
  display: inline-flex;
  flex-basis: 70%;
  justify-content: flex-end;
  vertical-align: middle;
  text-align: right;
  margin-top: 15px;
  margin-right: 0px;
  -webkit-transition: all 0.3s ease 0s;
  -moz-transition: all 0.3s ease 0s;
  -o-transition: all 0.3s ease 0s;
  transition: all 0.3s ease 0s;
  position: relative;
  z-index: 999;
}

.header-area .main-nav .nav li {
  padding-left: 10px;
  padding-right: 10px;
  display: inline-block;
}

.header-area .main-nav .nav li a {
  display: block;
  font-weight: 500;
  font-size: 14px;
  text-transform: capitalize;
  color: #2a2a2a;
  -webkit-transition: all 0.3s ease 0s;
  -moz-transition: all 0.3s ease 0s;
  -o-transition: all 0.3s ease 0s;
  transition: all 0.3s ease 0s;
  border: transparent;
  padding: 8px 15px;
  border-radius: 18px;
  letter-spacing: 1px;
}

.header-area .main-nav .nav li.has-sub ul.sub-menu li:last-child a:hover,
.background-header .main-nav .nav li.has-sub ul.sub-menu li:last-child a:hover {
  padding-left: 25px !important;
}

.header-area .main-nav .nav li:hover a,
.header-area .main-nav .nav li a.active {
  color: #fff;
  background-color: #7453fc;
}

.background-header .main-nav .nav li:hover a,
.background-header .main-nav .nav li a.active {
  color: #fff;
  opacity: 1;
}

.header-area .main-nav .nav li.has-sub {
  position: relative;
  padding-right: 15px;
}

/* 프로필 드롭다운 스타일 */
.profile-dropdown {
  position: relative;
}

.profile-trigger {
  display: flex;
  align-items: center;
  gap: 8px;
  cursor: pointer;
  padding: 4px 12px;
  border-radius: 20px;
  transition: background-color 0.3s ease;
}

.profile-trigger:hover {
  background-color: rgba(116, 83, 252, 0.1);
}

.profile-image {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid #7453fc;
}

.profile-name {
  font-weight: 500;
  font-size: 14px;
  color: #2a2a2a;
}

.dropdown-menu {
  position: absolute;
  top: calc(100% + 8px);
  right: 0;
  background-color: #ffffff;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
  min-width: 150px;
  display: none;
  z-index: 10000;
}

.dropdown-menu.show {
  display: block;
}

.dropdown-menu a,
.dropdown-menu button {
  display: block !important;
  width: 100% !important;
  padding: 12px 20px !important;
  text-align: left !important;
  font-size: 14px !important;
  color: #2a2a2a !important;
  text-decoration: none !important;
  border: none !important;
  background: transparent !important;
  cursor: pointer !important;
  transition: background-color 0.2s ease, color 0.2s ease !important;
  border-radius: 0 !important;
  font-family: inherit !important;
  letter-spacing: 0 !important;
  text-transform: none !important;
  margin: 0 !important;
}

.dropdown-menu a:first-child {
  border-radius: 8px 8px 0 0 !important;
}

.dropdown-menu button {
  border-top: 1px solid #eee !important;
  border-radius: 0 0 8px 8px !important;
}

.dropdown-menu a:hover,
.dropdown-menu button:hover {
  background-color: #f5f5f5 !important;
  color: #7453fc !important;
}

.dropdown-menu form {
  margin: 0;
  padding: 0;
}

/* 프로필 드롭다운은 active 효과 제외 */
.header-area .main-nav .nav li.profile-dropdown:hover .profile-trigger {
  background-color: rgba(116, 83, 252, 0.1);
}

.header-area .main-nav .nav li.profile-dropdown:hover a {
  color: #2a2a2a;
  background-color: transparent;
}

.header-area .main-nav .nav li.profile-dropdown a.active {
  color: #2a2a2a !important;
  background-color: transparent !important;
}

.header-area .main-nav .menu-trigger {
  cursor: pointer;
  display: block;
  position: absolute;
  top: 33px;
  width: 32px;
  height: 40px;
  text-indent: -9999em;
  z-index: 99;
  right: 20px;
  display: none;
}

.background-header .main-nav .menu-trigger {
  top: 17px;
}

.header-area .main-nav .menu-trigger span,
.header-area .main-nav .menu-trigger span:before,
.header-area .main-nav .menu-trigger span:after {
  -moz-transition: all 0.4s;
  -o-transition: all 0.4s;
  -webkit-transition: all 0.4s;
  transition: all 0.4s;
  background-color: #7453fc;
  display: block;
  position: absolute;
  width: 30px;
  height: 2px;
  left: 0;
}

.background-header .main-nav .menu-trigger span,
.background-header .main-nav .menu-trigger span:before,
.background-header .main-nav .menu-trigger span:after {
  background-color: #7453fc;
}

.header-area .main-nav .menu-trigger span:before,
.header-area .main-nav .menu-trigger span:after {
  -moz-transition: all 0.4s;
  -o-transition: all 0.4s;
  -webkit-transition: all 0.4s;
  transition: all 0.4s;
  background-color: #7453fc;
  display: block;
  position: absolute;
  width: 30px;
  height: 2px;
  left: 0;
  width: 75%;
}

.background-header .main-nav .menu-trigger span:before,
.background-header .main-nav .menu-trigger span:after {
  background-color: #7453fc;
}

.header-area .main-nav .menu-trigger span:before,
.header-area .main-nav .menu-trigger span:after {
  content: "";
}

.header-area .main-nav .menu-trigger span {
  top: 16px;
}

.header-area .main-nav .menu-trigger span:before {
  -moz-transform-origin: 33% 100%;
  -ms-transform-origin: 33% 100%;
  -webkit-transform-origin: 33% 100%;
  transform-origin: 33% 100%;
  top: -10px;
  z-index: 10;
}

.header-area .main-nav .menu-trigger span:after {
  -moz-transform-origin: 33% 0;
  -ms-transform-origin: 33% 0;
  -webkit-transform-origin: 33% 0;
  transform-origin: 33% 0;
  top: 10px;
}

.header-area .main-nav .menu-trigger.active span,
.header-area .main-nav .menu-trigger.active span:before,
.header-area .main-nav .menu-trigger.active span:after {
  background-color: transparent;
  width: 100%;
}

.header-area .main-nav .menu-trigger.active span:before {
  -moz-transform: translateY(6px) translateX(1px) rotate(45deg);
  -ms-transform: translateY(6px) translateX(1px) rotate(45deg);
  -webkit-transform: translateY(6px) translateX(1px) rotate(45deg);
  transform: translateY(6px) translateX(1px) rotate(45deg);
  background-color: #7453fc;
}

.background-header .main-nav .menu-trigger.active span:before {
  background-color: #7453fc;
}

.header-area .main-nav .menu-trigger.active span:after {
  -moz-transform: translateY(-6px) translateX(1px) rotate(-45deg);
  -ms-transform: translateY(-6px) translateX(1px) rotate(-45deg);
  -webkit-transform: translateY(-6px) translateX(1px) rotate(-45deg);
  transform: translateY(-6px) translateX(1px) rotate(-45deg);
  background-color: #7453fc;
}

.background-header .main-nav .menu-trigger.active span:after {
  background-color: #7453fc;
}

.header-area.header-sticky {
  min-height: 70px;
}

.header-area.header-sticky .nav li a.active {
  color: #fff;
}

@media (max-width: 1200px) {
  .header-area .main-nav .nav li {
    padding-left: 10px;
    padding-right: 10px;
  }
  .header-area .main-nav:before {
    display: none;
  }
}

@media (max-width: 992px) {
  .header-area {
    top: 0;
  }
  .header-area .main-nav {
    background-color: transparent;
    border-radius: 0px;
  }
  .header-area .main-nav .nav {
    height: auto;
    flex-basis: 100%;
  }
  .header-area .main-nav .logo {
    position: absolute;
    left: 30px;
    top: 15px;
  }
  .background-header .main-nav .logo {
    top: 0px;
  }
  .background-header .main-nav .border-button {
    top: 0px !important;
  }
  .header-area .main-nav .border-button {
    position: absolute;
    top: 15px;
    right: 70px;
  }
  .header-area.header-sticky .nav li a:hover,
  .header-area.header-sticky .nav li a.active {
    color: #7453fc!important;
    opacity: 1;
  }
  .header-area.header-sticky .nav li.search-icon a {
    width: 100%;
  }
  .header-area {
    background-color: #f7f7f7;
    padding: 0px 15px;
    height: 100px;
    box-shadow: none;
    text-align: center;
  }
  .header-area .container {
    padding: 0px;
    max-width:1180px
  }
  .header-area .logo {
    margin-left: 0px;
  }
  .header-area .menu-trigger {
    display: block !important;
  }
  .header-area .main-nav {
    overflow: hidden;
  }
  .header-area .main-nav .nav {
    float: none;
    width: 100%;
    display: none;
    -webkit-transition: all 0s ease 0s;
    -moz-transition: all 0s ease 0s;
    -o-transition: all 0s ease 0s;
    transition: all 0s ease 0s;
    margin-left: 0px;
  }
  .header-area.header-sticky .nav {
    margin-top: 85px !important;
    text-align: center;
  }
  .background-header.header-sticky .nav {
    margin-top: 70px !important;
  }
  .header-area .main-nav .nav li:first-child {
    border-top: 1px solid #eee;
  }
  .header-area .main-nav .nav li {
    width: 100%;
    background: #fff;
    border-bottom: 1px solid #eee;
    padding-left: 0px !important;
    padding-right: 0px !important;
  }
  .header-area .main-nav .nav li a {
    height: 50px !important;
    line-height: 50px !important;
    padding: 0px !important;
    border: none !important;
    background: #fff !important;
    color: #1e1e1e !important;
    font-weight: bold;
  }
  .header-area .main-nav .nav li a:hover {
    background: #fff !important;
    color: #7453fc!important;
  }
  .header-area .main-nav .nav li.has-sub ul.sub-menu {
    position: relative;
    visibility: inherit;
    opacity: 1;
    z-index: 1;
    transform: translateY(0%);
    top: 0px;
    width: 100%;
    box-shadow: none;
    height: 0px;
    transition: all 0s;
  }
  .header-area .main-nav .nav li.submenu ul li a {
    font-size: 12px;
    font-weight: 400;
  }
  .header-area .main-nav .nav li.submenu ul li a:hover:before {
    width: 0px;
  }
  .header-area .main-nav .nav li.has-sub ul.sub-menu {
    height: auto;
  }
  .header-area .main-nav .nav li.has-sub:after {
    color: #3B566E;
    right: 30px;
    font-size: 14px;
    top: 15px;
  }
  .header-area .main-nav .nav li.submenu:hover ul, .header-area .main-nav .nav li.submenu:focus ul {
    height: 0px;
  }
  
  /* 모바일 프로필 드롭다운 */
  .profile-dropdown {
    width: 100%;
  }
  
  .profile-trigger {
    width: 100%;
    justify-content: center;
    padding: 12px;
    background: #fff;
  }
  
  .dropdown-menu {
    position: static;
    display: block !important;
    box-shadow: none;
    border-radius: 0;
  }
  
  .dropdown-menu a,
  .dropdown-menu button {
    background: #f9f9f9 !important;
    border-bottom: 1px solid #eee;
  }
}
</style>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    const profileTrigger = document.querySelector('.profile-trigger');
    const dropdownMenu = document.querySelector('.dropdown-menu');
    
    if (profileTrigger && dropdownMenu) {
        // 프로필 클릭 이벤트
        profileTrigger.addEventListener('click', function(e) {
            e.stopPropagation();
            dropdownMenu.classList.toggle('show');
        });
        
        // 문서 클릭 시 드롭다운 닫기
        document.addEventListener('click', function(e) {
            if (!e.target.closest('.profile-dropdown')) {
                dropdownMenu.classList.remove('show');
            }
        });
        
        // 드롭다운 메뉴 내부 클릭 시 이벤트 전파 방지 (링크 클릭은 허용)
        dropdownMenu.addEventListener('click', function(e) {
            if (e.target.tagName === 'A' || e.target.tagName === 'BUTTON') {
                // 링크나 버튼 클릭은 정상 작동
                return;
            }
            e.stopPropagation();
        });
    }
});
</script>
</head>
<body>
   <!-- ***** Preloader Start ***** -->
  <div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
      <span class="dot"></span>
      <div class="dots">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  <!-- ***** Preloader End ***** -->

  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="../main/main.eum" class="logo">
                        <img src="../assets/images/logo.png" alt="">
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->

                    <ul class="nav">
                        <c:if test="${session.Scope.role == ROLE_ADMIN && sessionScope.id!=null }">
                    		<li><a href="../admin/admin_main.eum">관리자</a></li>
                    	</c:if>
                        <li><a href="../talent/list.eum">list</a></li>
                        <li><a href="../seller/join.eum">셀러 등록</a></li>
                        <li><a href="../notice/list.eum">공지 사항</a></li>
                        
                        <c:if test="${sessionScope.id==null}">
                        	<li><a href="../users/login.eum">로그인</a></li>
                        	<li><a href="../users/join.eum" class="active">회원가입</a></li>
                        </c:if>
                        <c:if test="${sessionScope.id!=null}">
                            <li class="profile-dropdown">
                                <div class="profile-trigger">
                                    <img src="${empty sessionScope.profile ? '../images/profile.jpg' : sessionScope.profile}" 
                                         alt="프로필" class="profile-image">
                                    <span class="profile-name">${sessionScope.name}님</span>
                                </div>
                                <div class="dropdown-menu">
                                    <a href="../users/info.eum">마이페이지</a>
                                    <form action="../users/logout.eum" method="post">
                                        <button type="submit">로그아웃</button>
                                    </form>
                                </div>
                            </li>
                    	</c:if>
                    </ul>   
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
  </header>
  <!-- ***** Header Area End ***** -->
  
</body>
</html>