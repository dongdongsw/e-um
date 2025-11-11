<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="../css/detail.css">
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
<style type="text/css">
  .profile {
     width: 100%; 
     height: 100%; 
     border-radius: 50%;
  }
  
  /* 리뷰 작성 폼 */
.form-box{border:none; background:#f9f9f9; border-radius:12px; padding:16px;}
.review-write{margin:10px 0 18px 0;}

.rw-row{display:flex; gap:12px; margin-top:10px;}
.rw-row:first-of-type{margin-top:0;}
.rw-label{width:72px; font-weight:700; font-size:13px; color:var(--text); line-height:36px;}
.rw-field{flex:1; min-width:0;}
.rw-head{ border-bottom:1px solid var(--line); padding-bottom:8px;
display: flex;
  align-items: center;
  gap: 10px;}
.rw-helper{font-size:12px; color:var(--muted);}

.rw-rate{display:flex; gap:6px; align-items:center;}
.rw-star{font-size:22px; cursor:pointer; user-select:none; color:#d1d5db; line-height:1;}
.rw-star.on{color:var(--accent);}

/* textarea */
#rw-content{width:100%; min-height:120px; padding:10px; border:1px solid var(--line); border-radius:10px; font-size:14px; resize:vertical;}

/* 썸네일 프리뷰 */
.rw-thumbs{display:flex; gap:8px; flex-wrap:wrap; margin-top:10px;}
.rw-thumb{width:76px; height:76px; border:1px dashed var(--line); border-radius:10px; background:#f3f4f6; overflow:hidden; display:flex; align-items:center; justify-content:center;}
.rw-thumb img{width:100%; height:100%; object-fit:cover; display:block;}

/* 하단 액션 (컨텐츠 페이지 버튼 톤과 맞춤) */
.rw-actions{display:flex; justify-content:flex-end; gap:8px; margin-top:12px;}
.btn-ghost{border:1px solid var(--line); background:var(--card); padding:10px 14px; border-radius:10px; font-weight:700;}
.btn-pri{background:#7453fc; color:#fff; padding:10px 14px; border-radius:10px; font-weight:900; border:1px solid #00000020; width: 30px;}
.btn-pri:hover{background:#7453fcde;}
 .rw-actions{
  display:flex;
  justify-content:flex-end;  /* 오른쪽 붙이기 */
  gap:8px;
  margin-top:12px;
}

/* 기본 프라이머리 버튼 (이미 있으면 유지) */
.reBtn{
  background:#7453fc;
  color:#fff;
  padding:10px 14px;
  border-radius:10px;
  font-weight:900;
  border:1px solid #00000020;
  height: 40px;
}
.reBtn:hover{ background:#7453fcde; }

/* 더 작은 사이즈 변형 */
.btn-pri--sm{
  padding:8px 12px;         /* 작게 */
  font-size:13px;           /* 글자도 살짝 작게 */
  border-radius:8px;        /* 카드 톤에 맞춰 둥글기 축소 */
}
.re-reply {
  margin: 10px 0 0 10px;
  padding: 15px;
  background-color: #f5f5f5;
  border-radius: 15px;
}

.re-reply-head {
  display: flex;
  align-items: center;
  gap: 10px;
  border-bottom: 1px solid var(--line);
  padding-bottom:8px;
}

.re-reply .avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background:#e5e7eb;
  overflow: hidden;
}

.re-reply .seller-name {
  font-weight: 800;
}

.re-reply .reply-date {
  margin-left: auto;
  font-size: 11px;
  color: #6b7280;
}

.re-reply-body {
  margin-top: 10px;
}

/* 내용 입력영역: 디자인만 (원하면 textarea로 교체 가능) */
.re-reply-input {
  width: 100%;
  min-height: 80px;
  padding: 10px 12px;
  background: #fff;
  border: 1px solid #e5e7eb;
  border-radius: 10px;
  font-size: 14px;
  color: #111;
  line-height: 1.5;
  outline: none;
}

.re-reply-input::placeholder {
  color: #9ca3af;
}

/* 하단 액션: 오른쪽 작은 버튼 */
.re-reply-actions {
  display: flex;
  justify-content: flex-end;
  margin-top: 10px;
}
/* 답변 카드 하단 우측 액션 */
.re-review { position: relative; }  /* 필요 시 하단 고정용 */
.re-review-footer{
  display:flex;
  justify-content:flex-end;
  align-items:center;
  gap:5px;
  margin-top:5px;                /* 본문과 살짝 간격 */
}

.re-review-btn{
  font-size:9px;
  color:#6b7280;                 /* 날짜와 비슷한 색 */
  background:transparent;
  border:0;
  padding:2px 4px;
  border-radius:6px;
  cursor:pointer;
}
.re-review-btn:hover{
  background:#eeeeee;            /* 살짝만 강조 */
  color:#111;
}
.re-review-dot{ color:#d1d5db; } /* 가운데 점 구분자 */
/* 리뷰 카드 하단 우측 액션 */
.review-footer{
  display:flex;
  justify-content:flex-end;
  align-items:center;
  gap:5px;
  margin-top:8px;          /* 본문과 살짝 띄움 */
  padding-right:6px;        /* 오른쪽 여백 약간 */
}

.review-btn{
  font-size:11px;
  color:#6b7280;            /* 날짜와 동일 톤 */
  background:transparent;
  border:0;
  padding:2px 4px;
  border-radius:6px;
  cursor:pointer;
}
.review-btn:hover{
  background:#f3f4f6;       /* 부드럽게 하이라이트 */
  color:#111;
}
.review-dot{ color:#d1d5db; } /* 중간 구분 점 */

</style>
</head>
<body>
  <div class="header-text" style="height: 200px;"></div>
	    
  <section class="dt-container hero" id="main-section">
    <div class="hero-left">
      <div class="title-row" style="display: inline-block;">
      <div>
         <button class="prime-badge">즐겨찾기</button>
      </div>
      <div style="display: flex; align-items: center; height: 100px;">
	  <h1 class="title" 
	      style="margin: 0; line-height: 1; font-size: 28px;">
	    ${vo.b_title}
	  </h1>
	</div>
         
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
        <span class="count">(${empty vo.r_count ? 0 : vo.r_count})</span> <!-- 리뷰 수 -->
		<div class="like-button">
		  <svg class="heart" viewBox="0 0 24 24" aria-hidden="true">
		    <path d="M12 21s-6.7-4.3-9.4-7.1C.7 11.9.4 8.9 2.3 7 4 5.3 6.8 5.6 8.6 7.3L12 10.6l3.4-3.3c1.8-1.7 4.6-2 6.3-.3 1.9 1.9 1.6 4.9-.3 6.8C18.7 16.7 12 21 12 21z"></path>
		  </svg>
		  <span class="like-count">${empty vo.r_count ? 0 : vo.r_count}</span> <!-- 좋아요 수 -->
		</div>

        <div class="quick">
  <svg class="view" viewBox="0 0 24 24" aria-hidden="true">
    <path d="M12 5C7 5 2.7 8.1 1 12c1.7 3.9 6 7 11 7s9.3-3.1 11-7c-1.7-3.9-6-7-11-7zm0 11a4 4 0 1 1 0-8 4 4 0 0 1 0 8z" fill="#6b7280"/>
  </svg>
  <span>${vo.b_view_count }</span> <!-- 조회수 -->
</div>
      </div>

      <div class="contact-bar">
        <div style="display: flex; ">
           <div class="avatar" style="margin-right: 10px; overflow: hidden;"><img src="${vo.u_s_profileimg_url }" class="profile"></div> <!-- 셀러 프로필 -->
           <div class="name"><p>${vo.u_s_com }</p></div> <!-- 셀러 이름 -->
        </div>
        <a class="btn-outline" href="#">문의하기</a>
      </div>

      <div class="prime-card">
        <ul class="prime-list">
          <li style="font-size:13px; font-weight: 700"><span class="tick">✔</span> 셀러 경력 : ${vo.u_s_carrer } 년</li>
          <li style="font-size:13px; font-weight: 700"><span class="tick">✔</span> 셀러 서비스 지역 : ${vo.u_s_zone }</li>
        </ul>
      </div>
    </div>

    <div class="hero-right">
      <div class="banner"> <!--컨텐츠 메인 이미지 -->
        <img src="${vo.b_thumbnail }" style="width: 100%; height: 100%; border-radius: 16px">
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
   		  <p style="font-weight: 600">작업 방식 : ${vo.b_prod_on_off eq "ONLINE" ? "대면" : "비대면"}</p> <!-- ONLINE => 비대면 / OFFLINE => 대면 -->
   		  <br>
          <p style="font-size: 14px">${vo.b_content }</p>
          <br><br>
          <c:forEach var="img" items="${list}">
            <img style="width:100%" src="${img}">
          </c:forEach>
        </div>
		<!-- 셀러 정보 -->
        <div id="tabs-2">
           <div id="tabs-2" style="max-width:700px; margin:auto; font-family:'Noto Sans KR', sans-serif;">
			  <div style="height: 30px;"></div>
			
			  <!-- 셀러 프로필 -->
			  <div style="display: flex; align-items: center; margin-bottom: 20px; background-color:#f9f9ff; border-radius:10px; padding:15px;">
			    <div class="avatar" style="width:60px; height:60px; border-radius:50%; background-color:#e0d8ff; margin-right:15px; overflow:hidden;">
			      <img src="${vo.u_s_profileimg_url }" alt="셀러 프로필" style="width:100%; height:100%; object-fit:cover;">
			    </div>
			    <div>
			      <div class="name" style="font-weight:700; font-size:16px; color:#333;">${vo.u_s_com }</div>
			      <div style="font-size:12px; font-weight:600; color:#8e4dff;">사업자 인증 완료</div>
			      <div style="font-size:11px; color:#666;">연락 가능 시간 : 언제나 가능 | 평균 응답 시간 : 1시간 이내</div>
			    </div>
			  </div>
			
			  <!-- 셀러 정보 -->
			  <div style="display:flex; justify-content:space-between; flex-wrap:wrap; gap:10px; background:#fff; border:1px solid #eee; border-radius:10px; padding:20px;">
			    <div class="stat-box" style="flex:1; min-width:200px;">
			      <div class="stat-label" style="font-size:12px; color:#888;">서비스 지역</div>
			      <div class="stat-value" style="font-weight:600;">${vo.u_s_zone }</div>
			    </div>
			    <div class="stat-box" style="flex:1; min-width:200px;">
			      <div class="stat-label" style="font-size:12px; color:#888;">셀러 경력</div>
			      <div class="stat-value" style="font-weight:600;">${vo.u_s_carrer }년</div>
			    </div>
			  </div>
			</div>

        </div>
		<!-- 리뷰 -->
        <div id="tabs-3">
          <aside class="side-sticky">
           <!-- 리뷰 작성 폼 -->
			<div class="review-write form-box">
			  <form action="../review/write_ok.eum" method="post" enctype="multipart/form-data">
			    <input type="hidden" name="b_id" value="${vo.b_id}">
			    <input type="hidden" name="score" id="rw-score" value="5">
			
			    <!-- 헤더 -->
			    <div class="rw-row rw-head">
				    <div class="avatar"></div>
				    <div class="seller-name">작성자명</div>
			    </div>
			
			    <!-- 별점 -->
			    <div class="rw-row">
			      <label class="rw-label">별점</label>
			      <div class="rw-rate" id="rw-rate">
			        <span class="rw-star on" data-score="1">★</span>
			        <span class="rw-star on" data-score="2">★</span>
			        <span class="rw-star on" data-score="3">★</span>
			        <span class="rw-star on" data-score="4">★</span>
			        <span class="rw-star on" data-score="5">★</span>
			      </div>
			    </div>
			
			    <!-- 내용 -->
			    <div class="rw-row">
			      <label class="rw-label">내용</label>
			      <div class="rw-field">
			        <textarea name="content" id="rw-content" maxlength="1000"></textarea>
			
			      </div>
			    </div>
			
			    <!-- 이미지 -->
			    <div class="rw-row">
			      <label class="rw-label">이미지</label>
			      <div class="rw-field">
			        <input type="file" id="rw-images" name="images" accept="image/*" multiple>
			        <div class="rw-thumbs" id="rw-thumbs">
			          <!-- 미리보기 썸네일이 여기에 렌더링됨 -->
			        </div>
			        <div class="rw-sub"><span class="rw-helper">최대 5장 (JPG/PNG 권장)</span></div>
			      </div>
			    </div>
			
			    <!-- 제출 -->
			    <div class="rw-actions">
				  <button type="submit" class=reBtn>등록</button>
				</div>
			  </form>
			</div>
			<hr>
            <div style="height: 50px;"></div>
            <c:forEach var="rev" items="${rList }">
              <div class="re-card" id="reviews">
               <div style="height: 15px;"></div>
                <div class="review">
                  <div style="display: flex;">
                    <div class="avatar" style="margin-right: 10px;"><img src="${rev.u_profileimg_url }" style="border-radius: 50px"></div> <!-- 리뷰 프로필 -->
                    <div>
                      <div class="stars-sm" aria-hidden="true">
					  <c:forEach var="i" begin="1" end="5">
					    <c:choose>
					      <%-- 꽉 찬 별 --%>
					      <c:when test="${i <= rev.b_review_score}">
					        <svg class="star-sm" viewBox="0 0 20 20" style="fill:#facc15">
					          <path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/>
					        </svg>
					      </c:when>
					
					      <%-- 반 별 --%>
					      <c:when test="${i - 0.5 <= rev.b_review_score}">
					        <svg class="star-sm" viewBox="0 0 20 20">
					          <defs>
					            <!-- 리뷰ID + 인덱스로 유니크 ID 생성 -->
					            <linearGradient id="half${rev.b_review_id}${i}">
					              <stop offset="50%" stop-color="#facc15"/>
					              <stop offset="50%" stop-color="#e5e7eb"/>
					            </linearGradient>
					          </defs>
					          <path fill="url(#half${rev.b_review_id}${i})"
					                d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/>
					        </svg>
					      </c:when>
					
					      <%-- 빈 별 --%>
					      <c:otherwise>
					        <svg class="star-sm" viewBox="0 0 20 20" style="fill:#e5e7eb">
					          <path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z"/>
					        </svg>
					      </c:otherwise>
					    </c:choose>
					  </c:forEach>
					</div>


                      <div class="name">${rev.u_nickname }</div> <!-- 리뷰 작성자 -->
                    </div>
                    <div style="text-align: right; margin-left: auto; font-size: 11px; color:#6b7280;"> <!-- 리뷰 날짜 -->
						<fmt:formatDate value="${rev.b_review_createdat}" pattern="yyyy.MM.dd HH:mm"/>
                    </div>
                  </div>
                </div>
				<div style="height: 10px;"></div>
                 <c:if test="${not empty rev.imgList and rev.imgList[0] ne null}">
				  <div class="review-images" style="margin-left: 20px;">
				    <c:forEach var="img" items="${rev.imgList}" varStatus="st">
				      <c:if test="${st.index < 5}">
				        <img class="review-img" src="${img}" alt="리뷰 이미지 ${st.index + 1}">
				      </c:if>
				    </c:forEach>
				  </div>
				</c:if>
				
				<div style="height: 15px;"></div>
				<!-- 리뷰 내용 -->
				
                <p style="margin:0; color:var(--muted)">${rev.b_review_content }</p>
                <div class="review-footer">
						  <button type="button" class="review-btn">수정</button>
						  <button type="button" class="review-btn">삭제</button>
						  <button type="button" class="review-btn">답변</button>
						</div>
                 <div class="re-review">
                 <div class="review">
                  <div style="display: flex;">
                    <div class="avatar" style="margin-right: 10px;"></div> 
                      <div class="seller-name">김민식</div> 
                      <div style="text-align: right; margin-left: auto; font-size: 11px; color:#6b7280;"> 
                        25.11.03 16:18
                      </div>
                    </div>
                  </div> 	
					
                	<p style="margin:0; color:var(--muted)">좋은 리뷰 감사합니다~!!!</p>

					<div class="re-review-footer">
					  <button type="button" class="re-review-btn">수정</button>
					  <button type="button" class="re-review-btn">삭제</button>
					</div>
                </div> 
                <div style="height: 15px;"></div>
              </div>
              <div class="re-reply">
				  <div class="re-reply-head">
				    <div class="avatar"></div>
				    <div class="seller-name">셀러명</div>
				  </div>
				
				  <div class="re-reply-body">
				    <!-- 디자인만 필요하면 contenteditable, 아니면 textarea로 교체 가능 -->
				    <textarea class="re-reply-input" placeholder="구매자에게 답변을 남겨주세요">

				    </textarea>
				  </div>
				
				  <div class="re-reply-actions">
				    <button type="button" class="reBtn" style="margin-top:5px">등록</button>
				  </div>
				</div>
            </c:forEach>
          </aside>
        </div>
      </div>
    </div>
	<!-- 가격 옵션 -->
	<div class="hero-right" id="sticky">
	  <div class="plans">
	    <span class="dropdown-el" id="sortDropdown">
	      <span class="current">
	        ${oList[0].b_op_title} (<fmt:formatNumber value="${oList[0].b_op_price}" type="number"/>원)
	      </span>
	      <div class="menu">
	       <c:forEach var="op" items="${oList}">
	        <input type="radio" name="sortType" value="Relevance" id="sort-relevance">
	        <label for="sort-relevance">${op.b_op_title } (<fmt:formatNumber value="${op.b_op_price}" type="number" />원)</label>
	       </c:forEach>
	      </div>
	    </span>
	    
	    <div class="price-desc">
	     <h5 style="color: black; font-weight: bold">가격 정보</h5><br><br>
	      <c:forEach var="op" items="${oList }">
	      <p>${op.b_op_title } : ${op.b_op_detail }</p><br>
	      </c:forEach>
	    </div>
	
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