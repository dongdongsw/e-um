<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
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
</style>
</head>
<body>
<div class="header-text" style="height: 200px; background-color: #fff;"></div>
<div class="seller-container">
  <!-- 좌측 메뉴 -->
  <aside class="sidebar">
    <h2 style="color:black">마이 페이지</h2>
    <nav class="menu">
      <a href="../users/info.eum" class="active">회원 정보</a>
      <a href="#" class="">작성한 리뷰</a>
      <a href="#">찜 컨텐츠</a>
      <a href="#">결제 내역</a>
      <a href="../users/info_update.eum">정보 수정</a>
    </nav>
  </aside>

  <!-- 오른쪽 본문 -->
  <main class="content">
    <h2 style="color: black">회원 정보</h2>

    <div class="profile-card">
      <!-- 프로필 이미지 -->
      <div class="profile-img">
        <img src="${empty sessionScope.profile ? '../images/profile.jpg' : sessionScope.profile}" alt="프로필 이미지">
      </div>

      <!-- 셀러 기본 정보 -->
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