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
      <a href="../seller/create.eum">컨텐츠 작성</a>
      <a href="../seller/my_contents.eum">내 컨텐츠</a>
      <a href="../seller/review.eum">구매자 리뷰</a>
      <a href="../seller/chat.eum">채팅 문의</a>
      <a href="../seller/sell.eum" class="active">판매 내역</a>
      <a href="../seller/info_update.eum">정보 수정</a>
    </nav>
  </aside>
  <!-- 오른쪽 본문 -->
  <main class="content">
    <h2 style="color:black;">내 컨텐츠</h2>

    <div class="content-list">

          <c:forEach var="vo" items="${uspay_vo}">
           <div class="content-item">
             <!-- 정보 -->
             
             <div class="content-info">
              <div class="content-dates">
   
               </div>
               <div class="content-title">${vo.bopvo.b_op_title}</div>
               <div class="content-stats">
                 <span class="status" style="font-weight: bold">
                   ${vo.o_status} 
                 </span>
                 
                 <span style="margin-left: 20px">주문 유저 닉네임 : ${vo.uvo.u_nickname}</span>
                 &nbsp;
               </div>
              
               <div class="content-price">
                 <fmt:formatNumber value="${vo.o_total_price}" pattern="#,###" />원
               </div>
             </div>
         
             <!-- 오른쪽 버튼 영역 -->
             <div class="content-actions">
               <div style="text-align: right; margin-left: auto; font-size: 11px; color:#6b7280;"> <!-- 주문 날짜 -->
                  <fmt:formatDate value="${vo.o_createdat}" pattern="yyyy.MM.dd HH:mm"/>
                    </div>
             </div>
           </div>
         </c:forEach>

     
    </div>
  </main>
</div>
</body>
</html>
