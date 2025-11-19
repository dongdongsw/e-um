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
/* 카테고리 탭 스타일 */
.category-tabs {
    background: #fff;
    padding: 20px 0;
    border-bottom: 1px solid #e0e0e0;
    margin-bottom: 30px;
}

.category-tabs-container {
    max-width: 800px;
    margin: 0 auto;
    padding: 0 20px;
}

.category-tabs ul {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    gap: 30px;
    overflow-x: auto;
    justify-content: center;
}

.category-tabs li {
    white-space: nowrap;
}

.category-tabs a {
    color: #666;
    text-decoration: none;
    font-size: 16px;
    font-weight: 500;
    padding: 10px 0;
    display: block;
    transition: color 0.2s;
}

.category-tabs a:hover {
    color: #000;
}

.category-tabs a.active {
    color: #000;
    font-weight: 700;
    border-bottom: 2px solid #000;
}

/* 히어로 배너 */
.hero-banner {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 60px 20px;
    text-align: center;
    margin-bottom: 30px;
}

.hero-banner h1 {
    font-size: 36px;
    font-weight: 700;
    margin-bottom: 15px;
}

.hero-banner p {
    font-size: 18px;
    opacity: 0.9;
}

/* 통계 섹션 */
.stats-section {
    background: #f8f9fa;
    padding: 40px 20px;
    margin-bottom: 30px;
}

.stats-container {
    max-width: 1200px;
    margin: 0 auto;
    display: flex;
    justify-content: space-around;
    gap: 30px;
}

.stat-item {
    text-align: center;
}

.stat-number {
    font-size: 32px;
    font-weight: 700;
    color: #667eea;
    margin-bottom: 5px;
}

.stat-label {
    font-size: 14px;
    color: #666;
}

/* 인기 서비스 섹션 */
.popular-section {
    max-width: 1200px;
    margin: 0 auto 40px;
    padding: 0 20px;
}

.popular-section h2 {
    font-size: 24px;
    font-weight: 700;
    margin-bottom: 20px;
}

.popular-tags {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
}
.popluar-tags:hover {
    color: white;
    border-color: black;
    background: #7453FC;
}
.tag-btn {
    background: #f0f0f0;
    border: 1px solid #ddd;
    padding: 8px 16px;
    border-radius: 20px;
    font-size: 14px;
    color: #333;
    cursor: pointer;
    transition: all 0.2s;
}

.tag-btn:hover {
    background: #7453FC;
    color: white;
    border-color: black;
}
</style>

<script>
// URL 파라미터 읽기
function getParam(name) {
    return new URLSearchParams(window.location.search).get(name);
}

