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

<style>
body {
  background-color: #fff !important;
  margin: 0;
  padding: 0;
}

.order-container {
  display: grid;
  grid-template-columns: 240px 1fr;
  width: 1180px;
  margin: 60px auto;
  gap: 40px;
}

/* ===== 좌측 메뉴 ===== */
.sidebar {
  border-right: 1px solid #e5e7eb;
  padding-right: 24px;
}

.sidebar h2 {
  font-size: 20px;
  font-weight: 700;
  margin-bottom: 50px;
  color: black;
}

.menu {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.menu a {
  color: #333;
  text-decoration: none;
  font-size: 15px;
  padding: 8px 0;
  border-radius: 6px;
  transition: background 0.2s;
}

.menu a.active {
  font-weight: 600;
  color: #8e4dff;
}

.menu a:hover {
  background: #f9fafb;
}

/* ===== 오른쪽 본문 ===== */
.content {
  background: #fff;
}

.content h2 {
  font-size: 20px;
  font-weight: 700;
  margin-bottom: 30px;
  color: black;
}

/* ===== 주문 정보 카드 ===== */
.order-info {
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  padding: 24px;
  background: #fff;
  margin-bottom: 20px;
}

.order-info .row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 12px;
  font-size: 15px;
}

.order-info .label {
  color: #6b7280;
  font-size: 14px;
}

.order-info .value {
  font-weight: 600;
  color: #111;
}

.btn-cancel {
  margin-top: 12px;
  width: 100%;
  padding: 10px;
  border: 1px solid #e5e7eb;
  border-radius: 8px;
  background: #fff;
  color: #6b7280;
  font-size: 14px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.2s;
}

.btn-cancel:hover {
  background: #f9fafb;
  border-color: #d1d5db;
}

/* ===== 상품 정보 ===== */
.product-box {
  display: flex;
  gap: 20px;
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  padding: 20px;
  background: #fff;
  margin-bottom: 20px;
}

.product-thumbnail {
  width: 120px;
  height: 120px;
  border-radius: 8px;
  overflow: hidden;
  flex-shrink: 0;
  background: #f3f4f6;
}

