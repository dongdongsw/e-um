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
	  function openModal() {
      document.getElementById("cancelModal").style.display = "flex";
  }

  function closeModal() {
      document.getElementById("cancelModal").style.display = "none";
  }

  function submitCancel() {
      const reason = document.getElementById("selectedReason").value;
      const msg = document.getElementById("cancelMsg").value;

      if (msg.trim() === "") {
          alert("메시지를 입력해주세요.");
          return;
      }

      $.post("refundInsert.eum", {
    	  imp_uid:"${orders_vo.pvo.imp_uid}",
    	  pay_id:"${pay_id}",
    	  o_u_id:"${o_u_id}",
    	  rf_reason: rf_reason,
    	  rf_amount: "${orders_vo.ovo.o_total_price}"
      }, function(res){    
          alert("거래 취소 요청이 완료되었습니다!");
          closeModal();
      });
  }
</script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<style>
:root {
  --border:#e5e7eb;
  --text:#111827;
  --muted:#6b7280;
  --accent:#2563eb;
  --bg:#fafafa;
  --highlight:#ffe600; /* 버튼색 */
}

#main-section.hero {
       display: block !important;
       grid-template-columns: none !important;
   }
/* ===== 상단 필터 ===== */
.filter-bar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 8px;
  flex-wrap: wrap;
  background: #fff;
  border: 1px solid var(--border);
  border-radius: 10px;
  padding: 12px 16px;
  margin-bottom: 30px;
  box-shadow: 0 1px 4px rgba(0,0,0,0.03);
}

.filter-bar select, .filter-bar input[type="date"], .filter-bar input[type="text"] {
  border: 1px solid var(--border);
  border-radius: 6px;
  padding: 6px 10px;
  font-size: 14px;
  color: var(--text);
  background-color: #fff;
}

.filter-bar button {
  background-color: #9a85ed;
  border: none;
  border-radius: 6px;
  padding: 7px 16px;
  font-weight: 600;
  cursor: pointer;
  font-size: 14px;
}

.filter-bar button:hover {
  opacity: 0.9;
}

/* ===== 페이지 제목 ===== */
.page-title {
  font-size: 22px;
  font-weight: 700;
  margin-bottom: 25px;
  padding-bottom: 8px;
}

/* ===== 주문 정보 ===== */
.order-info {
  border: 1px solid var(--border);
  border-radius: 12px;
  padding: 20px;
  background: var(--bg);
  margin-bottom: 25px;
}

.order-info .row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 8px;
}

.order-info .label {
  color: var(--muted);
  font-size: 14px;
}

.order-info .value {
  font-weight: 600;
  font-size: 15px;
}

/* ===== 상품 정보 ===== */
.product-box {
  display: flex;
  align-items: center;
  border: 1px solid var(--border);
  border-radius: 12px;
  padding: 15px;
  gap: 16px;
  margin-bottom: 20px;
}

.product-box img {
  width: 120px;
  height: 80px;
  border-radius: 8px;
  object-fit: cover;
}

.product-text h4 {
  margin: 0 0 5px;
  font-size: 16px;
  font-weight: 600;
}

.product-text p {
  font-size: 13px;
  color: var(--muted);
  margin: 0;
}

.product-text .inquiry {
  margin-top: 6px;
  display: inline-block;
  font-size: 13px;
  color: var(--accent);
  text-decoration: underline;
  cursor: pointer;
}

/* ===== 구매 항목 ===== */
.purchase-items {
  border: 1px solid var(--border);
  border-radius: 12px;
  overflow: hidden;
  margin-bottom: 25px;
}

.purchase-items table {
  width: 100%;
  border-collapse: collapse;
  font-size: 14px;
}

.purchase-items th {
  background: #f9fafb;
  color: var(--muted);
  font-weight: 500;
  padding: 10px 0;
}

.purchase-items td {
  text-align: center;
  padding: 10px 0;
  border-top: 1px solid var(--border);
}

/* ===== 결제 정보 ===== */
.payment-info {
  border: 1px solid var(--border);
  border-radius: 12px;
  background: var(--bg);
  padding: 20px;
}

.payment-info .row {
  display: flex;
  justify-content: space-between;
  font-size: 15px;
  margin-bottom: 8px;
}

.payment-info .total {
  font-weight: 700;
  font-size: 17px;
  border-top: 1px solid var(--border);
  margin-top: 12px;
  padding-top: 12px;
}
.modal-overlay {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.45);
    backdrop-filter: blur(2px);
    justify-content: center;
    align-items: center;
    z-index: 9999;
}

/* 모달 박스 */
.modal-container {
    width: 420px;
    background: #fff;
    border-radius: 14px;
    padding: 18px 22px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.15);
    animation: fadeIn 0.2s ease;
    display: flex;
    flex-direction: column;
}

/* 모달 헤더 */
.modal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 14px;
}

.modal-title {
    font-size: 20px;
    font-weight: 700;
    color: #222;
}

.modal-close {
    font-size: 24px;
    border: none;
    background: none;
    cursor: pointer;
    color: #555;
}