$(document).ready(function() {
    // 검색창 제출
    $(".search").off("submit").on("submit", function (e) {
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
});

</script>
</head>
<body>

<div class="header-text" style="height: 120px;"></div>

<!-- 🔹 카테고리 탭 추가 -->
<div class="category-tabs">
    <div class="category-tabs-container" style="text-align: center;">
        <ul style="display: inline-flex; gap: 50px;">
            <li><a href="../content/exer_list.eum?b_type=운동건강" class="active">운동/건강</a></li>
			<li><a href="../content/biz_list.eum?b_type=비즈니스">비즈니스</a></li>
			<li><a href="../content/hobby_list.eum?b_type=취미/자기개발">취미/자기개발</a></li>
			<li><a href="../content/talent_list.eum?b_type=생활라이프">생활/라이프</a></li>
			<li><a href="../content/etc_list.eum?b_type=기타">기타</a></li>
        </ul>
    </div>
</div>

<!-- 🔹 인기 검색어 섹션 -->
<div class="popular-section">
    <h2>🔥 인기 키워드</h2>
    <div class="popular-tags" style="display: inline-flex; gap: 20px;">
        <button class="tag-btn" onclick="location.href='../talent/keyword_list.eum?keyword=개발'">개발</button>
        <button class="tag-btn" onclick="location.href='../talent/keyword_list.eum?keyword=마케팅'">마케팅</button>
        <button class="tag-btn" onclick="location.href='../talent/keyword_list.eum?keyword=골프'">골프</button>
        <button class="tag-btn" onclick="location.href='../talent/keyword_list.eum?keyword=청소'">청소</button>
        <button class="tag-btn" onclick="location.href='../talent/keyword_list.eum?keyword=시공'">시공</button>
        <button class="tag-btn" onclick="location.href='../talent/keyword_list.eum?keyword=자동차'">자동차</button>
        <button class="tag-btn" onclick="location.href='../talent/keyword_list.eum?keyword=보컬'">보컬</button>
    </div>
</div>

<div class="list-container">
    <!-- 정렬 -->
    <div class="sidebar">
    <h2 style="font-weight: bold; position:relative; top:-50px;">
  <c:choose>
    <c:when test="${not empty keyword}">
      ${keyword}
    </c:when>
    <c:when test="${not empty b_type}">
      ${b_type}
    </c:when>
    </c:choose>
    </h2>
     <h3>정렬</h3>
     <div style="height: 10px"></div>
        <ul class="list">
    <li class="list__item">
      <label class="label--radio">
        <input type="radio" class="radio" name="fd" value="view">
          조회수
      </label>
    </li>   
    <li class="list__item">
      <label class="label--radio">
        <input type="radio" class="radio" name="fd" value="review_score">
         평점순
      </label>
    </li> 
    <li class="list__item">
      <label class="label--radio">
        <input type="radio" class="radio" name="fd" value="price_asc">
          낮은 가격순
      </label>
    </li>
    <li class="list__item">
      <label class="label--radio">
        <input type="radio" class="radio" name="fd" value="price_desc">
          높은 가격순
      </label>
    </li>
    <li class="list__item">
      <label class="label--radio">
        <input type="radio" class="radio" name="fd" value="review">
          리뷰 많은 순
      </label>
    </li>
  </ul>
   <hr style="border:0; height:1px; background:#e0e0e0; margin:50px 0;">

      <ul class="accordion" id="sidebar-accordion" style="margin-top: 6px;">
      <!-- 섹션 1 -->
      <li class="accordion__section">
        <button class="accordion__toggle" type="button"
                aria-expanded="false" aria-controls="panel-activate" id="toggle-activate">
          <span>운동/건강</span>
          <svg class="chevron" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M6 9l6 6 6-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
          </svg>
        </button>
        <div class="accordion__panel" id="panel-activate" role="region" aria-labelledby="toggle-activate" hidden>
          <ul class="submenu">
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=퍼스널트레이닝'">퍼스널트레이닝</button></li>
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=축구'">축구</button></li>
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=골프'">골프</button></li>
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=댄스'">댄스</button></li>
          </ul>
        </div>
      </li>

      <!-- 섹션 2 -->
      <li class="accordion__section">
        <button class="accordion__toggle" type="button"
                aria-expanded="false" aria-controls="panel-instagram" id="toggle-instagram">
          <span>비즈니스</span>
          <svg class="chevron" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M6 9l6 6 6-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
          </svg>
        </button>
        <div class="accordion__panel" id="panel-instagram" role="region" aria-labelledby="toggle-instagram">
          <ul class="submenu">
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=개발'">개발</button></li>
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=컨설팅'">컨설팅</button></li>
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=제작'">제작</button></li>
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=디자인'">디자인</button></li>
          </ul>
        </div>
      </li>

      <!-- 섹션 3 -->
      <li class="accordion__section">
        <button class="accordion__toggle" type="button"
                aria-expanded="false" aria-controls="panel-youtube" id="toggle-youtube">
          <span>취미/자기개발</span>
          <svg class="chevron" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M6 9l6 6 6-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
          </svg>
        </button>
        <div class="accordion__panel" id="panel-youtube" role="region" aria-labelledby="toggle-youtube" hidden>
          <ul class="submenu">
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=보컬'">보컬</button></li>
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=촬영'">촬영</button></li>
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=무용'">무용</button></li>
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=영상'">영상</button></li>
          </ul>
        </div>
      </li>

      <!-- 섹션 4 -->
      <li class="accordion__section">
        <button class="accordion__toggle" type="button"
                aria-expanded="false" aria-controls="panel-shorts" id="toggle-shorts">
          <span>생활/라이프</span>
          <svg class="chevron" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M6 9l6 6 6-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
          </svg>
        </button>
        <div class="accordion__panel" id="panel-shorts" role="region" aria-labelledby="toggle-shorts" hidden>
          <ul class="submenu">
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=청소'">청소</button></li>
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=시공'">시공</button></li>
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=심리검사'">심리검사</button></li>
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=심리상담'">심리상담</button></li>
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=설치'">설치</button></li>
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=수리'">수리</button></li>
          </ul>
        </div>
      </li>

      <!-- 섹션 5 -->
      <li class="accordion__section">
        <button class="accordion__toggle" type="button"
                aria-expanded="false" aria-controls="panel-viral" id="toggle-viral">
          <span>기타</span>
          <svg class="chevron" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M6 9l6 6 6-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
          </svg>
        </button>
        <div class="accordion__panel" id="panel-viral" role="region" aria-labelledby="toggle-viral" hidden>
          <ul class="submenu">
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=자동차'">자동차</button></li>
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=영어'">영어</button></li>
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=수학'">수학</button></li>
            <li><button class="submenu__item" type="button" onclick="location.href='../talent/keyword_list.eum?keyword=행사'">행사</button></li>
          </ul>
        </div>
      </li>
    </ul>
    </div>
    
<script>
  (function() {
      const accordion = document.getElementById('sidebar-accordion');

      accordion.addEventListener('click', (e) => {
          const btn = e.target.closest('.accordion__toggle');
          if (!btn) return; // 토글 버튼이 아니면 무시

          const panelId = btn.getAttribute('aria-controls');
          const panel = document.getElementById(panelId);
          const willOpen = btn.getAttribute('aria-expanded') !== 'true';

          // 모든 섹션 닫기
          accordion.querySelectorAll('.accordion__toggle').forEach(b => {
              const p = document.getElementById(b.getAttribute('aria-controls'));
              b.setAttribute('aria-expanded', 'false');
              p.hidden = true;
          });

          // 클릭한 섹션만 열기
          btn.setAttribute('aria-expanded', willOpen);
          panel.hidden = !willOpen;
      });
  })();
</script>

    <!-- 🔹 결과 영역 -->
    <div class="main">
        <form class="search">
          <button type="submit">
              <svg width="17" height="16" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M7.667 12.667A5.333 5.333 0 107.667 2a5.333 5.333 0 000 10.667zM14.334 14l-2.9-2.9"
                        stroke="currentColor" stroke-width="1.333"
                        stroke-linecap="round" stroke-linejoin="round"></path>
              </svg>
          </button>
          <input class="search_input" placeholder="어떤 서비스가 필요하세요?" required type="text">
          <button class="reset" type="reset">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6"
                    fill="none" viewBox="0 0 24 24"
                    stroke="currentColor" stroke-width="2">
                  <path stroke-linecap="round" stroke-linejoin="round"
                        d="M6 18L18 6M6 6l12 12"></path>
              </svg>
          </button>
        </form>
        <div class="header-text" style="height: 10px;"></div>
      <div class="card-area row"></div>
        <div id="default-list" class="row">
          <c:forEach var="vo" items="${list}">
            <div class="col-md-3">
              <div class="temporary__storage" style="border:none">
                <div class="list-card" onclick="location.href='../talent/detail.eum?b_id=${vo.b_id}'">
                  <div class="image">
                    <img src="${vo.b_thumbnail}" width="200" height="160" style="border-radius: 15px;" loading="lazy">
                  </div>
                  <div class="image__overlay"></div>
                  <div class="content">
                    <div class="avatar"></div>
                    <div class="content__text">
                      <span class="stream__title">${vo.b_title}</span>
                        <span class="event" style="font-size: 10px">
                          ⭐️ ${vo.rvo.b_review_score != null ? vo.rvo.b_review_score : 0}
                          (${vo.rvo.review_count != null ? vo.rvo.review_count : 0})
                        </span>
                        <span class="streamer__name" style="font-size: 12px">
                          <fmt:formatNumber value="${empty vo.bovo.b_op_price ? 0 : vo.bovo.b_op_price}"
                                            pattern="#,###"/>원
                        </span>
                        <span class="streamer__name" style="font-size: 10px">
                          ${vo.usvo.u_s_com}
                        </span>
                      <span class="categories">
                        <div class="categories__btn"
                             style="width:55px; text-align: center; font-size: 10px">
                          ${vo.b_type}
                        </div>
                      </span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </c:forEach>
          </div>
        
        <!-- 페이지네이션 -->
        <div id="pagination-area" class="container">
          <ul class="page">
            <c:if test="${startPage > 1}">
              <li class="page__btn active">
                <a href="../content/talent_list.eum?page=${startPage-1}&b_type=운동건강">&lt;</a>
              </li>
            </c:if>
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
              <li class="page__numbers ${i==curpage?'active':''}">
                <a href="../content/talent_list.eum?page=${i}&b_type=운동건강">${i}</a>
              </li>
            </c:forEach>
            <c:if test="${endPage < totalpage}">
              <li class="page__btn active">
                <a href="../content/talent_list.eum?page=${endPage+1}&b_type=운동건강">&gt;</a>
              </li>
            </c:if>
          </ul>
        </div>
    </div>
    </div>

</body>
</html>