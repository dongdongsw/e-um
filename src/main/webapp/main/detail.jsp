<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  $( function() {
    $( "#tabs" ).tabs();
  } );
</script>
<style>
    :root{
      --bg:#f4f4f4;           /* 페이지 배경 */
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
    html,body{height:100%; background:#f4f4f4}
    body{ 
      margin:0; font-family: ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, "Apple SD Gothic Neo", "Noto Sans KR", Arial, "Apple Color Emoji", "Segoe UI Emoji";
      color:var(--text);
    }
    a{color:inherit; text-decoration:none}
    .dt-container{max-width:1180px; margin-inline:auto; padding:28px 20px}
    /* 상단 경로 */
    .breadcrumb{font-size:13px; color:var(--muted); display:flex; gap:6px; align-items:center}
    .breadcrumb span{opacity:.9}

    /* 히어로 영역 */
    .hero{display:grid; grid-template-columns: 6fr 4fr; gap:28px; margin-top:16px}
    .hero-left{display:flex; flex-direction:column; gap:18px;}

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

    .prime-card{background:var(--card); border:1px solid var(--line); border-radius:14px; padding:16px}
    .prime-card h4{margin:0 0 10px; font-size:14px}
    .prime-list{display:grid; gap:8px}
    .prime-list li{list-style:none; display:flex; gap:10px; align-items:flex-start; color:var(--text)}
    .prime-list li .tick{color:var(--good); font-weight:900}

    .hero-right .banner{background:linear-gradient(135deg,#222 0%,#111 100%); color:#fff; border-radius:16px; display:flex; align-items:center; justify-content:center; font-weight:800; font-size:22px; text-align:center; padding:20px}
    .hero-right .banner small{display:block; margin-top:8px; opacity:.9; font-weight:600}
    .banner {height: 100%}

    /* 가격/패키지 카드 */
    .plans{margin-top:16px}
    .plan-card{background:var(--card); border:1px solid var(--line); border-radius:14px; padding:0; overflow:hidden}

    /* 탭 (HTML/CSS만) */
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
    .btn-ghost{flex:1; border:1px solid var(--line); background:var(--card); padding:12px; border-radius:12px; font-weight:700}
    .btn-primary{flex:1; background:#7453fc; color:#fff; padding:12px; border-radius:12px; font-weight:900; border:1px solid #00000020}

    /* 섹션 탭 네비게이션 (하단) */
    .section-tabs{margin-top:28px; display:flex; gap:12px; border-bottom:1px solid var(--line)}
    .section-tabs a{padding:12px 2px; color:var(--muted); font-weight:700}
    .section-tabs a.active{color:var(--text); border-bottom:2px solid #111}

    /* 본문 2열 레이아웃 */
    .main{display:grid; grid-template-columns: 1.5fr .8fr; gap:28px; margin-top:18px}

    .re-card{background:var(--card); border:1px solid var(--line); border-radius:14px; padding:18px}
    .re-card h3{margin:0 0 12px}

    .review{display:grid; grid-template-columns: 1fr; gap:12px}
    .review-item{border:1px dashed var(--line); border-radius:12px; padding:14px}
    .review-top{display:flex; align-items:center; gap:10px; margin-bottom:6px}
    .avatar{width:34px; height:34px; border-radius:50%; background:#e5e7eb}
    .name{font-weight:800}
    .stars-sm{display:inline-flex; gap:2px; transform:translateY(1px)}
    .star-sm{width:14px; height:14px; fill:var(--accent)}

    .side-sticky{position:sticky; top:18px; height:fit-content}

    /* 반응형 */
    @media (max-width: 980px){
      .hero{grid-template-columns: 1fr}
      .main{grid-template-columns:1fr}
    }
    #tabs .ui-state-default {
	  background: #f4f4f4;
	  color: #bebebe !important;
	  border: none !important;
	}
	.ui-state-active a,
	.ui-state-active a:link,
	.ui-state-active a:visited {
	  color:black !important;        /* 눌렸을 때 글씨 */
	  font-weight : 800;
	  border-bottom: 2px solid black !important;
}
	p {
	  color: black !important;
	}
    
  </style>
</head>
<body>
<div style="background-color:#fff; height:180px;"></div>
 <section class="dt-container hero" id="main-section">
    <div class="hero-left">
      <div class="title-row">
        <span class="prime-badge">prime</span>
        <h1 class="title">모든 종류의 보도자료, 기사 작성 및 송출해 드립니다.</h1>
      </div>
      <div class="meta" aria-label="별점 및 관심">
        <div class="stars" aria-hidden="true">
          <svg class="star" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
          <svg class="star" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
          <svg class="star" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
          <svg class="star" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
          <svg class="star" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
        </div>
        <span class="rating">4.9</span>
        <span class="count">(4,239)</span>
        <div class="quick" style="margin-left:6px">
          <svg class="heart" viewBox="0 0 24 24" aria-hidden="true"><path d="M12 21s-6.7-4.3-9.4-7.1C.7 11.9.4 8.9 2.3 7 4 5.3 6.8 5.6 8.6 7.3L12 10.6l3.4-3.3c1.8-1.7 4.6-2 6.3-.3 1.9 1.9 1.6 4.9-.3 6.8C18.7 16.7 12 21 12 21z" fill="#ef4444"/></svg>
          <span>1,477</span>
        </div>
      </div>

      <div class="contact-bar">
        <span class="chip">PRESSINSIDE · 언제나 가능</span>
        <span class="chip" style="background:#e5e7eb; color:#111">평균 응답 10분</span>
        <a class="btn-outline" href="#">문의하기</a>
      </div>

      <div class="prime-card">
        <h4>이 서비스는 꼼꼼한 상위 2% 전문가가 제공해요</h4>
        <ul class="prime-list">
          <li><span class="tick">✔</span> 포트폴리오와 고객 후기로 검증된 퀄리티</li>
          <li><span class="tick">✔</span> 경력·이력 인증 심사를 통과한 서비스</li>
          <li><span class="tick">✔</span> 다양한 고객의 요청에 맞춘 전문성</li>
        </ul>
      </div>
    </div>

    <div class="hero-right">
      <div class="banner">
        보도자료·기사 작성 / 송출
        <small>당일 신속 송출, 빠른 문의 응답</small>
      </div>
      </div>
  </section>
  <section class="dt-container hero">
    <div class="hero-left">
       <div id="tabs" style="background-color: #f4f4f4; border: none;">
	  <ul style="background-color: #f4f4f4; border: none; border-bottom: 1px solid #bebebe;">
	    <li><a href="#tabs-1">상세 내용</a></li>
	    <li><a href="#tabs-2">셀러 정보</a></li>
	    <li><a href="#tabs-3">리뷰</a></li>
	  </ul>
	  <div id="tabs-1">
	    <p>Proin elit arcu, rutrum commodo, vehicula tempus, commodo a, risus. Curabitur nec arcu. Donec sollicitudin mi sit amet mauris. Nam elementum quam ullamcorper ante. Etiam aliquet massa et lorem. Mauris dapibus lacus auctor risus. Aenean tempor ullamcorper leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel pede varius sollicitudin. Sed ut dolor nec orci tincidunt interdum. Phasellus ipsum. Nunc tristique tempus lectus.</p>
	  </div>
	  <div id="tabs-2">
	    <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
	   <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
	   <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
	    <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
	     <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
	      <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
	       <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
	  </div>
	  <div id="tabs-3">
	    <aside class="side-sticky">
        <div class="re-card" id="reviews">
          <h3>최근 받은 리뷰</h3>
          <div class="review">
            <div class="review-item">
              <div class="review-top">
                <div class="avatar"></div>
                <div class="name">양**</div>
                <div class="stars-sm" aria-hidden="true">
                  <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
                  <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
                  <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
                  <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
                  <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
                </div>
              </div>
              <p style="margin:0; color:var(--muted)">빠르고 정확하기도 한데다가 원고도 너무 좋네요…</p>
            </div>

            <div class="review-item">
              <div class="review-top">
                <div class="avatar"></div>
                <div class="name">김**</div>
                <div class="stars-sm" aria-hidden="true">
                  <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
                  <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
                  <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
                  <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
                  <svg class="star-sm" viewBox="0 0 20 20" style="opacity:.35"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
                </div>
              </div>
              <p style="margin:0; color:var(--muted)">신속한 응대와 친절한 상담 덕분에 의사결정이 빨랐어요.</p>
            </div>
          </div>
        </div>
      </aside>
	  </div>
	  </div>
    </div>
    <div class="hero-right">
      <div class="plans">
        <div class="plan-card side-sticky">
          <!-- 탭 스위치 (CSS 전용) -->
          <input type="radio" name="tab" id="tab-standard" />
          <input type="radio" name="tab" id="tab-deluxe" checked />
          <input type="radio" name="tab" id="tab-premium" />

          <div class="tabs">
            <label for="tab-standard">STANDARD</label>
            <label for="tab-deluxe">DELUXE</label>
            <label for="tab-premium">PREMIUM</label>
          </div>

          <div class="panel standard" aria-labelledby="tab-standard">
            <div class="price-row"><div class="price">69,000원</div><div class="vat">(VAT 포함)</div></div>
            <div class="benefit">기본 보도자료 1건 작성</div>
            <div class="kv"><small>작업일</small><strong>2일</strong></div>
            <div class="kv"><small>수정 횟수</small><strong>1회</strong></div>
            <div class="cta">
              <button class="btn-ghost">전문가에게 문의하기</button>
              <button class="btn-primary">구매하기</button>
            </div>
          </div>

          <div class="panel deluxe" aria-labelledby="tab-deluxe">
            <div class="price-row"><div class="price">99,000원</div><div class="vat">(VAT 포함)</div></div>
            <div class="benefit">B급 매체 3곳 송출 (원고 포함)</div>
            <div class="kv"><small>작업일</small><strong>1일</strong></div>
            <div class="kv"><small>수정 횟수</small><strong>제한 없음</strong></div>
            <div class="cta">
              <button class="btn-ghost">전문가에게 문의하기</button>
              <button class="btn-primary">구매하기</button>
            </div>
          </div>

          <div class="panel premium" aria-labelledby="tab-premium">
            <div class="price-row"><div class="price">199,000원</div><div class="vat">(VAT 포함)</div></div>
            <div class="benefit">포털 노출 중심 상급 매체 송출 패키지</div>
            <div class="kv"><small>작업일</small><strong>당일</strong></div>
            <div class="kv"><small>수정 횟수</small><strong>무제한</strong></div>
            <div class="cta">
              <button class="btn-ghost">전문가에게 문의하기</button>
              <button class="btn-primary">구매하기</button>
            </div>
          </div>
        </div>
        </div>
    </div>
    <div style="height: 100px"></div>
  </section>
 

</body>
</html>