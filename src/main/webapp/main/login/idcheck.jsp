<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 중복체크</title>
<style>
body {
  font-family: 'Noto Sans KR', sans-serif;
  background: linear-gradient(135deg, #f9f6ff, #eef9ff);
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0;
}

.check-container {
 
  background: #fff;
  padding: 40px 30px;
  border-radius: 18px;
  box-shadow: 0 10px 25px rgba(0,0,0,0.08);
  width: 360px;
  text-align: center;
  animation: fadeIn 0.5s ease;
}

@keyframes fadeIn {
  from {opacity: 0; transform: translateY(10px);}
  to {opacity: 1; transform: translateY(0);}
}

h2 {
  margin-bottom: 20px;
  color: #4a3b87;
  font-weight: 700;
  font-size: 22px;
}

/* 입력폼 */
.input-group {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-bottom: 10px;
}

.input-group input {
  flex: 1;
  padding: 12px;
  border: 1px solid #ddd;
  border-radius: 10px;
  font-size: 14px;
  transition: all 0.2s ease;
}

.input-group input:focus {
  border-color: #8a7cf3;
  box-shadow: 0 0 6px rgba(138,124,243,0.3);
  outline: none;
}

/* 버튼 */
button {
  background: linear-gradient(135deg, #8a7cf3, #6b64da);
  color: #fff;
  border: none;
  padding: 12px 18px;
  border-radius: 10px;
  cursor: pointer;
  font-size: 14px;
  transition: background 0.3s;
}

button:hover {
  background: linear-gradient(135deg, #7666e6, #5a53c7);
}

/* 메시지 */
.message {
  margin-top: 15px;
  font-size: 14px;
  padding: 10px;
  border-radius: 8px;
  display: none;
}

.success {
  background: #f1f9f2;
  color: #2e8b57;
  border: 1px solid #a9e7b8;
}

.error {
  background: #fff2f2;
  color: #c0392b;
  border: 1px solid #f5b7b1;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	$('#okBtn').click(function() {
		let id = $('#userid').val()
		parent.frm.id.value = id
		parent.Shadowbox.close()
	})
	
	$('#checkBtn').click(function() {
		let id = $('#userid').val()
		//alert(id)
		if(id.trim()==="") {
			$('#message').text("아이디를 입력하세요")
			$('#message').attr("class","message error")
			$('#message').show()
			return
		}
		
		// 서버 연동
		$.ajax({
			type:'post',
			url:'../member/idcheck_ok.do',
			data:{"id":id},
			success:function(result) {
				if(result==0) {
					$('#message').text(id+ '는(은) 사용이 가능한 아이디입니다.')
					$('#message').attr("class","message success")
					$('#message').show()
					$('#okBtn').show()
				} else {
					$('#message').text(id+ '는(은) 이미 사용중인 아이디입니다.')
					$('#message').attr("class","message error")
					$('#message').show()
					$('#okBtn').hide()
				}
			},
			error:function(err) {
				console.log(err)
			}
		})
	})
})
</script>
</head>
<body>

<div class="check-container">
  <h2>아이디 중복체크</h2>
  <div class="input-group">
    <input type="text" id="userid" placeholder="사용할 아이디를 입력하세요">
    <button id="checkBtn" type="button">중복확인</button>
  </div>
  <div id="message" class="message" style="margin-bottom: 10px;"></div>
  <button id="okBtn" type="button" style="display: none;">확인</button>
</div>


</body>
</html>