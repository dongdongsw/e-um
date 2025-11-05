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

    // ▼ 드롭다운 (민석님 기존 코드 유지)
    const root    = document.getElementById('sortDropdown');
    const current = root?.querySelector('.current');
    const menu    = root?.querySelector('.menu');

    if (root && menu) {
      root.addEventListener('click', function(e){
        if (e.target.closest('.menu')) return;
        e.stopPropagation();
        root.classList.toggle('expanded');
      });

      menu.addEventListener('click', function(e){
        let input, labelText;
        const label = e.target.closest('label[for]');
        if (label) {
          e.preventDefault();
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
        root.classList.remove('expanded');
        e.stopPropagation();
      });

      document.addEventListener('click', function(){
        root.classList.remove('expanded');
      });

      document.addEventListener('keydown', function(e){
        if (e.key === 'Escape') root.classList.remove('expanded');
      });

      const checked = menu.querySelector('input:checked + label');
      if (checked && current) current.textContent = checked.textContent.trim();
    }

    // ▼ 좋아요 버튼: 클릭 바인딩 + 토글
    function toggleLike(e){
      const el = e.currentTarget;                          // 클릭된 버튼
      const countEl = el.querySelector(".like-count");
      let count = parseInt(countEl.textContent.replace(/,/g, "")) || 0;
      const liked = el.classList.toggle("liked");          // 클래스 토글 (색상 변경)

      countEl.textContent = (liked ? count + 1 : count - 1).toLocaleString();
    }

    // 버튼 여러 개도 대응
    document.querySelectorAll('.like-button').forEach(btn=>{
      btn.addEventListener('click', toggleLike);
    });
    
    $(".count").on("click", function() {
    	  $("#tabs").tabs("option", "active", 2); // 0=상세, 1=셀러, 2=리뷰
    	  $("html, body").animate({
    	    scrollTop: $("#tabs").offset().top - 100 // 살짝 위로 위치 조정
    	  }, 400);
    });
  });
</script>
</head>
<body>
  <div class="header-text" style="height: 200px;"></div>

  <section class="dt-container hero" id="main-section">
    <div class="hero-left">
      <div class="title-row">
        <button class="prime-badge">즐겨찾기</button>
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
		<div class="like-button">
		  <svg class="heart" viewBox="0 0 24 24" aria-hidden="true">
		    <path d="M12 21s-6.7-4.3-9.4-7.1C.7 11.9.4 8.9 2.3 7 4 5.3 6.8 5.6 8.6 7.3L12 10.6l3.4-3.3c1.8-1.7 4.6-2 6.3-.3 1.9 1.9 1.6 4.9-.3 6.8C18.7 16.7 12 21 12 21z"></path>
		  </svg>
		  <span class="like-count">1,477</span> <!-- 좋아요 수 -->
		</div>

        <div class="quick">
  <svg class="view" viewBox="0 0 24 24" aria-hidden="true">
    <path d="M12 5C7 5 2.7 8.1 1 12c1.7 3.9 6 7 11 7s9.3-3.1 11-7c-1.7-3.9-6-7-11-7zm0 11a4 4 0 1 1 0-8 4 4 0 0 1 0 8z" fill="#6b7280"/>
  </svg>
  <span>23,512</span> <!-- 조회수 -->