/* Step UI */
.step-box {
    background: #f6f7fb;
    border-radius: 12px;
    padding: 10px 12px;
    display: flex;
    justify-content: space-between;
    margin-bottom: 14px;
}

.step-item {
    text-align: center;
    color: #c4c4c4;
}

.step-circle {
    width: 22px;
    height: 22px;
    border-radius: 50%;
    background: #e5e6ef;
    color: #a8a8b9;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 5px;
    font-size: 12px;
    margin-bottom: 3px;
}

.step-item.active .step-circle {
    background: #9a85ed;
    color: #333;
}

.step-item.active .step-text {
    color: #333;
}

/* Section */
.modal-section {
    margin-bottom: 8px !important;
    padding-bottom: 0 !important;
}

.section-title {
    font-weight: 600;
    margin-bottom: 8px;
    color: #333;
}

.modal-textarea {
    width: 100%;
    height: 250px;
    border: 1px solid #e0e0e0;
    border-radius: 10px;
    padding: 12px;
    resize: none;
    background: #ffffff;
    font-size: 14px;
}

/* Notice */
.notice-box {
    font-size: 13px;
    background: #fff7e6;
    border: 1px solid #ffe8c2;
    padding: 8px 10px;
    border-radius: 10px;
    margin-bottom: 16px;
}

.required {
    color: red;
}

/* Footer buttons */
.modal-footer {
    display: flex !important;
    flex-direction: row !important;
    justify-content: space-between;
    align-items: center;
    gap: 12px;
    margin-top: 0 !important;
    padding-top: 0 !important;
}

.btn-gray {
    width: 48%;
    padding: 8px;
    border-radius: 10px;
    background: #efefef;
    border: none;
    font-weight: 600;
    cursor: pointer;
    font-size: 13px;
}

.btn-yellow {
    width: 48%;
    padding: 8px;
    border-radius: 10px;
    background: #9a85ed;
    border: none;
    font-weight: 700;
    cursor: pointer;
    font-size: 13px;
    color: #fff;
}
.btn-gray, .btn-yellow {
    width: 50% !important;
}
.btn-yellow:hover {
    opacity: 0.9;
}
.modal-footer button {
    width: 50% !important;
    display: inline-flex !important;
    justify-content: center;
    flex: 1 1 auto !important;
}
.modal-container hr {
    display: none !important;
}
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(10px); }
    to   { opacity: 1; transform: translateY(0); }
}
</style>
</head>

<body>
<div class="container">

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

  <!-- 제목 -->
  <div class="page-title">주문 상세 내역</div>

  <!-- 주문 정보 -->
  <div class="order-info">
    <div class="row">
      <div class="label">주문번호</div>
      <div class="value">#${orders_vo.bovo.b_op_id}</div>
    </div>
    <div class="row">
      <div class="label">주문일시</div>
      <div class="value"><fmt:formatDate value="${orders_vo.ovo.o_createdat}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
    </div>
    <button onclick="openModal()" class="btn btn-light-sm" style="padding:4px 10px; font-size:12px;">취소 하기</button>
  </div>

  <!-- 상품 정보 -->
  <div class="product-box">
    <img src="${orders_vo.b_thumbnail}" alt="상품 이미지">
    <div class="product-text">
      <h4 style="color:black;">${orders_vo.bovo.b_op_title}</h4>
      <p>${orders_vo.usvo.u_s_com}</p>
      <button type="button" class="btn btn-light-sm" style="padding:4px 10px; font-size:12px;">문의하기</button>
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
          <td>${orders_vo.bovo.b_op_detail}</td>
          <td><fmt:formatNumber value="${orders_vo.ovo.o_total_price}" pattern="#,###원"/></td>
        </tr>
      </tbody>
    </table>
  </div>

  <!-- 결제 정보 -->
  <div class="payment-info">
    <div class="row">
      <span>상품 금액</span>
      <span><fmt:formatNumber value="${orders_vo.ovo.o_total_price}" pattern="#,###원"/></span>
    </div>
    <div class="total">
      총 결제 금액 
      <span style="float:right"><fmt:formatNumber value="${orders_vo.ovo.o_total_price}" pattern="#,###원"/></span>
    </div>
  </div>

</div>
<div id="cancelModal" class="modal-overlay">
  <div class="modal-container">
    
    <div class="modal-header">
      <span class="modal-title">거래 취소 요청</span>
      <button class="modal-close" onclick="closeModal()">✕</button>
    </div>

    <!-- 메시지 -->
    <div class="modal-section">
      <div class="section-title">취소 요청 사유</div>
      <textarea id="cancelMsg" class="modal-textarea" placeholder="메시지를 입력해주세요"></textarea>
    </div>

    <!-- 버튼들 -->
    <div class="modal-footer">
      <button class="btn-gray" onclick="closeModal()">이전</button>
      <button class="btn-yellow" onclick="submitCancel()">요청</button>
    </div>

  </div>
</div>
</body>
</html>
