<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 내역</title>
<link rel="stylesheet" href="../css/find.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
  $(function () {
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
<div class="header-text" style="height: 200px; background-color: #fff;"></div>
<div class="order-container">
  <!-- 좌측 메뉴 -->
  <aside class="sidebar">
    <h2>마이 페이지</h2>
    <nav class="menu">
      <a href="../users/info.eum">회원 정보</a>
      <a href="../users/review_list.eum">작성한 리뷰</a>
      <a href="../users/favorite_list.eum">즐겨찾기한 컨텐츠</a>
      <a href="../users/order_list.eum" class="active">결제 내역</a>
      <a href="../users/info_update.eum">정보 수정</a>
    </nav>
  </aside>

  <!-- 오른쪽 본문 -->
  <main class="content">
    <h2>결제 내역</h2>
    
    <!-- 🔍 상단 필터 영역 -->
    <form class="filter-bar" method="get" action="../users/order_find.eum">
      <select name="column">
        <option value="all">전체 상품</option>
        <option value="b_op_title">타이틀 명</option>
        <option value="u_s_com">셀러명</option>
      </select>
      
      <input type="text" name="find" placeholder="검색어를 입력해주세요.">
      <button type="submit">조회</button>
    </form>
    
    <c:if test="${!empty pay_vo1}">
      <c:forEach var="vo" items="${pay_vo1}">
        <!-- 주문 정보 -->
        <div class="order-info">
          <div class="row">
            <div class="label">주문번호</div>
            <div class="value">${vo.bopvo.b_op_id}</div>
          </div>
          <div class="row">
            <div class="label">주문일시</div>
            <div class="value"><fmt:formatDate value="${vo.o_createdat}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
          </div>
          <button 
            type="button"
            class="cancelBtn btn-cancel"
            data-pay="${vo.pvo.pay_id}"
            data-ouid="${vo.pvo.o_u_id}"
            data-amount="${vo.pvo.amount}"
            data-imp="${vo.pvo.imp_uid}">
            취소 하기
          </button>
        </div>

        <!-- 상품 정보 -->
        <div class="product-box">
          <div class="product-thumbnail">
            <img src="${vo.bvo.b_thumbnail}" alt="상품 이미지">
          </div>
          <div class="product-info">
            <div>
              <div class="product-title">${vo.bopvo.b_op_title}</div>
              <div class="product-seller">${vo.bvo.usvo.u_s_com}</div>
            </div>
            <button type="button" class="btn-inquiry">문의하기</button>
          </div>
        </div>

        <!-- 구매 항목 -->
        <div class="purchase-items">
          <table>
            <thead>
              <tr>
                <th>항목명</th>
                <th>금액</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>${vo.bopvo.b_op_detail}</td>
                <td><fmt:formatNumber value="${vo.pvo.amount}" pattern="#,###"/>원</td>
              </tr>
            </tbody>
          </table>
        </div>

        <!-- 결제 정보 -->
        <div class="payment-info">
          <div class="row">
            <span>상품 금액</span>
            <span><fmt:formatNumber value="${vo.pvo.amount}" pattern="#,###"/>원</span>
          </div>
          <div class="total">
            <span>총 결제 금액</span>
            <span><fmt:formatNumber value="${vo.pvo.amount}" pattern="#,###"/>원</span>
          </div>
        </div>
      </c:forEach>
    </c:if>
    
    <!-- 빈 상태 (주문이 없을 때) -->
    <c:if test="${empty pay_vo1}">
      <div class="empty-state">
        <div>검색 결과가 없습니다.</div>
      </div>
    </c:if>
  </main>
</div>

<!-- 모달 -->
<div id="cancelModal" class="modal-overlay">
  <div class="modal-container">
    <div class="modal-header">
      <span class="modal-title">거래 취소 요청</span>
      <button class="modal-close" onclick="closeModal()">✕</button>
    </div>

    <!-- 메시지 -->
    <div class="modal-section">
      <div class="section-title">취소 요청 사유</div>
      <textarea id="cancelMsg" class="modal-textarea" placeholder="취소 사유를 입력해주세요"></textarea>
    </div>
	
    <!-- 버튼들 -->
    <div class="modal-footer">
      <button class="btn-gray" onclick="closeModal()">이전</button>
      <button class="btn-purple" onclick="submitCancel()">요청</button>
    </div>
    
	<input type="hidden" id="modal_pay_id">
	<input type="hidden" id="modal_o_u_id">
	<input type="hidden" id="modal_amount">
	<input type="hidden" id="modal_imp_uid">
  </div>
</div>

<div class="header-text" style="height: 120px; background-color: #fff;"></div>

<script type="text/javascript">
function openModal() {
    document.getElementById("cancelModal").style.display = "flex";
}

function closeModal() {
    document.getElementById("cancelModal").style.display = "none";
}

$(document).on("click", ".cancelBtn", function() {
    $("#modal_pay_id").val($(this).data("pay"));
    $("#modal_o_u_id").val($(this).data("ouid"));
    $("#modal_amount").val($(this).data("amount"));
    $("#modal_imp_uid").val($(this).data("imp"));

    openModal();
});

function submitCancel() {
    const msg = document.getElementById("cancelMsg").value;

    if (msg.trim() === "") {
        alert("메시지를 입력해주세요.");
        return;
    }

    $.post("../pay/refund_insert.eum", {
        pay_id: $("#modal_pay_id").val(),
        o_u_id: $("#modal_o_u_id").val(),
        rf_reason: msg,
        rf_amount: $("#modal_amount").val()
    }, function(res) {
        alert("거래 취소 요청이 완료되었습니다! 관리자 승인 후 환불이 완료됩니다.");
        closeModal();
        location.reload();
    });
}
</script>
