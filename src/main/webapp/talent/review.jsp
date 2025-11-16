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
<link rel="stylesheet" href="../css/detail.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	// 리뷰 별점 클릭
	  $('.rw-star').click(function(){
	    let score = $(this).data('score');      
	    $('.rw-star').css('color', '#ccc');

	    $('#score').val(score);
	    
	    for(let i = 1; i <= score; i++) {
	      $('.rw-star[data-score="'+i+'"]').css('color', '#facc15');
	    }
	  });
	 
	  $('.re-reply').hide()
	   $('.rep-up').hide()
	   $('.re-up').hide()
	    let u=0
	    $('.ansBtn').click(function(){
			let data=$(this).attr("data-rep")
			if(u==0) {
				$('#re'+data).show()
				$(this).text("취소")
				u=1
			} else {
				$('#re'+data).hide()
				$(this).text("답변")
				u=0
			}
	    })
	    
	    $('.upBtn').click(function () {
	    	  let id = $(this).data('up');   // b_review_id

	    	  // 읽기 모드 숨기고 수정 폼 보여주기
	    	  $('#re-up' + id).show();
	    	  $('#re-read' + id).hide();

	    	  // hidden input에 저장된 기존 점수
	    	  let score = parseInt($('#upscore-' + id).val(), 10) || 0;

	    	  // 먼저 다 회색으로
	    	  for (let i = 1; i <= 5; i++) {
	    	    $('#up-star-' + id + '-' + i).css('color', '#ccc');
	    	  }
	    	  // score 만큼 노란색으로
	    	  for (let i = 1; i <= score; i++) {
	    	    $('#up-star-' + id + '-' + i).css('color', '#facc15');
	    	  }
	    	});
	  $(document).on('click', '.up-star', function(){
		    let id      = $(this).data('reviewid');  
		    let upscore = $(this).data('upscore');   

		    for (let i = 1; i <= 5; i++) {
		      $('#up-star-' + id + '-' + i).css('color', '#ccc');
		    }

		    for (let i = 1; i <= upscore; i++) {
		      $('#up-star-' + id + '-' + i).css('color', '#facc15');
		    }
		    $('#upscore-' + id).val(upscore);
		  });


	    $('.reCanBtn').click(function() {

	        let data = $(this).attr("data-up"); 

	        $('#re-up' + data).hide();
	        $('#re-read' + data).show();
	      });
	  
	  $('.repUpBtn').click(function(){
			let data=$(this).attr("data-up")
			
				$('#rep-up'+data).show()
				$('#rep-read'+data).hide()
				
	    })
	    $('.repCanBtn').click(function() {

	        let data = $(this).attr("data-up"); 

	        $('#rep-up' + data).hide();
	        $('#rep-read' + data).show();
	      });
	  

		 
	});
	
	
		</script>
		</head>
		<body>
		<aside class="side-sticky">
			
		    <!----------------------------- 리뷰 작성 폼 start ----------------------------------->
		    <c:if test="${sessionScope.id!=null }">
		      <div class="review-write form-box">
		        <form action="../review/insert_ok.eum" method="post">
		          <input type="hidden" name="b_id" value="${detail_vo.b_id}">
		          <input type="hidden" name="u_s_id" value="${detail_vo.u_s_id }">
		          
		
		          <!-- 헤더 -->
		          <div class="rw-row rw-head">
		            <div class="avatar">
		              <img src="${empty sessionScope.profile ? '../images/profile.jpg' : sessionScope.profile}">
		            </div>
		            <div class="seller-name">${sessionScope.name }</div>
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
		              <input type="hidden" name="score" id="score" value="5">
		            </div>
		          </div>
		
		          <!-- 내용 -->
		          <div class="rw-row">
		            <label class="rw-label">내용</label>
		            <div class="rw-field">
		              <textarea name="content" id="rw-content" maxlength="1000"></textarea>
		            </div>
		          </div>
		
		          <!-- 제출 -->
		          <div class="rw-actions">
		            <button type="submit" class="reBtn">등록</button>
		          </div>
		        </form>
		      </div>
		      <hr>
		    </c:if>
		    <!------------------------------- 리뷰 작성 폼 end ------------------------------->
		
		    <div style="height: 20px;"></div>
		
		    <!--------------------------- 리뷰 목록 start -------------------------------->
		    <c:set var="groupId" value="" />
		
		    <c:forEach var="rvo" items="${review_vo}" varStatus="st">
		      <c:if test="${not st.first and groupId != rvo.rvo.group_id}">
		        <hr style="background-color: gray; margin:8px;">
		      </c:if>
		      <c:if test="${rvo.rvo.depth == 1}">
		        <div style="height: 10px;"></div>
		        <div class="re-card">
		         <div id="re-read${rvo.rvo.b_review_id}">
		          <div class="review">
		            <div style="display: flex;">
		              <!-- 리뷰 프로필 -->
		              <div class="avatar" style="margin-right: 10px;">
		                 <img src="${empty rvo.uvo.u_profileimg_url ? '../images/profile.jpg' : rvo.uvo.u_profileimg_url}">
		              </div>
						<div>
						  <div class="stars-sm" aria-hidden="true">
						    <c:forEach var="i" begin="1" end="5">
						      <c:choose>
						        <%-- 점수 이하인 별은 노란색 (4.5면 1~4는 노랑, 5는 회색) --%>
						        <c:when test="${i <= rvo.rvo.b_review_score}">
						          <svg class="star-sm" viewBox="0 0 20 20" style="fill:#facc15">
						            <path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z" />
						          </svg>
						        </c:when>
						
						        <%-- 점수보다 큰 별은 회색 --%>
						        <c:otherwise>
						          <svg class="star-sm" viewBox="0 0 20 20" style="fill:#e5e7eb">
						            <path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z" />
						          </svg>
						        </c:otherwise>
						      </c:choose>
						    </c:forEach>
						  </div>
						
						  <div class="name">${rvo.uvo.u_nickname}</div>
						</div>
		              <!-- 리뷰 날짜 -->
		              <div style="text-align: right; margin-left: auto; font-size: 11px; color:#6b7280;">
		                ${rvo.rvo.b_review_createdat}
		              </div>
		            </div>
		          </div>
		
					<div style="height: 10px;"></div>
					
					<c:if test="${not empty rvo.rvo.imgList and rvo.rvo.imgList[0] ne null}">
					  <div class="review-images" style="margin-left: 20px;">
					    <c:forEach var="img" items="${rvo.rvo.imgList}" varStatus="st">
					      <c:if test="${st.index < 5}">
					        <img class="review-img" src="${img}" alt="리뷰 이미지 ${st.index + 1}">
					      </c:if>
					    </c:forEach>
					  </div>
					</c:if>
					
					<div style="height: 15px;"></div>
		
		          <!-- 리뷰 내용 -->
		          <p style="margin:7px 0 0 10px; color:var(--muted)">${rvo.rvo.b_review_content}</p>
		          <div class="review-footer">
		            <c:if test="${sessionScope.id eq rvo.uvo.u_id }">
		              <button type="button" class="review-btn upBtn" data-up="${rvo.rvo.b_review_id}">수정</button>
		              <button type="button" class="review-btn delBtn" data-del="${rvo.rvo.b_review_id}">삭제</button>
		            </c:if>
		            <c:if test="${(sessionScope.sid eq detail_vo.u_s_id) and (rvo.rvo.reply eq 0)}">
		              <button type="button" class="review-btn ansBtn" data-rep="${rvo.rvo.b_review_id}">답변</button>
		            </c:if>
		          </div>
		         </div>
		        <!------------------------ 리뷰 수정 start -------------------------------->  
		        <div class="review-write form-box re-up" id="re-up${rvo.rvo.b_review_id}">
		        <div>
		          <input type="hidden" name="b_id" value="${detail_vo.b_id}">
		          <input type="hidden" name="u_s_id" value="${detail_vo.u_s_id }">
		          
		
		          <!-- 헤더 -->
		          <div class="rw-row rw-head">
		            <div class="avatar">
		              <img src="${empty sessionScope.profile ? '../images/profile.jpg' : sessionScope.profile}">
		            </div>
		            <div class="seller-name">${sessionScope.name }</div>
		          </div>
		
		          <!-- 별점 -->
		          <div class="rw-row">
		            <label class="rw-label">별점</label>
		            <div class="rw-rate" id="rw-rate">
					<span class="up-star"
				          id="up-star-${rvo.rvo.b_review_id}-1"
				          data-reviewid="${rvo.rvo.b_review_id}"
				          data-upscore="1">★</span>
				    <span class="up-star"
				          id="up-star-${rvo.rvo.b_review_id}-2"
				          data-reviewid="${rvo.rvo.b_review_id}"
				          data-upscore="2">★</span>
				    <span class="up-star"
				          id="up-star-${rvo.rvo.b_review_id}-3"
				          data-reviewid="${rvo.rvo.b_review_id}"
				          data-upscore="3">★</span>
				    <span class="up-star"
				          id="up-star-${rvo.rvo.b_review_id}-4"
				          data-reviewid="${rvo.rvo.b_review_id}"
				          data-upscore="4">★</span>
				    <span class="up-star"
				          id="up-star-${rvo.rvo.b_review_id}-5"
				          data-reviewid="${rvo.rvo.b_review_id}"
				          data-upscore="5">★</span>
				
				    <input type="hidden"
				           name="upscore"
				           id="upscore-${rvo.rvo.b_review_id}"
				           value="${rvo.rvo.b_review_score}">
				  </div>
		            </div>
		          </div>
		
		          <!-- 내용 -->
		          <div class="rw-row">
		            <label class="rw-label">내용</label>
		            <div class="rw-field">
		              <textarea name="content" id="rw-content" maxlength="1000">${rvo.rvo.b_review_content}</textarea>
		            </div>
		          </div>
		
		          <!-- 제출 -->
		          <div class="rw-actions">
		            <button type="button" class="reCanBtn" data-up="${rvo.rvo.b_review_id}" style="width: 55px; height: 40px; background: black; color: white; border-radius: 10px;
		            		font-weight: bold">취소</button>
		           <button type="button" class="reUpBtn" style="width: 55px; height: 40px; background: #7453fc; color: white; border-radius: 10px; border:1px solid #00000020;
		            		font-weight: bold">수정</button>
		          </div>
		        </div>
		      </div>
					<!------------------------ 리뷰 수정 end -------------------------------->  
							
				<!-- ---------------------- 답글 작성 start -------------------------------->
				 <form method="post" action="../reply/insert_ok.eum">
		          <div class="re-reply" id="re${rvo.rvo.b_review_id}" style="padding:10px 20px 10px 20px; margin: 0 10px 0 25px; background-color: #f5f5f5; border-radius: 15px">
		          
		            <div class="re-reply-head">
		              <div class="avatar">
		                <img src="${empty board_vo.usvo.u_s_profileimg_url ? '../images/profile.jpg' : board_vo.usvo.u_s_profileimg_url}">
		              </div>
		              <div class="seller-name" style="margin-bottom:8px">${board_vo.usvo.u_s_com}</div>
		            </div>
		
		            <div class="re-reply-body">
		              <textarea class="re-reply-input" name=content style="margin-top:8px"></textarea>
		            </div>
		
		            <div class="re-reply-actions">
		              <button type="submit" class="reBtn">등록</button>
		            </div>
		          </div>
		          <input type="hidden" name="b_id" value="${detail_vo.b_id}">
		          <input type="hidden" name="u_s_id" value="${detail_vo.u_s_id }">
		          <input type="hidden" name="group_id" value="${rvo.rvo.b_review_id}">
		          </form>
		          <!--------------------------- 답글 작성 end ----------------------------->
							
		        </div> 
		      </c:if>
		      <!--------------------------- 답글 목록 start ----------------------------->
		      <c:if test="${rvo.rvo.depth == 2 }">
		        <div class="re-review" id="rep-read${rvo.rvo.b_review_id}">
		          <div class="review">
		            <div style="display: flex; border-bottom: 1px solid var(--line); padding-bottom:8px; margin-bottom: 8px;">
		              <div class="avatar" style="margin-right: 10px;">
		                <img src="${board_vo.usvo.u_s_profileimg_url}">
		              </div>
		              <div class="seller-name">${board_vo.usvo.u_s_com}</div>
		              <div style="text-align: right; margin-left: auto; font-size: 11px; color:#6b7280;">
		                ${rvo.rvo.b_review_createdat}
		              </div>
		            </div>
		          </div>
		
		          <p style="margin:5px 0 0 10px; color:var(--muted)">${rvo.rvo.b_review_content}</p>
		
		          <div class="re-review-footer">
		            <c:if test="${sessionScope.sid eq detail_vo.u_s_id}">
		              <button type="button" class="re-review-btn repUpBtn" data-up="${rvo.rvo.b_review_id}">수정</button>
		              <button type="button" class="re-review-btn repDelBtn">삭제</button>
		            </c:if>
		          </div>
		        </div>
		      </c:if>
		      <!-- ---------------------- 답글 수정 start -------------------------------->
				 <div>
		          <div class="re-reply rep-up" id="rep-up${rvo.rvo.b_review_id}" style="padding:10px 20px 10px 20px; margin: 0 10px 0 25px; background-color: #f5f5f5; border-radius: 15px">
		          
		            <div class="re-reply-head">
		              <div class="avatar">
		                <img src="${empty board_vo.usvo.u_s_profileimg_url ? '../images/profile.jpg' : board_vo.usvo.u_s_profileimg_url}">
		              </div>
		              <div class="seller-name" style="margin-bottom:8px">${board_vo.usvo.u_s_com}</div>
		            </div>
		
		            <div class="re-reply-body">
		              <textarea class="re-reply-input" id="reupcon" name=reupcon style="margin-top:8px">${rvo.rvo.b_review_content}</textarea>
		            </div>
		
		            <div class="re-reply-actions">
		             <button type="button" class="repCanBtn" data-up="${rvo.rvo.b_review_id}" style="width: 55px; height: 40px; background: black; color: white; border-radius: 10px;
		            		font-weight: bold; margin:2px;">취소</button>
		              <button type="button" class="repUpBtn" style="width: 55px; height: 40px; background: #7453fc; color: white; border-radius: 10px; border:1px solid #00000020;
		            		font-weight: bold; margin:2px;">수정</button>
		            </div>
		          </div>
		          <input type="hidden" name="b_id" value="${detail_vo.b_id}">
		          <input type="hidden" name="u_s_id" value="${detail_vo.u_s_id }">
		          <input type="hidden" name="group_id" value="${rvo.rvo.b_review_id}">
		          </div>
		           <!--------------------------- 답글 수정 end ----------------------------->
		      <c:set var="groupId" value="${rvo.rvo.group_id}" />
		    </c:forEach>

		    
		  </aside>
</body>
</html>