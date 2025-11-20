<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이음 관리자</title>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Simplebar -->
<link rel="stylesheet" href="css/simplebar.css">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Overpass:wght@100;200;300;400;600;700;800;900&display=swap" rel="stylesheet">

<!-- Icons -->
<link rel="stylesheet" href="css/feather.css">

<!-- Select2 (몇몇 페이지에서 사용) -->
<link rel="stylesheet" href="css/select2.css">

<!-- Date Range Picker -->
<link rel="stylesheet" href="css/daterangepicker.css">

<!-- App Theme -->
<link rel="stylesheet" href="css/app-light.css" id="lightTheme">
<link rel="stylesheet" href="css/app-dark.css" id="darkTheme" disabled>

</head>
<body>

<!-- 공통 헤더 -->
<jsp:include page="header.jsp" />

<!-- 메인 콘텐츠 (각 화면) -->
<jsp:include page="${admin_main_jsp}" />

<!-- 공통 푸터 -->
<jsp:include page="footer.jsp" />

</body>
</html>
