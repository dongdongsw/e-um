<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>작성한 리뷰</title>
<style>
body {background-color: #fff !important; margin: 0; padding: 0;}

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
  color: black;
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
  color: black;
}

/* 리뷰 리스트 */
.review-list {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.review-item {
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  padding: 24px;
  background: #fff;
}

.review-header {
  display: flex;
  gap: 20px;
  margin-bottom: 20px;
  padding-bottom: 20px;
  border-bottom: 1px solid #f3f4f6;
}

.product-thumbnail {
  width: 80px;
  height: 80px;
  border-radius: 8px;
  overflow: hidden;
  flex-shrink: 0;
  background: #f3f4f6;
}

.product-thumbnail img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.product-info {
  flex: 1;
}

.product-category {
  font-size: 13px;
  color: #8e4dff;
  font-weight: 600;
  margin-bottom: 6px;
}

.product-title {
  font-size: 16px;
  font-weight: 600;
  color: #111;
  margin-bottom: 8px;
}

.product-author {
  font-size: 14px;
  color: #6b7280;
}

.review-actions {
  display: flex;
  gap: 8px;
  align-items: flex-start;
}

.btn-edit, .btn-delete {
  padding: 6px 14px;
  border: 1px solid #e5e7eb;
  border-radius: 6px;
  background: #fff;
  color: #6b7280;
  font-size: 13px;
  cursor: pointer;
  transition: all 0.2s;
}

.btn-edit:hover, .btn-delete:hover {
  background: #f9fafb;
  border-color: #d1d5db;
}

.review-rating {
  display: flex;
  gap: 4px;
  margin-bottom: 16px;
  font-size: 16px;
  color: #f59e0b;
}

.star.empty {
  color: #e5e7eb;
}

.review-content {
  font-size: 14px;
  color: #374151;
  line-height: 1.6;
  margin-bottom: 16px;
}

.review-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 13px;
  color: #9ca3af;
  padding-top: 16px;
  border-top: 1px solid #f3f4f6;
}

.review-stats {
  display: flex;
  gap: 16px;
}

/* 빈 상태 */
.empty-state {
  text-align: center;
  padding: 100px 20px;
  color: #9ca3af;
}

.empty-state div {
  font-size: 15px;
  margin-bottom: 10px;
}
</style>
</head>
<body>
<div class="header-text" style="height: 200px; background-color: #fff;"></div>
<div class="seller-container">
  <!-- 좌측 메뉴 -->
  <aside class="sidebar">
    <h2>마이 페이지</h2>
    <nav class="menu">
      <a href="../users/info.eum">회원 정보</a>
      <a href="../users/review_list.eum" class="active">작성한 리뷰</a>
      <a href="../users/favorite_list.eum">즐겨찾기한 컨텐츠</a>
      <a href="#">결제 내역</a>
      <a href="../users/info_update.eum">정보 수정</a>
    </nav>
  </aside>

  <!-- 오른쪽 본문 -->
  <main class="content">
    <h2>작성한 리뷰</h2>
    <c:if test="${vo.b_review_id!=null}">
    <div class="review-list">
      <!-- 리뷰 -->
      <div class="review-item">
        <div class="review-header">
          <div class="product-thumbnail">
            <img src="#">
          </div>
          <div class="product-info">
            <div class="product-category">카테고리</div>
            <div class="product-title">제목</div>
            <div class="product-author">셀러명</div>
          </div>
          <div class="review-actions">
            <button class="btn-edit">자세히 보기</button>
          </div>
        </div>

        <div class="review-rating">
          <span class="star">★</span>
          <span class="star">★</span>
          <span class="star">★</span>
          <span class="star">★</span>
          <span class="star">★</span>
        </div>

        <div class="review-content">
          리뷰내용
        </div>

        <div class="review-footer">
          <div>리뷰작성일</div>
          <div class="review-stats">
            <span>💬 답글 count</span>
          </div>
        </div>
      </div>
    </div>
	</c:if>
	
    <!-- 빈 상태 (리뷰가 없을 때) -->
    <c:if test="${vo.b_review_id==null}">
      <div class="empty-state">
        <div>아직 작성한 리뷰가 없습니다.</div>
      </div>
    </c:if>
  </main>
</div>
<div class="header-text" style="height: 120px; background-color: #fff;"></div>
</body>
</html>