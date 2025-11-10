<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../css/join.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
$(function(){
		// 아이디 중복 검사
	$('#idBtn').click(function(){
		let id=$('#id').val()
		if(id.trim()==="") {
			$('#id_msg').text("아이디 입력하세요")
			$('#id_msg').attr("class","message error")
			$('#id_msg').css('color', 'red')
			$('#id_msg').show()
			return
		}
		$.ajax({
			type:'post',
			url:'../users/idcheck_ok.eum',
			data:{"u_loginid":id},
			success:function(result) {
				if(result==0) {
					$('#id_msg').text(id+ '는(은) 사용 가능한 아이디입니다')
					$('#id_msg').attr("class","message success")
					$('#id_msg').css('color', 'green')
					$('#id_msg').show()
				} else {
					$('#id_msg').text(id+ '는(은) 이미 사용 중인 아이디입니다')
					$('#id_msg').attr("class","message error")
					$('#id_msg').css('color', 'red')
					$('#id_msg').show()
					}
				}, 
				error:function(err) {
					console.log(err)
				}
			})
				
		})

	$('#nickBtn').click(function(){
		let nickname=$('#nickname').val()
		if(nickname.trim()==="") {
			$('#nick_msg').text("닉네임 입력하세요")
			$('#nick_msg').attr("class","message error")
			$('#nick_msg').css('color', 'red')
			$('#nick_msg').show()
			return
		}
		$.ajax({
			type:'post',
			url:'../users/nickcheck_ok.eum',
			data:{"u_nickname":nickname},
			success:function(result) {
				if(result==0) {
					$('#nick_msg').text(nickname + '는(은) 사용 가능한 닉네임입니다')
					$('#nick_msg').attr("class","message success")
					$('#nick_msg').css('color', 'green')
					$('#nick_msg').show()
				} else {
					$('#nick_msg').text(nickname+ '는(은) 이미 사용 중인 닉네임입니다')
					$('#nick_msg').attr("class","message error")
					$('#nick_msg').css('color', 'red')
					$('#nick_msg').show()
				}
			}, 
			error:function(err) {
				console.log(err)
			}
		})
	})
	
	$('#locBtn').on('click',function(){
		new daum.Postcode({
			oncomplete:function(data){
				$('#loc').val(data.address)
			}
		}).open()
	})
	
	$('#joinBtn').click(function(){
		let id=$('#id').val()
		if(id.trim()==="") {
			alert("아이디 중복체크를 하세요")
			return
		}	
		let pwd1=$('#pwd1').val()
		if(pwd1.trim()==="") {
			$('#pwd1').focus()
			return
		}
		let pwd2=$('#pwd2').val()
		if(pwd1!==pwd2) {
			alert("비밀번호가 틀립니다")
			$('#pwd2').val("")
			$('#pwd2').focus()
			return
		}
		let nickname=$('#nickname').val()
		if(nickname.trim()==="") {
			alert("닉네임을 입력하세요")
			$('#nickname').focus()
			return
		}
		
		let email=$('#email').val()
		if(email.trim()==="") {
			alert("이메일을 입력하세요")
			$('#email').focus()
			return
		}
		
		let birth=$('#birth').val()
		if(birth.trim()==="") {
			alert("생년월일을 선택하세요")
			$('#birth').focus()
			return
		}
		
		$('#frm').submit()
	})
})
</script>
</head>
<body>
<div class="header-text" style="height: 150px;  background-color: #fff;"></div>
  <div class="join-container">
    <div class="panel">
      <h1 class="title" style="color:black;  text-align: center"><span style="font-size: 30px;">회원가입</span>하고<br/>비즈니스 성공을 시작해 보세요!</h1>
      <p class="subtitle" style=" text-align: center">이미 계정이 있으신가요? <a href="#" style="color: #888;">로그인하기</a></p>
	  <div style="height: 30px"></div>
     <form id="frm" name="frm" method="post" action="../users/join_ok.eum">
        <!-- 아이디 (필수) -->
        <div class="field" style="margin-bottom:0px">
          <label class="label" for="u_loginId">아이디<sup style="color: #a50021">&nbsp;*</sup></label>
          <div class="id-inline">
            <div class="search">
              <input class="search_input" id="id" name="id" type="text" placeholder="아이디" />
            </div>
            <button type="button" id="idBtn" class="btn">중복체크</button>
          </div>
          <div id="id_msg" style="color:black; height: 30px; margin-left:20px"></div>
        </div>
        
        
        <!-- 비밀번호 (필수) -->
        <div class="field">
          <label class="label" for="u_pwd">비밀번호<sup style="color: #a50021">&nbsp;*</sup></label>
          <div class="search">
            <input class="search_input" id="pwd1" name="pwd" type="password" placeholder="비밀번호" />
          </div>
        </div>

        <!-- 비밀번호 확인 (필수) -->
        <div class="field">
          <label class="label" for="u_pwd_check">비밀번호 확인<sup style="color: #a50021">&nbsp;*</sup></label>
          <div class="search">
            <input class="search_input" id="pwd2" type="password" placeholder="비밀번호 재입력" />
          </div>
        </div>

        <!-- 닉네임 (필수) -->
        <div class="field" style="margin-bottom:0px">
          <label class="label" for="u_nickname">닉네임<sup style="color: #a50021">&nbsp;*</sup></label>
          <div class="id-inline">
            <div class="search">
              <input class="search_input" id="nickname" name="nickname" type="text" placeholder="닉네임"/>
            </div>
            <button type="button" id="nickBtn" class="btn">중복체크</button>
          </div>
          <div id="nick_msg" style="color:black; height: 30px; margin-left:20px"></div>
        </div>

        <!-- 이메일 (필수) -->
        <div class="field">
          <label class="label" for="u_email">이메일<sup style="color: #a50021">&nbsp;*</sup></label>
          <div class="search">
            <input class="search_input" id="email" name="email" type="email" placeholder="이메일" />
          </div>
        </div>

		<!-- 생년월일 (필수) -->
        <div class="field">
          <label class="label" for="u_birth">생년월일<sup style="color: #a50021">&nbsp;*</sup></label>
          <div class="search">
            <input class="search_input" id="birth" name="birth" type="date" />
          </div>
        </div>
        
        <!-- 성별 -->
        <div class="field">
          <label class="label">성별</label>
          <div class="radio-wrap">
            <label><input type="radio" name="gender" value="남" checked /> 남성</label>
            <label><input type="radio" name="gender" value="여" /> 여성</label>
          </div>
        </div>
        
        <!-- 휴대폰 -->
        <div class="field">
          <label class="label" for="u_phone">휴대폰 번호</label>
          <div class="search">
            <input class="search_input" id="phone" name="phone" type="text" placeholder="010########" />
          </div>
        </div>

		<!-- 주소 -->
        <div class="field">
		  <label class="label">주소</label>
		  <div class="id-inline">
		  <div class="search">
		     <input class="search_input" type="text" id="loc" name="loc" placeholder="주소" readonly>
		  </div>
			 <button type="button" id="locBtn" class="btn">주소검색</button>
		 </div>
		</div>

        <!-- 수신동의 -->
        <div class="field">
          <label class="label">수신동의</label>
          <div class="agree-box">
            <label class="agree-item">
              <input type="checkbox" id="push_noti" name="push_noti" value="Y" />
              <span>푸시 동의 (선택)</span>
            </label>
            <label class="agree-item">
              <input type="checkbox" id="email_noti" name="email_noti" value="Y" />
              <span>이메일 수신 동의 (선택)</span>
            </label>
            <label class="agree-item">
              <input type="checkbox" id="sms_noti" name="sms_noti" value="Y" />
              <span>SMS 수신 동의 (선택)</span>
            </label>
          </div>
        </div>
		<div class="sub-button">
		  <button class="cancel" type="button" onclick="history.back()">취소</button>
		  <button class="submit" type="button" id="joinBtn">회원가입</button>
		</div>
        <div style="height: 30px"></div>
      </form>
    </div>
  </div>
</body>
</html>
