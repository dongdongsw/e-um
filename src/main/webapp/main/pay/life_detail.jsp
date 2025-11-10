<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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
        <h1 class="title">${detail_vo.b_title}</h1> <!-- 컨텐츠 제목 -->
      </div>

      <div class="meta" aria-label="별점 및 관심">
        <div class="stars" aria-hidden="true">
          <svg class="star" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
          <svg class="star" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
          <svg class="star" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
          <svg class="star" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
          <svg class="star" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
        </div>
        <span class="rating">${score_vo.rvo.b_review_score}</span> <!-- 컨텐츠 평점 -->
        <span class="count">${score_vo.rvo.review_count}</span> <!-- 리뷰 수 -->
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
  <span>${detail_vo.b_view_count}</span> <!-- 조회수 -->
</div>
      </div>

      <div class="contact-bar">
        <div style="display: flex;">
           <div class="avatar" style="margin-right: 10px;">
           <img src="${board_vo.usvo.u_s_profileimg_url}"></div> <!-- 셀러 프로필 -->
           <div class="name"><p>${board_vo.usvo.u_s_com}</p></div> <!-- 셀러 이름 -->
        </div>
        <a class="btn-outline" href="#">문의하기</a>
      </div>

      <div class="prime-card">
        <ul class="prime-list">
          <li style="font-size:13px; font-weight: 700"><span class="tick">✔</span> 셀러 경력 : ${board_vo.usvo.u_s_carrer == 0 ? '없음' : board_vo.usvo.u_s_carrer}년</li>
          <li style="font-size:13px; font-weight: 700"><span class="tick">✔</span> 셀러 서비스 지역 : ${board_vo.usvo.u_s_zone}</li>
        </ul>
      </div>
    </div>

    <div class="hero-right">
       <!--컨텐츠 메인 이미지 -->
        <img src="${detail_vo.b_thumbnail }">
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
   		  <p style="font-weight: 600">작업 방식 : ${detail_vo.b_prod_on_off == 'ONLINE' ? '비대면' : '대면'}</p> <!-- ONLINE => 비대면 / OFFLINE => 대면 -->
   		  <br>
          <p style="font-size: 14px">${detail_vo.b_content}</p>
          <br><br>
          <c:forEach begin="0" end="7">
            <img style="width:100%" src="${board_vo.bivo.b_img_url}">
          </c:forEach>
        </div>
		<!-- 셀러 정보 -->
        <div id="tabs-2">
           <div id="tabs-2" style="max-width:700px; margin:auto; font-family:'Noto Sans KR', sans-serif;">
			  <div style="height: 30px;"></div>
			
			  <!-- 셀러 프로필 -->
			  <div style="display: flex; align-items: center; margin-bottom: 20px; background-color:#f9f9ff; border-radius:10px; padding:15px;">
			    <div class="avatar" style="width:60px; height:60px; border-radius:50%; background-color:#e0d8ff; margin-right:15px; overflow:hidden;">
			      <img src="${board_vo.usvo.u_s_profileimg_url}" alt="셀러 프로필" style="width:100%; height:100%; object-fit:cover;">
			    </div>
			    <div>
			      <div class="name" style="font-weight:700; font-size:16px; color:#333;">${board_vo.usvo.u_s_com}</div>
			      <div style="font-size:12px; font-weight:600; color:#8e4dff;">사업자 인증 완료</div>
			      <div style="font-size:11px; color:#666;">연락 가능 시간 : 언제나 가능 | 평균 응답 시간 : 1시간 이내</div>
			    </div>
			  </div>
			
			  <!-- 셀러 정보 -->
			  <div style="display:flex; justify-content:space-between; flex-wrap:wrap; gap:10px; background:#fff; border:1px solid #eee; border-radius:10px; padding:20px;">
			    <div class="stat-box" style="flex:1; min-width:200px;">
			      <div class="stat-label" style="font-size:12px; color:#888;">서비스 지역</div>
			      <div class="stat-value" style="font-weight:600;">${board_vo.usvo.u_s_zone}</div>
			    </div>
			    <div class="stat-box" style="flex:1; min-width:200px;">
			      <div class="stat-label" style="font-size:12px; color:#888;">셀러 경력</div>
			      <div class="stat-value" style="font-weight:600;">${board_vo.usvo.u_s_carrer == 0 ? '없음' : board_vo.usvo.u_s_carrer}년</div>
			    </div>
			  </div>
			</div>

        </div>
		<!-- 리뷰 -->
        <div id="tabs-3">
          <aside class="side-sticky">
            <c:forEach var="rvo" items="${review_vo}">
              <div class="re-card" id="reviews">
                <div class="review">
                  <div style="display: flex;">
                    <div class="avatar" style="margin-right: 10px;"><img src="${rvo.uvo.u_profileimg_url }"></div> <!-- 리뷰 프로필 -->
                    <div>
                      <div class="stars-sm" aria-hidden="true">
                        <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
                        <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
                        <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
                        <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
                        <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/></svg>
                      </div>
                      <div class="name">${rvo.uvo.u_nickname}</div> <!-- 리뷰 작성자 -->
                    </div>
                    <div style="text-align: right; margin-left: auto; font-size: 11px; color:#6b7280;"> <!-- 리뷰 날짜 -->
                      ${rvo.rvo.b_review_createdat}
                    </div>
                  </div>
                </div>

				<c:if test="${not empty rvo.rivo.r_image_url}">
					<div class="review-img" style="margin-bottom: 10px;">
						<img src="${rvo.rivo.r_image_url}">
					</div>
				</c:if>
				<!-- 리뷰 내용 -->
                <p style="margin-top: 10px; margin-bottom: 0; color:var(--muted)">${rvo.rvo.b_review_content}</p>
                
                <div class="re-review">
                 <div class="review">
                  <div style="display: flex;">
                    <div class="avatar" style="margin-right: 10px;"><img src="${board_vo.usvo.u_s_profileimg_url}"></div> <!-- 셀러 프로필 -->
                      <div class="seller-name">${board_vo.usvo.u_s_com}</div> <!--  -->
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
		  <c:if test="${not empty price_vo}">
		    <span class="current">
		      ${price_vo[0].b_op_title}
		      (<fmt:formatNumber value="${price_vo[0].b_op_price}" pattern="#,###" />원)
		    </span>
		  </c:if>
		
		  <div class="menu">
		    <c:forEach var="price" items="${price_vo}">
		      <input type="radio" name="sortType" id="sort-${price.b_op_id}">
		      <label for="sort-${price.b_op_id}">
		        ${price.b_op_title}
		        (<fmt:formatNumber value="${price.b_op_price}" pattern="#,###" />원)
		      </label>
		    </c:forEach>
		  </div>
		</span>
            <div class="cta">
              <button class="btn-ghost">전문가에게 문의하기</button>
              <a href="../main/orderPayment.eum" class="btn-pri">구매하기</a>
            </div>
          </div>
        </div>
    <div style="height: 100px"></div>
  </section>
</body>
</html>
</html>