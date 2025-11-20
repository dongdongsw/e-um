<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 페이지</title>
<link rel="stylesheet" href="../css/order_payment.css">
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
<script type="text/javascript">
var o_u_id = "${o_u_id}";
var o_id = "${o_id}";
let sel=0;
var IMP = window.IMP; 
IMP.init("imp65483433"); 
function requestPay() {
    let b_op_id = $(".pay-btn").data("id");
    let price   = $(".pay-btn").data("price");
    
    $.ajax({
        type: "post",
        url: "../pay/orders_insert.eum",
        data: {
            "b_op_id": b_op_id,
            "o_total_price": price,
            "o_u_id": o_u_id
        },
        success: function(o_id){
            	console.log("생성된 o_id:", o_id);

                if(o_id && o_id !== "null") {
                    requestPayment(o_id);
                } else {
                    alert("주문 번호 생성 실패! 다시 시도해주세요.");
                  return;
            }
          },
          error: function(err){
              console.log(err);
          }
    });
}
function requestPayment(o_id){
    IMP.request_pay({
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: "ORD-"+new Date().getTime(),   // 주문번호
        name: "${orders_vo.bovo.b_op_title}",
        amount: ${orders_vo.bovo.b_op_price}         // 숫자 타입
    }, function (rsp) { // callback
    	if (rsp.success) {
    		let b_op_id = $(".pay-btn").data("id");
            let price   = $(".pay-btn").data("price");
            
            let paymentMethod = "";   // 결제 수단 최종 문자열

            if (rsp.pay_method === "card") {
                paymentMethod = rsp.card_name ? rsp.card_name + " (카드)" : "카드 결제";
            }
            else if (rsp.pay_method === "vbank") {
                paymentMethod = rsp.vbank_name ? rsp.vbank_name + " (가상계좌)" : "가상계좌";
            }
            else if (rsp.pay_method === "trans") {
                paymentMethod = rsp.bank_name ? rsp.bank_name + " (계좌이체)" : "계좌이체";
            }
            else if (rsp.pay_method === "kakaopay") {
                paymentMethod = "카카오페이";
            }
            else if (rsp.pay_method === "tosspay") {
                paymentMethod = "토스페이";
            }
            else {
                paymentMethod = rsp.pay_method;  
            }
            $.ajax({
                type: "post",
                url: "../pay/payment_insert.eum",
                data: {
                    "b_op_id": b_op_id,
                    "o_total_price": price,
					"o_id":o_id,
                    "imp_uid": rsp.imp_uid,
                    "merchant_uid": rsp.merchant_uid,
                    "amount":price,
                    "pay_method": rsp.pay_method,
                    "pg_provider": rsp.pg_provider,
                    "receipt_url": rsp.receipt_url,
                    "status": rsp.status,   // "paid" 들어옴
                    "o_method": paymentMethod
                },
                success: function(res){
                    if(res === "OK"){
                    	location.href="../pay/payment_complete.eum?o_id="+o_id+"&price="+price;
                    }
                },
                error: function(err){
                    console.log("AJAX ERROR:", err);
                }
            });

        } else {
            alert("결제가 취소되었습니다!");
            $.ajax({
                type: "post",
                url: "../pay/orders_cancel.eum",
                data: {"o_id": o_id},
                success: function(res){
                    console.log("취소변경 결과:", res);
                }
            });
        }
    });
}
</script>
</head>
<body>
  <div class="header-text" style="height: 0px;"></div>

  <section class="dt-container hero" id="main-section">
   <section class="OrderStepBar">
    <span class="OrderStepBar__step now">
        <span class="OrderStepBar__number now">1</span>
        주문 확인 및 결제
    </span>
    <span class="OrderStepBar__next-arrow">&gt;</span>
    <span class="OrderStepBar__step">
        <span class="OrderStepBar__number">2</span>
        주문 완료
    </span>
  </section>
  
    <!-- head -->
   <!-- 주문단계 -->
        <h2 class="OrderHeader__title">결제하기</h2>
      <div class="section-box">
        <div class="section-title">주문 내역</div>
        
        <div class="order-item">
          <img src="${orders_vo.b_thumbnail}" alt="상품 이미지">
          
          <div class="order-info">
            <h4 class="item-title">${orders_vo.bovo.b_op_title}</h4>
          
          <div class="seller-box">
           <div class="avatar">
            <img src="${orders_vo.usvo.u_s_profileimg_url}"></div> <!-- 셀러 프로필 -->
           <div class="name"><p>${orders_vo.usvo.u_s_com}</p></div> <!-- 셀러 이름 -->
          </div>
          </div>
          

      <div class="order-detail">
          <p>기본항목: ${orders_vo.bovo.b_op_detail}</p>
          <p>가격: <fmt:formatNumber value="${orders_vo.bovo.b_op_price}" pattern="#,###" /> 원</p>
        </div>
      </div>
      </div>
    
    <div class="right-section">
      <div class="summary-row"><span>주문 금액</span><span><fmt:formatNumber value="${orders_vo.bovo.b_op_price}" pattern="#,###" /> 원</span></div>
      <div class="summary-total">
        총 결제 금액 <span style="float:right;"><fmt:formatNumber value="${orders_vo.bovo.b_op_price}" pattern="#,###" /> 원</span>
      </div>
      
      <form id="paymentForm" method="post" action="paymentReady.eum">
        <input type="hidden" name="b_op_id" value="${orders_vo.bovo.b_op_id}">
        
        
        <div class="accordion" id="accordionExample">
     <div class="accordion-item">
       <h2 class="accordion-header">
         <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
           결제 전 안내사항
         </button>
       </h2>
       <div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
         <div class="accordion-body">
           <strong>환불 규정 유의사항 동의</strong><br> · 전문가가 의뢰인의 주문 의뢰 내용에 맞게 용역을 제공하는 맞춤형 상품의 경우, 가분하거나 재판매하기 어려운 성격의 상품입니다. 주문 의뢰 내용에 따라 용역 등의 작업이 진행된 이후에는 「전자상거래법」 제17조 2항에 따라 원칙적으로 청약철회가 제한됩니다. 의뢰인은 서비스 상세페이지에 명시된 취소·환불 규정 또는 전문가와 별도 합의한 내용에 따라 청약철회를 요청할 수 있습니다.
