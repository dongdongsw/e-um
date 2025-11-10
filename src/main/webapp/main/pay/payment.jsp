<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let sel=0;
var IMP = window.IMP; 
IMP.init("imp65483433"); 
function requestPay() {
    IMP.request_pay({
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: "ORD20180131-0000011",   // 주문번호
        name: '홍길동',
        amount: 10000,         // 숫자 타입
        buyer_email: 'email',
        buyer_name: 'buyer_name',
        buyer_tel:'1111-1111',
        buyer_addr: '서울',
        buyer_postcode: '000-111'
    }, function (rsp) { // callback
    	
   });
}
</script>
</head>
<body>
  <input type=button value="결제" onclick="requestPay()">
</body>
</html>