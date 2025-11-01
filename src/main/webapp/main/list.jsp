<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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

<style>
  .container {
    width: 100% !important;
  }
  body {
    margin: 0;
    background: white !important;
  }

  .list-container {
    display: flex;
    width: 1180px;
    margin: 0 auto;
    gap: 20px;
    background-color: #fff;
    min-height: 800px;
  }

  /* 사이드바 */
  .sidebar {
    width: 20%;
    background-color: #fff;
    border-right: 1px solid #e5e7eb;
    padding: 20px;
  }

  .sidebar h3 {
    font-size: 15px;
    font-weight: 800;
    margin-bottom: 5px;
  }
  .sidebar ul {
    list-style: none;
    padding: 0;
    margin: 0;
  }
  a {
    color: #333;
  }
  .sidebar ul li {
    margin-bottom: 3px;
    margin-left: 10px;
    text-decoration: none;
    color: black;
    font-size: 13px;
    font-weight: 700px;
  }

  .sidebar ul li:hover {
    color: #7453fc;
  }
   .accordion {
    list-style: none;
    padding: 0;
    margin: 0;
  }
  .accordion__section + .accordion__section { margin-top: 6px; }

  /* 섹션 헤더 버튼 */
  .accordion__toggle {
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 8px;
    border:none;
    padding: 12px;
    background: none;          /* 색상 없음 */
    font: inherit;
    line-height: 1.2;
    cursor: pointer;
  }
  .accordion__toggle:focus-visible {
    outline: 2px solid currentColor; /* 시스템 색상 사용 */
    outline-offset: 2px;
  }

  /* 화살표 */
  .chevron {
    width: 18px; height: 18px; flex: 0 0 18px;
    transition: transform 160ms ease;
  }
  .accordion__toggle[aria-expanded="true"] .chevron {
    transform: rotate(180deg);
  }

  /* 패널(하위 메뉴) */
  .accordion__panel {
    border:none;
    margin: 6px 0 0 10px;
    padding: 6px 0 0 10px;
  }
  .submenu {
    list-style: none;
    margin: 0;
    padding: 6px 0 8px 0;
    display: grid;
    gap: 6px;
  }
  .submenu__item {
    border: 0;
    background: none;
    padding: 6px 2px;
    width: 100%;
    text-align: left;
    cursor: pointer;
    font: inherit;
  }
  .submenu__item:focus-visible {
    outline: 2px solid currentColor;
    outline-offset: 2px;
  }
  /* 메인 콘텐츠 */
  .main {
    width: 80%;
    padding: 20px;
    min-height: 800px;
  }
.temporary__storage {
/*delete this*/
  width: 220px;
  height: 290px;
  border-radius: 15px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.list-card {
  width: 200px;
  height: 270px;
  position: relative;
  color: #black;
  display: flex;
  flex-direction: column;
  gap: 5px;
  cursor: pointer;
  transition: all .2s ease;
}

.image {
  width: 100%;
  height: 160px;
  position: absolute;
  background-color: white;
  cursor: pointer;
  transition: all .2s ease;
  border-radius: 15px;
}

.list-card::before {
  position: absolute;
  top: 7px;
  left: 7px;
  font-weight: 900;
  font-size: .8em;
  background-color: white;
  border-radius: 5px;
  padding: 3px 5px;
}

.list-card::after {
  position: absolute;
  bottom: 7px;
  left: 7px;
  font-weight: 300;
  font-size: .7em;
  background-color: white;
  border-radius: 2px;
  padding: 3px 5px;
}

.image__overlay {
  width: 100%;
  height: 160px;
}
label {
  font-weight: 600;
}

.list-card:hover {
  transform: translate(5px, -5px);
}

.avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  cursor: pointer;
}

.content {
  display: flex;
  flex-direction: row;
  gap: 10px;
}

.content__text {
  display: flex;
  flex-direction: column;
  gap: 5px;
}

.content__body {
  display: flex;
  flex-direction: column;
}

.stream__title {
  font-weight: 900;
  width: 190px;
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
  cursor: pointer;
}

.event {
  cursor: pointer;
}

.streamer__name, .event {
  font-size: .8em;
  font-weight: 400;
  color: black;
}

