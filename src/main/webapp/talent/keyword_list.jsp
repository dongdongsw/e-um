<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/list.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
// URL 파라미터 읽기
function getParam(name) {
    return new URLSearchParams(window.location.search).get(name);
}

function loadList(page, fd) {
    let keyword = getParam("keyword");
    let b_type = getParam("b_type");

    if (!keyword) keyword = "";
    if (!b_type) b_type = "";
    if (!fd) fd = $("input[name=fd]:checked").val() || "view";

    let ajaxUrl = "../main/main.jsp";
    if (keyword !== "") ajaxUrl = "../talent/keyword_ajax.eum";
    else if (b_type !== "") ajaxUrl = "../talent/b_type_ajax.eum";
    else return;

    console.log("AJAX SEND:", { keyword, b_type, fd, page });

    $.ajax({
        url: ajaxUrl,
        type: "GET",
        data: { 
            keyword: keyword,
            b_type: b_type,
            fd: fd,
            page: page
        },
        dataType: "json",
        success: function(json) {

            console.log("AJAX RESULT:", json);
            console.log(JSON.stringify(json.list[0], null, 2));
            

            let rawList = json.list;
            let list = [];
            
            if (rawList && typeof rawList === 'object' && !Array.isArray(rawList)) {
                list = Object.keys(rawList).map(key => rawList[key]).filter(item => item !== undefined);
            } else if (Array.isArray(rawList)) {
                list = rawList; 
            }
            
            $("#default-list").hide();   // ★ 위로 이동시키고 한 번만 실행
            $(".card-area").empty();
            
            if (!list || list.length === 0) {
                $(".card-area").html('<div class="col-md-12"><p style="text-align:center; padding:50px 0;">검색 결과가 없습니다.</p></div>');
                $("#pagination-area .page").empty();
                return;
            }
         // loadList 함수 내부의 카드 생성 부분을 다음과 같이 수정:

            list.forEach(function(vo) {
                var reviewScore = vo.rvo && vo.rvo.b_review_score ? vo.rvo.b_review_score : 0;
                var reviewCount = vo.rvo && vo.rvo.review_count ? vo.rvo.review_count : 0;
                var price       = vo.bovo && vo.bovo.b_op_price ? Number(vo.bovo.b_op_price).toLocaleString() : 0;
                var company     = vo.usvo && vo.usvo.u_s_com ? vo.usvo.u_s_com : "";

                var html  = '';
                html += '<div class="col-md-3">';
                html += '  <div class="temporary__storage" style="border:none">';
                html += '    <div class="list-card" onclick="location.href=\'../talent/detail.eum?b_id=' + vo.b_id + '\'">';
                html += '      <div class="image">';
                html += '        <img src="' + vo.b_thumbnail + '" width="200" height="160" style="border-radius: 15px;">';
                html += '      </div>';
                html += '      <div class="image__overlay"></div>';  // 이 줄 추가!
                html += '      <div class="content">';  // contents → content로 변경
                html += '        <div class="avatar"></div>';  // 이 줄 추가!
                html += '        <div class="content__text">';
                html += '          <span class="stream__title">' + vo.b_title + '</span>';
                html += '          <span class="event" style="font-size: 10px">';
                html += '            ⭐️ ' + reviewScore + ' (' + reviewCount + ')';
                html += '          </span>';
                html += '          <span class="streamer__name" style="font-size: 12px">';
                html += '            ' + price + '원';
                html += '          </span>';
                html += '          <span class="streamer__name" style="font-size: 10px">';
                html += '            ' + company;
                html += '          </span>';
                html += '          <span class="categories">';  // 이 부분도 추가
                html += '            <div class="categories__btn" style="width:55px; text-align: center; font-size: 10px">';
                html += '              ' + (vo.b_type || '');
                html += '            </div>';
                html += '          </span>';
                html += '        </div>';
                html += '      </div>';
                html += '    </div>';
                html += '  </div>';
                html += '</div>';

                $(".card-area").append(html);
            });



         // 페이지 정보
            let cur = json.curpage;
            let total = json.totalpage;
            let sp = json.startpage;
            let ep = json.endpage;

            let p_html = "";

            // 이전 페이지 버튼
            if (sp > 1) {
                p_html += '<li class="page__btn active">';
                p_html += '<a href="#" data-page="' + (sp - 1) + '">&lt;</a>';
                p_html += '</li>';
            }

            // 페이지 번호들
            for (let i = sp; i <= ep; i++) {
                if (i == cur) {
                    p_html += '<li class="page__numbers active">';
                    p_html += '<a href="#" data-page="' + i + '" data-fd="' + fd + '">' + i + '</a>';
                    p_html += '</li>';
                } else {
                    p_html += '<li class="page__numbers">';
                    p_html += '<a href="#" data-page="' + i + '" data-fd="' + fd + '">' + i + '</a>';
                    p_html += '</li>';
                }
            }

            // 다음 페이지 버튼
            if (ep < total) {
                p_html += '<li class="page__btn active">';
                p_html += '<a href="#" data-page="' + (ep + 1) + '">&gt;</a>';
                p_html += '</li>';
            }

            $("#pagination-area .page").html(p_html);
        },
        error: function(xhr, status, error) {
            console.error("AJAX 에러:", error);
            $(".card-area").html('<div class="col-md-12"><p style="text-align:center; padding:50px 0;">데이터를 불러오는데 실패했습니다.</p></div>');
        }
    });
}


