<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>셀러 정보</title>
<link rel="stylesheet" href="../css/seller_info.css">
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
<div class="seller-container">
  <!-- 좌측 메뉴 -->
  <aside class="sidebar">
    <h2 style="color:black">셀러 페이지</h2>
    <nav class="menu">
      <a href="../seller/info.eum" class="active">셀러 정보</a>
      <a href="../seller/my_contents.eum">컨텐츠 관리</a>
      <a href="../seller/review.eum">구매자 리뷰</a>
      <a href="../seller/sell.eum">판매 내역</a>
    </nav>
  </aside>

  <!-- 오른쪽 본문 -->
  <main class="content">
    <h2 style="color: black">셀러 정보</h2>

    <div class="profile-card">

      <form id="profileUpdateForm" action="../seller/profile_upload.eum" method="post" enctype="multipart/form-data">
        <div class="profile-container">
          <!-- 프로필 이미지 -->
          <div class="profile-img">
            <img id="currentProfileImg" src="${empty vo.u_s_profileimg_url ? '../images/profile.jpg' : vo.u_s_profileimg_url}" alt="프로필 이미지">
          </div>
          <!-- 파일 선택 -->
	      <div class="upload-btn">
	        <input type="file" id="profile_img" name="profile_img" accept="image/*" style="display:none;">
	        <button type="button" id="selectBtn" class="ulBtn" style="width: 125px">사진 선택</button>
	        <div id="actionButtons" style="display:none;">
              <button type="button" id="saveBtn" class="ulBtn saveBtn" style="width: 60px">저장</button>
              <button type="button" id="cancelBtn" class="ulBtn cancelBtn" style="width: 60px">취소</button>
            </div>
	      </div>
	    </div>
	  </form>

      <!-- 셀러 기본 정보 -->
      <div class="profile-info">
        <div class="info-block">
          <div class="info-title">셀러 이름</div>
          <div class="info-value">${vo.u_s_com}</div>
        </div>

        <div class="info-block">
          <div class="info-title">사업자 등록번호</div>
          <div class="info-value">${vo.u_s_biz_no}</div>
        </div>

        <div class="info-block">
          <div class="info-title">서비스 지역</div>
          <div class="info-value">${vo.u_s_zone}</div>
        </div>

        <div class="info-block">
          <div class="info-title">경력</div>
          <div class="info-value">${vo.u_s_carrer}년</div>
        </div>
        <div style="text-align: right;">
         <a href="../seller/info_update.eum">
          <button class="editBtn">수정</button>
         </a>
        </div>
      </div>
    </div>
  </main>
</div>
<div class="header-text" style="height: 120px; background-color: #fff;"></div>
</body>
</html>