.categories__btn {
  text-decoration: none;
  color: rgb(73, 71, 71);
  font-size: .8em;
  background-color: rgb(220, 220, 220);
  padding: 2px 8px;
  border-radius: 15px;
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
}

:root {
  --primary: #7453fc;
  --greyLight: #7453fc;
  --greyDark: #2d4848;
}

/* 페이지네이션 컨테이너 */
.page {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 15px;
  margin: 3rem auto;
  border-radius: 0.6rem;
  background: #ffffff;
  box-shadow: 0 0.8rem 2rem rgba(90, 97, 129, 0.05);
}

/* 각 요소 공통 */
.page__numbers, .page__btn, .page__dots {
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 5px;
  font-size: 14px;
  cursor: pointer;
}

/* 숫자 버튼 */
.page__numbers {
  width: 20px;
  height: 20px;
  border-radius: 0.4rem;
  transition: all 0.3s ease;
}
.page__numbers:hover {
  color: var(--primary);
}
.page__numbers.active {
  color: #fff;
  background: var(--primary);
  font-weight: 600;
  border: 1px solid var(--primary);
}
.page__btn {
  color: var(--greyLight);
  pointer-events: none;
}
.page__btn.active {
  color: var(--greyDark);
  pointer-events: initial;
}
.page__btn.active:hover {
  color: var(--primary);
}
.number {
  position: absolute;
  top: 2.1875rem;
  left: -1.25rem;
  color: #16a085;
  font-size: 2rem;
  font-family: Helvetiva, Arial, sans-serif;
}

.list {
  padding: 0.5rem 1rem;
  margin: 0.5rem 0.5rem 2rem 0.5rem;
}

.list__item {
  margin: 0 0 0.5rem 0;
  padding: 0;
}

.label--checkbox,
.label--radio {
  position: relative;
  margin: 0.5rem;
  font-family: Arial, sans-serif;
  line-height: 135%;
  cursor: pointer;
}

.checkbox {
  position: relative;
  top: -0.375rem;
  margin: 0 1rem 0 0;
  cursor: pointer;
}
.checkbox:before {
  -webkit-transition: -webkit-transform 0.4s cubic-bezier(0.45, 1.8, 0.5, 0.75);
  -moz-transition: -moz-transform 0.4s cubic-bezier(0.45, 1.8, 0.5, 0.75);
  transition: transform 0.4s cubic-bezier(0.45, 1.8, 0.5, 0.75);
  -webkit-transform: rotate(-45deg) scale(0, 0);
  -moz-transform: rotate(-45deg) scale(0, 0);
  -ms-transform: rotate(-45deg) scale(0, 0);
  -o-transform: rotate(-45deg) scale(0, 0);
  transform: rotate(-45deg) scale(0, 0);
  content: "";
  position: absolute;
  left: 0.1875rem;
  top: 0.125rem;
  z-index: 1;
  width: 0.75rem;
  height: 0.375rem;
  border: 2px solid #16a085;
  border-top-style: none;
  border-right-style: none;
}
.checkbox:checked:before {
  -webkit-transform: rotate(-45deg) scale(1, 1);
  -moz-transform: rotate(-45deg) scale(1, 1);
  -ms-transform: rotate(-45deg) scale(1, 1);
  -o-transform: rotate(-45deg) scale(1, 1);
  transform: rotate(-45deg) scale(1, 1);
}
.checkbox:after {
  content: "";
  position: absolute;
  top: -0.125rem;
  left: 0;
  width: 1rem;
  height: 1rem;
  background: #fff;
  border: 2px solid #f2f2f2;
  cursor: pointer;
}

