<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<style>
    .content-area {
        margin-left: 260px; /* 사이드바 폭 */
        padding: 20px;
    }

    .content-wrapper {
        display: flex;
        gap: 20px;
    }

    /* ----------------------
       LEFT : 상품 정보 카드
       ---------------------- */
    .product-card {
        flex: 1;
        background: #fff;
        border: 1px solid #e3e6ea;
        border-radius: 8px;
        padding: 25px;
        min-height: 80vh;
        box-shadow: 0 1px 2px rgba(0,0,0,0.03);
          height: 87vh;  
          overflow-y: auto;
    }

/* 공통 스크롤 디자인 */
.product-card::-webkit-scrollbar,
.image-viewer-card::-webkit-scrollbar {
    width: 4px;        /* ⭐ 스크롤바 굵기 (초극세) */
}

/* 스크롤바 트랙(배경) */
.product-card::-webkit-scrollbar-track,
.image-viewer-card::-webkit-scrollbar-track {
    background: transparent;        /* 트랙 안보이게 */
}

/* 스크롤바 손잡이(바) */
.product-card::-webkit-scrollbar-thumb,
.image-viewer-card::-webkit-scrollbar-thumb {
    background: rgba(0, 0, 0, 0.2);  /* 연한 회색 투명 */
    border-radius: 10px;
}

/* 스크롤바 hover 시 손잡이 강조 */
.product-card::-webkit-scrollbar-thumb:hover,
.image-viewer-card::-webkit-scrollbar-thumb:hover {
    background: rgba(0, 0, 0, 0.35);
}

    .product-header {
        display: flex;
        gap: 20px;
        align-items: center;
        margin-bottom: 25px;
    }

    .thumbnail-img {
        width: 110px;
        height: 110px;
        border-radius: 8px;
        object-fit: cover;
        border: 1px solid #ddd;
    }

    .seller-profile {
        display: flex;
        align-items: center;
        margin-top: 10px;
        gap: 10px;
    }

    .seller-img {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        object-fit: cover;
        border: 1px solid #ccc;
    }

    .info-label {
        color: #888;
        font-size: 14px;
        margin-bottom: 4px;
    }

    .info-value {
        font-weight: 600;
        color: #222;
    }

    .divider {
        margin: 20px 0;
        border-bottom: 1px solid #eee;
    }

    .option-box {
        background: #f9fafb;
        border: 1px solid #e5e7eb;
        padding: 12px 15px;
        border-radius: 6px;
        margin-bottom: 10px;
    }

    .badge-mode {
        display: inline-block;
        padding: 4px 10px;
        border-radius: 12px;
        font-size: 12px;
        font-weight: 600;
        margin-right: 6px;
    }

    .badge-online {
        background: #e0e7ff;
        color: #4338ca;
    }

    .badge-offline {
        background: #d1fae5;
        color: #065f46;
    }

    .stats-row {
        display: flex;
        gap: 20px;
        font-size: 14px;
        color: #555;
    }

    .stats-row span {
        font-weight: 600;
        color: #222;
    }


    .image-viewer-card {
        flex: 1.2;
        background: #fff;
        border: 1px solid #e3e6ea;
        border-radius: 8px;
        padding: 20px;

        height: 87vh;        
        overflow-y: auto;   
        box-shadow: 0 1px 2px rgba(0,0,0,0.03);
    }

    .webtoon-img {
        width: 100%;
        border-radius: 6px;
        margin-bottom: 20px;
        display: block;
    }
    .title-buttons {
    display: flex;
    justify-content: space-between; /* 제목 왼쪽, 버튼 오른쪽 */
    align-items: center;
    margin-bottom: 8px;
}

.detail-title {
    margin: 0;
    font-weight: 700;
}

.right-buttons button {
    margin-left: 8px;
}
    
    .title-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.product-title {
    margin: 0;
    font-weight: 700;
    font-size: 20px;
}

.title-buttons button {
    margin-left: 8px;
}
</style>


<div class="content-area">
    <div class="content-wrapper">
		
        <!-- LEFT : 상품 정보 카드 -->
        <div class="product-card">
            <div class="product-header">
    <img src="${board_vo.b_thumbnail }" class="thumbnail-img">
    
    <div style="flex:1;">
        <div class="title-row">
            <h4 class="product-title">${board_vo.b_title}</h4>

            <div class="title-buttons">
                <c:if test="${fn:toLowerCase(board_vo.b_status) == 'active'}">
				    <a href="" class="btn btn-info btn-sm mr-1">활성화</a>
				</c:if>
				
				<c:if test="${fn:toLowerCase(board_vo.b_status) != 'active'}">
				    <a href="" class="btn btn-danger btn-sm mr-1">비활성화</a>
				</c:if>

                <a href="" class="btn btn-danger btn-sm">삭제</a>
            </div>
        </div>

        <div class="seller-profile">
            <img src="${board_vo.usvo.u_s_profileimg_url }" class="seller-img">
            <div>
                <div class="info-value">홍길동 (판매자)</div>
                <div class="info-label">경력 5년</div>
            </div>
        </div>
    </div>
</div>
			
            <div>
                <div class="info-label">서비스 지역</div>
                <div class="info-value">${board_vo.usvo.u_s_zone }</div>
            </div>

            <div class="divider"></div>

            <div>
                <div class="info-label">가격 옵션</div>
				<c:forEach var="opt" items="${bo }" >
	                <div class="option-box">
	                    <strong>${opt.b_op_title }</strong><br>
	                    ${opt.b_op_price }원
	                </div>
                </c:forEach>
            </div>

            <div class="divider"></div>

            <div>
                <div class="info-label">수업 방식</div>
               <c:if test="${board_vo.b_prod_on_off == 'OFFLINE' }">
                	<span class="badge-mode badge-online">비대면</span>
                </c:if>
                <c:if test="${ board_vo.b_prod_on_off == 'ONLINE'}">
                	<span class="badge-mode badge-offline">대면</span>
                </c:if>
            </div>

            <div class="divider">${board_vo.b_content }</div>

            <div class="stats-row">
                <div>❤️ 좋아요 <span>${ board_vo.l_count}</span></div>
                <div>👁 조회수 <span>${ board_vo.b_view_count}</span></div>
                <div>⭐ 평점 
				    <span>
				        <c:choose>
				            <c:when test="${empty board_avg.b_review_score}">
				                0 
				            </c:when>
				            <c:otherwise>
				                ${board_avg.b_review_score}
				            </c:otherwise>
				        </c:choose>
				    </span>
				</div>
                <div>📝 리뷰수 <span>${board_vo.r_count } </span></div>
            </div>
        </div>


        <!-- RIGHT : 웹툰 이미지 뷰어 -->
        <div class="image-viewer-card">

            <h5 class="mb-3">미리보기</h5>
				<c:forEach var="img" items="${b_img_vo }" >
	                <!-- 더미 이미지 -->
	                <img src="${img.b_img_url }" class="webtoon-img">
				</c:forEach>

        </div>

    </div>
</div>
