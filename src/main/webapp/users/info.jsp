<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<style>
body {background-color: #fff !important;}
.user-container {
  display: grid;
  grid-template-columns: 240px 1fr;
  width: 1180px;
  margin: 60px auto;
  gap: 40px;
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
	margin-bottom: 100px;
}

.profile-container {
    display: flex;
    flex-direction: column;
    align-items: center;
}
.upload-btn {
    margin-top: 10px;
}
.ulBtn {
	background-color: transparent; 
    border: 1px solid #8e4dff;
    color: #8e4dff;
    padding: 6px 15px;
    border-radius: 6px;
    cursor: pointer;
    font-size: 14px;
    font-weight: 500;
    transition: background-color 0.2s, color 0.2s;
    line-height: 1.5;
}
.ulBtn:hover {
    background-color: #f1e9ff;
    color: #8e4dff;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	const originalImageUrl = $('#currentProfileImg').attr('src');
	
	$('#selectBtn').click(function() {
		$('#profile_img').click();
	});
	
	$('#profile_img').change(function(e) {
	    const file = e.target.files[0];
	    const currentProfileImg = $('#currentProfileImg');
	    
	    if (file) {
	      const reader = new FileReader();
	      reader.onload = function(event) {
	    	  currentProfileImg.attr('src', event.target.result);
	    	  $('#selectBtn').hide();
	    	  $('#actionButtons').show();
	      };
	      reader.readAsDataURL(file);
	    }
	});
	
	$('#saveBtn').click(function() {
		$('#profileUpdateForm').submit();
	});
	
	$('#cancelBtn').click(function() {
		$('#currentProfileImg').attr('src', originalImageUrl);
		$('#profile_img').val('');
		$('#actionButtons').hide();
		$('#selectBtn').show();
	});
});
</script>
</head>
<body>
<div class="header-text" style="height: 200px; background-color: #fff;"></div>
<div class="user-container">
  <!-- 좌측 메뉴 -->
  <aside class="sidebar">
    <h2 style="color:black">마이 페이지</h2>
    <nav class="menu">
      <a href="../users/info.eum" class="active">회원 정보</a>
      <a href="../users/review_list.eum">작성한 리뷰</a>
      <a href="../users/favorite_list.eum">즐겨찾기한 컨텐츠</a>
      <a href="#">결제 내역</a>
      <a href="../users/info_update.eum">정보 수정</a>
    </nav>
  </aside>

  <!-- 오른쪽 본문 -->
  <main class="content">
    <h2 style="color: black">회원 정보</h2>
    <div class="profile-card">
      <form id="profileUpdateForm" action="../users/profile_upload.eum" method="post" enctype="multipart/form-data">
        <div class="profile-container">
          <!-- 프로필 이미지 -->
          <div class="profile-img">
            <img id="currentProfileImg" src="${empty sessionScope.profile ? '../images/profile.jpg' : sessionScope.profile}" alt="프로필 이미지">
          </div>
          <!-- 파일 선택 -->
	      <div class="upload-btn">
	        <input type="file" id="profile_img" name="profile_img" accept="image/*" style="display:none;">
	        <button type="button" id="selectBtn" class="ulBtn">사진 선택</button>
	        <div id="actionButtons" style="display:none;">
              <button type="button" id="saveBtn" class="ulBtn saveBtn">저장</button>
              <button type="button" id="cancelBtn" class="ulBtn cancelBtn">취소</button>
            </div>
	      </div>
	    </div>
	  </form>

      <!-- 회원 기본 정보 -->
      <div class="profile-info">
        <div class="info-block">
          <div class="info-title">아이디</div>
          <div class="info-value">${sessionScope.loginid}</div>
        </div>

        <div class="info-block">
          <div class="info-title">닉네임</div>
          <div class="info-value">${sessionScope.name}</div>
        </div>

        <div class="info-block">
          <div class="info-title">이메일</div>
          <div class="info-value">${sessionScope.email}</div>
        </div>

        <div class="info-block">
          <div class="info-title">연락처</div>
          <div class="info-value">${sessionScope.phone}</div>
        </div>
        
        <div class="info-block">
          <div class="info-title">거주지역</div>
          <div class="info-value">${sessionScope.loc}</div>
        </div>
        
        <div class="info-block">
          <div class="info-title">가입일</div>
          <div class="info-value">${sessionScope.createat}</div>
        </div>
      </div>
    </div>
  </main>
</div>
<div class="header-text" style="height: 120px; background-color: #fff;"></div>
</body>
</html>