.radio {
  position: relative;
  margin: 0 1rem 0 0;
  cursor: pointer;
}
.radio:before {
  -webkit-transition: -webkit-transform 0.4s cubic-bezier(0.45, 1.8, 0.5, 0.75);
  -moz-transition: -moz-transform 0.4s cubic-bezier(0.45, 1.8, 0.5, 0.75);
  transition: transform 0.4s cubic-bezier(0.45, 1.8, 0.5, 0.75);
  -webkit-transform: scale(0, 0);
  -moz-transform: scale(0, 0);
  -ms-transform: scale(0, 0);
  -o-transform: scale(0, 0);
  transform: scale(0, 0);
  content: "";
  position: absolute;
  top: 0.08rem;
  left: 0.125rem;
  z-index: 1;
  width: 0.50rem;
  height: 0.50rem;
  background: #7453fc;
  border-radius: 50%;
}
.radio:checked:before {
  -webkit-transform: scale(1, 1);
  -moz-transform: scale(1, 1);
  -ms-transform: scale(1, 1);
  -o-transform: scale(1, 1);
  transform: scale(1, 1);
}
.radio:after {
  content: "";
  position: absolute;
  top: -0.15rem;
  left: -0.125rem;
  width: 1rem;
  height: 1rem;
  background: #fff;
  border: 2px solid #f2f2f2;
  border-radius: 50%;
}
.label--radio {
  display: flex;
  align-items: center;  /* 세로 가운데 정렬 */
  gap: 6px;             /* 버튼과 텍스트 사이 여백 */
  cursor: pointer;
}

.label--radio .radio {
  display: inline-block;
  margin: 0;            /* 브라우저 기본 여백 제거 */
  vertical-align: middle;
}

.list__item {
  list-style: none;
  margin-bottom: 6px;
}
::selection {
  color: #fff;
  background: #7453fc;
}
.wrapper {
  width: 200px;
  padding: 10px 30px 30px 10px;
}
header h2 {
  font-size: 24px;
  font-weight: 600;
}
header p {
  margin-top: 5px;
  font-size: 16px;
}
.price-input {
  width: 100%;
  display: flex;
  margin: 20px 0 20px;
  border:none;
  
}
.price-input .field {
  display: flex;
  width: 100%;
  align-items: center;
}
.field input {
  width: 50px;
  height: 100%;
  outline: none;
  font-size: 10px;
  border-radius: 5px;
  text-align: center;
  border: 1px solid #dcdcdc;
  -moz-appearance: textfield;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
  -webkit-appearance: none;
}
.price-input .separator {
  width: 130px;
  display: flex;
  font-size: 19px;
  align-items: center;
  justify-content: center;
}
.slider {
  height: 5px;
  position: relative;
  background: #ddd;
  border-radius: 5px;
}
.slider .progress {
  height: 100%;
  left: 5%;
  right: 80%;
  position: absolute;
  border-radius: 5px;
  background: #7453fc;
}
.range-input {
  position: relative;
}
.range-input input {
  position: absolute;
  width: 100%;
  height: 5px;
  top: -5px;
  background: none;
  pointer-events: none;
  -webkit-appearance: none;
  -moz-appearance: none;
}
input[type="range"]::-webkit-slider-thumb {
  height: 17px;
  width: 17px;
  border-radius: 50%;
  background: #7453fc;
  pointer-events: auto;
  -webkit-appearance: none;
  box-shadow: 0 0 6px rgba(0, 0, 0, 0.05);
}
input[type="range"]::-moz-range-thumb {
  height: 17px;
  width: 17px;
  border: none;
  border-radius: 50%;
  background: #7453fc;
  pointer-events: auto;
  -moz-appearance: none;
  box-shadow: 0 0 6px rgba(0, 0, 0, 0.05);
}

/* Support */
.support-box {
  top: 2rem;
  position: relative;
  bottom: 0;
  text-align: center;
  display: block;
}
.b-btn {
  color: white;
  text-decoration: none;
  font-weight: bold;
}
.b-btn.paypal i {
  color: blue;
}
.b-btn:hover {
  text-decoration: none;
  font-weight: bold;
}
.b-btn i {
  font-size: 20px;
  color: yellow;
  margin-top: 2rem;
}

