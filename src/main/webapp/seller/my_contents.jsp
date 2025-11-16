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
html {
  overflow-y: scroll;
  scrollbar-gutter: stable;
}
.seller-container {
  display: grid;
  grid-template-columns: 240px 1fr;
  width: 1180px !important;
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
  margin-bottom: 40px;
}

/* ===== 가로형 컨텐츠 리스트 ===== */
.content-list {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.content-item {
  display: flex;
  align-items: center;
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  background: #fafafa;
  overflow: hidden;
  transition: box-shadow 0.2s;
  padding: 16px;
}

.content-item:hover {
  box-shadow: 0 3px 10px rgba(0,0,0,0.06);
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
      <a href="../seller/create_contents.eum">컨텐츠 작성</a>
      <a href="../seller/my_contents.eum" class="active">내 컨텐츠</a>
      <a href="../seller/review.eum">구매자 리뷰</a>
      <a href="../seller/chat.eum">채팅 문의</a>
      <a href="../seller/sell.eum">판매 내역</a>
    </nav>
  </aside>

  <!-- 오른쪽 본문 -->
  <main class="content">
    <h2 style="color:black; margin-bottom: 50px">내 컨텐츠</h2>

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
				    <a href="../talent/detail.eum?b_id=${vo.b_id }" type="button" class="btn view">보기</a>
				
				    <button type="button" class="btn edit"
				            onclick="location.href='../seller/update_contents.eum?b_id=${vo.b_id}'">
				        수정
				    </button>
				
				    <a href="../seller/delete_contents_ok.eum?b_id=${vo.b_id }" class="btn delete">삭제</a>
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