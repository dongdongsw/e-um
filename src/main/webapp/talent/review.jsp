<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

  		  <aside class="side-sticky">
	
		    <!----------------------------- 리뷰 작성 폼 start ----------------------------------->
		    <c:if test="${sessionScope.id!=null }">
		      <div class="review-write form-box">
		        <form id="reviewIn">
		          <input type="hidden" id="b_id" name="b_id" value="${detail_vo.b_id}">
		          <input type="hidden" id="u_s_id" name="u_s_id" value="${detail_vo.u_s_id }">
		          
		
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
		              <textarea name="content" id="content" maxlength="1000"></textarea>
		            </div>
		          </div>
		
		          <!-- 이미지 -->
		          <div class="rw-row">
		            <label class="rw-label">이미지</label>
		            <div class="rw-field">
		              <input type="file" id="rw-images" name="images" accept="image/*" multiple>
		              <div class="rw-thumbs" id="rw-thumbs"></div>
		              <div class="rw-sub">
		                <span class="rw-helper">최대 5장 (JPG/PNG 권장)</span>
		              </div>
		            </div>
		          </div>
		
		          <!-- 제출 -->
		          <div class="rw-actions">
		            <button class="reBtn" id="reBtn">등록</button>
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
		          <div class="review">
		            <div style="display: flex;">
		              <!-- 리뷰 프로필 -->
		              <div class="avatar" style="margin-right: 10px;">
		                 <img src="${empty rvo.uvo.u_profileimg_url ? '../images/profile.jpg' : rvo.uvo.u_profileimg_url}">
		              </div>
		
		              <div>
		                <div class="stars-sm" aria-hidden="true">
		                  <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z" /></svg>
		                  <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z" /></svg>
		                  <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z" /></svg>
		                  <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z" /></svg>
		                  <svg class="star-sm" viewBox="0 0 20 20"><path d="M10 1.5l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5L10 16l-5.8 3.4 1.1-6.5L.6 8.3l6.5-.9L10 1.5z" /></svg>
		                </div>
		                <div class="name">${rvo.uvo.u_nickname}</div>
		              </div>
		
		              <!-- 리뷰 날짜 -->
		              <div style="text-align: right; margin-left: auto; font-size: 11px; color:#6b7280;">
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
		          <p style="margin:7px 0 0 10px; color:var(--muted)">${rvo.rvo.b_review_content}</p>
		
		          <div class="review-footer">
		            <c:if test="${sessionScope.id eq rvo.uvo.u_id }">
		              <button type="button" class="review-btn">수정</button>
		              <button type="button" class="review-btn">삭제</button>
		            </c:if>
		            <c:if test="${(sessionScope.sid eq detail_vo.u_s_id) and (rvo.rvo.reply eq 0)}">
		              <button type="button" class="review-btn ansBtn" data-uid="${rvo.rvo.b_review_id}">답변</button>
		            </c:if>
		          </div>
		          <!-- ---------------------- 답글 작성 start -------------------------------->
				 <form id="replyIn">
		          <div class="re-reply" id="re${rvo.rvo.b_review_id}">
		          
		            <div class="re-reply-head">
		              <div class="avatar">
		                <img src="${empty board_vo.usvo.u_s_profileimg_url ? '../images/profile.jpg' : board_vo.usvo.u_s_profileimg_url}">
		              </div>
		              <div class="seller-name" style="margin-bottom:8px">${board_vo.usvo.u_s_com}</div>
		            </div>
		
		            <div class="re-reply-body">
		              <textarea class="re-reply-input" id="recontent" name=content style="margin-top:8px"></textarea>
		            </div>
		
		            <div class="re-reply-actions">
		              <button class="reBtn" id="repBtn">등록</button>
		            </div>
		          </div>
		          <input type="hidden" id="rb_id" name="b_id" value="${detail_vo.b_id}">
		          <input type="hidden" id="ru_s_id" name="u_s_id" value="${detail_vo.u_s_id }">
		          <input type="hidden" id="group_id" name="group_id" value="${rvo.rvo.b_review_id}">
		          </form>
		          <!--------------------------- 답글 작성 end ----------------------------->
		
		        </div> 
		      </c:if>
		      <c:if test="${rvo.rvo.depth == 2 }">
		        <div class="re-review">
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
		              <button type="button" class="re-review-btn">수정</button>
		              <button type="button" class="re-review-btn">삭제</button>
		            </c:if>
		          </div>
		        </div>
		      </c:if>
		
		      <c:set var="groupId" value="${rvo.rvo.group_id}" />
		    </c:forEach>
		    <!---------------------------- 리뷰 목록 end ---------------------------->
		
		  </aside>
