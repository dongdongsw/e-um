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

.form-container {
  width: 420px !important;
  max-width: 90% !important;
  border-radius: 0.75rem !important;
  background-color: #ffffff !important;
  padding: 2rem !important;
  color: #333 !important;
  border: 1px solid #e0e0e0 !important;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1) !important;
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
      <form class="form" id="form-pw" action="../users/find_pwd.eum" method="post">
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

        <button type="submit" class="submit">비밀번호 재설정</button>
      </form>
	  
	  <c:if test="${!empty requestScope.msg && requestScope.msg eq 'NOID'}">
        <div id="result-pw" class="result-box error show">
          <p class="result-text">존재하지 않는 계정 정보입니다.</p>
        </div>
      </c:if>
    </div>

    <div class="back-to-login">
      <a href="../users/login.eum">로그인으로 돌아가기</a>
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

    // 아이디 찾기 입력폼 초기화 (탭 전환 시)
    if (tab === 'id') clearIdInputs();
}

// 아이디 찾기 입력폼 초기화 함수
function clearIdInputs() {
    $('#input-id-phone').val('');
    $('#input-id-email').val('');
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
            return; // 첫 번째 빈 칸 발견 시 바로 종료
        }

        if (iEmail === "") {
            $resultBox.addClass('error')[0].style.setProperty('display', 'block', 'important');
            $resultText.html('이메일을 입력해주세요.');
            $('#input-id-email').focus();
            return; // 두 번째 빈 칸 확인
        }

        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/users/find_id.eum',
            data: { iPhone: iPhone, iEmail: iEmail },
            dataType: 'text',
            success: function(response) {
                $resultBox.removeClass('success error');
                $resultText.html('');

                const [msg, foundId] = response.split(':');

                if (msg === "OK") {
                    $resultBox.addClass('success')[0].style.setProperty('display', 'block', 'important');
                    $resultText.html('회원님의 아이디는 <strong>' + foundId + '</strong> 입니다.');
                    clearIdInputs();
                } else if (msg === "NOID") {
                    $resultBox.addClass('error')[0].style.setProperty('display', 'block', 'important');
                    $resultText.html('입력하신 정보와 일치하는 계정을 찾을 수 없습니다.');
                    clearIdInputs();
                    $('#input-id-phone').focus();
                }
            },
            error: function(xhr, status, error) {
                alert("AJAX 통신 오류 발생. 상태: " + status);
            }
        });
	});
});
</script>
</body>
</html>