<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    padding: 8px 16px;
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
			        <div class="col-lg-9">
			            <fieldset>
			                <input type="text" name="keyword" class="searchText" placeholder="어떤 재능이 필요하세요?" autocomplete="on" required>
			            </fieldset>
			        </div>
			        <div class="col-lg-2">                        
			            <fieldset>
			                <button class="main-button" style="width:80px;">검색</button>
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
			        <button class="tag-btn" onclick="location.href='../talent/keyword_list.eum?keyword=시공'">시공</button>
			        <button class="tag-btn" onclick="location.href='../talent/keyword_list.eum?keyword=자동차'">자동차</button>
			        <button class="tag-btn" onclick="location.href='../talent/keyword_list.eum?keyword=보컬'">보컬</button>
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
				    <a href="../talent/b_type_list.eum?b_type=all">
				    <button class="brutalist-button button-1">
				      <img src="../images/기타.gif" alt="잔체보기" class="category-icon">
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
                  <h2><em>신뢰할 수 있는 결과물<br> 고객 만족도 4.9점</em></h2>
                </div>
              </div>
              <div class="col-lg-12">
                <div class="owl-collection owl-carousel">
                  <div class="item">
                    <img src="../assets/images/collection-01.jpg" alt="">
                    <div class="down-content">
                      <h4>Mutant Bored Ape Yacht Club</h4>
                      <span class="collection">Items In Collection:<br><strong>310/340</strong></span>
                      <span class="category">Category:<br><strong>Digital Crypto</strong></span>
                      <div class="main-button">
                        <a href="explore.html">Explore Mutant</a>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <img src="../assets/images/collection-01.jpg" alt="">
                    <div class="down-content">
                      <h4>Bored Ape Kennel Club</h4>
                      <span class="collection">Items In Collection:<br><strong>324/324</strong></span>
                      <span class="category">Category:<br><strong>Visual Art</strong></span>
                      <div class="main-button">
                        <a href="explore.html">Explore Bored Ape</a>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <img src="../assets/images/collection-01.jpg" alt="">
                    <div class="down-content">
                      <h4>Genesis Collective Statue</h4>
                      <span class="collection">Items In Collection:<br><strong>380/394</strong></span>
                      <span class="category">Category:<br><strong>Music Art</strong></span>
                      <div class="main-button">
                        <a href="explore.html">Explore Genesis</a>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <img src="../assets/images/collection-01.jpg" alt="">
                    <div class="down-content">
                      <h4>Worldwide Artwork Ground</h4>
                      <span class="collection">Items In Collection:<br><strong>426/468</strong></span>
                      <span class="category">Category:<br><strong>Blockchain</strong></span>
                      <div class="main-button">
                        <a href="explore.html">Explore Worldwide</a>
                      </div>
                    </div>
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
            <h2>Create Your NFT & Put It On The Market.</h2>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="main-button">
            <a href="create.html">Create Your NFT Now</a>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="item first-item">
            <div class="number">
              <h6>1</h6>
            </div>
            <div class="icon">
              <img src="../assets/images/icon-02.png" alt="">
            </div>
            <h4>Set Up Your Wallet</h4>
            <p>NFT means Non-Fungible Token that are used in digital cryptocurrency markets. There are many different kinds of NFTs in the industry.</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="item second-item">
            <div class="number">
              <h6>2</h6>
            </div>
            <div class="icon">
              <img src="../assets/images/icon-04.png" alt="">
            </div>
            <h4>Add Your Digital NFT</h4>
            <p>There are 5 different HTML pages included in this NFT <a href="https://templatemo.com/page/1" target="_blank" rel="nofollow">website template</a>. You can edit or modify any section on any page as you required.</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="item">
            <div class="icon">
              <img src="../assets/images/icon-06.png" alt="">
            </div>
            <h4>Sell Your NFT &amp; Make Profit</h4>
            <p>If you would like to support our TemplateMo website, please visit <a rel="nofollow" href="https://templatemo.com/contact" target="_parent">our contact page</a> to make a PayPal contribution. Thank you.</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="currently-market">
    <div class="container">
      <div class="row">
        <div class="col-lg-6">
          <div class="section-heading">
            <div class="line-dec"></div>
            <h2><em>Items</em> Currently In The Market.</h2>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="filters">
            <ul>
              <li data-filter="*"  class="active">All Items</li>
              <li data-filter=".msc">Music Art</li>
              <li data-filter=".dig">Digital Art</li>
              <li data-filter=".blc">Blockchain</li>
              <li data-filter=".vtr">Virtual</li>
            </ul>
          </div>
        </div>
        <div class="col-lg-12">
          <div class="row grid">
            <div class="col-lg-6 currently-market-item all msc">
              <div class="item">
                <div class="left-image">
                  <img src="../assets/images/market-01.jpg" alt="" style="border-radius: 20px; min-width: 195px;">
                </div>
                <div class="right-content">
                  <h4>Music Art Super Item</h4>
                  <span class="author">
                    <img src="../assets/images/author.jpg" alt="" style="max-width: 50px; border-radius: 50%;">
                    <h6>Liberty Artist<br><a href="#">@libertyart</a></h6>
                  </span>
                  <div class="line-dec"></div>
                  <span class="bid">
                    Current Bid<br><strong>2.03 ETH</strong><br><em>($8,240.50)</em>
                  </span>
                  <span class="ends">
                    Ends In<br><strong>4D 08H 15M 42S</strong><br><em>(July 24th, 2022)</em>
                  </span>
                  <div class="text-button">
                    <a href="details.html">View Item Details</a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6 currently-market-item all dig">
              <div class="item">
                <div class="left-image">
                  <img src="../assets/images/market-01.jpg" alt="" style="border-radius: 20px; min-width: 195px;">
                </div>
                <div class="right-content">
                  <h4>Digital Crypto Artwork</h4>
                  <span class="author">
                    <img src="../assets/images/author.jpg" alt="" style="max-width: 50px; border-radius: 50%;">
                    <h6>Liberty Artist<br><a href="#">@libertyart</a></h6>
                  </span>
                  <div class="line-dec"></div>
                  <span class="bid">
                    Current Bid<br><strong>2.03 ETH</strong><br><em>($7,200.50)</em>
                  </span>
                  <span class="ends">
                    Ends In<br><strong>2D 06H 30M 25S</strong><br><em>(July 26th, 2022)</em>
                  </span>
                  <div class="text-button">
                    <a href="details.html">View Item Details</a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6 currently-market-item all blc">
              <div class="item">
                <div class="left-image">
                  <img src="../assets/images/market-01.jpg" alt="" style="border-radius: 20px; min-width: 195px;">
                </div>
                <div class="right-content">
                  <h4>Blockchain Item One</h4>
                  <span class="author">
                    <img src="../assets/images/author.jpg" alt="" style="max-width: 50px; border-radius: 50%;">
                    <h6>Liberty Artist<br><a href="#">@libertyart</a></h6>
                  </span>
                  <div class="line-dec"></div>
                  <span class="bid">
                    Current Bid<br><strong>3.64 ETH</strong><br><em>($6,600.00)</em>
                  </span>
                  <span class="ends">
                    Ends In<br><strong>6D 05H 40M 50S</strong><br><em>(July 28th, 2022)</em>
                  </span>
                  <div class="text-button">
                    <a href="details.html">View Item Details</a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6 currently-market-item all vtr">
              <div class="item">
                <div class="left-image">
                  <img src="../assets/images/market-01.jpg" alt="" style="border-radius: 20px; min-width: 195px;">
                </div>
                <div class="right-content">
                  <h4>Virtual Currency Art</h4>
                  <span class="author">
                    <img src="../assets/images/author.jpg" alt="" style="max-width: 50px; border-radius: 50%;">
                    <h6>Liberty Artist<br><a href="#">@libertyart</a></h6>
                  </span>
                  <div class="line-dec"></div>
                  <span class="bid">
                    Current Bid<br><strong>2.44 ETH</strong><br><em>($8,800.50)</em>
                  </span>
                  <span class="ends">
                    Ends In<br><strong>3D 05H 20M 58S</strong><br><em>(July 14th, 2022)</em>
                  </span>
                  <div class="text-button">
                    <a href="details.html">View Item Details</a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6 currently-market-item all vrt dig">
              <div class="item">
                <div class="left-image">
                  <img src="../assets/images/market-01.jpg" alt="" style="border-radius: 20px; min-width: 195px;">
                </div>
                <div class="right-content">
                  <h4>Digital Art Item</h4>
                  <span class="author">
                    <img src="../assets/images/author.jpg" alt="" style="max-width: 50px; border-radius: 50%;">
                    <h6>Liberty Artist<br><a href="#">@libertyart</a></h6>
                  </span>
                  <div class="line-dec"></div>
                  <span class="bid">
                    Current Bid<br><strong>2.50 ETH</strong><br><em>($8,400.50)</em>
                  </span>
                  <span class="ends">
                    Ends In<br><strong>4D 08H 32M 18S</strong><br><em>(July 16th, 2022)</em>
                  </span>
                  <div class="text-button">
                    <a href="details.html">View Item Details</a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6 currently-market-item all msc blc">
              <div class="item">
                <div class="left-image">
                  <img src="../assets/images/market-01.jpg" alt="" style="border-radius: 20px; min-width: 195px;">
                </div>
                <div class="right-content">
                  <h4>Blockchain Music Design</h4>
                  <span class="author">
                    <img src="../assets/images/author.jpg" alt="" style="max-width: 50px; border-radius: 50%;">
                    <h6>Liberty Artist<br><a href="#">@libertyart</a></h6>
                  </span>
                  <div class="line-dec"></div>
                  <span class="bid">
                    Current Bid<br><strong>2.44 ETH</strong><br><em>($8,200.50)</em>
                  </span>
                  <span class="ends">
                    Ends In<br><strong>5D 10H 22M 24S</strong><br><em>(July 18th, 2022)</em>
                  </span>
                  <div class="text-button">
                    <a href="details.html">View Item Details</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  
</body>
</html>