</div>
      </div>

      <div class="contact-bar">
        <div style="display: flex;">
           <div class="avatar" style="margin-right: 10px;"></div> <!-- 셀러 프로필 -->
           <div class="name"><p>김민식</p></div> <!-- 셀러 이름 -->
        </div>
        <a class="btn-outline" href="#">문의하기</a>
      </div>

      <div class="prime-card">
        <ul class="prime-list">
          <li style="font-size:13px; font-weight: 700"><span class="tick">✔</span> 셀러 경력 : 100년</li>
          <li style="font-size:13px; font-weight: 700"><span class="tick">✔</span> 셀러 서비스 지역 : 서울</li>
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
   		  <br>
   		  <p style="font-weight: 600">작업 방식 : 비대면</p> <!-- ONLINE => 비대면 / OFFLINE => 대면 -->
   		  <br>
          <p style="font-size: 14px">[진행 과정] 취미반: 한국무용 기본을 배운 후 여러 작품을 배울 수 있습니다 우리나라의 전통춤과 그 전통춤의 기본을 기반으로 제가 만들어주는 창작 작품을 재밌게 배워보실 수 있습니다 전공반: 예고입시로 예고때도 한국무용을 전공하고 대학에서도 무용을 전공한 젊은 제가 그 누구보다 입시가 어떻게 흘러가고 있는지 가장 잘 알고 있습니다  전공반은 기본과 개인 작품 수업과 창작,전통 둘 다 필수로 배울 수 있도록 하고있습니다  [진행 과정]  한국무용의 기본 디딤 팔사위 등을 배운 후 국립기본 순서를 배웁니다  [추천 대상] 바른자세를 원하고 움직이고 싶으신 성인분들께 취미로 추천드립니다! 원하시면 취미반도 콩쿨을 나갈 수 있습니다 무대에 올라가 자신의 끼를 모든 사람들에게 보여줄 수 있는 좋은 추억입니다  [고수 정보]  예고,무용과 졸업 수상경력 및 티칭 경력 다수 필라테스 자격증 취득  전공생은 아무래도 제가 입시생들을 가르쳐봤고 원하는 학교에도 보냈었기에 저한테 오시면 책임감 있게 해드리기에 추천 드립니다  [상품정보] 1시간 35000 개인레슨이다 보니 홀비는 별도 이시며 제가 회원님들 계신곳 근처로 가 홀을 잡고 회원님 거주지 근처에서 레슨을 진행해 드리고 있습니다^^  [기타] 풀치마,버선,코슈즈, 입춤 부채 등등</p>
          <br><br>
          <c:forEach begin="0" end="7">
            <img style="width:100%" src="./assets/images/플랫폼개발.webp">
          </c:forEach>
        </div>
		<!-- 셀러 정보 -->
        <div id="tabs-2">
           <div id="tabs-2" style="max-width:700px; margin:auto; font-family:'Noto Sans KR', sans-serif;">
			  <div style="height: 30px;"></div>
			
			  <!-- 셀러 프로필 -->
			  <div style="display: flex; align-items: center; margin-bottom: 20px; background-color:#f9f9ff; border-radius:10px; padding:15px;">
			    <div class="avatar" style="width:60px; height:60px; border-radius:50%; background-color:#e0d8ff; margin-right:15px; overflow:hidden;">
			      <img src="seller-profile.jpg" alt="셀러 프로필" style="width:100%; height:100%; object-fit:cover;">
			    </div>
			    <div>
			      <div class="name" style="font-weight:700; font-size:16px; color:#333;">김민석</div>
			      <div style="font-size:12px; font-weight:600; color:#8e4dff;">사업자 인증 완료</div>
			      <div style="font-size:11px; color:#666;">연락 가능 시간 : 언제나 가능 | 평균 응답 시간 : 1시간 이내</div>
			    </div>
			  </div>
			
			  <!-- 셀러 정보 -->
			  <div style="display:flex; justify-content:space-between; flex-wrap:wrap; gap:10px; background:#fff; border:1px solid #eee; border-radius:10px; padding:20px;">
			    <div class="stat-box" style="flex:1; min-width:200px;">
			      <div class="stat-label" style="font-size:12px; color:#888;">서비스 지역</div>
			      <div class="stat-value" style="font-weight:600;">서울특별시 강남구</div>
			    </div>
			    <div class="stat-box" style="flex:1; min-width:200px;">
			      <div class="stat-label" style="font-size:12px; color:#888;">셀러 경력</div>
			      <div class="stat-value" style="font-weight:600;">3년</div>
			    </div>
			    <div class="stat-box" style="flex:1; min-width:200px;">
			      <div class="stat-label" style="font-size:12px; color:#888;">소속 회사</div>
			      <div class="stat-value" style="font-weight:600;">EUM Studio</div>
			    </div>
			  </div>
			</div>

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
                
                <div class="re-review">
                 <div class="review">
                  <div style="display: flex;">
                    <div class="avatar" style="margin-right: 10px;"></div> <!-- 셀러 프로필 -->
                      <div class="seller-name">김민식</div> <!--  -->
                      <div style="text-align: right; margin-left: auto; font-size: 11px; color:#6b7280;"> <!-- 답글 날짜 -->
                        25.11.03 16:18
                      </div>
                    </div>
                  </div> 	
					<!-- 대댓글 내용 -->
                	<p style="margin:0; color:var(--muted)">좋은 리뷰 감사합니다~!!!</p>
                </div>
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