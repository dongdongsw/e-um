<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이디 / 비밀번호 찾기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style>
body {
  margin: 0;
  background: #f5f5f5 !important;
}

.find-wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: calc(100vh - 200px);
  padding: 120px 20px 40px 20px;
}

.container-wrapper {
  display: flex;
  gap: 24px;
}

.form-container {
  width: 420px !important;
  border-radius: 0.75rem !important;
  background-color: #ffffff !important;
  padding: 2rem !important;
  color: #333 !important;
  border: 1px solid #e0e0e0 !important;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1) !important;
}

.reset-form-container {
  width: 420px;
  border-radius: 0.75rem !important;
  background-color: #ffffff !important;
  padding: 2rem !important;
  color: #333 !important;
  border: 1px solid #e0e0e0 !important;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1) !important;
  display: none;
}

.reset-form-container.show {
  display: block;
  animation: slideIn 0.4s ease;
}

@keyframes slideIn {
  from {
    opacity: 0;
    transform: translateX(20px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

.title {
  text-align: center !important;
  font-size: 1.5rem !important;
  font-weight: 700 !important;
  color: #333 !important;
  margin: 0 0 1.5rem 0 !important;
}

/* 탭 버튼 */
.tab-buttons {
  display: flex !important;
  gap: 8px !important;
  margin-bottom: 2rem !important;
  border-bottom: 2px solid #e0e0e0 !important;
}

.tab-btn {
  flex: 1 !important;
  padding: 12px 0 !important;
  border: none !important;
  background: transparent !important;
  color: #666 !important;
  font-size: 15px !important;
  font-weight: 600 !important;
  cursor: pointer !important;
  transition: all 0.2s ease !important;
  position: relative !important;
}

.tab-btn.active {
  color: #7453fc !important;
}

.tab-btn.active::after {
  content: '' !important;
  position: absolute !important;
  bottom: -2px !important;
  left: 0 !important;
  right: 0 !important;
  height: 2px !important;
  background: #7453fc !important;
}

/* 탭 컨텐츠 */
.tab-content {
  display: none !important;
}

.tab-content.active {
  display: block !important;
}

/* 폼 스타일 */
.form {
  display: flex !important;
  flex-direction: column !important;
  gap: 20px !important;
}

.field {
  display: block !important;
}

.label {
  display: block !important;
  font-size: 13px !important;
  font-weight: 700 !important;
  margin-bottom: 8px !important;
  color: #333 !important;
}

.search {
  height: 44px !important;
  display: flex !important;
  align-items: center !important;
  padding: 0 14px !important;
  border: 1px solid #C4C4C4 !important;
  border-radius: 8px !important;
  background: #fff !important;
  transition: border-color 0.2s ease, box-shadow 0.2s ease !important;
}

.search:focus-within {
  border-color: #7453fc !important;
  box-shadow: 0 0 0 3px rgba(116, 83, 252, 0.1) !important;
}

.search_input {
  width: 100% !important;
  height: 100% !important;
  border: none !important;
  background: transparent !important;
  font-size: 14px !important;
  color: #333 !important;
}

.search_input:focus {
  outline: none !important;
}

.search_input::placeholder {
  color: #999 !important;
}

/* 버튼 */
.submit {
  width: 100% !important;
  padding: 14px 16px !important;
  border: 0 !important;
  border-radius: 8px !important;
  background: #7453fc !important;
  color: #fff !important;
  font-weight: 700 !important;
  font-size: 15px !important;
  cursor: pointer !important;
  transition: background 0.2s ease !important;
  margin-top: 8px !important;
}

.submit:hover {
  background: #5f3fd9 !important;
}

.submit.cancel-btn {
  background: #aaa !important;
  margin-top: 12px !important;
}

.submit.cancel-btn:hover {
  background: #999 !important;
}

/* 결과 메시지 */
.result-box {
  margin-top: 20px !important;
  padding: 16px !important;
  border-radius: 8px !important;
  background: #f9fafb !important;
  border: 1px solid #e5e7eb !important;
  display: none !important;
}

.result-box.show {
  display: block !important;
}

.result-box.success {
  background: #f3f0ff !important;
  border-color: #9b87f5 !important;
}

.result-box.error {
  background: #fef2f2 !important;
  border-color: #ef4444 !important;
}

.result-text {
  font-size: 14px !important;
  color: #333 !important;
  line-height: 1.6 !important;
  text-align: center !important;
}

.result-text strong {
  color: #7453fc !important;
  font-weight: 700 !important;
}

/* 로그인 링크 */
.back-to-login {
  text-align: center !important;
  margin-top: 20px !important;
  font-size: 13px !important;
  color: #666 !important;
}

.back-to-login a {
  color: #7453fc !important;
  text-decoration: none !important;
  font-weight: 600 !important;
}

.back-to-login a:hover {
  text-decoration: underline !important;
}

#pw-reset-area .field {
	margin-bottom: 22px !important;
}

/* 반응형 */
@media (max-width: 768px) {
  .form-container {
    width: 95% !important;
    padding: 1.5rem !important;
  }
  
  .title {
    font-size: 1.35rem !important;
  }
}
</style>
</head>
<body>
<div class="find-wrapper">
  <div class="container-wrapper">
    <div class="form-container">
      <h2 class="title">계정 찾기</h2>
      
      <!-- 탭 버튼 -->
      <div class="tab-buttons">
        <button class="tab-btn active" id="btn-id" onclick="switchTab('id')">아이디 찾기</button>
        <button class="tab-btn" id="btn-pw" onclick="switchTab('pw')">비밀번호 찾기</button>
      </div>

      <!-- 아이디 찾기 탭 -->
      <div id="tab-id" class="tab-content active">
        <form class="form" id="form-id">
          <div class="field">
            <label class="label">휴대폰 번호</label>
            <div class="search">
              <input type="text" class="search_input" name="iPhone" id="input-id-phone" placeholder="휴대폰 번호를 입력하세요" required>
            </div>
          </div>

          <div class="field">
            <label class="label">이메일</label>
            <div class="search">
              <input type="email" class="search_input" name="iEmail" id="input-id-email" placeholder="example@email.com" required>
            </div>
          </div>

          <button type="button" class="submit" id="findIdBtn">아이디 찾기</button>
        </form>
        
        <div id="result-id" class="result-box" style="display: none;">
          <p class="result-text" id="idResultText"></p>
        </div>
      </div>

      <!-- 비밀번호 찾기 탭 -->
      <div id="tab-pw" class="tab-content">
        <form class="form" id="form-pw">
          <div class="field">
            <label class="label">아이디</label>
            <div class="search">
              <input type="text" class="search_input" name="iLoginid" id="input-pw-id" placeholder="아이디를 입력하세요" required>
            </div>
          </div>

          <div class="field">
            <label class="label">이메일</label>
            <div class="search">
              <input type="email" class="search_input" name="iEmail" id="input-pw-email" placeholder="example@email.com" required>
            </div>
          </div>

          <button type="button" class="submit" id="findPwdBtn">비밀번호 재설정</button>
        </form>
        
        <div id="result-pw" class="result-box" style="display: none;">
          <p class="result-text" id="pwResultText"></p>
        </div>
      </div>

      <div class="back-to-login">
        <a href="../users/login.eum">로그인으로 돌아가기</a>
      </div>
    </div>
    
    <!-- 우측 비밀번호 재설정 폼 -->
    <div class="reset-form-container" id="reset-form-container">
      <h2 class="title">비밀번호 재설정</h2>
      
      <div id="pw-reset-area">
        <div class="field">
          <label class="label">새 비밀번호</label>
          <div class="search">
            <input type="password" class="search_input" id="newPwd" placeholder="새 비밀번호 입력" required="required">
          </div>
        </div>
        
        <div class="field">
          <label class="label">비밀번호 재입력</label>
          <div class="search">
            <input type="password" class="search_input" id="newPwd2" placeholder="비밀번호 재입력" required="required">
          </div>
        </div>
        
        <button type="button" class="submit" id="changePwdBtn">변경</button>
        <button type="button" class="submit cancel-btn" id="cancelPwdBtn">취소</button>
      </div>
      
      <div id="result-reset" class="result-box" style="display: none;">
        <p class="result-text" id="resetResultText"></p>
      </div>
    </div>
  </div>
</div>

<script>
function switchTab(tab) {
    // 모든 탭 버튼/컨텐츠 비활성화
    document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));
    document.querySelectorAll('.tab-content').forEach(content => content.classList.remove('active'));

    // 선택한 탭 활성화
    if (tab === 'id') {
        document.getElementById('btn-id').classList.add('active');
        document.getElementById('tab-id').classList.add('active');
    } else {
        document.getElementById('btn-pw').classList.add('active');
        document.getElementById('tab-pw').classList.add('active');
    }

    // 결과 박스 초기화
    document.querySelectorAll('.result-box').forEach(box => {
        box.style.display = 'none';
        box.classList.remove('success', 'error', 'show');
    });

    // 우측 재설정 폼 숨기기
    $('#reset-form-container').removeClass('show');

    // 아이디 찾기 입력폼 초기화 (탭 전환 시)
    if(tab==='id') clearIdInputs();
    if(tab==='pw') clearPwInputs();
}

