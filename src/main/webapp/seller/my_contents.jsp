<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>내 컨텐츠</title>
<link rel="stylesheet" href="../css/seller_mycon.css">
</head>
<body>
<div class="header-text" style="height: 200px; background-color: #fff;"></div>

<div class="seller-container">
  <!-- 좌측 메뉴 -->
  <aside class="sidebar">
    <h2 style="color:black">셀러 페이지</h2>
    <nav class="menu">
      <a href="../seller/info.eum">셀러 정보</a>
      <a href="../seller/my_contents.eum" class="active">컨텐츠 관리</a>
      <a href="../seller/review.eum">구매자 리뷰</a>
      <a href="../seller/sell.eum">판매 내역</a>
    </nav>
  </aside>

  <!-- 오른쪽 본문 -->
  <main class="content">
    <h2 style="color:black; margin-bottom: 20px">내 컨텐츠</h2>
	
	

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
			        <span>리뷰&nbsp;${vo.rvo.review_count}</span>
			      </div>
			     
			      <div class="content-price">
			        <fmt:formatNumber value="${vo.bovo.b_op_price }" pattern="#,###" />원
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
     <div style="text-align: right;">
         <a href="../seller/create_contents.eum">
          <button class="creBtn">작성</button>
         </a>
        </div>
    </div>
  </main>
</div>
</body>
</html>