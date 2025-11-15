<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>셀러 정보</title>
<style>
body {background-color: #fff !important;}
.seller-container {
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
h2 {margin-bottom:100px}

.editBtn {
  color: white;
  background-color: black;
  width: 80px;
  height: 40px;
  align-content: flex-end;
  border-radius: 15px;
  font-weight: bold;
}
</style>
</head>
<body>
<div class="header-text" style="height: 200px; background-color: #fff;"></div>
<div class="seller-container">
  <!-- 좌측 메뉴 -->
  <aside class="sidebar">
    <h2 style="color:black">셀러 페이지</h2>
    <nav class="menu">
      <a href="../seller/info.eum" class="active">셀러 정보</a>
      <a href="../seller/create_contents.eum">컨텐츠 작성</a>
      <a href="../seller/my_contents.eum">내 컨텐츠</a>
      <a href="../seller/review.eum">구매자 리뷰</a>
      <a href="../seller/chat.eum">채팅 문의</a>
      <a href="#">판매 내역</a>
    </nav>
  </aside>

  <!-- 오른쪽 본문 -->
  <main class="content">
    <h2 style="color: black">셀러 정보</h2>

    <div class="profile-card">
      <!-- 프로필 이미지 -->
      <div class="profile-img">
        <img src="${empty vo.u_s_profileimg_url ? '../images/profile.jpg' : vo.u_s_profileimg_url}" alt="프로필 이미지">
      </div>

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
          <button class="editBtn">✍️수정</button>
         </a>
        </div>
      </div>
    </div>
  </main>
</div>
<div class="header-text" style="height: 120px; background-color: #fff;"></div>
</body>
</html>