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
  border-bottom: 2px solid var(--text);
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
</body>
</html>
