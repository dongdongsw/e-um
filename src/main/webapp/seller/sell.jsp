<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>내 컨텐츠</title>
<link rel="stylesheet" href="../css/seller_sell.css">
</head>
<body>
<div class="header-text" style="height: 200px; background-color: #fff;"></div>

<div class="seller-container">
  <!-- 좌측 메뉴 -->
  <aside class="sidebar">
    <h2 style="color:black">판매 내역</h2>
    <nav class="menu">
      <a href="../seller/info.eum">셀러 정보</a>
      <a href="../seller/my_contents.eum">컨텐츠 관리</a>
      <a href="../seller/review.eum">구매자 리뷰</a>
      <a href="../seller/sell.eum" class="active">판매 내역</a>
    </nav>
  </aside>
  <!-- 오른쪽 본문 -->
  <main class="content">
    <h2 style="color:black;">판매 내역</h2>

    <div class="content-list">
      <c:if test="${empty uspay_vo}">
          <div class="content-item">
		    <div style="padding:24px;color:#666;">판매 내역이 없습니다.</div>
		  </div>
      </c:if>
		
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
         
          <ul class="page"> 
	  <c:if test="${startPage > 1}">
	    <li class="page__btn active">
	      <a class="material-icons"
	         href="../seller/sell.eum?page=${startPage-1 }">&lt;</a>
	    </li>
	  </c:if>
	
	  <c:forEach var="i" begin="${startPage}" end="${endPage}">
	    <li class="page__numbers ${i==curpage?'active':''}">
	      <a href="../seller/sell.eum?page=${i}">${i}</a>
	    </li>
	  </c:forEach>
	
	  <c:if test="${endPage < totalpage}">
	    <li class="page__btn active">
	      <a class="material-icons"
	         href="../seller/sell.eum?page=${endPage+1}">&gt;</a>
	    </li>
  	</c:if>

</ul>

     
    </div>
  </main>
</div>
</body>
</html>