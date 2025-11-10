<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title></title>
  <link rel="stylesheet" href="../css/notice.css">
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
  <script type="text/javascript">
  $(function() {
      // ✅ 삭제버튼 클릭 시 모달 표시
      $("#delSpan").click(function() {
        $(".modal-overlay").fadeIn(150);
      });

      // ✅ 취소버튼 클릭 시 모달 닫기
      $("#cancelBtn").click(function() {
        $(".modal-overlay").fadeOut(150);
      });

      // ✅ 확인버튼 클릭 시 삭제 요청
      $("#confirmBtn").click(function() {
        const n_id = "${vo.n_id}";
        location.href = "delete_ok.do?n_id=" + n_id;
      });
    });
  </script>
  <style type="text/css">
  /* ✅ 디테일 */
.notice-page .notice-title.detail {
  font-size: 26px;
}
.notice-page .notice-date {
  color: #999;
  font-size: 14px;
  margin-bottom: 30px;
}

.notice-page .notice-content {
  font-size: 16px;
  line-height: 1.8;
  color: #444;
  white-space: pre-line;
}

.notice-page .btn-move {
  text-align: right;
}
  </style>
</head>
<body class="notice-page">
  <div class="header-text" style="height: 150px;  background-color: #fff;"></div>
  <div class="notice-container">
    <h1 class="notice-title">[안내] 11월 정기 점검 일정</h1>
    <div class="notice-date">작성일 : 2025.11.07</div>
    <div class="notice-content">
      안정적인 서비스 제공을 위해 정기 점검이 진행됩니다.
      점검 시간 동안 일시적으로 서비스 이용이 제한될 수 있습니다.

      점검 일시: 11월 10일(월) 00:00 ~ 06:00
      점검 내용: 서버 업그레이드 및 보안 패치
      점검 내용: 서버 업그레이드 및 보안 패치
      점검 내용: 서버 업그레이드 및 보안 패치
      점검 내용: 서버 업그레이드 및 보안 패치
      점검 내용: 서버 업그레이드 및 보안 패치
      점검 내용: 서버 업그레이드 및 보안 패치
      점검 내용: 서버 업그레이드 및 보안 패치
      점검 내용: 서버 업그레이드 및 보안 패치
    </div>
   <div class="btn-move">
	<a href="update.jsp" class="btn-update">수정</a>
	<span id="delSpan" class="btn-delete">삭제</span>
    <a href="javascript:history.back()" class="btn-back">목록</a>
    </div>
  </div>
   <!-- ✅ 삭제 확인 모달창 -->
  <div class="modal-overlay">
    <div class="modal-box">
      <h3>정말 삭제하시겠습니까?</h3>
      <div class="modal-btns">
        <button id="confirmBtn" class="btn-confirm">확인</button>
        <button id="cancelBtn" class="btn-cancel">취소</button>
      </div>
    </div>
  </div>
</body>
</html>