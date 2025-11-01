<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<script>
  $(function () {
    // jQuery UI tabs
    $("#tabs").tabs();

    const root    = document.getElementById('sortDropdown');
    const current = root.querySelector('.current');
    const menu    = root.querySelector('.menu');

    // ▼ 열기/닫기: 메뉴 안을 클릭한 경우는 토글하지 않음
    root.addEventListener('click', function(e){
      if (e.target.closest('.menu')) return;  // 메뉴 내부 클릭은 무시
      e.stopPropagation();
      root.classList.toggle('expanded');
    });

    // ▼ 옵션 선택 시: 라벨 또는 라디오 모두 대응 + 즉시 닫기
    menu.addEventListener('click', function(e){
      let input, labelText;

      const label = e.target.closest('label[for]');
      if (label) {
        e.preventDefault();                 // 라벨 기본 동작 억제
        const id = label.getAttribute('for');
        input = document.getElementById(id);
        labelText = label.textContent.trim();
      } else {
        input = e.target.closest('input[type="radio"]');
        if (input) {
          const assocLabel = menu.querySelector(`label[for="${input.id}"]`);
          labelText = assocLabel ? assocLabel.textContent.trim() : input.value;
        }
      }

      if (!input) return;

      input.checked = true;
      if (current) current.textContent = labelText;

      // 선택 직후 닫기
      root.classList.remove('expanded');
      e.stopPropagation();                  // 루트로 버블링 방지
    });

    // ▼ 바깥 클릭 시 닫기
    document.addEventListener('click', function(){
      root.classList.remove('expanded');
    });

    // ▼ ESC로 닫기 (옵션)
    document.addEventListener('keydown', function(e){
      if (e.key === 'Escape') root.classList.remove('expanded');
    });

    // ▼ 최초 표시 동기화
    const checked = menu.querySelector('input:checked + label');
    if (checked && current) current.textContent = checked.textContent.trim();
  });
