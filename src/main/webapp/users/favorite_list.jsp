<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>즐겨찾기한 컨텐츠</title>
<style>
body {background-color: #fff !important; margin: 0; padding: 0;}

.favorite-container {
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

/* 즐겨찾기 리스트 */
.favorites-list {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.favorite-item {
  display: flex;
  gap: 20px;
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  padding: 20px;
  background: #fff;
}

.item-thumbnail {
  width: 120px;
  height: 120px;
  border-radius: 8px;
  overflow: hidden;
  flex-shrink: 0;
  background: #f3f4f6;
}

.item-thumbnail img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.item-info {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.item-category {
  font-size: 13px;
  color: #8e4dff;
  font-weight: 600;
  margin-bottom: 8px;
}

.item-title {
  font-size: 16px;
  font-weight: 600;
  color: #111;
  margin-bottom: 8px;
}

.item-author {
  font-size: 14px;
  color: #6b7280;
  margin-bottom: 12px;
}

.item-meta {
  display: flex;
  gap: 16px;
  font-size: 14px;
  color: #9ca3af;
}

.item-actions {
  display: flex;
  align-items: center;
  gap: 12px;
}

.item-price {
  font-size: 18px;
  font-weight: 600;
  color: #111;
}

.btn-remove {
  padding: 8px 16px;
  border: 1px solid #e5e7eb;
  border-radius: 6px;
  background: #fff;
  color: #6b7280;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.2s;
}

.btn-remove:hover {
  background: #f9fafb;
  border-color: #d1d5db;
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
<div class="favorite-container">
  <!-- 좌측 메뉴 -->
  <aside class="sidebar">
    <h2>마이 페이지</h2>
    <nav class="menu">
      <a href="../users/info.eum">회원 정보</a>
      <a href="../users/review_list.eum">작성한 리뷰</a>
      <a href="../users/favorite_list.eum" class="active">즐겨찾기한 컨텐츠</a>
      <a href="#">결제 내역</a>
      <a href="../users/info_update.eum">정보 수정</a>
    </nav>
  </aside>

  <!-- 오른쪽 본문 -->
  <main class="content">
    <h2>즐겨찾기한 컨텐츠</h2>
	<c:if test="${!empty fList}">
      <div class="favorites-list">
        <!-- 항목 -->
        <c:forEach var="vo" items="${fList}">
          <div class="favorite-item">
            <div class="item-thumbnail">
              <a href="../talent/detail.eum?b_id=${vo.b_id}">              
                <img src="${vo.bvo.b_thumbnail}" alt="${vo.bvo.b_title} 썸네일">
              </a>
            </div>
            <div class="item-info">
              <div>
                <div class="item-category">${vo.bvo.b_type}</div>
                <a href="../talent/detail.eum?b_id=${vo.b_id}">
                  <div class="item-title">${vo.bvo.b_title}</div>
                </a>
                <div class="item-author">${vo.usvo.u_s_com}</div>
              </div>
              <div class="item-meta">
                <span>⭐️ ${vo.rvo.b_review_avg} (${vo.rvo.review_count})</span>
                <span>${vo.dbday} 저장</span>
              </div>
            </div>
            <div class="item-actions">
              <a href="../users/favorite_delete.eum?fv_id=${vo.fv_id}">
                <button class="btn-remove">삭제</button>
              </a>
            </div>
          </div>
        </c:forEach>
      </div>
    </c:if>
    
    <!-- 빈 상태 (즐겨찾기가 없을 때) -->
    <c:if test="${empty fList}">
      <div class="empty-state">
        <div>아직 즐겨찾기한 컨텐츠가 없습니다.</div>
      </div>
    </c:if>
  </main>
</div>
<div class="header-text" style="height: 120px; background-color: #fff;"></div>
</body>
</html>