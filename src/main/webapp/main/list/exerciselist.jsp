<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/list.css">
<script>
window.addEventListener('DOMContentLoaded', function () {
  const rangeInput = document.querySelectorAll(".range-input input");
  const priceInput = document.querySelectorAll(".price-input input");
  const range = document.querySelector(".slider .progress");
  let priceGap = 1000;

  priceInput.forEach((input) => {
    input.addEventListener("input", (e) => {
      const minPrice = parseInt(priceInput[0].value);
      const maxPrice = parseInt(priceInput[1].value);

      if (maxPrice - minPrice >= priceGap && maxPrice <= rangeInput[1].max) {
        if (e.target.classList.contains("input-min")) {
          rangeInput[0].value = minPrice;
          range.style.left = (minPrice / rangeInput[0].max) * 100 + "%";
        } else {
          rangeInput[1].value = maxPrice;
          range.style.right = 100 - (maxPrice / rangeInput[1].max) * 100 + "%";
        }
      }
    });
  });

  rangeInput.forEach((input) => {
    input.addEventListener("input", (e) => {
      let minVal = parseInt(rangeInput[0].value);
      let maxVal = parseInt(rangeInput[1].value);

      if (maxVal - minVal < priceGap) {
        if (e.target.classList.contains("range-min")) {
          rangeInput[0].value = maxVal - priceGap;
        } else {
          rangeInput[1].value = minVal + priceGap;
        }  
      } else {
        priceInput[0].value = minVal;
        priceInput[1].value = maxVal;
        range.style.left  = (minVal / rangeInput[0].max) * 100 + "%";
        range.style.right = 100 - (maxVal / rangeInput[1].max) * 100 + "%";
      }
    });
  });
});
</script>
</head>
<body>
  <div class="header-text" style="height: 100px;"></div>
	<div class="radio-inputs">
  <div class="category">

    <label>
      <input class="radio-input" type="radio" name="engine">
      <span class="radio-tile">
        <span class="radio-icon">
          <img src="../images/exercise.svg" alt="exercise">
        </span>
        <span class="radio-label">EXERCISE</span>
      </span>
    </label>

    <label>
      <input checked class="radio-input" type="radio" name="engine">
      <span class="radio-tile">
        <span class="radio-icon">
          <img src="../images/business.svg" alt="business">
        </span>
        <span class="radio-label">BUSINESS</span>
      </span>
    </label>

    <label>
      <input class="radio-input" type="radio" name="engine">
      <span class="radio-tile">
        <span class="radio-icon">
          <img src="../images/hobby.svg" alt="hobby">
        </span>
        <span class="radio-label">HOBBY</span>
      </span>
    </label>

    <label>
      <input class="radio-input" type="radio" name="engine">
      <span class="radio-tile">
        <span class="radio-icon">
          <img src="../images/life.svg" alt="life">
        </span>
        <span class="radio-label">LIFE</span>
      </span>
    </label>

    <label>
      <input class="radio-input" type="radio" name="engine">
      <span class="radio-tile">
        <span class="radio-icon">
          <img src="../images/etc.svg" alt="etc">
        </span>
        <span class="radio-label">ETC</span>
      </span>
    </label>

  </div>
