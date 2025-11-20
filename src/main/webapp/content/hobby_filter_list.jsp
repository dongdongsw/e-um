<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/list.css?v=1.0">
<link rel="stylesheet" href="css/content.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
$(document).ready(function() {
    // 검색 기능
    $(".search button[type='submit']").on("click", function(e) {
    e.preventDefault();
    let keyword = $(".search_input").val().trim();
    if (!keyword) {
        alert("검색어를 입력해주세요");
        return;
    }
    location.href = "../talent/keyword_list.eum?keyword=" 
                  + encodeURIComponent(keyword) 
                  + "&page=1";
	});
	
    $("#sort-select").on("change", function() {
        let sortValue = $(this).val(); // 선택된 정렬값
        if (sortValue) {
            // 현재 페이지와 키워드를 유지하면서 URL에 sort 파라미터 추가
            let currentUrl = new URL(window.location.href);
            currentUrl.searchParams.set('sort', sortValue); // sort 파라미터 추가
            currentUrl.searchParams.set('page', 1); // 정렬 변경 시 첫 페이지로 이동
            window.location.href = currentUrl.toString(); // 페이지 이동
        }
    });
    
/*     // 카테고리 드롭다운 토글
    $(".category-group h4").on("click", function() {
        $(this).toggleClass("active");
        $(this).next(".category-items").toggleClass("show");
    }); */
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
                <button class="filter-btn" onclick="location.href='../talent/keyword_list.eum?keyword=개발'">개발</button>
                <button class="filter-btn" onclick="location.href='../talent/keyword_list.eum?keyword=마케팅'">마케팅</button>
                <button class="filter-btn" onclick="location.href='../talent/keyword_list.eum?keyword=골프'">골프</button>
                <button class="filter-btn" onclick="location.href='../talent/keyword_list.eum?keyword=청소'">청소</button>
                <button class="filter-btn" onclick="location.href='../talent/keyword_list.eum?keyword=시공'">시공</button>
                <button class="filter-btn" onclick="location.href='../talent/keyword_list.eum?keyword=자동차'">자동차</button>
                <button class="filter-btn" onclick="location.href='../talent/keyword_list.eum?keyword=보컬'">보컬</button>
            </div>
        </div>

        <!-- 카테고리 그룹 -->
        <div class="filter-section">
            <div class="category-group">
                <h4>취미/자기개발</h4>
                <div class="category-items">
                    <div class="category-item" onclick="location.href='../talent/keyword_list.eum?keyword=보컬'">보컬</div>
                    <div class="category-item" onclick="location.href='../talent/keyword_list.eum?keyword=작곡'">작곡-편곡</div>
                    <div class="category-item" onclick="location.href='../talent/keyword_list.eum?keyword=디제잉'">디제잉</div>
                    <div class="category-item" onclick="location.href='../talent/keyword_list.eum?keyword=캘리그라피'">캘리그라피</div>
                    <div class="category-item" onclick="location.href='../talent/keyword_list.eum?keyword=가죽'">가죽공예</div>
                    <div class="category-item" onclick="location.href='../talent/keyword_list.eum?keyword=레진'">레진아트-레슨</div>
                    <div class="category-item" onclick="location.href='../talent/keyword_list.eum?keyword=영상'">영상-촬영-편집</div>
                    <div class="category-item" onclick="location.href='../talent/keyword_list.eum?keyword=요리'">요리-조리</div>
                    <div class="category-item" onclick="location.href='../talent/keyword_list.eum?keyword=한국무용'">한국무용</div>
                    <div class="category-item" onclick="location.href='../talent/keyword_list.eum?keyword=사진촬영'">사진촬영</div>
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
                <select class="dropdown-select" name="fd" id="sort-select">
                    <option value="">정렬 기준</option>
                    <option value="view">조회수</option>
                    <option value="review_score">평점순</option>
                    <option value="price_asc">낮은 가격순</option>
                    <option value="price_desc">높은 가격순</option>
                    <option value="review">리뷰 많은 순</option>
                </select>
            </div>
            
            <!-- 검색창 -->
            <form class="search">
                <button type="submit">
                    <svg width="17" height="16" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M7.667 12.667A5.333 5.333 0 107.667 2a5.333 5.333 0 000 10.667zM14.334 14l-2.9-2.9"
                              stroke="currentColor" stroke-width="1.333"
                              stroke-linecap="round" stroke-linejoin="round"></path>
                    </svg>
                </button>
                <input class="search_input" placeholder="어떤 서비스가 필요하세요?" type="text">
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

        <!-- 페이지네이션 (keyword 유지) -->
        <div id="pagination-area" class="container">
          <ul class="page">
            <c:if test="${startPage > 1}">
              <li class="page__btn active">
                <a href="../talent/keyword_list.eum?page=${startPage-1}&keyword=${keyword}">&lt;</a>
              </li>
            </c:if>
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
              <li class="page__numbers ${i==curpage?'active':''}">
                <a href="../talent/keyword_list.eum?page=${i}&keyword=${keyword}">${i}</a>
              </li>
            </c:forEach>
            <c:if test="${endPage < totalpage}">
              <li class="page__btn active">
                <a href="../talent/keyword_list.eum?page=${endPage+1}&keyword=${keyword}">&gt;</a>
              </li>
            </c:if>
          </ul>
        </div>
    </main>
</div>

</body>
</html>