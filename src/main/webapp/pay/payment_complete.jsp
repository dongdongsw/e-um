	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
	<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
	<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>주문 완료 페이지</title>
	<link rel="stylesheet" href="../css/payment_complete.css">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<link rel="stylesheet" href="../css/detail.css">
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	</head>
	
	<body>
	    <section class="OrderStepBar">
	    <span class="OrderStepBar__step">
	        <span class="OrderStepBar__number">1</span>
	        주문 확인 및 결제
	    </span>
	    <span class="OrderStepBar__next-arrow">&gt;</span>
	    <span class="OrderStepBar__step now">
	        <span class="OrderStepBar__number now">2</span>
	        주문 완료
	    </span>
	  </section>
	
	  <div class="container">
	    <div class="icon-check" style="text-align: center;"><i class="bi bi-check-circle-fill"></i></div>
	    <h1 style="text-align: center;">결제가 완료됐어요!</h1>
	    <p class="desc" style="text-align: center;">
	      구매내역에서 주문한 서비스를 확인하실 수 있어요.<br>
	      작업 관련 사항은 주문 정보 내 <b>문의하기</b>를 통해 전문가에게 전달해주세요.
	    </p>
	
	    <div class="button-group">
	      <button class="btn">전문가에게 문의</button>
	      <button class="btn btn-primary" onclick="location.href='../users/order_list.eum'">주문 정보 확인</button>
	    </div>
	
	    <div class="summary-box">
	      <span>총 결제 금액</span>
	      <span><b><fmt:formatNumber value="${price}" pattern="#,###"/>원</b></span>
	    </div>
	
	    <div class="process-box">
	      <div class="process-title">주문 후 거래 단계 안내</div>
	      <div class="steps">
	        <div class="step-item">
	          <img src="https://cdn-icons-png.flaticon.com/512/3084/3084398.png" alt="">
	          <p>작업에 필요한<br>정보 제공</p>
	        </div>
	        <div class="step-item">
	          <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="">
	          <p>전문가의<br>작업 진행</p>
	        </div>
	        <div class="step-item">
	          <img src="https://cdn-icons-png.flaticon.com/512/4283/4283446.png" alt="">
	          <p>작업물 확인<br>(수정 요청 가능)</p>
	        </div>
	        <div class="step-item">
	          <img src="https://cdn-icons-png.flaticon.com/512/616/616408.png" alt="">
	          <p>거래 완료</p>
	        </div>
	      </div>
	      <div class="notice">
	        ※ 파란 점 표시는 의뢰인의 확인이 필요한 단계예요.<br>
	        ※ ‘작업에 필요한 정보 제공’ 단계는 구매한 서비스의 성격에 따라 생략될 수 있어요.
	      </div>
	      
	    </div>
	  </div>
	</body>
	</html>
