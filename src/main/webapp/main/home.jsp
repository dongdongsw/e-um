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
  padding: 40px 0 50px 0;  /* ✅ 위 공간 확장 */
  display: flex;
  justify-content: center;
  align-items: flex-start; /* ✅ 위로 여유 공간 확보 */
  overflow: visible; /* ✅ hover 시 위쪽 짤림 방지 */
  margin-top: 30px !important;
  margin-bottom: 30px !important;
}

.category-container {
  display: flex;
  justify-content: center;
  flex-wrap: nowrap;
  gap: 32px;
  overflow-x: auto;
  max-width: 100%;
  padding: 10px 40px; /* ✅ 좌우 여백 추가 */
  box-sizing: border-box;
}



/* 버튼 스타일 */
.brutalist-button.button-1 {
  width: 160px;
  height: 160px;
  background: #ffffff;
  border: 2px solid #b3aaff;
  border-radius: 18px;
  box-shadow: 5px 5px 0 #00000022;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 12px;
  cursor: pointer;
  transition: all 0.3s ease;
  color: #333;
  font-size: 16px;
  font-weight: 600;
}

/* hover 시 효과 */
.brutalist-button.button-1:hover {
  background: #6c63ff;
  color: #fff;
  border-color: #4c43e2;
  transform: translate(-5px, -5px);
  box-shadow: 8px 8px 0 #00000033;
}

/* 클릭 시 */
.brutalist-button.button-1:active {
  transform: translate(0, 0);
  box-shadow: 3px 3px 0 #00000033;
}

/* 아이콘 */
.category-icon {
  width: 60px;
  height: 60px;
  object-fit: contain;
  transition: transform 0.3s ease;
}

.brutalist-button.button-1:hover .category-icon {
  transform: scale(1.1) rotate(5deg);
}

</style>
</head>
<body>
  <div class="main-banner" style="background-color: #fff">
    <div class="container" style="width:1180px;">
      <div class="row">
        <div class="col-lg-6 align-self-center">
          <div class="header-text">
           
           <div>
             <h2 style="color:black">이음,<br>
				딱 맞는 전문가와 이어드립니다</h2>
           </div>
            
           
          <div class="discover-items">
          <form id="search-form" name="gs" method="submit" role="search" action="#">
            <div class="row">
              <div class="col-lg-4">
                <fieldset>
                    <input type="text" name="keyword" class="searchText" placeholder="어떤 재능이 필요하세요?" autocomplete="on" required>
                </fieldset>
              </div>
              <div class="col-lg-3">
                <fieldset>
                    <select name="Category" class="form-select" aria-label="Default select example" id="chooseCategory" onchange="this.form.click()">
                        <option selected>카테고리</option>
                        <option type="checkbox" name="option1" value="Music">Music</option>
                        <option value="Digital">Digital</option>
                        <option value="Blockchain">Blockchain</option>
                        <option value="Virtual">Virtual</option>
                    </select>
                </fieldset>
              </div>
              <div class="col-lg-3">
                <fieldset>
                    <select name="Price" class="form-select" aria-label="Default select example" id="chooseCategory" onchange="this.form.click()">
                        <option selected>가격대</option>
                        <option value="Ending-Soon">Ending Soon</option>
                        <option value="Coming-Soon">Coming Soon</option>
                        <option value="Closed">Closed</option>
                    </select>
                </fieldset>
              </div>
              <div class="col-lg-2">                        
                <fieldset>
                    <button class="main-button">검색</button>
                </fieldset>
              </div>
            </div>
          </form>
          </div>
          </div>
        </div>
        <div class="col-lg-5 offset-lg-1">
          <div class="owl-banner owl-carousel">
            <div class="item">
              <img src="assets/images/banner-01.png" alt="">
            </div>
            <div class="item">
              <img src="assets/images/banner-02.png" alt="">
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
    <button class="brutalist-button button-1">
      <img src="../main/images/color-pallete.png" alt="디자인" class="category-icon">
      <span>디자인</span>
    </button>

    <button class="brutalist-button button-1">
      <img src="../main/images/video-camera.png" alt="영상" class="category-icon">
      <span>영상</span>
    </button>

    <button class="brutalist-button button-1">
      <img src="../main/images/headphones.png" alt="음악" class="category-icon">
      <span>음악</span>
    </button>

    <button class="brutalist-button button-1">
      <img src="../main/images/graduation.png" alt="교육" class="category-icon">
      <span>교육</span>
    </button>

    <button class="brutalist-button button-1">
      <img src="../main/images/robot.png" alt="AI/테크" class="category-icon">
      <span>AI / 테크</span>
    </button>

    <button class="brutalist-button button-1">
      <img src="../main/images/puzzle.png" alt="기타" class="category-icon">
      <span>기타</span>
    </button>
  </div>