$(document).ready(function() {
    // 정렬 라디오 버튼 변경
   $(document)
  .off("change", "input[name=fd]")
  .on("change", "input[name=fd]", function () {
      loadList(1, $(this).val());
});

    // 페이지네이션 클릭
    $(document)
  .off("click", "#pagination-area a")
  .on("click", "#pagination-area a", function(e) {
      e.preventDefault();
      let nextPage = $(this).data("page");
      let currentFd = $("input[name=fd]:checked").val() || "view";
      loadList(nextPage, currentFd);
});

    // 검색창 제출
    $(".search").on("submit", function (e) {
        e.preventDefault();
        let keyword = $(".search_input").val().trim();
        if (!keyword) {
            alert("검색어를 입력해주세요");
            return;
        }
        location.href = "../talent/keyword_list.eum?keyword=" + encodeURIComponent(keyword) + "&page=1";
    });
});
</script>
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
</head>
<body>
<div class="header-text" style="height: 120px;"></div>

<!-- 🔹 카테고리 탭 추가 -->
<div class="category-tabs">
    <div class="category-tabs-container" style="text-align: center;">
        <ul style="display: inline-flex; gap: 50px;">
            <li><a href="../talent/b_type_list.eum?b_type=운동건강" data-type="운동건강" class="${b_type == '운동건강' ? 'active' : ''}">운동/건강</a></li>
            <li><a href="../talent/b_type_list.eum?b_type=비즈니스" data-type="비즈니스" class="${b_type == '비즈니스' ? 'active' : ''}">비즈니스</a></li>
            <li><a href="../talent/b_type_list.eum?b_type=취미/자기개발" data-type="취미/자기개발" class="${b_type == '취미/자기개발' ? 'active' : ''}">취미/자기계발</a></li>
            <li><a href="../talent/b_type_list.eum?b_type=생활라이프" data-type="생활라이프" class="${b_type == '생활라이프' ? 'active' : ''}">생활/라이프</a></li>
            <li><a href="../talent/b_type_list.eum?b_type=기타" data-type="기타" class="${b_type == '기타' ? 'active' : ''}">기타</a></li>
        </ul>
    </div>
</div>

<!-- 🔹 인기 검색어 섹션 -->
<div class="popular-section">
    <h2>🔥 인기 키워드</h2>
    <div class="popular-tags">
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
    <h2 style="font-weight: bold; position:relative; top:-30px;">
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

      <ul class="accordion" id="sidebar-accordion" style="margin-top: 60px;">
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
          <span>취미/자기계발</span>
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
  // 하나만 펼쳐지는 아코디언
  (function () {
    const accordion = document.getElementById('sidebar-accordion');
    const toggles = accordion.querySelectorAll('.accordion__toggle');

    function closeAll(exceptId) {
      toggles.forEach(btn => {
        const panelId = btn.getAttribute('aria-controls');
        if (panelId !== exceptId) {
          btn.setAttribute('aria-expanded', 'false');
          const panel = document.getElementById(panelId);
          if (panel) panel.hidden = true;
        }
      });
    }

    toggles.forEach(btn => {
      const panelId = btn.getAttribute('aria-controls');
      const panel = document.getElementById(panelId);

      // 초기 hidden 동기화 (HTML의 hidden / aria-expanded 상태 반영)
      if (btn.getAttribute('aria-expanded') === 'true') {
        panel.hidden = false;
      } else {
        panel.hidden = true;
      }

      btn.addEventListener('click', () => {
        const expanded = btn.getAttribute('aria-expanded') === 'true';
        const willOpen = !expanded;

        // 다른 패널은 닫기
        closeAll(willOpen ? panelId : null);

        // 현재 토글 토글링
        btn.setAttribute('aria-expanded', String(willOpen));
        panel.hidden = !willOpen;
      });

      // 키보드 접근성 (Space/Enter)
      btn.addEventListener('keydown', (e) => {
        if (e.key === ' ' || e.key === 'Enter') {
          e.preventDefault();
          btn.click();
        }
      });
    });
  })();
</script>
<!-- 검색 -->

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
                    <img src="${vo.b_thumbnail}" width="200" height="160" style="border-radius: 15px;">
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
    </div>
    </div>

</body>
</html>