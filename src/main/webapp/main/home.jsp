<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* ===============================
   LIBERTY NFT - Category Buttons
================================= */
.category-section {
  width: 100%;
background: #ffffff;  
border-bottom: 1px solid #e6e6f8;
  padding: 40px 0 50px 0; 
  display: flex;
  justify-content: center;
  align-items: flex-start; 
  overflow: visible; 
  margin-top: 0 !important;
  margin-bottom: 30px !important;
}

.category-container {
  display: flex;
  justify-content: center;
  flex-wrap: nowrap;
  gap: 32px;
  overflow-x: auto;
  max-width: 100%;
  padding: 10px 40px;
  box-sizing: border-box;
}

.brutalist-button.button-1 {
  width: 150px;
  height: 150px;
  background: #ffffff;
  border: 2px solid #b3aaff;
  border-radius: 18px;
  box-shadow: 5px 5px 0 #00000022;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 10px;
  cursor: pointer;
  transition: all 0.3s ease;
  color: #333;
  font-size: 16px;
  font-weight: 600;
}

.brutalist-button.button-1:hover {
  background: #fff;
  color: black;
  border-color: #4c43e2;
  transform: translate(-5px, -5px);
  box-shadow: 8px 8px 0 #c6b7f5;
}

.brutalist-button.button-1:active {
  transform: translate(0, 0);
  box-shadow: 3px 3px 0 #e3dcfb;
}

.category-icon {
  width: 60px;
  height: 60px;
  object-fit: contain;
  transition: transform 0.3s ease;
}

.brutalist-button.button-1:hover .category-icon {
  transform: scale(1.1) rotate(5deg);
}
.item > img {
  border-radius: 20px;
  
  align-items: center;
}
.main-banner {
  background-color: #f7f7f7;
}
.popular-section {
    max-width: 1200px;
    margin: 15px 0 0 0;
    padding: 0;
}

.popular-section h2 {
    font-size: 24px;
    font-weight: 700;
    margin-bottom: 20px;
}

.popular-tags {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
}
.popluar-tags:hover {
    color: white;
    border-color: black;
    background: #7453FC;
}
.tag-btn {
    background: #f0f0f0;
    border: 1px solid #ddd;
    padding: 8px 15px;
    border-radius: 20px;
    font-size: 14px;
    color: #333;
    cursor: pointer;
    transition: all 0.2s;
}

.tag-btn:hover {
    background: #7453FC;
    color: white;
    border-color: black;
}
/* 인기 컨텐츠 */
.title{
	font-size: 18px !important;
	display: -webkit-box;
    -webkit-line-clamp: 1;   /* 보일 최대 줄 수 */
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    line-height: 1.4em;       /* 줄 간격 */
    max-height: calc(1.4em * 1);
    margin-bottom: 30px;
}
.com{
	display: -webkit-box;
    -webkit-line-clamp: 1;   /* 보일 최대 줄 수 */
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    line-height: 1.4em;       /* 줄 간격 */
    max-height: calc(1.4em * 1);
}
.con {
	display: -webkit-box;
    -webkit-line-clamp: 3;   /* 보일 최대 줄 수 */
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    line-height: 1.4em;       /* 줄 간격 */
    max-height: calc(1.4em * 3);
}

.sub {
	font-size: 15px !important;
	white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}

.sub:hover {
 	color: #dcdcdc;
}

.thumb {
  width: 380px;
  border-radius: 15px;
  background: #f9f9f9;
}

