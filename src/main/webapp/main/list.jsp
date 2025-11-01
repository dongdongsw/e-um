<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style>
  body {
    margin: 0;
    background: white !important;
  }

  .list-container {
    display: flex;
    width: 1180px;
    margin: 0 auto;
    gap: 20px;
    background-color: #fff;
    min-height: 800px;
  }

  /* 사이드바 */
  .sidebar {
    width: 20%;
    background-color: #fff;
    border-right: 1px solid #e5e7eb;
    padding: 20px;
  }

  .sidebar h3 {
    font-size: 14px;
    font-weight: 700;
    margin-bottom: 12px;
  }

  .sidebar ul {
    list-style: none;
    padding: 0;
    margin: 0;
  }

  .sidebar ul li {
    margin-bottom: 8px;
  }

  .sidebar ul li {
    text-decoration: none;
    color: #333;
    font-size: 13px;
  }

  .sidebar ul li:hover {
    color: #7453fc;
  }

  /* 메인 콘텐츠 */
  .main {
    width: 80%;
    padding: 20px;
    min-height: 800px;
  }
.temporary__storage {
/*delete this*/
  width: 220px;
  height: 290px;
  border-radius: 15px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.list-card {
  width: 200px;
  height: 270px;
  position: relative;
  color: #black;
  display: flex;
  flex-direction: column;
  gap: 5px;
  cursor: pointer;
  transition: all .2s ease;
}

.image {
  width: 100%;
  height: 160px;
  position: absolute;
  background-color: white;
  cursor: pointer;
  transition: all .2s ease;
  border-radius: 15px;
}

.list-card::before {
  position: absolute;
  top: 7px;
  left: 7px;
  font-weight: 900;
  font-size: .8em;
  background-color: white;
  border-radius: 5px;
  padding: 3px 5px;
}

.list-card::after {
  position: absolute;
  bottom: 7px;
  left: 7px;
  font-weight: 300;
  font-size: .7em;
  background-color: white;
  border-radius: 2px;
  padding: 3px 5px;
}

.image__overlay {
  width: 100%;
  height: 160px;
}

.list-card:hover {
  transform: translate(5px, -5px);
}

.avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  cursor: pointer;
}

.content {
  display: flex;
  flex-direction: row;
  gap: 10px;
}

.content__text {
  display: flex;
  flex-direction: column;
  gap: 5px;
}

.content__body {
  display: flex;
  flex-direction: column;
}

.stream__title {
  font-weight: 900;
  width: 190px;
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
  cursor: pointer;
}

.event {
  cursor: pointer;
}

.streamer__name, .event {
  font-size: .8em;
  font-weight: 400;
  color: black;
}

.categories__btn {
  text-decoration: none;
  color: rgb(73, 71, 71);
  font-size: .8em;
  background-color: rgb(220, 220, 220);
  padding: 2px 8px;
  border-radius: 15px;
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
}

.stream__title:hover, .event:hover {
  color: #9f7cd3;
}
</style>
</head>
<body>
  <div style="background-color:#fff; height:180px;"></div>
  <div class="header-text" style="height: 100px;"></div>

  <div class="list-container">
    <!-- 사이드바 -->
    <div class="sidebar">
      <h3>영상</h3>
      <ul>
        <li><a href="#">광고·홍보 영상</a></li>
        <li><a href="#">쇼츠 영상</a></li>
        <li><a href="#">업종별 영상</a></li>
        <li><a href="#">제품 영상</a></li>
        <li><a href="#">교육 영상</a></li>
        <li><a href="#">행사 영상</a></li>
        <li><a href="#">유튜브 영상</a></li>
        <li><a href="#">드론 촬영</a></li>
        <li><a href="#">영상 후반작업</a></li>
      </ul>

      <h3>컴퓨터 그래픽(CG)</h3>
      <ul>
        <li><a href="#">모션그래픽</a></li>
        <li><a href="#">인포그래픽</a></li>
        <li><a href="#">타이포그래피</a></li>
        <li><a href="#">3D 모델링</a></li>
      </ul>
    </div>

    <!-- 오른쪽 메인 -->
    <div class="main">
      <div class="row">
       <c:forEach begin="0" end="11">
         <div class="col-md-3">
		   <div class="temporary__storage" style="border:none">
			  <div class="list-card" onclick="location.href='../main/detail.eum'">
			    <div class="image">
			      <img src="./assets/images/플랫폼개발.webp" width="200" height="160" style="border-radius: 15px;">
			    </div>
			    <div class="image__overlay"></div>
			    <div class="content">
			      <div class="avatar"></div>
			      <div class="content__text">
			        <span class="stream__title">맞춤 개발로 완벽한 플랫폼을 만들어드립니다</span>
			        <div class="content__body">
			          <span class="event" id="rating" id="review-count" style="font-size: 10px">⭐️ 4.9 (23)</span>
			          <span class="streamer__name" id="price" style="font-size: 12px">10,000원</span>
			          <span class="streamer__name" id="seller" style="font-size: 10px">김민식</span>
			        </div>
			        <span class="categories">
			          <div class="categories__btn" style="width:55px; text-align: center; font-size: 10px">카테고리</div>
			        </span>
			      </div>
			    </div>
			</div>
		  </div>
        </div>
      </c:forEach>
    </div>
  </div>
 </div>
</body>
</html>
