<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>정보 수정</title>
<link rel="stylesheet" href="../css/join.css">
<style type="text/css">
body {background-color: #fff !important;}
.update-container {
    display: flex;
    width: 1180px;
    margin: 0 auto;
    gap: 20px;
    background-color: #fff;
    min-height: 800px;
}
.update-container {
	max-width:1170px;
	margin:0 auto;
	padding:48px 16px;
	display:flex;
	justify-content:center;
	font-weight: bold;
}

/* ===== 좌측 메뉴 ===== */
.sidebar {
  border-right: 1px solid #e5e7eb;
  padding-right: 24px;
}

.sidebar h2 {
  font-size: 20px;
  font-weight: 700;
  margin-bottom: 50px;
}

.menu {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.menu a {
  color: #333;
  text-decoration: none;
  font-size: 15px;
  padding: 8px 0;
  border-radius: 6px;
  transition: background 0.2s;
}

.menu a.active {
  font-weight: 600;
  color: #8e4dff;
}

.menu a:hover {
  background: #f9fafb;
}

/* ===== 오른쪽 본문 ===== */
.content {
  background: #fff;
}

.content h2 {
  font-size: 20px;
  font-weight: 700;
  margin-bottom: 50px;
}

/* 프로필 카드 */
.profile-card {
  display: flex;
  gap: 50px;
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  padding: 32px 40px;
  background: #fff;
}

.profile-img {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  overflow: hidden;
  border: 1px solid #e5e7eb;
  flex-shrink: 0;
}

.profile-img img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.profile-info {
  flex: 1;
}

.info-block {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 10px 18px;
  border-radius: 8px;
  margin-bottom: 20px;
}

.info-title {
  font-size: 14px;
  color: #6b7280;
  flex: 0 0 180px; /* 제목 영역 고정 폭 */
}

.info-value {
  font-size: 15px;
  color: #111;
  flex: 1; /* 오른쪽 값은 자동 확장 */
  text-align: left;
}

.note {
  font-size: 13px;
  color: #9ca3af;
  margin-top: 4px;
}

h2 {
	margin-bottom:100px;
}

.subtitle {
	text-align: right;
  	margin-top: 5px;
  	color: #888;
    cursor: pointer;
}

.subtitle:hover {
  color: #555;
}

.result-box {
  margin-top: 15px;
  padding: 15px;
  border-radius: 8px;
  background-color: #f0f9ff;
  border: 1px solid #3b82f6;
  animation: slideDown 0.3s ease;
}

@keyframes slideDown {
  from {
    opacity: 0;
    transform: translateY(-10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.result-text {
  margin: 0;
  color: #1e40af;
  font-size: 14px;
  line-height: 1.6;
  text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	$('#nickBtn').click(function() {
		let nickname = $('#nickname').val().trim();
		if(nickname==="") {
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
	
	$('#locBtn').on('click',function() {
		new daum.Postcode({
			oncomplete:function(data) {
				$('#loc').val(data.address)
			}
		}).open()
	})
	
	$('#joinBtn').click(function() {
		let pwd1 = $('#pwd1').val().trim();
		let pwd2 = $('#pwd2').val().trim();
		let nickname = $('#nickname').val().trim();

		if(nickname==="") {
			alert("닉네임을 입력하세요");
			$('#nickname').focus();
			return;
		}

		if(pwd1 !== "") { 
            if(pwd2 === "") {
                 alert("비밀번호 확인을 입력하세요");
                 $('#pwd2').focus();
                 return;
            }
			if(pwd1 !== pwd2) {
				alert("비밀번호가 서로 일치하지 않습니다");
				$('#pwd2').val("");
				$('#pwd2').focus();
				return;
			}
		} else if (pwd2 !== "") {
            alert("비밀번호를 입력하세요");
            $('#pwd1').focus();
            return;
        }
        
		$('#frm').submit();
	})
	
 	document.getElementById('deleteBtn').addEventListener('click', function(e) {
 		e.preventDefault();
    
    	if (confirm('정말로 회원탈퇴를 하시겠습니까?')) {
      		const resultBox = document.getElementById('result-delete');
      		const resultText = document.getElementById('deleteResultText');
      
      		resultText.innerHTML = '회원탈퇴에 성공하였습니다.<br>잠시 후 홈페이지로 이동합니다.';
      		resultBox.style.display = 'block';
      
      		setTimeout(function() {
	        document.getElementById('deleteForm').submit();
      		}, 3000);
    	}
  	});
})
</script>
</head>
<body>
<div class="header-text" style="height: 200px;  background-color: #fff;"></div>
  <div class="update-container">
    <!-- 좌측 메뉴 -->
	<aside class="sidebar">
	  <h2 style="color:black">마이 페이지</h2>
	  <nav class="menu">
	    <a href="../users/info.eum">회원 정보</a>
	    <a href="../users/review_list.eum">작성한 리뷰</a>
	    <a href="../users/favorite_list.eum">즐겨찾기한 컨텐츠</a>
	    <a href="../users/order_list.eum">결제 내역</a>
	    <a href="../users/info_update.eum" class="active">정보 수정</a>
	  </nav>
	</aside>
	
	<!-- 오른쪽 본문 -->
	<main class="content"></main>
      <div class="panel">
        <h2 class="title" style="color: black;">정보 수정</h1>
	    <div style="height: 30px"></div>
        <form id="frm" name="frm" method="post" action="../users/update_ok.eum">
          <!-- 닉네임 (필수) -->
          <div class="field" style="margin-bottom:0px">
            <label class="label" for="u_nickname">닉네임<sup style="color: #a50021">&nbsp;*</sup></label>
            <div class="id-inline">
              <div class="search">
                <input class="search_input" id="nickname" name="nickname" type="text" value="${sessionScope.name}"/>
              </div>
              <button type="button" id="nickBtn" class="btn">중복체크</button>
            </div>
            <div id="nick_msg" style="color:black; height: 30px; margin-left:20px"></div>
          </div>
        
          <!-- 비밀번호 (필수) -->
          <div class="field">
            <label class="label" for="u_pwd">비밀번호<sup style="color: #a50021">&nbsp;*</sup></label>
            <div class="search">
              <input class="search_input" id="pwd1" name="pwd" type="password"/>
            </div>
          </div>

          <!-- 비밀번호 확인 (필수) -->
          <div class="field">
            <label class="label" for="u_pwd_check">비밀번호 확인<sup style="color: #a50021">&nbsp;*</sup></label>
            <div class="search">
              <input class="search_input" id="pwd2" type="password"/>
            </div>
          </div>
        
          <!-- 휴대폰 -->
          <div class="field">
            <label class="label" for="u_phone">휴대폰 번호</label>
            <div class="search">
              <input class="search_input" id="phone" name="phone" type="text" value="${sessionScope.phone}" />
            </div>
          </div>

		  <!-- 주소 -->
          <div class="field">
		    <label class="label">주소</label>
		    <div class="id-inline">
		      <div class="search">
		        <input class="search_input" type="text" id="loc" name="loc" value="${sessionScope.loc}" readonly>
		      </div>
			  <button type="button" id="locBtn" class="btn">주소검색</button>
		    </div>
		  </div>

          <!-- 수신동의/철회 -->
          <div class="field">
            <label class="label">수신동의/철회</label>
            <div class="agree-box">
              <label class="agree-item">
                <input type="checkbox" id="push_noti" name="push_noti" value="Y" ${sessionScope.push_noti eq 'Y' ? 'checked' : ""}/>
                <span>푸시 동의 (선택)</span>
              </label>
              <label class="agree-item">
                <input type="checkbox" id="email_noti" name="email_noti" value="Y" ${sessionScope.email_noti eq 'Y' ? 'checked' : ""}/>
                <span>이메일 수신 동의 (선택)</span>
              </label>
              <label class="agree-item">
                <input type="checkbox" id="sms_noti" name="sms_noti" value="Y" ${sessionScope.sms_noti eq 'Y' ? 'checked' : ""}/>
                <span>SMS 수신 동의 (선택)</span>
              </label>
            </div>
          
            <!-- 회원 탈퇴 -->
            <p class="subtitle" id="deleteBtn">회원탈퇴</p>
            <div id="result-delete" class="result-box" style="display: none;">
              <p class="result-text" id="deleteResultText"></p>
            </div>
          </div>
		  <div class="sub-button">
		    <button class="cancel" type="button" onclick="history.back()">취소</button>
		    <button class="submit" type="button" id="joinBtn">수정완료</button>
		  </div>
          <div style="height: 30px;"></div>
        </form>
        <form method="post" action="../users/delete_ok.eum" id="deleteForm"></form>
      </div>
  </div>
</body>
</html>