.thumb > img {
	width: 100%;
	padding:20px; 
	height: 250px; 

.item > img{
 border-radius: 20px;

}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
$(function(){
    $("#search-form").submit(function(e){
        let keyword = $("input[name=keyword]").val().trim();
        if(keyword === ""){
            alert("검색어를 입력하세요.");
            e.preventDefault();
        }
    });
});
</script>
</head>
<body>
  <div class="main-banner" style="background-color: #fff">
    <div class="container" style="width:1180px;">
      <div class="row">
        <div class="col-lg-6 align-self-center">
          <div class="header-text" style="margin-left:50px">
           <div style="margin-left:15px">
             <h2 style="color:black">이음,<br>
				</h2>
				<h3 style="color: black;font-size: 40px;">딱 맞는 전문가와 이어드립니다</h3>
           </div>
          <div class="discover-items">
			  <form id="search-form" method="GET" class="search" action="../talent/keyword_list.eum">
			      <div class="row">
			        <div class="col-lg-12">
			            <fieldset>
			                <input type="text" name="keyword" class="searchText" placeholder="어떤 재능이 필요하세요?" autocomplete="on" required>
			            </fieldset>
			        </div>
			    </div>
			</form>
			<div class="popular-section">
			    <div class="popular-tags" style="display: inline-flex; gap: 6px;">
			        <button class="tag-btn" onclick="location.href='../talent/keyword_list.eum?keyword=개발'">개발</button>
			        <button class="tag-btn" onclick="location.href='../talent/keyword_list.eum?keyword=마케팅'">마케팅</button>
			        <button class="tag-btn" onclick="location.href='../talent/keyword_list.eum?keyword=골프'">골프</button>
			        <button class="tag-btn" onclick="location.href='../talent/keyword_list.eum?keyword=청소'">청소</button>
			        <button class="tag-btn" onclick="location.href='../talent/keyword_list.eum?keyword=자동차'">자동차</button>
			        <button class="tag-btn" onclick="location.href='../talent/keyword_list.eum?keyword=보컬'">보컬</button>
			        <button class="tag-btn" onclick="location.href='../talent/keyword_list.eum?keyword=시공'">시공</button>
			    </div>
			</div>
          </div>
          </div>
        </div>
        
        <div class="col-lg-5 col-lg-5">
          <div class="owl-banner owl-carousel" style="margin-left: 50px;">
            <div class="item">
              <img src="../images/banner1.png">
            </div>
            <div class="item">
              <img src="../images/banner2.png">
            </div>
            <div class="item">
              <img src="../images/banner3.png">
            </div>
            <div class="item">
              <img src="../images/banner4.jpg">
            </div>
          </div>
        </div>
      </div>
      
      <div class="row">
        <div class="col-lg-12">
          <div class="categories">
            <div class="row">
              <div class="col-lg-12">
                <div class="section-heading">
                </div>
              </div>
              <section class="category-section">
				  <div class="category-container">
				  <a href="../content/exer_list.eum">
				    <button class="brutalist-button button-1">
				      <img src="../images/운동11.gif" alt="디자인" class="category-icon">
				      <span>운동/건강</span>
				    </button>
				    </a>
				   <a href="../content/biz_list.eum">
				    <button class="brutalist-button button-1">
				      <img src="../images/비즈니스.gif" alt="비즈니스" class="category-icon">
				      <span>비즈니스</span>
				    </button>
				    </a>
				    <a href="../content/hobby_list.eum">
				    <button class="brutalist-button button-1">
				      <img src="../images/프라이팬.gif" alt="음악" class="category-icon">
				      <span>취미/자기개발</span>
				    </button>
				    </a>
				   <a href="../content/talent_list.eum">
				    <button class="brutalist-button button-1">
				      <img src="../images/생활.gif" alt="AI/테크" class="category-icon">
				      <span>생활/라이프</span>
				    </button>
				    </a>
					<a href="../content/etc_list.eum">
				    <button class="brutalist-button button-1">
				      <img src="../images/기타.gif" alt="기타" class="category-icon">
				      <span>기타</span>
				    </button>
				    </a>
				    <a href="../content/all_list.eum">
				    <button class="brutalist-button button-1">
				      <img src="../images/ALL.png" alt="잔체보기" class="category-icon">
				      <span>전체보기</span>
				    </button>
				    </a>
				  </div>
				</section>
              
              </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- ***** Main Banner Area End ***** -->
  
  <div class="categories-collections">
    <div class="container">
      <div class="row">
       
        <div class="col-lg-12">
          <div class="collections">
            <div class="row">
              <div class="col-lg-12">
                <div class="section-heading">
                  <div class="line-dec"></div>
                  <h2><em>인기 급상승 서비스</em></h2>
                </div>
              </div>
              <div class="col-lg-12">
                <div class="owl-collection owl-carousel">
                  <c:forEach var="vo" items="${hotList}">
                    <div class="item">
                      <a href="../talent/detail.eum?b_id=${vo.b_id }">
                        <div class="image">
                          <img src="${vo.b_thumbnail}" width="250" height="300" style="border-radius: 15px;">
                        </div>
                        <div class="down-content">
                          <h6 style="margin-bottom: 10px; color: #999999">${vo.b_type}</h6>
                          <h5 class="title">${vo.b_title}</h5>
                          <span class="collection">⭐️ ${vo.rvo.b_review_score != null ? vo.rvo.b_review_score : 0}</span>
                          <span class="category com"><strong>${vo.usvo.u_s_com}</strong></span>
                        </div>
                      </a>
                    </div>
                  </c:forEach>
                </div>
                </div>
              </div>
            </div> 
          </div>
        </div>
      </div>
    </div>
</div>


  <div class="create-nft">
    <div class="container">
      <div class="row">
        <div class="col-lg-8">
          <div class="section-heading">
            <div class="line-dec"></div>
            <h2>최근 컨텐츠</h2>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="main-button">
          </div>
        </div>
        <div class="col-lg-4">
          <div class="item first-item">
            <div class="number">
            </div>
            <div class="thumb">
              <img src="${resList[0].b_thumbnail }">
            </div>
            <a href="../talent/detail.eum?b_id=${resList[0].b_id}">
			  <h4 class="sub">${resList[0].b_title}</h4>
			</a>
            <p class="con">${resList[0].b_content }</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="item second-item">
            <div class="number">
            </div>
           <div class="thumb">
              <img src="${resList[1].b_thumbnail }">
            </div>
            <a href="../talent/detail.eum?b_id=${resList[1].b_id}">
			  <h4 class="sub">${resList[1].b_title}</h4>
			</a>
            <p class="con">${resList[1].b_content }</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="item">
           <div class="thumb">
              <img src="${resList[2].b_thumbnail }">
            </div>
            <a href="../talent/detail.eum?b_id=${resList[1].b_id}">
			  <h4 class="sub">${resList[1].b_title}</h4>
			</a>
            <p class="con">${resList[2].b_content }</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>