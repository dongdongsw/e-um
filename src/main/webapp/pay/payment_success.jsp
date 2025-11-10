<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 완료 | e-um</title>

<!-- 폰트 및 아이콘 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<style>
body {
  font-family: 'Noto Sans KR', sans-serif;
  background-color: #ffffff;
  margin: 0;
  padding: 0;
  color: #333;
}

.container {
  max-width: 900px;
  margin: 80px auto;
  text-align: center;
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

.icon-check {
  font-size: 56px;
  color: #4caf50;
  margin-bottom: 20px;
}

h1 {
  font-size: 24px;
  font-weight: 700;
  margin-bottom: 10px;
}

p.desc {
  font-size: 15px;
  color: #555;
  margin-bottom: 40px;
}

.button-group {
  display: flex;
  justify-content: center;
  gap: 12px;
  margin-bottom: 50px;
}

.btn {
  border: 1px solid #ccc;
  border-radius: 6px;
  padding: 10px 24px;
  font-size: 15px;
  font-weight: 500;
  cursor: pointer;
  background: #fff;
}

.btn-primary {
  background-color: #7453fc;
  color: #fff;
  border: none;
}

.btn:hover {
  opacity: 0.9;
}

.summary-box {
  border: 1px solid #eee;
  border-radius: 10px;
  width: 400px;
  margin: 0 auto 50px;
  padding: 16px 24px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 16px;
  font-weight: 500;
  background: #fafafa;
}

.process-box {
  border: 1px solid #eee;
  border-radius: 12px;
  padding: 30px 40px;
  max-width: 750px;
  margin: 0 auto;
  background: #fcfcfc;
}

.process-title {
  font-size: 17px;
  font-weight: 600;
  margin-bottom: 25px;
}

.steps {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  text-align: center;
  margin-bottom: 15px;
}

.step-item {
  flex: 1;
}

.step-item img {
  width: 48px;
  height: 48px;
  margin-bottom: 10px;
}

.step-item p {
  margin: 0;
  font-size: 14px;
  color: #333;
}

.notice {
  font-size: 13px;
  color: #888;
  margin-top: 10px;
  text-align: left;
}
</style>
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
    <div class="icon-check"><i class="bi bi-check-circle-fill"></i></div>
    <h1>결제가 완료됐어요!</h1>
    <p class="desc">
      구매내역에서 주문한 서비스를 확인하실 수 있어요.<br>
      작업 관련 사항은 주문 정보 내 <b>문의하기</b>를 통해 전문가에게 전달해주세요.
    </p>

    <div class="button-group">
      <button class="btn">전문가에게 문의</button>
      <button class="btn btn-primary" onclick="location.href='orderDetail.eum?o_id=${orderId}'">주문 정보 확인</button>
    </div>

    <div class="summary-box">
      <span>총 결제 금액</span>
      <span><b><fmt:formatNumber value="${totalAmount}" pattern="#,###"/>원</b></span>
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
