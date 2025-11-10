<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>공지사항</title>
  <link rel="stylesheet" href="../css/notice.css">
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
  <style type="text/css">
   .notice-page {
  font-family: 'Pretendard', 'Noto Sans KR', sans-serif;
  background-color: #fff;
  margin: 0;
  padding: 0;
}

/* ✅ 컨테이너 */
 .notice-page .notice-container {
  width: 900px;
  margin: 80px auto 60px auto;
  background: #fff;
  border-radius: 10px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.05);
  padding: 40px;
}

/* ✅ 타이틀 */
 .notice-page .notice-title {
  font-weight: 700;
  color: #7453fc;
  border-bottom: 3px solid #7453fc;
  padding-bottom: 15px;
  margin-bottom: 30px;
}

/* ✅ 버튼 공통 */
 .notice-page .btn,
 .notice-page .btn-write,
 .notice-page .btn-back,
 .notice-page .btn-update,
 .notice-page .btn-delete {
  background: #7453fc;
  color: white;
  border: none;
  padding: 10px 18px;
  border-radius: 6px;
  font-size: 15px;
  cursor: pointer;
  transition: 0.2s;
  text-decoration: none;
  display: inline-block;
}

 .notice-page .btn:hover,
 .notice-page .btn-write:hover,
 .notice-page .btn-back:hover,
 .notice-page .btn-update:hover {
  background: #5334d0;
}

 .notice-page .btn-cancel {
  background: #bbb;
}

 .notice-page .btn-cancel:hover {
  background: #999;
}

/* ✅ 리스트 */
 .notice-page .notice-title.list {
  font-size: 28px;
  margin-bottom: 40px;
}

 .notice-page table {
  width: 100%;
  border-collapse: collapse;
  font-size: 15px;
}

 .notice-page th,
 .notice-page td {
  border-bottom: 1px solid #ddd;
  padding: 14px 10px;
  text-align: left;
}

 .notice-page th {
  background-color: #f4f0ff;
  color: #5334d0;
}

 .notice-page tr:hover {
  background-color: #f8f5ff;
  cursor: pointer;
}

 .notice-page .btn-write {
  float: right;
  margin-top: -15px;
  margin-bottom: 10px;
  padding: 8px 15px;
}

/* ✅ 작성, 수정 */
 .notice-page .notice-title.insert,
 .notice-page .notice-title.update {
  font-size: 26px;
}

 .notice-page form {
  display: flex;
  flex-direction: column;
}

 .notice-page label {
  font-weight: 600;
  margin-top: 15px;
  margin-bottom: 8px;
  color: #5334d0;
  font-size: 15px;
}

 .notice-page input[type="text"],
 .notice-page textarea {
  font-size: 15px;
  padding: 12px;
  border: 1px solid #ddd;
  border-radius: 6px;
  outline: none;
  transition: 0.2s;
}

 .notice-page input[type="text"]:focus,
 .notice-page textarea:focus {
  border-color: #7453fc;
  box-shadow: 0 0 0 3px rgba(116, 83, 252, 0.1);
}

 .notice-page textarea {
  height: 250px;
  resize: vertical;
  line-height: 1.6;
}

 .notice-page .btn-wrap {
  margin-top: 30px;
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}
.notice-page .pagination {
  margin-top: 30px;
  display: flex;
  justify-content: center; /* ✅ 가운데 정렬 핵심 */
  gap: 8px;                /* ✅ 숫자 간 간격 */
  font-size: 15px;
}
  </style>
</head>

<body class="notice-page">
 <div class="header-text" style="height: 150px;  background-color: #fff;"></div>
  <%-- <c:choose>
    <c:when test="${not empty sessionScope.user}">
      <li><a href="mypage.do">${sessionScope.user.u_name} 님</a></li>
      <li><a href="logout.do">로그아웃</a></li>
    </c:when>
  </c:choose> --%>
 

      
  <!-- ========== 공지사항 리스트 영역 ========== -->
  <div class="notice-container">
    <h1 class="notice-title">공지사항</h1>
    <a href="insert.jsp" class="btn-write">글쓰기</a>

    <table>
      <thead>
        <tr>
          <th style="width:60px;">번호</th>
          <th>제목</th>
          <th style="width:150px;">작성일</th>
        </tr>
      </thead>
      <tbody>
        <!-- DB에서 불러온 list 출력 -->
        <c:forEach var="vo" items="${list}">
          <tr onclick="location.href='../notice/detail.eum?n_id=${vo.n_id}'">
            <td>${vo.n_id}</td>
            <td>
              ${vo.n_title}
              <!-- 오늘 날짜면 NEW 표시 -->
              <c:if test="${vo.n_createdAt == today}">
                <sup style="color:red; font-weight:bold;">NEW</sup>
              </c:if>
            </td>
            <td>
              <fmt:formatDate value="${vo.n_createdAt}" pattern="yyyy.MM.dd" />
            </td>
          </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- 페이지네이션 -->
    <div class="pagination" style="margin-top:20px; text-align:center;">
  <%-- ◀◀ 이전 10페이지 이동 --%>
  <c:if test="${startPage > 1}">
    <a href="list.eum?page=${startPage - 10}">&laquo;</a>
  </c:if>

  <%-- ◀ 이전 1페이지 이동 --%>
  <c:if test="${curpage > 1}">
    <a href="list.eum?page=${curpage - 1}">&lt;</a>
  </c:if>

  <%-- 페이지 번호 목록 출력 (현재 그룹 범위) --%>
  <c:forEach var="i" begin="${startPage}" end="${endPage}">
    <c:choose>
      <c:when test="${i == curpage}">
        <strong style="color:#7453fc;">${i}</strong>
      </c:when>
      <c:otherwise>
        <a href="list.eum?page=${i}">${i}</a>
      </c:otherwise>
    </c:choose>
  </c:forEach>

  <%-- ▶ 다음 1페이지 이동 --%>
  <c:if test="${curpage < totalpage}">
    <a href="list.eum?page=${curpage + 1}">&gt;</a>
  </c:if>

  <%-- ▶▶ 다음 10페이지 이동 --%>
  <c:if test="${endPage < totalpage}">
    <a href="list.eum?page=${startPage + 10}">&raquo;</a>
  </c:if>
</div>

  </div>

 


</body>
</html>