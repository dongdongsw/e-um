<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>구매자 리뷰</title>

<style>
/* ===================== 기본 레이아웃 ===================== */
body {background-color: #fff !important;}
.seller-container {
  display: grid;
  grid-template-columns: 240px 1fr;
  width: 1180px;
  margin: 60px auto;
  gap: 40px;
}

/* ===================== 좌측 메뉴 ===================== */
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

/* ===================== 오른쪽 컨텐츠 박스 ===================== */
.content {
  background: #ffffff;
  border-radius: 16px;
  padding: 28px 30px;
  box-shadow: 0 8px 20px rgba(15, 23, 42, 0.06);
}

h2 {
  font-size: 20px;
  font-weight: 700;
  color: #111827;
  margin: 0;
}

/* ===================== 리스트 전체 ===================== */
.content-list {
  display: flex;
  flex-direction: column;
  gap: 18px;
  margin-top: 32px;
}

/* ===================== 카드 ===================== */
.content-item {
  display: flex;
  align-items: stretch;
  border-radius: 12px;
  background: #f9fafb;
  overflow: hidden;
  transition: all 0.18s ease;
  padding: 18px 20px;
  border: 1px solid #e5e7eb;
}

.content-item:hover {
  box-shadow: 0 6px 16px rgba(15, 23, 42, 0.09);
  transform: translateY(-1px);
  border-color: #d1d5db;
}

/* ===================== 썸네일 ===================== */
.product-thumbnail {
  width: 190px;
  height: 140px;
  border-radius: 10px;
  overflow: hidden;
  flex-shrink: 0;
  margin-right: 24px;
  background: #e5e7eb;
  align-self: center;
}

.product-thumbnail img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

/* ===================== 오른쪽 컨텐츠 정보 ===================== */
.content-info {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 8px;
}

/* 제목 */
.content-title {
  font-size: 18px;
  font-weight: 800;
  color: #111827;
  margin-bottom: 4px;
}

.one-line {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

/* 작성자 · 날짜 */
.content-meta {
  font-size: 13px;
  color: #6b7280;
  display: flex;
  align-items: center;
  gap: 8px;
}

.dot {
  margin: 0 4px;
  color: #d1d5db;
}

/* 아바타 */
.avatar {
  width: 26px;
  height: 26px;
  border-radius: 50%;
  object-fit: cover;
  flex-shrink: 0;
}

/* ===================== 리뷰 영역 ===================== */
.review-block {
  margin-top: 10px;
  padding-top: 12px;
  border-top: 1px solid #e5e7eb;
}

.review-label {
  font-size: 12px;
  font-weight: 600;
  color: #6b7280;
  margin-bottom: 4px;
}

.review-rating {
  font-size: 13px;
  color: #f59e0b;
  font-weight: 600;
  margin-bottom: 4px;
}

.clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
  font-size: 14px;
  color: #374151;
  line-height: 1.5;
}

/* ===================== 버튼 ===================== */
.btn {
  padding: 8px 12px;
  border-radius: 8px;
  border: 1px solid #e5e7eb;
  background-color: #111827;
  cursor: pointer;
  width: 110px;
  color: #ffffff;
  font-size: 12px;
  text-align: center;
  transition: all 0.15s ease;
}

.btn:hover {
  background-color: #1f2937;
  border-color: #1f2937;
  transform: translateY(-1px);
}

/* 버튼 세로 정렬 */
.content-actions.vertical {
  display: flex;
  flex-direction: column;
  gap: 8px;
  align-items: flex-end;
  justify-content: flex-end;
  margin-left: 16px;
}
</style>
</head>

<body>
<div class="header-text" style="height: 200px;"></div>

<div class="seller-container">

  <!-- ===================== 왼쪽 메뉴 ===================== -->
  <aside class="sidebar">
    <h2 style="color:black">셀러 페이지</h2>
    <nav class="menu">
      <a href="../seller/info.eum">셀러 정보</a>
      <a href="../seller/create.eum">컨텐츠 작성</a>
      <a href="../seller/my_contents.eum">내 컨텐츠</a>
      <a href="../seller/review.eum" class="active">구매자 리뷰</a>
      <a href="../seller/chat.eum">채팅 문의</a>
      <a href="../seller/sell.eum">판매 내역</a>
    </nav>
  </aside>

  <!-- ===================== 오른쪽 본문 ===================== -->
  <main>
    <h2>구매자 리뷰</h2>

    <div class="content-list">

      <c:choose>
        <c:when test="${empty list}">
          <div class="content-item">
            <div style="padding:24px;color:#666;">등록된 리뷰가 없습니다.</div>
          </div>
        </c:when>

        <c:otherwise>
          <c:forEach var="vo" items="${list}">
            <div class="content-item">

              <div class="product-thumbnail">
                <img src="${vo.b_thumbnail}">
              </div>

              <div class="content-info">

                <div class="content-title one-line">${vo.b_title}</div>

                <div class="content-meta">
                  <c:choose>
                    <c:when test="${not empty vo.uvo.u_profileimg_url}">
                      <img class="avatar" src="${vo.uvo.u_profileimg_url}">
                    </c:when>
                    <c:otherwise>
                      <img class="avatar" src="../images/profile.jpg">
                    </c:otherwise>
                  </c:choose>

                  <span style="font-weight:600;">${vo.uvo.u_nickname}</span>
                  
                  <div class="review-rating">★ ${vo.rvo.b_review_score}</div>
                  <span class="dot">·</span>
                  <span>${vo.rvo.b_review_createdat}</span>
                  
                </div>

                <div class="review-block">
                  
                  <div class="clamp-2">${vo.rvo.b_review_content}</div>
                </div>
              </div>

              <div class="content-actions vertical">
                <c:choose>
                  <c:when test="${vo.rvo.has_reply==1 }">
                    <p style="font-weight: bold; color:#6b7280; margin:0 20px 70px 0;">답변 완료</p>
                  </c:when>
                  <c:otherwise>
                    <p style="font-weight: bold; color:#6b7280; margin:0 20px 70px 0;">답변 전</p>
                  </c:otherwise>
                </c:choose>

                <button type="button" class="btn"
                  onclick="location.href='../talent/detail.eum?b_id=${vo.b_id}#tabs-3'">
                  자세히 보기
                </button>
              </div>

            </div>
          </c:forEach>
        </c:otherwise>
      </c:choose>
		<div style="height: 100px"></div>
    </div>
  </main>
</div>

</body>
</html>
