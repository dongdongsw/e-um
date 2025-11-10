<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기 | e-um</title>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

<style>
  body {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #ffffff;
    margin: 0;
    padding: 0;
  }

  .container {
    max-width: 1100px;
    margin: 40px auto;
    padding: 0 20px;
    display: flex;
    gap: 40px;
  }

  .OrderStepBar {
    display: flex;
    margin: 0 0 0 32px;
    font-size: 14px;
    color: #9a9ba7;
    align-items: center;
    justify-content: center;
    border-radius: 8px;
    font-weight: 500;
	}
   .OrderStepBar__number.now {
       background-color: #9a85ed;
       color: #303441;
   }
   .OrderStepBar__number {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 8px;
    width: 24px;
    height: 24px;
    border-radius: 12px;
    text-align: center;
    background-color: #f2f3f7;
    color: #c8cad2;
   }
   .OrderStepBar__next-arrow {
       display: inline-block;
       margin: 0 20px;
       color: #c8cad2;
   }
   .OrderStepBar__step.now {
    color: #303441;
   }
   .OrderStepBar__step {
       display: flex;
       align-items: center;
       font-weight: 500;
   }

  .left-section {
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 10px;
  }

  .section-box {
    background: #fff;
    border: 1px solid #e4e5ed;
    padding: 25px 30px;
  }

  .section-title {
    font-size: 15px;
    font-weight: bold;
    line-height: 1.5438;
    margin: 0 0 16px 0;
    color: #303441;
  }

  .order-item {
    display: flex;
    align-items: flex-start;
    gap: 15px;
  }

  .order-item img {
    width: 90px;
    height: 90px;
    border-radius: 8px;
    object-fit: cover;
  }

  .order-info h4 {
    font-size: 16px;
    font-weight: 500;
    margin: 0 0 5px;
  }

  .order-info p {
    font-size: 14px;
    color: #666;
    margin: 0;
  }

  .order-detail {
    border-top: 1px solid #eee;
    margin-top: 15px;
    padding-top: 10px;
    font-size: 14px;
    color: #555;
  }

  .right-section {
    width: 330px;
    background: #fff;
    border-radius: 10px;
    padding: 25px 30px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.06);
    height: fit-content;
  }

  .summary-row {
    display: flex;
    justify-content: space-between;
    font-size: 15px;
    margin-bottom: 10px;
  }

  .summary-total {
    border-top: 1px solid #eee;
    padding-top: 15px;
    margin-top: 15px;
    font-size: 17px;
    font-weight: 700;
  }

  .pay-btn {
    width: 100%;
    background: #7453fc;
    color: #fff;
    font-weight: 600;
    border: none;
    border-radius: 8px;
    padding: 14px 0;
    font-size: 16px;
    margin-top: 20px;
    cursor: pointer;
    transition: background 0.3s;
  }

  .pay-btn:hover {
    opacity: 0.9;
  }
  #orderDiv {
    margin-bottom: 100px;
  }
  .OrderHeader__title {
    font-weight: 500;
    margin-bottom: 6px;
    color: #212224;
    line-height: 36px;
    font-size: 24px;
}

</style>
</head>

<body>
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

  <div class="container">
    <div class="left-section">
    <!-- head -->
   <!-- 주문단계 -->
   <div class="OrderHeader layout__container">
        <h2 class="OrderHeader__title">결제하기</h2>
    </div>
      <div class="section-box">
        <div class="section-title">주문 내역</div>
        <div class="order-item">
          <img src="${order.thumbnail}" alt="상품 이미지">
          <div class="order-info">
            <h4>${order.title}</h4>
            <p>${order.sellerName}</p>
          </div>
        </div>

        <div class="order-detail">
          <p>기본항목: ${option_vo.board_option_detail}</p>
          <p>가격: <fmt:formatNumber value="${order.price}" pattern="#,###" /> 원</p>
        </div>
      </div>
    </div>

    <div class="right-section">
      <div class="summary-row"><span>주문 금액</span><span><fmt:formatNumber value="${order.price}" pattern="#,###" /> 원</span></div>
      <div class="summary-row"><span>수수료</span><span><fmt:formatNumber value="${order.fee}" pattern="#,###" /> 원</span></div>
      <div class="summary-total">
        총 결제 금액 <span style="float:right;"><fmt:formatNumber value="${order.total}" pattern="#,###" /> 원</span>
      </div>
      <form id="paymentForm" method="post" action="paymentReady.eum">
        <input type="hidden" name="o_id" value="${order.id}">
        <input type="hidden" name="amount" value="${order.total}">
        <input type="hidden" name="item_name" value="${order.title}">
        <button type="submit" class="pay-btn">결제하기</button>
      </form>
    </div>
  </div>
</body>
</html>
