<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<style>
    .content-area {
        margin-left: 260px; 
        padding: 20px;
    }

    .content-wrapper {
        display: flex;
        gap: 20px;
    }

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


.product-card::-webkit-scrollbar,
.image-viewer-card::-webkit-scrollbar {
    width: 4px;   
}

.product-card::-webkit-scrollbar-track,
.image-viewer-card::-webkit-scrollbar-track {
    background: transparent; 
}


.product-card::-webkit-scrollbar-thumb,
.image-viewer-card::-webkit-scrollbar-thumb {
    background: rgba(0, 0, 0, 0.2); 
    border-radius: 10px;
}


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

.seller-profile {
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%;
}

.seller-info {
    display: flex;
    flex-direction: column;
    margin-left: 10px;
    flex: 1; /* 이미지와 버튼 사이 공간 채움 */
}

.title-buttons {
    display: flex;
    gap: 6px;
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
.status-badge {
    display: inline-block;
    padding: 6px 12px;
    border-radius: 5px;
    font-size: 13px;
    font-weight: 700;
    margin-left: 10px;
}

.status-active {
    background: #17a2b8;   /* btn-info 비슷한 색 */
    color: #ffffff;
}

.status-inactive {
    background: #dc3545;  /* btn-danger 색상 */
    color: #ffffff;
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
            <h4 class="product-title">${board_vo.b_title}
            	 <c:choose>
            <c:when test="${fn:toLowerCase(board_vo.b_status) == 'active'}">
                <span class="status-badge status-active">판매중</span>
            </c:when>
            <c:otherwise>
                <span class="status-badge status-inactive">판매중지</span>
            </c:otherwise>
        </c:choose>
            </h4>

            
        </div>

        <div class="seller-profile">
    
    <!-- 프로필 이미지 -->
    <img src="${board_vo.usvo.u_s_profileimg_url }" class="seller-img">

    <!-- 회사명 + 경력 -->
    <div class="seller-info">
        <div class="info-value">${board_vo.usvo.u_s_com}</div>
        <div class="info-label">
            <c:if test="${board_vo.usvo.u_s_carrer > 0}">
                경력 ${board_vo.usvo.u_s_carrer}년
            </c:if>
            <c:if test="${board_vo.usvo.u_s_carrer <= 0}">
                경력 0년
            </c:if>
        </div>
    </div>

    <!-- 오른쪽 버튼들 -->
    <div class="title-buttons">
        <c:choose>
		    <c:when test="${board_vo.b_status == 'active'}">
		        <!-- active 상태 -->
		        <a href="../admin/admin_contents_status.eum?b_id=${board_vo.b_id}&b_status=inactive"
		           class="btn btn-danger btn-sm mr-1">비활성화</a>
		    </c:when>
		
		    <c:otherwise>
		        <!-- inactive 상태 -->
		        <a href="../admin/admin_contents_status.eum?b_id=${board_vo.b_id}&b_status=active"
		           class="btn btn-info btn-sm mr-1">활성화</a>
		    </c:otherwise>
		</c:choose>

        <a href="../admin/admin_contents_delete.eum?page=1&b_id=${board_vo.b_id}&keyword= " class="btn btn-danger btn-sm">삭제</a>
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