</style>
</head>
<body>
  <div style="background-color:#fff; height:180px;"></div>
  <div class="header-text" style="height: 100px;"></div>

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
          <span>채널 활성화</span>
          <!-- 화살표 (색상 지정 없음) -->
          <svg class="chevron" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M6 9l6 6 6-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
          </svg>
        </button>
        <div class="accordion__panel" id="panel-activate" role="region" aria-labelledby="toggle-activate" hidden>
          <ul class="submenu">
            <li><button class="submenu__item" type="button">블로그 관리</button></li>
            <li><button class="submenu__item" type="button">카페 관리</button></li>
          </ul>
        </div>
      </li>

      <!-- 섹션 2 -->
      <li class="accordion__section">
        <button class="accordion__toggle" type="button"
                aria-expanded="true" aria-controls="panel-instagram" id="toggle-instagram">
          <span>인스타그램 관리</span>
          <svg class="chevron" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M6 9l6 6 6-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
          </svg>
        </button>
        <div class="accordion__panel" id="panel-instagram" role="region" aria-labelledby="toggle-instagram">
          <ul class="submenu">
            <li><button class="submenu__item" type="button">인스타그램 대행</button></li>
            <li><button class="submenu__item" type="button">인스타그램 활성화</button></li>
          </ul>
        </div>
      </li>

      <!-- 섹션 3 -->
      <li class="accordion__section">
        <button class="accordion__toggle" type="button"
                aria-expanded="false" aria-controls="panel-youtube" id="toggle-youtube">
          <span>유튜브 관리</span>
          <svg class="chevron" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M6 9l6 6 6-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
          </svg>
        </button>
        <div class="accordion__panel" id="panel-youtube" role="region" aria-labelledby="toggle-youtube" hidden>
          <ul class="submenu">
            <li><button class="submenu__item" type="button">채널 운영</button></li>
            <li><button class="submenu__item" type="button">영상 최적화</button></li>
          </ul>
        </div>
      </li>

      <!-- 섹션 4 -->
      <li class="accordion__section">
        <button class="accordion__toggle" type="button"
                aria-expanded="false" aria-controls="panel-shorts" id="toggle-shorts">
          <span>릴스·쇼츠·틱톡 관리</span>
          <svg class="chevron" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M6 9l6 6 6-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
          </svg>
        </button>
        <div class="accordion__panel" id="panel-shorts" role="region" aria-labelledby="toggle-shorts" hidden>
          <ul class="submenu">
            <li><button class="submenu__item" type="button">숏폼 편집</button></li>
            <li><button class="submenu__item" type="button">캠페인 운영</button></li>
          </ul>
        </div>
      </li>

      <!-- 섹션 5 -->
      <li class="accordion__section">
        <button class="accordion__toggle" type="button"
                aria-expanded="false" aria-controls="panel-viral" id="toggle-viral">
          <span>바이럴·협찬</span>
          <svg class="chevron" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M6 9l6 6 6-6" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" />
          </svg>
        </button>
        <div class="accordion__panel" id="panel-viral" role="region" aria-labelledby="toggle-viral" hidden>
          <ul class="submenu">
            <li><button class="submenu__item" type="button">인플루언서 마케팅</button></li>
            <li><button class="submenu__item" type="button">체험단 모집</button></li>
            <li><button class="submenu__item" type="button">바이럴·포스팅</button></li>
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
       <c:forEach begin="0" end="11">
         <div class="col-md-3">
		   <div class="temporary__storage" style="border:none">
			  <div class="list-card" onclick="location.href='../main/detail.eum'">
			    <div class="image">
			      <img src="./assets/images/플랫폼개발.webp" width="200" height="160" style="border-radius: 15px;">
			    </div>
			    <div class="image__overlay"></div>
			    <div class="content">
			      <div class="avatar"></div>
			      <div class="content__text">
			        <span class="stream__title">맞춤 개발로 완벽한 플랫폼을 만들어드립니다</span>
			        <div class="content__body">
			          <span class="event" id="rating" id="review-count" style="font-size: 10px">⭐️ 4.9 (23)</span>
			          <span class="streamer__name" id="price" style="font-size: 12px">10,000원</span>
			          <span class="streamer__name" id="seller" style="font-size: 10px">김민식</span>
			        </div>
			        <span class="categories">
			          <div class="categories__btn" style="width:55px; text-align: center; font-size: 10px">카테고리</div>
			        </span>
			      </div>
			    </div>
			</div>
		  </div>
        </div>
      </c:forEach>
      <div id="app" class="container">  
  <ul class="page">
    <li class="page__btn active"><span class="material-icons">&lt;</span></li>
    <li class="page__numbers">1</li>
    <li class="page__numbers active">2</li>
    <li class="page__numbers">3</li>
    <li class="page__numbers">4</li>
    <li class="page__numbers">5</li>
    <li class="page__btn active"><span class="material-icons">&gt;</span></li>
  </ul>
</div>
      
    </div>
  </div>
 </div>
</body>
</html>