// 아이디 찾기 입력폼 초기화 함수
function clearIdInputs() {
    $('#input-id-phone').val('');
    $('#input-id-email').val('');
}

function clearPwInputs() {
	$('#input-pw-id').val('');
	$('#input-pw-email').val('');
	$('#newPwd').val('');
	$('#newPwd2').val('');
	$('#reset-form-container').removeClass('show');
	$('#result-pw').hide().removeClass('success error');
	$('#result-reset').hide().removeClass('success error');
}

$(function() {
    const $resultBox = $('#result-id');
    const $resultText = $('#idResultText');

    $('#findIdBtn').click(function() {
        const iPhone = $('#input-id-phone').val().trim();
        const iEmail = $('#input-id-email').val().trim();

        // 결과 박스 초기화
        $resultBox.removeClass('success error')[0].style.setProperty('display', 'none', 'important');
        $resultText.html('');

        if (iPhone === "") {
            $resultBox.addClass('error')[0].style.setProperty('display', 'block', 'important');
            $resultText.html('휴대폰 번호를 입력해주세요.');
            $('#input-id-phone').focus();
            return;
        }

        if (iEmail === "") {
            $resultBox.addClass('error')[0].style.setProperty('display', 'block', 'important');
            $resultText.html('이메일을 입력해주세요.');
            $('#input-id-email').focus();
            return;
        }

        $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/users/find_id.eum',
            data:{iPhone:iPhone, iEmail:iEmail},
            dataType:'text',
            success:function(response) {
                $resultBox.removeClass('success error');
                $resultText.html('');

                const [msg, foundId] = response.split(':');

                if (msg === "OK") {
                    $resultBox.addClass('success')[0].style.setProperty('display', 'block', 'important');
                    $resultText.html('회원님의 아이디는 <strong>' + foundId + '</strong> 입니다.');
                    clearIdInputs();
                } else if (msg === "NOID") {
                    $resultBox.addClass('error')[0].style.setProperty('display', 'block', 'important');
                    $resultText.html('존재하지 않는 계정 정보입니다.');
                    clearIdInputs();
                    $('#input-id-phone').focus();
                }
            },
            error: function(xhr, status, error) {
                alert("AJAX 통신 오류 발생. 상태: " + status);
            }
        });
	});
    
    $('#findPwdBtn').click(function() {
    	const id = $('#input-pw-id').val().trim();
    	const email = $('#input-pw-email').val().trim();
    	
    	const $pwBox = $('#result-pw');
    	const $pwText = $('#pwResultText');
    	
    	$pwBox.removeClass('success error')[0].style.setProperty('display','none','important');
    	$pwText.text('');
    	$('#reset-form-container').removeClass('show');
    	
    	if(id==="") {
    		$pwBox.addClass('error')[0].style.setProperty('display','block','important');
    		$pwText.text("아이디를 입력해주세요.");
    		$('#input-pw-id').focus();
    		return;
    	}
    	if(email==="") {
    		$pwBox.addClass('error')[0].style.setProperty('display','block','important');
    		$pwText.text("이메일을 입력해주세요.");
    		$('#input-pw-email').focus();
    		return;
    	}
    	
    	$.ajax({
    		type:'post',
    		url:'${pageContext.request.contextPath}/users/find_pwd.eum',
    		data:{iLoginId:id, iEmail:email},
    		dataType:'text',
    		success:function(response) {
    			const [msg, uid] = response.split(':');
    			
    			if(msg==="OK") {
    				$pwBox.removeClass('error').addClass('success')[0].style.setProperty('display','block','important');
    				$pwText.html("계정이 확인되었습니다.<br>우측에서 새 비밀번호를 입력해주세요.");
    				
    				// 우측 폼 표시
    				$('#reset-form-container').addClass('show').data('uid', uid);
    				
    				setTimeout(function() {
    					$('#newPwd').focus();
    				}, 400);
    				
    				$('#input-pw-id').val('');
    				$('#input-pw-email').val('');
    			} else {
    				$pwBox.removeClass('success').addClass('error')[0].style.setProperty('display','block','important');
    				$pwText.html("존재하지 않는 계정 정보입니다.");
    				$('#input-pw-id').val('');
    				$('#input-pw-email').val('');
    				$('#input-pw-id').focus();
    			}
    		}
    	});
    });
    
    $('#changePwdBtn').click(function() {
    	const newPwd = $('#newPwd').val().trim();
    	const newPwd2 = $('#newPwd2').val().trim();
    	const uid = $('#reset-form-container').data('uid');
    	
    	const $resetBox = $('#result-reset');
    	const $resetText = $('#resetResultText');
    	
    	$resetBox.removeClass('success error')[0].style.setProperty('display','none','important');
    	
    	if(newPwd==="") {
    		$resetBox.addClass('error')[0].style.setProperty('display','block','important');
    		$resetText.text("새 비밀번호를 입력해주세요.");
    		$('#newPwd').focus();
    		return;
    	}
    	if(newPwd!==newPwd2) {
    		$resetBox.removeClass('success').addClass('error')[0].style.setProperty('display','block','important');
    		$resetText.html("비밀번호가 일치하지 않습니다.");
    		$('#newPwd2').val('').focus();
    		return;
    	}
    	
    	$.ajax({
    		type:'post',
    		url:'${pageContext.request.contextPath}/users/pwd_change.eum',
    		data:{pwd:newPwd,u_id:uid},
    		success:function(response) {
    			$resetBox.removeClass('error').addClass('success')[0].style.setProperty('display','block','important');
    			$resetText.html("비밀번호가 성공적으로 변경되었습니다.<br>잠시 후 로그인 페이지로 이동합니다.");
    			
    			$('#newPwd').val('');
    			$('#newPwd2').val('');
    			
    			setTimeout(function() {
    				location.href = "../users/login.eum";
    			}, 2000);
    		},
    		error:function(xhr, status, error) {
    			$resetBox.removeClass('success').addClass('error')[0].style.setProperty('display','block','important');
    	        $resetText.html("비밀번호 변경 실패: "+error);
    		}
    	});
    });
    
    $('#cancelPwdBtn').click(function() {
    	$('#reset-form-container').removeClass('show');
    	$('#newPwd').val('');
    	$('#newPwd2').val('');
    	$('#result-reset').hide().removeClass('success error');
    });
});
</script>
</body>
</html>