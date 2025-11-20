<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/list.css?v=1.0">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
/* ====== 스타일 (그대로) ====== */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
    background: #f8f9fa;
}
.top-category-nav {
    background: white;
    border-bottom: 1px solid #e0e0e0;
    padding: 0;
    margin-bottom: 20px;
}
.category-container {
    max-width: 1400px;
    margin: 0 auto;
    display: flex;
    justify-content: center;
    gap: 40px;
    padding: 20px;
}
.category-link {
    color: #666;
    text-decoration: none;
    font-size: 15px;
    font-weight: 500;
    padding: 8px 0;
    transition: color 0.2s;
    border-bottom: 2px solid transparent;
}
.category-link:hover {
    color: #000;
}
.category-link.active {
    color: #7453FC;
    font-weight: 700;
    border-bottom: 2px solid #7453FC;
}
.main-layout {
    max-width: 1400px;
    margin: 0 auto;
    display: flex;
    gap: 30px;
    padding: 20px;
}
.left-sidebar {
    width: 240px;
    flex-shrink: 0;
}
.filter-section {
    background: white;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 20px;
}
.filter-section h3 {
    font-size: 14px;
    font-weight: 700;
    margin-bottom: 15px;
    color: #333;
}
.filter-buttons {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    margin-bottom: 20px;
}
.filter-btn {
    background: white;
    border: 1px solid #ddd;
    padding: 8px 16px;
    border-radius: 20px;
    font-size: 13px;
    color: #666;
    cursor: pointer;
    transition: all 0.2s;
}
.filter-btn:hover,
.filter-btn.active {
    background: #f0f0f0;
    border-color: #999;
    color: #333;
}
.category-group {
    margin-bottom: 15px;
}
.category-group h4 {
    font-size: 13px;
    font-weight: 700;
    margin-bottom: 12px;
    color: #333;
    cursor: pointer;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 8px 0;
    transition: color 0.2s;
}
.category-group h4:hover {
    color: #7453FC;
}
.category-group h4:after {
    content: '∨';
    font-size: 12px;
    color: #999;
    transition: transform 0.3s;
}
.category-group h4.active:after {
    transform: rotate(180deg);
}
.category-items {
    display: flex !important;
    flex-direction: column;
    gap: 8px;
    padding-left: 12px;
    margin-top: 8px;
}
.category-items.show {
    display: flex;
}
.category-item {
    font-size: 13px;
    color: #666;
    padding: 6px 0;
    cursor: pointer;
    transition: color 0.2s;
}
.category-item:hover {
    color: #7453FC;
}
.main-content {
    flex: 1;
    min-width: 0;
}
.banner-section {
    background: linear-gradient(135deg, #A8E6CF 0%, #FFD3B6 100%);
    border-radius: 12px;
    padding: 30px;
    margin-bottom: 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}
.banner-content h2 {
    font-size: 20px;
    font-weight: 700;
    color: #333;
    margin-bottom: 8px;
}
.banner-content p {
    font-size: 14px;
    color: #666;
}
.banner-button {
    background: #333;
    color: white;
    border: none;
    padding: 12px 24px;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
}
.filter-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
    gap: 20px;
}
.filter-left {
    display: flex;
    gap: 10px;
}
.dropdown-select {
    padding: 8px 16px;
    border: 1px solid #ddd;
    border-radius: 6px;
    font-size: 13px;
    background: white;
    cursor: pointer;
    min-width: 140px;
}
.search {
    display: flex;
    align-items: center;
    background: white;
    border: 2px solid #ddd;
    border-radius: 8px;
    padding: 4px 8px;
    width: 400px;
    transition: border-color 0.2s;
}
.search:focus-within {
    border-color: #7453FC;
}
.search button[type="submit"] {
    background: none;
    border: none;
    padding: 8px;
    cursor: pointer;
    color: #666;
    display: flex;
    align-items: center;
}
.search_input {
    flex: 1;
    border: none;
    padding: 8px;
    font-size: 14px;
    outline: none;
}
.search .reset {
    background: none;
    border: none;
    padding: 8px;
    cursor: pointer;
    color: #999;
    display: none;
}
.search_input:not(:placeholder-shown) ~ .reset {
    display: flex;
    align-items: center;
}
.card-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
    margin-bottom: 40px;
}
.service-card {
    background: white;
    border-radius: 8px;
    overflow: hidden;
    cursor: pointer;
    transition: transform 0.2s, box-shadow 0.2s;
}
.service-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 8px 16px rgba(0,0,0,0.1);
}
.card-image {
    position: relative;
    width: 100%;
    padding-top: 75%;
    background: #f5f5f5;
    overflow: hidden;
}
.card-image img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.card-content {
    padding: 16px;
}
.card-title {
    font-size: 14px;
    font-weight: 600;
    color: #333;
    margin-bottom: 8px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.card-rating {
    font-size: 12px;
    color: #666;
    margin-bottom: 8px;
}
.card-price {
    font-size: 15px;
    font-weight: 700;
    color: #333;
    margin-bottom: 4px;
}
.card-seller {
    font-size: 12px;
    color: #999;
}
.card-tags {
    display: flex;
    gap: 6px;
    margin-top: 8px;
}
.card-tag {
    background: #f5f5f5;
    padding: 4px 8px;
    border-radius: 4px;
    font-size: 11px;
    color: #666;
}
.pagination {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 8px;
    margin: 40px 0;
}
.pagination button,
.pagination span {
    min-width: 32px;
    height: 32px;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 1px solid #ddd;
    background: white;
    border-radius: 4px;
    font-size: 13px;
    cursor: pointer;
    transition: all 0.2s;
}
.pagination button:hover {
    border-color: #7453FC;
    color: #7453FC;
}
.pagination .active {
    background: #7453FC;
    color: white;
    border-color: #7453FC;
    font-weight: 600;
}
@media (max-width: 1200px) {
    .card-grid {
        grid-template-columns: repeat(3, 1fr);
    }
}
@media (max-width: 992px) {
    .main-layout {
        flex-direction: column;
    }
    .left-sidebar {
        width: 100%;
    }
    .filter-buttons {
        justify-content: center;
    }
}
@media (max-width: 768px) {
    .card-grid {
        grid-template-columns: repeat(2, 1fr);
    }
    .category-container {
        overflow-x: auto;
        justify-content: flex-start;
    }
}
</style>

<script>
$(document).ready(function() {
    // 검색 input 변화에 따른 reset 버튼 표시
    $(".search_input").on("input", function(){
        const hasText = $(this).val().trim().length > 0;
        if (hasText) {
            $(".search .reset").show();
        } else {
            $(".search .reset").hide();
        }
    });

    if ($(".search_input").val().trim().length > 0) {
        $(".search .reset").show();
    }

    // 🔹 정렬 선택 시: sort 파라미터 변경 + page=1로 이동
    $("#sort-select").on("change", function() {
        let sortValue = $(this).val();
        let url = new URL(window.location.href);

        if (sortValue) {
            url.searchParams.set('sort', sortValue);
        } else {
            url.searchParams.delete('sort');
        }
        url.searchParams.set('page', 1);

        window.location.href = url.toString();
    });
});
</script>
</head>
<body>

<div class="header-text" style="height: 120px;"></div>

<!-- 상단 카테고리 네비게이션 -->
<div class="top-category-nav">
    <div class="category-container">
        <a href="../talent/list.eum?b_type=운동건강"
           class="category-link <c:if test='${b_type eq "운동건강"}'>active</c:if>">운동/건강</a>

        <a href="../talent/list.eum?b_type=비즈니스"
           class="category-link <c:if test='${b_type eq "비즈니스"}'>active</c:if>">비즈니스</a>

        <a href="../talent/list.eum?b_type=취미/자기개발"
           class="category-link <c:if test='${b_type eq "취미/자기개발"}'>active</c:if>">취미/자기개발</a>

        <a href="../talent/list.eum?b_type=생활라이프"
           class="category-link <c:if test='${b_type eq "생활라이프"}'>active</c:if>">생활/라이프</a>

        <a href="../talent/list.eum?b_type=기타"
           class="category-link <c:if test='${b_type eq "기타"}'>active</c:if>">기타</a>
    </div>
</div>

<!-- 메인 레이아웃 -->
<div class="main-layout">
    <!-- 좌측 사이드바 -->
    <aside class="left-sidebar">
        <div class="filter-section">
            <h3>키워드</h3>
            <div class="filter-buttons">
                <button class="filter-btn" onclick="location.href='../talent/list.eum?keyword=개발&page=1'">개발</button>
                <button class="filter-btn" onclick="location.href='../talent/list.eum?keyword=마케팅&page=1'">마케팅</button>
                <button class="filter-btn" onclick="location.href='../talent/list.eum?keyword=골프&page=1'">골프</button>
                <button class="filter-btn" onclick="location.href='../talent/list.eum?keyword=청소&page=1'">청소</button>
                <button class="filter-btn" onclick="location.href='../talent/list.eum?keyword=시공&page=1'">시공</button>
                <button class="filter-btn" onclick="location.href='../talent/list.eum?keyword=자동차&page=1'">자동차</button>
                <button class="filter-btn" onclick="location.href='../talent/list.eum?keyword=보컬&page=1'">보컬</button>
            </div>
        </div>

        <div class="filter-section">
            <div class="category-group">
                <h4>취미/자기개발</h4>
                <div class="category-items">
                    <div class="category-item" onclick="location.href='../talent/list.eum?keyword=보컬&page=1'">보컬</div>
                    <div class="category-item" onclick="location.href='../talent/list.eum?keyword=작곡&page=1'">작곡-편곡</div>
                    <div class="category-item" onclick="location.href='../talent/list.eum?keyword=디제잉&page=1'">디제잉</div>
                    <div class="category-item" onclick="location.href='../talent/list.eum?keyword=캘리그라피&page=1'">캘리그라피</div>
                    <div class="category-item" onclick="location.href='../talent/list.eum?keyword=가죽&page=1'">가죽공예</div>
                    <div class="category-item" onclick="location.href='../talent/list.eum?keyword=레진&page=1'">레진아트-레슨</div>
                    <div class="category-item" onclick="location.href='../talent/list.eum?keyword=영상&page=1'">영상-촬영-편집</div>
                    <div class="category-item" onclick="location.href='../talent/list.eum?keyword=요리&page=1'">요리-조리</div>
                    <div class="category-item" onclick="location.href='../talent/list.eum?keyword=한국무용&page=1'">한국무용</div>
                    <div class="category-item" onclick="location.href='../talent/list.eum?keyword=사진촬영&page=1'">사진촬영</div>
                </div>
            </div>
        </div>
    </aside>

    <!-- 메인 콘텐츠 -->
    <main class="main-content">
        <div class="banner-section">
            <div class="banner-content">
                <h2>🍌 지금 도배전 가입하면 온라인 창업 준비 끝!</h2>
                <p>창업가들 보러가기 &gt;</p>
            </div>
            <button class="banner-button">2,000P</button>
        </div>

        <!-- 필터 바 -->
        <div class="filter-bar">
            <div class="filter-left">
                <select class="dropdown-select" name="sort" id="sort-select">
                    <option value="">정렬 기준</option>
                    <option value="view"
                        <c:if test="${sort eq 'view' || empty sort}">selected</c:if>>조회수</option>
                    <option value="review_score"
                        <c:if test="${sort eq 'review_score'}">selected</c:if>>평점순</option>
                    <option value="price_asc"
                        <c:if test="${sort eq 'price_asc'}">selected</c:if>>낮은 가격순</option>
                    <option value="price_desc"
                        <c:if test="${sort eq 'price_desc'}">selected</c:if>>높은 가격순</option>
                    <option value="review"
                        <c:if test="${sort eq 'review'}">selected</c:if>>리뷰 많은 순</option>
                </select>
            </div>

            <!-- 검색 -->
            <form class="search" action="../talent/list.eum" method="get">
                <button type="submit">
                    <svg width="17" height="16" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M7.667 12.667A5.333 5.333 0 107.667 2a5.333 5.333 0 000 10.667zM14.334 14l-2.9-2.9"
                              stroke="currentColor" stroke-width="1.333"
                              stroke-linecap="round" stroke-linejoin="round"></path>
                    </svg>
                </button>
                <input class="search_input" name="keyword" placeholder="어떤 서비스가 필요하세요?" type="text"
                       value="${keyword}">
                <input type="hidden" name="page" value="1">
                <c:if test="${not empty b_type}">
                    <input type="hidden" name="b_type" value="${b_type}">
                </c:if>
                <c:if test="${not empty sort}">
                    <input type="hidden" name="sort" value="${sort}">
                </c:if>
                <button class="reset" type="reset">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6"
                          fill="none" viewBox="0 0 24 24"
                          stroke="currentColor" stroke-width="2" width="16" height="16">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M6 18L18 6M6 6l12 12"></path>
                    </svg>
                </button>
            </form>
        </div>

        <!-- 카드 그리드 -->
        <div class="card-grid">
            <c:forEach var="vo" items="${list}">
                <div class="service-card" onclick="location.href='../talent/detail.eum?b_id=${vo.b_id}'">
                    <div class="card-image">
                        <img src="${vo.b_thumbnail}" alt="${vo.b_title}" loading="lazy">
                    </div>
                    <div class="card-content">
                        <div class="card-title">${vo.b_title}</div>
                        <div class="card-rating">
                            ⭐️ ${vo.rvo.b_review_score != null ? vo.rvo.b_review_score : 0}
                            (${vo.rvo.review_count != null ? vo.rvo.review_count : 0})
                        </div>
                        <div class="card-price">
                            <fmt:formatNumber value="${empty vo.bovo.b_op_price ? 0 : vo.bovo.b_op_price}"
                                              pattern="#,###"/>원
                        </div>
                        <div class="card-seller">${vo.usvo.u_s_com}</div>
                        <div class="card-tags">
                            <span class="card-tag">${vo.b_type}</span>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- 페이지네이션 -->
        <div class="pagination">
            <!-- 이전 -->
            <c:if test="${startPage > 1}">
                <c:url var="prevUrl" value="../talent/list.eum">
                    <c:param name="page" value="${startPage-1}" />
                    <c:if test="${not empty keyword}">
                        <c:param name="keyword" value="${keyword}" />
                    </c:if>
                    <c:if test="${not empty b_type}">
                        <c:param name="b_type" value="${b_type}" />
                    </c:if>
                    <c:if test="${not empty sort}">
                        <c:param name="sort" value="${sort}" />
                    </c:if>
                </c:url>
                <button onclick="location.href='${prevUrl}'">&lt;</button>
            </c:if>

            <!-- 페이지 번호 -->
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                <c:url var="pageUrl" value="../talent/list.eum">
                    <c:param name="page" value="${i}" />
                    <c:if test="${not empty keyword}">
                        <c:param name="keyword" value="${keyword}" />
                    </c:if>
                    <c:if test="${not empty b_type}">
                        <c:param name="b_type" value="${b_type}" />
                    </c:if>
                    <c:if test="${not empty sort}">
                        <c:param name="sort" value="${sort}" />
                    </c:if>
                </c:url>
                <span class="${i==curpage?'active':''}"
                      onclick="location.href='${pageUrl}'">${i}</span>
            </c:forEach>

            <!-- 다음 -->
            <c:if test="${endPage < totalpage}">
                <c:url var="nextUrl" value="../talent/list.eum">
                    <c:param name="page" value="${endPage+1}" />
                    <c:if test="${not empty keyword}">
                        <c:param name="keyword" value="${keyword}" />
                    </c:if>
                    <c:if test="${not empty b_type}">
                        <c:param name="b_type" value="${b_type}" />
                    </c:if>
                    <c:if test="${not empty sort}">
                        <c:param name="sort" value="${sort}" />
                    </c:if>
                </c:url>
                <button onclick="location.href='${nextUrl}'">&gt;</button>
            </c:if>
        </div>
    </main>
</div>

</body>
</html>
