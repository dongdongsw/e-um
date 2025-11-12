<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>내 컨텐츠</title>
<style>
html {
  overflow-y: scroll;
  scrollbar-gutter: stable;
}
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
/* ===== 가로형 컨텐츠 리스트 ===== */
.content-list {
  display: flex;
  flex-direction: column;
  gap: 24px; /* 카드 사이 간격 살짝 늘림 */
}

.content-item {
  display: flex;
  align-items: flex-start;
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  background: #fafafa;
  overflow: hidden;
  transition: box-shadow 0.2s;
  padding: 24px 28px; /* 내부 여백 넓힘 */
}

.content-item:hover {
  box-shadow: 0 4px 12px rgba(0,0,0,0.06);
}

.content-info {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 10px; /* 요소 간 여백 약간 늘림 */
}

.content-thumb {
  width: 180px;
  height: 120px;
  border-radius: 8px;
  overflow: hidden;
  flex-shrink: 0;
  margin-right: 24px;
}

.content-thumb img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.content-info {
  flex: 1;
}

.content-title {
  font-size: 17px;
  font-weight: 700;
  color: #111;
  margin-bottom: 6px;
}

.content-meta {
  font-size: 13px;
  color: #6b7280;
  margin-bottom: 6px;
}

.content-stats {
  margin-bottom: 6px;
}

.content-price {
  font-size: 15px;
  font-weight: 700;
  color: #8e4dff;
}

/* 추가 유틸 (디자인 유지, 내용 가독성만) */
.stars {font-size:14px; line-height:1; letter-spacing:1px; margin-bottom:6px}
.stars .score {font-weight:700; margin-left:6px; color:#111}
.one-line {overflow:hidden; text-overflow:ellipsis; white-space:nowrap;}
.clamp-2 {
  display:-webkit-box; -webkit-line-clamp:2; -webkit-box-orient:vertical;
  overflow:hidden;
}
.badge {display:inline-block; font-size:12px; color:#6b7280; background:#f3f4f6; border:1px solid #e5e7eb; border-radius:999px; padding:2px 8px}
.dot {margin:0 6px; color:#d1d5db}
.content-actions .btn {margin-left:8px; padding:8px 12px; border:1px solid #e5e7eb; border-radius:8px; cursor:pointer}
.content-actions {background:#f9fafb}
.content-actions {display:flex; align-items:center; gap:8px; margin-left:16px}
.content-dates {font-size:12px; color:#9ca3af}

/* 닉네임 옆 프로필 아바타 */
.avatar { width:24px; height:24px; border-radius:50%; object-fit:cover; flex-shrink:0; }

/* 리뷰 이미지 썸네일 (틀만) */
.review-images { display:flex; gap:8px; margin-top:6px; }
.review-thumb {
  width:72px; height:72px; border-radius:8px;
  background:#f3f4f6; border:1px dashed #d1d5db;
}

/* 버튼 공통 (기존 유지) */
.btn {
  padding:8px 12px; border:1px solid #e5e7eb; border-radius:8px; background-color: #111111; cursor:pointer; width: 100px; color:#ffffff; font-size: 12px
}
.btn:hover { 
  background-color: #1f1f1f;
  border-color: #1f1f1f;
  transform: translateY(-1px);
  transition: all 0.15s ease;
  color:white;
	
}
.content-actions.vertical {
  display: flex;
  flex-direction: column;    /* 세로로 쌓이게 */
  gap: 8px;
  align-items: flex-end;     /* 오른쪽 정렬 */
  justify-content: center;   /* 가운데 정렬 느낌 */
  margin-left: 16px;
}
h2 {
  font-size: 20px;
  font-weight: 700;

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
      <a href="../seller/info.eum">셀러 정보</a>
      <a href="../seller/create.eum">컨텐츠 작성</a>
      <a href="../seller/my_contents.eum">내 컨텐츠</a>
      <a href="../seller/review.eum" class="active">구매자 리뷰</a>
      <a href="../seller/chat.eum">채팅 문의</a>
      <a href="../seller/sell.eum">판매 내역</a>
      <a href="../seller/info_update.eum">정보 수정</a>
    </nav>
  </aside>

  <!-- 오른쪽 본문 -->
  <main class="content">
    <h2 style="color:black;">구매자 리뷰</h2>

    <div class="content-list" style="margin-top: 50px">
      <c:choose>
        <c:when test="${empty list}">
          <div class="content-item">
            <div style="padding:24px;color:#666;">등록된 리뷰가 없습니다.</div>
          </div>  
        </c:when>
        <c:otherwise>
          <c:forEach var="vo" items="${list}">
            <div class="content-item">
              <!-- 본문 -->
              <div class="content-info" style="flex:1;">
                <!-- 제목: 한 줄 말줄임 -->
                <div class="content-title one-line">${vo.b_title}</div>

                <!-- 작성자(아바타+닉네임) · 날짜 -->
                <div class="content-meta" style="display:flex; align-items:center; gap:8px;">
                  <c:choose>
                    <c:when test="${not empty vo.uvo.u_profileimg_url}">
                      <img class="avatar" src="${vo.uvo.u_profileimg_url}" alt="${vo.uvo.u_nickname}">
                    </c:when>
                    <c:otherwise>
                      <img class="avatar" src="../images/profile.jpg" alt="user">
                    </c:otherwise>
                  </c:choose>
                  <span style="font-weight:600; color:#111;">${vo.uvo.u_nickname}</span>
                  <span class="dot">·</span>
                  <span>${vo.rvo.b_review_createdat}</span>
                </div>

                <!-- 별점 -->
               <%--  <div class="stars">
                  <c:forEach begin="1" end="5" var="i">
                    <c:choose>
                       <c:when test="${i <= vo.b_review_score}">&#9733;</c:when> 
                      <c:otherwise>&#9734;</c:otherwise>
                    </c:choose>
                  </c:forEach>
                  <span class="score">${vo.rvo.b_review_score}</span>
                </div>
 --%>
                <!-- 리뷰 본문: 두 줄 말줄임 -->
                <div class="clamp-2" style="color:#333;">${vo.rvo.b_review_content}</div>

                <!-- 리뷰 이미지 썸네일 (값 없이 틀만) -->
                <div class="review-images">
                  <div class="review-thumb"></div>
                  <div class="review-thumb"></div>
                  <div class="review-thumb"></div>
                </div>
              </div>

             <div class="content-actions vertical">
			  <button type="button" class="btn"
			    onclick="location.href='../etc/detail.eum?b_id=${vo.b_id}'">자세히 보기</button>
			  <button type="button" class="btn">답변</button>
			</div>
            </div>
          </c:forEach>
        </c:otherwise>
      </c:choose>
    </div>
  </main>
</div>
</body>
</html>