</div>

  <div class="list-container">
    <!-- 사이드바 -->
    
    <div class="sidebar">
     <h3>필터 검색</h3>
     <div style="height: 10px"></div>
        <ul class="list">
    <li class="list__item">
      <label class="label--radio">
      	<input type="radio" class="radio" checked  name="foo">
          인기순
      </label>
    </li>
    <li class="list__item">
      <label class="label--radio">
      	<input type="radio" class="radio" name="foo">
          최신순
      </label>
    </li>
    <li class="list__item">
      <label class="label--radio">
      	<input type="radio" class="radio" name="foo">
         평점순
      </label>
    </li>
    <li class="list__item">
      <label class="label--radio">
      	<input type="radio" class="radio" name="foo">
          리뷰 많은 순
      </label>
    </li>
  </ul>
   <div class="d-flex">
    <div class="wrapper">
      <div class="price-input">
        <div class="field">
          <input type="number" class="input-min" value="50000">
          <span>원</span>
        </div>
        <div class="separator">-</div>
        <div class="field">
          <input type="number" class="input-max" value="200000">
          <span>원</span>
        </div>
      </div>
      <div class="slider">
        <div class="progress"></div>
      </div>
      <div class="range-input">
        <input type="range" class="range-min" min="0" max="990000" value="50000" step="10000">
        <input type="range" class="range-max" min="10000" max="1000000" value="200000" step="10000">
      </div>
    </div>
  </div>

   <hr>
      <ul class="accordion" id="sidebar-accordion">
      <!-- 섹션 1 -->
      <li class="accordion__section">
        <button class="accordion__toggle" type="button"
                aria-expanded="false" aria-controls="panel-activate" id="toggle-activate">
          <span>라켓 스포츠</span>
          <!-- 화살표 (색상 지정 없음) -->
          <svg class="chevron" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M6 9l6 6 6-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
          </svg>
        </button>
        <div class="accordion__panel" id="panel-activate" role="region" aria-labelledby="toggle-activate" hidden>
          <ul class="submenu">
            <li><button class="submenu__item" type="button">테니스</button></li>
            <li><button class="submenu__item" type="button">배드민턴</button></li>
            <li><button class="submenu__item" type="button">스쿼시라켓볼</button></li>
          </ul>
        </div>
      </li>

      <!-- 섹션 2 -->
      <li class="accordion__section">
        <button class="accordion__toggle" type="button"
                aria-expanded="false" aria-controls="panel-instagram" id="toggle-instagram">
          <span>격투·무술</span>
          <svg class="chevron" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M6 9l6 6 6-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
          </svg>
        </button>
        <div class="accordion__panel" id="panel-instagram" role="region" aria-labelledby="toggle-instagram">
          <ul class="submenu">
            <li><button class="submenu__item" type="button">복싱 & 킥복싱</button></li><!-- 킥복싱-무에타이 -->
            <li><button class="submenu__item" type="button">태권도</button></li>
            <li><button class="submenu__item" type="button">주짓수</button></li>
            <li><button class="submenu__item" type="button">종합격투기-레슨</button></li>	
          </ul>
        </div>
      </li>

      <!-- 섹션 3 -->
      <li class="accordion__section">
        <button class="accordion__toggle" type="button"
                aria-expanded="false" aria-controls="panel-youtube" id="toggle-youtube">
          <span>요가·필라테스·피트니스</span>
          <svg class="chevron" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M6 9l6 6 6-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
          </svg>
        </button>
        <div class="accordion__panel" id="panel-youtube" role="region" aria-labelledby="toggle-youtube" hidden>
          <ul class="submenu">
            <li><button class="submenu__item" type="button">요가</button></li>
            <li><button class="submenu__item" type="button">필라테스</button></li>
            <li><button class="submenu__item" type="button">피트니스</button></li> <!-- 퍼스널트레이닝임 원래,  체조 -->
          </ul>
        </div>
      </li>

      <!-- 섹션 4 -->
      <li class="accordion__section">
        <button class="accordion__toggle" type="button"
                aria-expanded="false" aria-controls="panel-shorts" id="toggle-shorts">
          <span>관리댄스·리듬운동</span>
          <svg class="chevron" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M6 9l6 6 6-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
          </svg>
        </button>
        <div class="accordion__panel" id="panel-shorts" role="region" aria-labelledby="toggle-shorts" hidden>
          <ul class="submenu">
            <li><button class="submenu__item" type="button">방송댄스</button></li>
            <li><button class="submenu__item" type="button">스트릿-댄스</button></li>
            <li><button class="submenu__item" type="button">댄스스포츠</button></li>
            <li><button class="submenu__item" type="button">살사댄스</button></li>
            <li><button class="submenu__item" type="button">바차타댄스-레슨</button></li>
            <li><button class="submenu__item" type="button">폴-댄스</button></li>
            <li><button class="submenu__item" type="button">음악줄넘기</button></li>
          </ul>
        </div>
      </li>

      <!-- 섹션 5 -->
      <li class="accordion__section">
		  <button class="accordion__toggle" type="button"
		          aria-expanded="false" aria-controls="panel-water" id="toggle-water">
		    <span>수상·익스트림 스포츠</span>
		    <svg class="chevron" viewBox="0 0 24 24" aria-hidden="true">
		      <path d="M6 9l6 6 6-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
		    </svg>
		  </button>
		  <div class="accordion__panel" id="panel-water" role="region" aria-labelledby="toggle-water" hidden>
          <ul class="submenu">
            <li><button class="submenu__item" type="button">수영</button></li>
            <li><button class="submenu__item" type="button">서핑</button></li>
            <li><button class="submenu__item" type="button">스킨스쿠버</button></li>
            <li><button class="submenu__item" type="button">프리다이빙-강습</button></li>
            <li><button class="submenu__item" type="button">스키</button></li>
            <li><button class="submenu__item" type="button">스노우보드</button></li>
            <li><button class="submenu__item" type="button">스케이트보드-강습</button></li>
            <li><button class="submenu__item" type="button">인라인-스케이트-레슨</button></li>
            <li><button class="submenu__item" type="button">스포츠클라이밍</button></li>
          </ul>
        </div>
      </li>
      
      <!-- 섹션 6 -->
      <li class="accordion__section">
		  <button class="accordion__toggle" type="button"
		          aria-expanded="false" aria-controls="panel-team" id="toggle-team">
		    <span>구기·팀스포츠</span>
		    <svg class="chevron" viewBox="0 0 24 24" aria-hidden="true">
		      <path d="M6 9l6 6 6-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
		    </svg>
		  </button>
		  <div class="accordion__panel" id="panel-team" role="region" aria-labelledby="toggle-team" hidden>
          <ul class="submenu">
            <li><button class="submenu__item" type="button">축구</button></li>
            <li><button class="submenu__item" type="button">농구</button></li>
            <li><button class="submenu__item" type="button">야구</button></li>
            <li><button class="submenu__item" type="button">당구</button></li>
          </ul>
        </div>
      </li>
      
      
      <!-- 섹션 7 -->
		<li class="accordion__section">
		  <button class="accordion__toggle" type="button"
		          aria-expanded="false" aria-controls="panel-athletic" id="toggle-athletic">
		    <span>육상·체력운동</span>
		    <svg class="chevron" viewBox="0 0 24 24" aria-hidden="true">
		      <path d="M6 9l6 6 6-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
		    </svg>
		  </button>
		  <div class="accordion__panel" id="panel-athletic" role="region" aria-labelledby="toggle-athletic" hidden>
          <ul class="submenu">
            <li><button class="submenu__item" type="button">마라톤육상</button></li>
            <li><button class="submenu__item" type="button">스포츠지도사-준비</button></li>
          </ul>
        </div>
      </li>
      
      <!-- 섹션 8 -->
      <li class="accordion__section">
		  <button class="accordion__toggle" type="button"
		          aria-expanded="false" aria-controls="panel-creative" id="toggle-creative">
		    <span>창의·기타 운동</span>
		    <svg class="chevron" viewBox="0 0 24 24" aria-hidden="true">
		      <path d="M6 9l6 6 6-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
		    </svg>
		  </button>
		  <div class="accordion__panel" id="panel-creative" role="region" aria-labelledby="toggle-creative" hidden>
          <ul class="submenu">
            <li><button class="submenu__item" type="button">업사이클링-레슨</button></li>
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
    <!-- 오른쪽 메인 -->
    <div class="main">
      <div class="row">
      <!-- start 검색바 -->
      <form class="search">
      <button>
          <svg width="17" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" role="img" aria-labelledby="search">
              <path d="M7.667 12.667A5.333 5.333 0 107.667 2a5.333 5.333 0 000 10.667zM14.334 14l-2.9-2.9" stroke="currentColor" stroke-width="1.333" stroke-linecap="round" stroke-linejoin="round"></path>
          </svg>
      </button>
      <input class="search_input" placeholder="어떤 서비스가 필요하세요?" required="" type="text">
      <button class="reset" type="reset">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
              <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"></path>
          </svg>
      </button>
       </form>
       <!-- end 검색바 -->
       <div class="header-text" style="height: 10px;"></div>
       <c:forEach var="vo" items="${list }">
         
       
         <div class="col-md-3">
         <a href="../main/exercisedetail_before.eum?b_id=${vo.b_id }&page=${curpage }">
		   <div class="temporary__storage" style="border:none">
			  <div class="list-card">
			    <div class="image">
			     	 <img src="${vo.b_thumbnail }" width="200" height="160" style="border-radius: 15px;">
			     	
			    </div>
			    <div class="image__overlay"></div>
			    <div class="content">
			      <div class="avatar"></div>
			      <div class="content__text">
			        <span class="stream__title">${vo.b_title}</span>
			        <div class="content__body">
			          <span class="event" id="rating" id="review-count" style="font-size: 10px">⭐️ ${vo.r_avg_score } (${vo.r_count })</span>
			          <span class="streamer__name" id="price" style="font-size: 12px"><fmt:formatNumber value="${vo.b_op_price_min}" pattern="#,###" />원</span>
			          <span class="streamer__name" id="seller" style="font-size: 10px">${vo.u_s_com }</span>
			        </div>
			        <span class="categories">
					  <div class="categories__btn">${vo.b_type}</div>
					  <div class="categories__btn">${vo.b_filter}</div>
					</span>

			      </div>
			    </div>
			</div>
		  </div>
		  </a>
        </div>
        
      </c:forEach>
      <div id="app" class="container">  
  <ul class="page">
    <c:if test="${startPage>1}">
      <li class="page__btn active">
        <a class="material-icons" href="../main/exerciselist.eum?page=${startPage-1}">&lt;</a>
      </li>
    </c:if>
    <c:forEach var="i" begin="${startPage}" end="${endPage}">
      <li class="page__numbers ${i==curpage?'active':''}">
        <a href="../main/exerciselist.eum?page=${i}">${i}</a>
      </li>
    </c:forEach>
    <c:if test="${endPage<totalpage}">
      <li class="page__btn active">
        <a class="material-icons" href="../main/exerciselist.eum?page=${endPage+1}">&gt;</a>
      </li>
    </c:if>
  </ul>
</div>
      
    </div>
  </div>
 </div>
</body>
</html>
