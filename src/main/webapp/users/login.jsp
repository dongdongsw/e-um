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
.team-slider {
    width: 100%;
    height: 60px;
    background: #f8f9fa;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    overflow: hidden;
    position: relative;
}

.slider-container {
    width: 100%;
    overflow: hidden;
    position: relative;
}

.slider-track {
    display: flex;
    animation: scroll 15s linear infinite;
    white-space: nowrap;
}

.slide {
    color: #495057;
    font-size: 16px;
    font-weight: bold;
    padding: 0 50px;
    display: inline-block;
}

@keyframes scroll {
    0% {
        transform: translateX(0);
    }
    100% {
        transform: translateX(-50%);
    }
}
</style>
</head>
<body>
  <div class="login-wrapper">
  <div class="form-container">
    <a href="../main/main.eum" style="text-decoration: none; color: black;">
	  <p class="title">로그인</p>
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
		<input type="button" class="sign" id="logBtn" value="로그인" style="margin-top: 30px;">
	</form>
	<br>
	<p class="signup">아직 회원이 아니신가요?
		<a rel="noopener noreferrer" href="../users/join.eum" class="">회원가입</a>
	</p>
  </div>
  </div>
</body>
</html>