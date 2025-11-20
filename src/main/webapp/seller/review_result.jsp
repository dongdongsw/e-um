<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/seller_review.css">
</head>
<body>
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

      <ul class="page"> 
	  <c:if test="${startPage > 1}">
	    <li class="page__btn active">
	      <a class="material-icons"
	         href="javascript:void(0);"
	         onclick="prev(${startPage - 1})">&lt;</a>
	    </li>
	  </c:if>
	
	  <c:forEach var="i" begin="${startPage}" end="${endPage}">
	    <li class="page__numbers ${i==curpage?'active':''}">
	      <a href="javascript:void(0);"
	         onclick="change(${i})">${i}</a>
	    </li>
	  </c:forEach>
	
	  <c:if test="${endPage < totalpage}">
	    <li class="page__btn active">
	      <a class="material-icons"
	         href="javascript:void(0);"
	         onclick="next(${endPage + 1})">&gt;</a>
	    </li>
  	</c:if>
</ul>
      <div style="height: 100px"></div>
</body>
</html>