</script>
<style>
    :root{
      --bg:#fff;           /* 페이지 배경 */
      --card:#ffffff;         /* 카드 배경 */
      --text:#111827;         /* 본문 텍스트 */
      --muted:#6b7280;        /* 보조 텍스트 */
      --line:#e5e7eb;         /* 경계선 */
      --brand:#111;           /* 메인 진한색 */
      --accent:#facc15;       /* 별점 색 (노랑) */
      --primary:#ffe600;      /* CTA 버튼 */
      --primary-ink:#111;     /* CTA 글자 */
      --chip:#111827;         /* 배지 바탕 */
      --chip-ink:#fff;        /* 배지 글자 */
      --good:#22c55e;         /* 긍정 포인트 */
    }
    *{box-sizing:border-box}
    html,body{height:100%; background:#fff}
    body{ background : #fff !important;
      margin:0; font-family: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, "Apple SD Gothic Neo", "Noto Sans KR", Arial, "Apple Color Emoji", "Segoe UI Emoji";
      color:var(--text);
    }
    a{color:inherit; text-decoration:none}
    .dt-container{max-width:1180px; margin-inline:auto; padding:28px 20px; width:100%}
    /* 상단 경로 */
    .breadcrumb{font-size:13px; color:var(--muted); display:flex; gap:6px; align-items:center}
    .breadcrumb span{opacity:.9}

    /* 히어로 영역 */
    .hero{display:grid; grid-template-columns: 6fr 4fr; gap:28px; margin-top:16px}
    .hero-left{display:flex; flex-direction:column; gap:18px; width: 100%}

    .title-row{display:flex; align-items:center; gap:12px; flex-wrap:wrap}
    .prime-badge{background:#111; color:#fff; border-radius:6px; padding:4px 8px; font-weight:700; font-size:12px; letter-spacing:.2px}

    .title{font-size:32px; line-height:1.25; font-weight:800; color:black;}

    .meta{display:flex; align-items:center; gap:14px}
    .stars{display:inline-flex; gap:2px; transform: translateY(1px)}
    .star{width:18px; height:18px; fill:var(--accent)}
    .rating{font-weight:700}
    .count{color:var(--muted); font-size:13px}

    .quick{display:flex; gap:8px; align-items:center; color:var(--muted)}
    .heart{width:18px; height:18px; fill:#ef4444}

    .contact-bar{display:flex; gap:12px; align-items:center; flex-wrap:wrap}
    .chip{background:var(--chip); color:var(--chip-ink); border-radius:999px; padding:6px 12px; font-size:12px}
    .btn-outline{border:1px solid var(--line); background:var(--card); padding:10px 14px; border-radius:10px; font-weight:600}

    .prime-card{background:#f4f4f4; border:1px solid var(--line); border-radius:14px; padding:16px}
    .prime-card h4{margin:0 0 10px; font-size:14px}
    .prime-list{display:grid; gap:8px}
    .prime-list li{list-style:none; display:flex; gap:10px; align-items:flex-start; color:var(--text)}
    .prime-list li .tick{color:var(--good); font-weight:900}

    .hero-right .banner{background:linear-gradient(135deg,#222 0%,#111 100%); width: 100%; color:#fff; border-radius:16px; display:flex; align-items:center; justify-content:center; font-weight:800; font-size:22px; text-align:center; padding:20px}
    .hero-right .banner small{display:block; margin-top:8px; opacity:.9; font-weight:600}
    .banner {height: 100%}

    .plans{margin-top:16px}
    .plan-card{background:var(--card); border:1px solid var(--line); border-radius:14px; padding:0;}

    .tabs{display:flex; border-bottom:1px solid var(--line); background:#fafafa}
    .tabs label{flex:1; text-align:center; padding:14px 10px; cursor:pointer; font-weight:700}
    .tabs label:hover{background:#f3f4f6}

    input[name=tab]{position:absolute; left:-9999px}
    #tab-standard:checked ~ .tabs label[for=tab-standard],
    #tab-deluxe:checked ~ .tabs label[for=tab-deluxe],
    #tab-premium:checked ~ .tabs label[for=tab-premium]{
      background:var(--card); border-bottom:3px solid #111; color:#111
    }

    .panel{display:none; padding:18px}
    #tab-standard:checked ~ .panel.standard,
    #tab-deluxe:checked ~ .panel.deluxe,
    #tab-premium:checked ~ .panel.premium{display:block}

    .price{font-size:26px; font-weight:900; margin:6px 0 2px}
    .vat{font-size:12px; color:var(--muted)}
    .benefit{font-size:12px; color:var(--muted); margin-top:8px}

    .kv{display:grid; grid-template-columns: 1fr auto; gap:12px; align-items:center; margin-top:10px}
    .kv small{color:var(--muted)}

    .cta{display:flex; gap:10px; margin-top:14px}
    .btn-ghost{flex:1; border:1px solid var(--line); #7553fcde; padding:12px; border-radius:12px; font-weight:700}
    .btn-pri{flex:1; background:#7453fc; color:#fff; padding:12px; border-radius:12px; font-weight:900; border:1px solid #00000020}
	.btn-pri:hover{background:#7453fcde}
    /* 섹션 탭 네비게이션 (하단) */
    .section-tabs{margin-top:28px; display:flex; gap:12px; border-bottom:1px solid var(--line)}
    .section-tabs a{padding:12px 2px; color:var(--muted); font-weight:700}
    .section-tabs a.active{color:var(--text); border-bottom:2px solid #111}

    /* 본문 2열 레이아웃 */
    .main{display:grid; grid-template-columns: 1.5fr .8fr; gap:28px; margin-top:18px}

    .re-card{background:var(--card); border-bottom:1px solid var(--line); padding:10px; width: 100%}
    .re-card h3{margin:0 0 12px}

    .review{display:grid; grid-template-columns: 1fr; gap:12px}
    .review-item{border:1px dashed var(--line); border-radius:12px; padding:14px}
    .review-top{display:flex; align-items:center; gap:10px; margin-bottom:6px}
    .avatar{width:40px; height:40px; border-radius:50%; background:#e5e7eb}
    .review-img{width:70px; height:70px; background:#e5e7eb; border-radius:15%; margin: 10px 1px 10px 0; display: inline-block;}
    .name{font-weight:800}
    .stars-sm{display:inline-flex; gap:2px; transform:translateY(1px)}
    .star-sm{width:14px; height:14px; fill:var(--accent)}

    .side-sticky{position:sticky; top:18px; height:fit-content}

    @media (max-width: 980px){
      .hero{grid-template-columns: 1fr}
      .main{grid-template-columns:1fr}
    }
    #tabs .ui-state-default {
	  background: #fff;
	  color: #bebebe !important;
	  border: none !important;
	}
	.ui-state-active a,
	.ui-state-active a:link,
	.ui-state-active a:visited {
	  color:black !important;    
	  font-weight : 800;
	  border-bottom: 2px solid black !important;
}
	p {
	  color: black !important;
	}
	/* 컨트롤 자체는 항상 2em 고정, 레이아웃 변화 없음 */
	.dropdown-el{
	  position:relative;
	  display:inline-block;
	  width: 100%;
	  height:50px;
	  line-height:2em;
	  padding:0 2.6em 0 1em;
	  border: solid .0625rem #E0E5EB;
	  border-radius:1em;
	  cursor:pointer;
	  white-space:nowrap;
	  user-select:none;
	  transition:border .2s ease, background .2s ease, box-shadow .2s ease;
	  display: flex;
  	  align-items: center; 
	}
	
	/* 현재 선택 텍스트 */
	.dropdown-el .current{
	  display:block;
	  /* overflow:hidden; */
	  text-overflow:ellipsis;
	  font-size: 17px;
	}
	
	/* 아래 화살표 아이콘 */
	.dropdown-el::after{
	  content:"";
	  position:absolute;
	  right:.8em; top:.85em;
	  border:.3em solid #7453fc;
	  border-color:#7453fc transparent transparent transparent;
	  transition:transform .2s ease, top .2s ease;
	}
	
	/* 떠 있는 메뉴 패널 (absolute로 띄워서 외부 높이에 영향 X) */
	.dropdown-el .menu{
	  position:absolute;
	  top:100%;
	  left:0;
	  z-index: 999999;  
	
	  /* 패널 비주얼 */
	  background:#fff;
	  border:1px solid #7453fc;
	  border-radius:.5em;
	  box-shadow:0 4px 10px rgba(0,0,0,.12);
	
	  /* 스크롤 가능 */
	  max-height:15em;
	  overflow:auto;
	
	  /* 기본은 숨김 */
	  display:none;
	  margin-top:.25em;
	  padding:.25em 0;
	  min-width:100%;
	}
	
	/* 열렸을 때만 보이도록 */
	.dropdown-el.expanded .menu{ display:block; z-index: 999999;  }
	
	/* 옵션 라벨/인풋 스타일 */
	.dropdown-el .menu input{
	  position:absolute;
	  opacity:.01;
	  pointer-events:none;
	}
	.dropdown-el .menu label{
	  display:block;
	  padding:.5em 1em;
	  line-height:1.4;
	  border-top:1px solid #eee;
	  color:#333;
	  transition:color .15s ease, background .15s ease;
	}
	.dropdown-el .menu label:first-of-type{ border-top:none; }
	
	.dropdown-el .menu label:hover{ background:#f6fbff; color:#7453fc; }
	.dropdown-el .menu input:checked + label{ color:#7453fc; font-weight:600; }
	
	/* 모션만 살짝 */
	.dropdown-el.expanded{
	  background:#fff;
	  border-color:#7453fc;
	  box-shadow:0 2px 8px rgba(0,0,0,.08);
	  z-index: 999999;  
	}
	.dropdown-el.expanded::after{
	  transform:rotate(-180deg);
	  top:.55em;
	  z-index: 999999;  
	}
    .dropdown-portal {
	  position: fixed;          /* 뷰포트 기준 */
	  z-index: 999999;          /* 최상단으로 */
	  background: #fff;
	  border: 1px solid #7453fc;
	  border-radius: .5em;
	  box-shadow: 0 8px 24px rgba(0,0,0,.14);
	  max-height: 15em;
	  /* verflow: auto; */
	  display: none;            /* 기본 숨김 */
	}
	#skicky{
  		position: sticky;
		top: 100px;          /* 화면 상단에서 20px 떨어진 위치에 고정 */
		align-self: start;  /* 부모가 flex/grid일 때 위에서부터 배치 */
		z-index: 2;         /* 필요한 경우 헤더/카드 위로 */
}
    
  </style>
</head>
<body>
  <div style="background-color:#fff; height:180px;"></div>
  <div class="header-text" style="height: 100px;"></div>

  <section class="dt-container hero" id="main-section">
    <div class="hero-left">
      <div class="title-row">
        <span class="prime-badge">prime</span>
        <h1 class="title">모든 종류의 보도자료, 기사 작성 및 송출해 드립니다.</h1> <!-- 컨텐츠 제목 -->
      </div>

      <div class="meta" aria-label="별점 및 관심">
        <div class="stars" aria-hidden="true">
          <svg class="star" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
          <svg class="star" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
          <svg class="star" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
          <svg class="star" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
          <svg class="star" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
        </div>
        <span class="rating">4.9</span> <!-- 컨텐츠 평점 -->
        <span class="count">(4,239)</span> <!-- 리뷰 수 -->
        <div class="quick" style="margin-left:6px">
          <svg class="heart" viewBox="0 0 24 24" aria-hidden="true">
            <path d="M12 21s-6.7-4.3-9.4-7.1C.7 11.9.4 8.9 2.3 7 4 5.3 6.8 5.6 8.6 7.3L12 10.6l3.4-3.3c1.8-1.7 4.6-2 6.3-.3 1.9 1.9 1.6 4.9-.3 6.8C18.7 16.7 12 21 12 21z" fill="#ef4444"/>
          </svg>
          <span>1,477</span> <!-- 좋아요 수 -->
        </div>
      </div>

      <div class="contact-bar">
        <span class="chip">PRESSINSIDE · 언제나 가능</span>
        <span class="chip" style="background:#e5e7eb; color:#111">평균 응답 10분</span>
        <a class="btn-outline" href="#">문의하기</a>
      </div>

      <div class="prime-card">
        <h4 style="color:black;">이 서비스는 꼼꼼한 상위 2% 전문가가 제공해요</h4>
        <ul class="prime-list">
          <li><span class="tick">✔</span> 포트폴리오와 고객 후기로 검증된 퀄리티</li>
          <li><span class="tick">✔</span> 경력·이력 인증 심사를 통과한 서비스</li>
          <li><span class="tick">✔</span> 다양한 고객의 요청에 맞춘 전문성</li>
        </ul>
      </div>
    </div>

    <div class="hero-right">
      <div class="banner"> <!--컨텐츠 메인 이미지 -->
        보도자료·기사 작성 / 송출
        <small>당일 신속 송출, 빠른 문의 응답</small>
      </div>
    </div>
  </section>

  <section class="dt-container hero">
    <div class="hero-left">
      <div id="tabs" style="background-color: #fff; border: none;">
        <ul style="background-color: #fff; border: none; border-bottom: 1px solid #bebebe;">
          <li><a href="#tabs-1">상세 내용</a></li>
          <li><a href="#tabs-2">셀러 정보</a></li>
          <li><a href="#tabs-3">리뷰</a></li>
        </ul>
		<!-- 컨텐츠 상세 내용 -->
        <div id="tabs-1">
          <p>Proitempus lectus.</p>
        </div>
		<!-- 셀러 정보 -->
        <div id="tabs-2">
          <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
          <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
          <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
          <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
          <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
          <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
          <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
        </div>
		<!-- 리뷰 -->
        <div id="tabs-3">
          <aside class="side-sticky">
            <c:forEach begin="0" end="5">
              <div class="re-card" id="reviews">
                <div class="review">
                  <div style="display: flex;">
                    <div class="avatar" style="margin-right: 10px;"></div> <!-- 리뷰 프로필 -->
                    <div>
                      <div class="stars-sm" aria-hidden="true">
                        <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
                        <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
                        <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
                        <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
                        <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
                      </div>
                      <div class="name">양**</div> <!-- 리뷰 작성자 -->
                    </div>
                    <div style="text-align: right; margin-left: auto; font-size: 11px; color:#6b7280;"> <!-- 리뷰 날짜 -->
                      25.11.01 14:56
                    </div>
                  </div>
                </div>

                <c:forEach begin="0" end="2"> <!-- 리뷰 이미지 -->
                  <div class="review-img"></div>
                </c:forEach>
				<!-- 리뷰 내용 -->
                <p style="margin:0; color:var(--muted)">빠르고 정확하기도 한데다가 원고도 너무 좋네요…</p>
              </div>
            </c:forEach>
          </aside>
        </div>
      </div>
    </div>

    <div class="hero-right" id="skicky">
      <div class="plans">
          <span class="dropdown-el" id="sortDropdown">
		  <span class="current">벽걸이 기본 (90,000원)</span>
			  <div class="menu">
			    <input type="radio" name="sortType" value="Relevance" checked id="sort-relevance">
			    <label for="sort-relevance">벽걸이 기본 (90,000원)</label>
			
			    <input type="radio" name="sortType" value="Popularity" id="sort-best">
			    <label for="sort-best">벽걸이 와이드 (100,000원)</label>
			
			    <input type="radio" name="sortType" value="PriceIncreasing" id="sort-low">
			    <label for="sort-low">벽걸이 와이드 (100,000원)</label>
			
			    <input type="radio" name="sortType" value="PriceDecreasing" id="sort-high">
			    <label for="sort-high">벽걸이 와이드 (100,000원)</label>
			  </div>
			</span>
            <div class="cta">
              <button class="btn-ghost">전문가에게 문의하기</button>
              <button class="btn-pri">구매하기</button>
            </div>
          </div>
        </div>
      


    <div style="height: 100px"></div>
  </section>
</body>
</html>
</html>