<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>구매자 리뷰</title>
<link rel="stylesheet" href="../css/seller_review.css">
<style type="text/css">
a {
  color: #7453fc;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
  // 공통 AJAX 함수
  function loadReviews(page) {
    let sort = $("#sortSelect").val();

    $.ajax({
      type: 'post',
      url: '../seller/review_result.eum',
      data: {
        page: page,   
        sort: sort   
      },
      success: function(result) {

        $('.content-list').html(result);
      },
      error: function(err) {
        console.error("리뷰 로딩 실패:", err);
      }
    });
  }

  $(function() {
    const initSort = $("#sortSelect").val();

    loadReviews(1);

    $("#sortSelect").on("change", function () {
      const sort = $(this).val();
      console.log("변경된 sort :", sort);
      loadReviews(1);
    });
  });

  function change(page) {
    loadReviews(page);
  }
  function prev(page) {
    loadReviews(page);
  }
  function next(page) {
    loadReviews(page);
  }
</script>
</head>

<body>
<div class="header-text" style="height: 200px;"></div>

<div class="seller-container">

  <!-- ===================== 왼쪽 메뉴 ===================== -->
  <aside class="sidebar">
    <h2 style="color:black">셀러 페이지</h2>
    <nav class="menu">
      <a href="../seller/info.eum">셀러 정보</a>
      <a href="../seller/create.eum">컨텐츠 작성</a>
      <a href="../seller/my_contents.eum">내 컨텐츠</a>
      <a href="../seller/review.eum" class="active">구매자 리뷰</a>
      <a href="../seller/chat.eum">채팅 문의</a>
      <a href="../seller/sell.eum">판매 내역</a>
    </nav>
  </aside>

  <!-- ===================== 오른쪽 본문 ===================== -->
  <main id="right-contents">
    <div class="content-header">
      <h2>구매자 리뷰</h2>

      <div id="reviewSortForm" class="sort-form">
		  <select id="sortSelect" class="sort-select">
		    <option value="최신순" selected>최신순</option>
		    <option value="오래된순">오래된 순</option>
		    <option value="별점높은순">별점 높은 순</option>
		    <option value="별점낮은순">별점 낮은 순</option>
		  </select>
		</div>
	</div>

    <div class="content-list"></div>
  </main>
</div>

</body>
</html>