· 디지털 형태로 제작된 콘텐츠를 제공하는 상품의 경우, 콘텐츠 제공이 개시되면 서비스 제공이 완료된 것으로 간주합니다. 콘텐츠 제공이 개시된 이후에는 「전자상거래법」 제17조 2항에 따라 원칙적으로 청약철회가 제한됩니다. 의뢰인은 서비스 상세페이지에 등록된 디지털 콘텐츠의 일부를 미리 확인한 후 서비스를 구매할 수 있습니다.
         </div>
       </div>
     </div>
     <div class="accordion-item">
       <h2 class="accordion-header">
         <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
           개인정보 제3자 제공
         </button>
       </h2>
       <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
         <div class="accordion-body">
           <strong>제공받는 자의 개인정보 이용 목적</strong><br> · 전자상거래 계약 이행 및 서비스 제공, 의뢰인 확인, 고객상담, 상품/서비스의 배송 업무 처리 등
			제공하는 개인정보 항목
			· 의뢰인 닉네임
			제공받는 자의 보유 기간
			· 재화 또는 서비스의 제공 목적 달성 후 파기
			회원은 개인정보의 제3자 제공 동의를 거부할 권리가 있으나,
			이 경우 서비스 이용이 제한될 수 있습니다.
			그 밖의 내용은 서비스 이용약관 및 개인정보처리방침에 따릅니다.
         </div>
       </div>
     </div>
        <div class="accordion-body">
           위 내용을 확인하였고, 결제에 동의하실 경우 결제하기 버튼을 눌러주세요.
         </div>
        <input type=button value="결제하기" onclick="requestPay()" class="pay-btn" 
        data-id="${orders_vo.bovo.b_op_id }" data-price="${orders_vo.bovo.b_op_price}">
      </form>
    </div>
    
    <div style="height: 300px"></div>
  </section>
</body>
</html>