.product-thumbnail img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.product-info {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.product-title {
  font-size: 16px;
  font-weight: 600;
  color: #111;
  margin-bottom: 8px;
}

.product-seller {
  font-size: 14px;
  color: #6b7280;
  margin-bottom: 12px;
}

.btn-inquiry {
  padding: 6px 14px;
  border: 1px solid #e5e7eb;
  border-radius: 6px;
  background: #fff;
  color: #6b7280;
  font-size: 13px;
  cursor: pointer;
  transition: all 0.2s;
  align-self: flex-start;
}

.btn-inquiry:hover {
  background: #f9fafb;
  border-color: #d1d5db;
}

/* ===== 구매 항목 테이블 ===== */
.purchase-items {
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  overflow: hidden;
  margin-bottom: 20px;
  background: #fff;
}

.purchase-items table {
  width: 100%;
  border-collapse: collapse;
}

.purchase-items th {
  background: #f9fafb;
  color: #6b7280;
  font-weight: 500;
  padding: 12px;
  text-align: center;
  font-size: 14px;
}

.purchase-items td {
  text-align: center;
  padding: 16px 12px;
  border-top: 1px solid #e5e7eb;
  font-size: 14px;
  color: #111;
}

/* ===== 결제 정보 ===== */
.payment-info {
  border: 1px solid #e5e7eb;
  border-radius: 12px;
  background: #fff;
  padding: 24px;
}

.payment-info .row {
  display: flex;
  justify-content: space-between;
  font-size: 15px;
  color: #6b7280;
  margin-bottom: 12px;
}

.payment-info .total {
  display: flex;
  justify-content: space-between;
  font-weight: 700;
  font-size: 17px;
  color: #111;
  border-top: 2px solid #e5e7eb;
  margin-top: 16px;
  padding-top: 16px;
}

/* ===== 모달 ===== */
.modal-overlay {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  backdrop-filter: blur(2px);
  justify-content: center;
  align-items: center;
  z-index: 9999;
}

.modal-container {
  width: 420px;
  background: #fff;
  border-radius: 12px;
  padding: 24px;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
  animation: fadeIn 0.2s ease;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.modal-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.modal-title {
  font-size: 18px;
  font-weight: 700;
  color: #111;
}

.modal-close {
  font-size: 24px;
  border: none;
  background: none;
  cursor: pointer;
  color: #6b7280;
  padding: 0;
  line-height: 1;
}

.modal-close:hover {
  color: #111;
}

.modal-section {
  margin-bottom: 20px;
}

.section-title {
  font-size: 14px;
  font-weight: 600;
  color: #111;
  margin-bottom: 8px;
}

.modal-textarea {
  width: 100%;
  height: 200px;
  border: 1px solid #e5e7eb;
  border-radius: 8px;
  padding: 12px;
  resize: none;
  background: #fff;
  font-size: 14px;
  font-family: inherit;
  color: #111;
}

.modal-textarea:focus {
  outline: none;
  border-color: #8e4dff;
}

.modal-textarea::placeholder {
  color: #9ca3af;
}

.modal-footer {
  display: flex;
  gap: 8px;
  margin-top: 20px;
}

.btn-gray {
  flex: 1;
  padding: 10px;
  border-radius: 8px;
  background: #f3f4f6;
  border: none;
  font-weight: 600;
  cursor: pointer;
  font-size: 14px;
  color: #6b7280;
  transition: all 0.2s;
}

.btn-gray:hover {
  background: #e5e7eb;
}

.btn-purple {
  flex: 1;
  padding: 10px;
  border-radius: 8px;
  background: #8e4dff;
  border: none;
  font-weight: 600;
  cursor: pointer;
  font-size: 14px;
  color: #fff;
  transition: all 0.2s;
}

.btn-purple:hover {
  background: #7c3aed;
}

/* 빈 상태 */
.empty-state {
  text-align: center;
  padding: 100px 20px;
  color: #9ca3af;
}

.empty-state div {
  font-size: 15px;
  margin-bottom: 10px;
}

/* ===== 상단 필터 ===== */
.filter-bar {
  display: flex;
  align-items: center;
  justify-content: flex-start;
  gap: 8px;
  flex-wrap: wrap;
  background: #fff;
  border: 1px solid #e5e7eb;
  border-radius: 10px;
  padding: 12px 16px;
  margin-bottom: 30px;
}

.filter-bar select,
.filter-bar input[type="date"],
.filter-bar input[type="text"] {
  border: 1px solid #e5e7eb;
  border-radius: 6px;
  padding: 7px 10px;
  font-size: 14px;
  color: #111;
  background-color: #fff;
}

.filter-bar select:focus,
.filter-bar input[type="date"]:focus,
.filter-bar input[type="text"]:focus {
  outline: none;
  border-color: #8e4dff;
}

.filter-bar span {
  color: #6b7280;
  font-size: 14px;
}

.filter-bar button[type="submit"] {
  background-color: #8e4dff;
  color: #fff;
  border: none;
  border-radius: 6px;
  padding: 7px 16px;
  font-weight: 600;
  cursor: pointer;
  font-size: 14px;
  transition: all 0.2s;
}

.filter-bar button[type="submit"]:hover {
  background-color: #7c3aed;
}
</style>
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
      <a href="../pay/mypage_payment.eum" class="active">결제 내역</a>
      <a href="../users/info_update.eum">정보 수정</a>
    </nav>
  </aside>

  <!-- 오른쪽 본문 -->
  <main class="content">
    <h2>주문 상세 내역</h2>
    
    <!-- 🔍 상단 필터 영역 -->
    <form class="filter-bar" method="get" action="order_search.eum">
      <select name="product_type">
        <option value="">전체 상품</option>
        <option value="life">생활라이프</option>
        <option value="food">푸드</option>
        <option value="music">음악</option>
      </select>

      <select name="order_status">
        <option value="">전체 상태</option>
        <option value="paid">결제완료</option>
        <option value="working">작업중</option>
        <option value="done">작업완료</option>
        <option value="refund">환불완료</option>
      </select>

      <input type="date" name="start_date">
      <span>~</span>
      <input type="date" name="end_date">

      <input type="text" name="nickname" placeholder="닉네임">
      <button type="submit">조회</button>
    </form>
    
    <c:if test="${!empty pay_vo}">
      <c:forEach var="vo" items="${pay_vo}">
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
    <c:if test="${empty pay_vo}">
      <div class="empty-state">
        <div>주문 내역이 없습니다.</div>
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
</body>
</html>