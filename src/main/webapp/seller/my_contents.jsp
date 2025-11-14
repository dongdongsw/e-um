<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>내 컨텐츠</title>
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
    <h2 style="color:black">셀러 페이지</h2>
    <nav class="menu">
      <a href="../seller/info.eum">셀러 정보</a>
      <a href="#" class="">컨텐츠 작성</a>
      <a href="../seller/my_contents.eum" class="active">내 컨텐츠</a>
      <a href="#">판매 내역</a>
      <a href="../seller/info_update.eum">정보 수정</a>
    </nav>
  </aside>

  <!-- 오른쪽 본문 -->
  <main class="content">
    <h2 style="color:black;">내 컨텐츠</h2>

    <div class="content-list">
      <c:choose>
		  <c:when test="${empty list}">
		   <div class="content-item">
		    <div style="padding:24px;color:#666;">등록된 컨텐츠가 없습니다.</div>
		   </div>
		  </c:when>
		  <c:otherwise>
		    <c:forEach var="vo" items="${list}">
			  <div class="content-item">
			    <!-- 썸네일 -->
			    <div class="content-thumb">
			      <img src="${vo.b_thumbnail}" alt="${vo.b_title}">
			    </div>
			
			    <!-- 정보 -->
			    
			    <div class="content-info">
			     <div class="content-dates">

			        
			      </div>
			      <div class="content-title">${vo.b_title}</div>
			      <div class="content-meta">
			        ${vo.b_type} <span class="dot">·</span> ${vo.b_filter}
			      </div>
			      <div class="content-stats">
			        <span class="status" style="font-weight: bold">
			          ${vo.b_status eq 'active' ? '판매중' : 'inactive'} 
			        </span>
			     	
			        <span style="margin-left: 20px">조회수 ${vo.b_view_count}</span>
			        &nbsp;
			        <span>리뷰 100</span>
			      </div>
			     
			      <div class="content-price">
			        <fmt:formatNumber value="50000" pattern="#,###" />원
			      </div>
			    </div>
			
			    <!-- 오른쪽 버튼 영역 -->
			    <div class="content-actions">
			      <button type="button" class="btn view">보기</button>
			      <button type="button" class="btn edit">수정</button>
			      <button type="button" class="btn delete">삭제</button>
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
