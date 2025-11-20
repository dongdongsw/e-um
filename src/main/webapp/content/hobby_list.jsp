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
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
    background: #f8f9fa;
}

/* 상단 카테고리 네비게이션 */
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

/* 메인 레이아웃 */
.main-layout {
    max-width: 1400px;
    margin: 0 auto;
    display: flex;
    gap: 30px;
    padding: 20px;
}

/* 좌측 사이드바 */
.left-sidebar {
    width: 240px;
    flex-shrink: 0;
}

/* 필터 섹션 */
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

/* 카테고리 그룹 */
.category-group {
    margin-bottom: 25px;
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
}

.category-group h4:after {
    content: '∨';
    font-size: 12px;
    color: #999;
}

.category-items {
    display: flex;
    flex-direction: column;
    gap: 8px;
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

/* 메인 콘텐츠 */
.main-content {
    flex: 1;
    min-width: 0;
}

/* 배너 영역 */
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

/* 필터 바 */
.filter-bar {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    margin-bottom: 20px;
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

/* 카드 그리드 */
.card-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
    margin-bottom: 40px;
}

/* 카드 스타일 */
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

/* 페이지네이션 */
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

/* 반응형 */
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
    // 검색 기능
    $(".search-btn").on("click", function (e) {
        e.preventDefault();
        let keyword = $(".search-box input").val().trim();
        if (!keyword) {
            alert("검색어를 입력해주세요");
            return;
        }
        location.href = "../talent/keyword_list.eum?keyword=" 
                      + encodeURIComponent(keyword) 
                      + "&page=1";
    });
});
</script>
</head>
<body>

<div class="header-text" style="height: 120px;"></div>

<!-- 상단 카테고리 네비게이션 -->
<div class="top-category-nav">
    <div class="category-container">
        <a href="../content/exer_list.eum?b_type=운동건강" class="category-link">운동/건강</a>
        <a href="../content/biz_list.eum?b_type=비즈니스" class="category-link">비즈니스</a>
        <a href="../content/hobby_list.eum?b_type=취미/자기개발" class="category-link active">취미/자기개발</a>
        <a href="../content/talent_list.eum?b_type=생활라이프" class="category-link">생활/라이프</a>
        <a href="../content/etc_list.eum?b_type=기타" class="category-link">기타</a>
    </div>
</div>

<!-- 메인 레이아웃 -->
<div class="main-layout">
    <!-- 좌측 사이드바 -->
    <aside class="left-sidebar">
        <!-- 필터 섹션 -->
        <div class="filter-section">
            <h3>키워드</h3>
            <div class="filter-buttons">
                <button class="filter-btn">개발</button>
                <button class="filter-btn">마케팅</button>
                <button class="filter-btn">사진</button>
                <button class="filter-btn">골프</button>
                <button class="filter-btn">청소</button>
                <button class="filter-btn">보컬</button>
                <button class="filter-btn">골프</button>
            </div>
        </div>

        <!-- 카테고리 그룹 -->
        <div class="filter-section">
            <div class="category-group">
                <h4>취미/자기개발</h4>
                <div class="category-items">
                    <div class="category-item">사진</div>
                    <div class="category-item">보컬</div>
                </div>
            </div>
        </div>
    </aside>

    <!-- 메인 콘텐츠 -->
    <main class="main-content">
        <!-- 배너 -->
        <div class="banner-section">
            <div class="banner-content">
                <h2>🍌 지금 도배전 가입하면 온라인 창업 준비 끝!</h2>
                <p>창업가들 보러가기 ></p>
            </div>
            <button class="banner-button">2,000P</button>
        </div>

        <!-- 필터 바 -->
        <div class="filter-bar">
            <div class="filter-left">
                <select class="dropdown-select">
                    <option>정렬 기준</option>
                    <option value="view">조회수</option>
                    <option value="review_score">평점순</option>
                    <option value="price_asc">낮은 가격순</option>
                    <option value="price_desc">높은 가격순</option>
                    <option value="review">리뷰 많은 순</option>
                </select>
            </div>
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
            <c:if test="${startPage > 1}">
                <button onclick="location.href='../content/hobby_list.eum?page=${startPage-1}&b_type=취미/자기개발'">&lt;</button>
            </c:if>
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                <span class="${i==curpage?'active':''}" 
                      onclick="location.href='../content/hobby_list.eum?page=${i}&b_type=취미/자기개발'">${i}</span>
            </c:forEach>
            <c:if test="${endPage < totalpage}">
                <button onclick="location.href='../content/hobby_list.eum?page=${endPage+1}&b_type=취미/자기개발'">&gt;</button>
            </c:if>
        </div>
    </main>
</div>

</body>
</html>