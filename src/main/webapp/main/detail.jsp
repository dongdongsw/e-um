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
<link rel="stylesheet" href="css/detail.css">
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
</head>
<body>
  <div class="header-text" style="height: 200px;"></div>

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
  <!-- 상세정보 시작 --> 
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
	<!-- 가격 옵션 -->
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