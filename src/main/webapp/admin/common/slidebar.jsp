<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body class="vertical light">
    <div class="wrapper">

      <!-- 상단 헤더 -->
      <nav class="topnav navbar navbar-light">
        <button type="button" class="navbar-toggler text-muted mt-2 p-0 mr-3 collapseSidebar">
          <i class="fe fe-menu navbar-toggler-icon"></i>
        </button>

        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link text-muted my-2" href="#" id="modeSwitcher" data-mode="light">
              <i class="fe fe-sun fe-16"></i>
            </a>
          </li>

          <li class="nav-item nav-notif">
            <a class="nav-link text-muted my-2" href="#" data-toggle="modal" data-target=".modal-notif">
              <span class="fe fe-bell fe-16"></span>
              <span class="dot dot-md bg-success"></span>
            </a>
          </li>
        </ul>
      </nav>


      <!-- 왼쪽 슬라이드바 -->
      <aside class="sidebar-left border-right bg-white shadow" id="leftSidebar" data-simplebar>
        <a href="#" class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3">
          <i class="fe fe-x"></i>
        </a>

        <nav class="vertnav navbar navbar-light">

          <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="../main/main.eum">
            <img src="../images/logo.svg" class="navbar-brand-img brand-sm" style="width:80px; height:auto;" />
          </a>

          <ul class="navbar-nav flex-fill w-100 mb-2 mt-3">
            <li class="nav-item w-100">
              <a class="nav-link" href="../admin/admin_main.eum">
                <i class="fe fe-home fe-16"></i>
                <span class="ml-3 item-text">DASHBOARD</span>
              </a>
            </li>
          </ul>

          <p class="text-muted nav-heading mt-4 mb-1"><span>Management</span></p>

          <ul class="navbar-nav flex-fill w-100 mb-2">

            <li class="nav-item w-100">
              <a class="nav-link" href="../admin/admin_users_list.eum">
                <i class="fe fe-users fe-16"></i>
                <span class="ml-3 item-text">USERS</span>
              </a>
            </li>

            <li class="nav-item w-100">
              <a class="nav-link" href="../admin/admin_sellers_list.eum">
                <i class="fe fe-briefcase fe-16"></i>
                <span class="ml-3 item-text">SELLERS</span>
              </a>
            </li>

            <li class="nav-item w-100">
              <a class="nav-link" href="../admin/admin_contents_list.eum">
                <i class="fe fe-shopping-bag fe-16"></i>
                <span class="ml-3 item-text">CONTENTS</span>
              </a>
            </li>

            <li class="nav-item w-100">
              <a class="nav-link" href="../admin/admin_review_list.eum">
                <i class="fe fe-edit fe-16"></i>
                <span class="ml-3 item-text">REVIEW</span>
              </a>
            </li>

            <li class="nav-item w-100">
              <a class="nav-link" href="../admin/admin_orders_list.eum">
                <i class="fe fe-clipboard fe-16"></i>
                <span class="ml-3 item-text">ORDERS</span>
              </a>
            </li>

          </ul>

          <p class="text-muted nav-heading mt-4 mb-1"><span>Operations</span></p>

          <ul class="navbar-nav flex-fill w-100 mb-2">

            <li class="nav-item w-100">
              <a class="nav-link" href="../admin/admin_notice_list.eum">
                <i class="fe fe-book fe-16"></i>
                <span class="ml-3 item-text">공지사항</span>
              </a>
            </li>

            <li class="nav-item w-100">
              <a class="nav-link" href="../admin/admin_chat.eum">
                <i class="fe fe-message-square fe-16"></i>
                <span class="ml-3 item-text">채팅</span>
              </a>
            </li>

          </ul>

        </nav>
      </aside>

    </div> <!-- wrapper 끝 -->

    <!-- 필수 스크립트만 유지 -->
     <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/moment.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/simplebar.min.js"></script>
    <script src='js/daterangepicker.js'></script>
    <script src='js/jquery.stickOnScroll.js'></script>
    <script src="js/tinycolor-min.js"></script>
    <script src="js/config.js"></script>
    <script src="js/d3.min.js"></script>
    <script src="js/topojson.min.js"></script>
    <script src="js/datamaps.all.min.js"></script>
    <script src="js/datamaps-zoomto.js"></script>
    <script src="js/datamaps.custom.js"></script>
    <script src="js/Chart.min.js"></script>
    <script>
      /* defind global options */
      Chart.defaults.global.defaultFontFamily = base.defaultFontFamily;
      Chart.defaults.global.defaultFontColor = colors.mutedColor;
    </script>
    <script src="js/gauge.min.js"></script>
    <script src="js/jquery.sparkline.min.js"></script>
    <script src="js/apexcharts.min.js"></script>
    <script src="js/apexcharts.custom.js"></script>
    <script src='js/jquery.mask.min.js'></script>
    <script src='js/select2.min.js'></script>
    <script src='js/jquery.steps.min.js'></script>
    <script src='js/jquery.validate.min.js'></script>
    <script src='js/jquery.timepicker.js'></script>
    <script src='js/dropzone.min.js'></script>
    <script src='js/uppy.min.js'></script>
    <script src='js/quill.min.js'></script>
    
    
    
<script>
  $("#modeSwitcher").on("click", function (e) {
    e.preventDefault();
    modeSwitch();
  });
</script>
</body>
</html>