</section>
              <div class="col-lg-2 col-sm-5">
                <div class="item">
                  <div class="icon">
                    <img src="assets/images/icon-01.png" alt="">
                  </div>
                  <h4>Blockchain</h4>
                  <div class="icon-button">
                    <a href="#"><i class="fa fa-angle-right"></i></a>
                  </div>
                </div>
              </div>
              <div class="col-lg-2 col-sm-5">
                <div class="item">
                  <div class="icon">
                    <img src="assets/images/icon-02.png" alt="">
                  </div>
                  <h4>Digital Art</h4>
                  <div class="icon-button">
                    <a href="#"><i class="fa fa-angle-right"></i></a>
                  </div>
                </div>
              </div>
              <div class="col-lg-2 col-sm-5">
                <div class="item">
                  <div class="icon">
                    <img src="assets/images/icon-03.png" alt="">
                  </div>
                  <h4>Music Art</h4>
                  <div class="icon-button">
                    <a href="#"><i class="fa fa-angle-right"></i></a>
                  </div>
                </div>
              </div>
              <div class="col-lg-2 col-sm-5">
                <div class="item">
                  <div class="icon">
                    <img src="assets/images/icon-05.png" alt="">
                  </div>
                  <h4>Valuable</h4>
                  <div class="icon-button">
                    <a href="#"><i class="fa fa-angle-right"></i></a>
                  </div>
                </div>
              </div>
              <div class="col-lg-2 col-sm-5">
                <div class="item">
                  <div class="icon">
                    <img src="assets/images/icon-06.png" alt="">
                  </div>
                  <h4>Triple NFT</h4>
                  <div class="icon-button">
                    <a href="#"><i class="fa fa-angle-right"></i></a>
                  </div>
                </div>
              </div>
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
                  <h2><em>인기 컨텐츠</em></h2>
                </div>
              </div>
              <div class="col-lg-12">
                <div class="owl-collection owl-carousel">
                  <div class="item">
                    <img src="assets/images/collection-01.jpg" alt="">
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
                    <img src="assets/images/collection-01.jpg" alt="">
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
                    <img src="assets/images/collection-01.jpg" alt="">
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
                    <img src="assets/images/collection-01.jpg" alt="">
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
              <img src="assets/images/icon-02.png" alt="">
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
              <img src="assets/images/icon-04.png" alt="">
            </div>
            <h4>Add Your Digital NFT</h4>
            <p>There are 5 different HTML pages included in this NFT <a href="https://templatemo.com/page/1" target="_blank" rel="nofollow">website template</a>. You can edit or modify any section on any page as you required.</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="item">
            <div class="icon">
              <img src="assets/images/icon-06.png" alt="">
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
                  <img src="assets/images/market-01.jpg" alt="" style="border-radius: 20px; min-width: 195px;">
                </div>
                <div class="right-content">
                  <h4>Music Art Super Item</h4>
                  <span class="author">
                    <img src="assets/images/author.jpg" alt="" style="max-width: 50px; border-radius: 50%;">
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
                  <img src="assets/images/market-01.jpg" alt="" style="border-radius: 20px; min-width: 195px;">
                </div>
                <div class="right-content">
                  <h4>Digital Crypto Artwork</h4>
                  <span class="author">
                    <img src="assets/images/author.jpg" alt="" style="max-width: 50px; border-radius: 50%;">
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
                  <img src="assets/images/market-01.jpg" alt="" style="border-radius: 20px; min-width: 195px;">
                </div>
                <div class="right-content">
                  <h4>Blockchain Item One</h4>
                  <span class="author">
                    <img src="assets/images/author.jpg" alt="" style="max-width: 50px; border-radius: 50%;">
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
                  <img src="assets/images/market-01.jpg" alt="" style="border-radius: 20px; min-width: 195px;">
                </div>
                <div class="right-content">
                  <h4>Virtual Currency Art</h4>
                  <span class="author">
                    <img src="assets/images/author.jpg" alt="" style="max-width: 50px; border-radius: 50%;">
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
                  <img src="assets/images/market-01.jpg" alt="" style="border-radius: 20px; min-width: 195px;">
                </div>
                <div class="right-content">
                  <h4>Digital Art Item</h4>
                  <span class="author">
                    <img src="assets/images/author.jpg" alt="" style="max-width: 50px; border-radius: 50%;">
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
                  <img src="assets/images/market-01.jpg" alt="" style="border-radius: 20px; min-width: 195px;">
                </div>
                <div class="right-content">
                  <h4>Blockchain Music Design</h4>
                  <span class="author">
                    <img src="assets/images/author.jpg" alt="" style="max-width: 50px; border-radius: 50%;">
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