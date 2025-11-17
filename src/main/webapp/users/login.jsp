<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../css/login.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	function doLogin() {
		let id = $('#id').val()
		if(id.trim()==="") {
			$('#id').focus()
			return
		}
		
		let pwd = $('#pwd').val()
		if(pwd.trim()==="") {
			$('#pwd').focus()
			return
		}
		
		$.ajax({
			type:'post',
			url:'../users/login_ok.eum',
			data:{"id":id,"pwd":pwd},
			success:function(result) {
				if(result==="NOID") {
					alert("아이디가 존재하지 않습니다")
					$('#id').val("")
					$('#pwd').val("")
					$('#id').focus()
				} else if(result==="NOPWD") {
					alert("비밀번호가 잘못 되었습니다")
					$('#pwd').val("")
					$('#pwd').focus()
				} else if(result==="OK") {
					location.href = "../main/main.eum"
				}
			},
			error:function(err) {
				console.log(err)
			}
		})
	}
	
	$('#logBtn').click(function() {
		doLogin()
	})
	
	$('#id, #pwd').keydown(function(e) {
		if(e.keyCode==13) {
			doLogin()
		}
	})
})
</script>
<style type="text/css">
.social-icons {
    display: flex;
    gap: 10px;
    align-items: center;
    justify-content: center;
}

.social-login-link {
    display: inline-block;
    padding: 10px; 
    text-decoration: none; 
}

.social-login-link .icon-image {
    display: block; 
    width: 30px; 
}
</style>
</head>
<body>
  <div class="login-wrapper">
  <div class="form-container">
    <a href="../main/main.eum" style="text-decoration: none; color: black;">
	  <p class="title">E-UM</p>
	</a>
	<form class="form" method="post" action="../main/login/login.eum">
		<div class="input-group">
			<label for="username">ID</label>
			<input type="text" name="id" id="id" placeholder="아이디 입력">
		</div>
		<div class="input-group">
			<label for="password">PASSWORD</label>
			<input type="password" name="pwd" id="pwd" placeholder="비밀번호 입력">
			<div class="forgot">
				<a rel="noopener noreferrer" href="../users/fine_me.eum">아이디 / 비밀번호 찾기</a>
			</div>
		</div>
		<input type="button" class="sign" id="logBtn" value="로그인">
	</form>
	<div class="social-message">
		<div class="line"></div>
		<p class="message">소셜 로그인</p>
		<div class="line"></div>
	</div>
	<div class="social-icons">
      <a href="#" aria-label="Login with kakao" class="social-login-link">
        <img src="../images/kakao_login.png" class="icon-image">
      </a>
      <a href="#" aria-label="Login with naver" class="social-login-link">
        <img src="../images/naver_login.png" class="icon-image">
      </a>
      <a href="#" aria-label="Login with google" class="social-login-link">
        <img src="../images/google_login.png" class="icon-image">
      </a>
      <a href="#" aria-label="Login with apple" class="social-login-link">
        <img src="../images/apple_login.png" class="icon-image">
      </a>
	</div>
	<p class="signup">아직 회원이 아니신가요?
		<a rel="noopener noreferrer" href="../users/join.eum" class="">회원가입</a>
	</p>
  </div>
  </div>
</body>
</html>