<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
  <head>
    <title>이벤트 페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">

    <link rel="stylesheet" href="../css/aos.css">

    <link rel="stylesheet" href="../css/ionicons.min.css">

    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="../css/flaticon.css">
    <link rel="stylesheet" href="../css/icomoon.css">
    <link rel="stylesheet" href="../css/style.css">
  </head>
  <body>
    
	  <nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/main.jsp">ABO PLATE</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse dropmenu" id="ftco-nav">
				<ul class="navbar-nav ml-auto" id="dm_ul">
					<li class="nav-item"><a href="../member/login.jsp" class="nav-link">로그인</a></li>
					<li class="nav-item"><a href="../member/signup.jsp" class="nav-link">회원가입</a></li>
					<li class="nav-item"><a href="event.jsp" class="nav-link">이벤트</a></li>
					<li class="nav-item"><a class="nav-link">최근본 맛집</a>
						<ul>
			            <li>
			            	<div class="d-flex">
			            		<a href="../restaurant/storeInfoBefore.jsp">
			            			<img src="../images/image_1.jpg" style="width:100px;"></img>aaaa
			            		</a>
			            	</div>
			            </li>
			            <li>
			            	<div class="d-flex">
			            		<a href="../restaurant/storeInfoBefore.jsp">
			            			<img src="../images/image_2.jpg" style="width:100px;"></img>bbbb
			            		</a>
			            	</div>
			            </li>
			            <li>
			            	<div class="d-flex">
			            		<a href="../restaurant/storeInfoBefore.jsp">
			            			<img src="../images/image_3.jpg" style="width:100px;"></img>cccc
			            		</a>
			            	</div>
			            </li>
			            <li>
			            	<div class="d-flex">
			            		<a href="../restaurant/storeInfoBefore.jsp">
			            			<img src="../images/image_4.jpg" style="width:100px;"></img>dddd
			            		</a>
			            	</div>
			            </li>
			          </ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
    <!-- END nav -->
    
	<section class="hero-wrap2 hero-wrap-2 ftco-degree-bg js-fullheight" style="background-image: url('../images/main.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          
            <p class="mb-3 bread" style="position: relative; top: 50px; font-size: 30px;">이벤트</p>

        </div>
      </div>
    </section>
    
    <div id="mask"></div>
    <div class="container">
		<div id="layerbox" class="layerpop"
			style="height: 800px; border-radius: 5% !important;">
			<article class="layerpop_area" style="width:625px;">
				<a href="javascript:popupClose();" class="layerpop_close" id="layerbox_close">X</a><br>
				<div class="content">
					<p>이벤트!</p>
					<img style="width:600px;" src="../images/event1.jpg">
				</div>
			</article>
		</div>
	</div>
    
	<section class="ftco-section">
      <div class="container">
        <div class="row d-flex">
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <h3 class="heading"></h3>
                <div class="meta mb-3">
                </div>
                <a href="javascript:goDetail();" id="getImg" class="block-20 img" style="background-image: url('../images/event1.jpg');">
	              </a>
	              <h5>냉모밀 맛집 탐방!</h5>
	              <p>2020-xx-xx</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <h3 class="heading"></h3>
                <div class="meta mb-3">
                </div>
                <a href="javascript:goDetail();" id="getImg" class="block-20 img" style="background-image: url('../images/event2.jpg');">
	              </a>
	              <h5>여름음식 맛집 투어!</h5>
	              <p>2020-xx-xx</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <h3 class="heading"></h3>
                <div class="meta mb-3">
                </div>
                <a href="javascript:goDetail();" id="getImg" class="block-20 img" style="background-image: url('../images/event3.jpg');"></a>
	              <h5>국내 먹는 여행</h5>
	              <p>2020-xx-xx</p>
              </div>
            </div>
          </div>
          <!-- <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <h3 class="heading"></h3>
                <div class="meta mb-3">
                  <div><a href="#">Admin</a></div>
                </div>
                <a href="blog-single.html" class="block-20 img" style="background-image: url('../images/image_4.jpg');">
	              </a>
	              <h5>이벤트 제목</h5>
	              <p>이벤트 일시</p>
              </div>
            </div>
          </div>

          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <h3 class="heading"></h3>
                <div class="meta mb-3">
                  <div><a href="#">Admin</a></div>
                </div>
                <a href="blog-single.html" class="block-20 img" style="background-image: url('../images/image_5.jpg');">
	              </a>
	             <h5>이벤트 제목</h5>
	              <p>이벤트 일시</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <h3 class="heading"></h3>
                <div class="meta mb-3">
                  <div><a href="#">Admin</a></div>
                </div>
                <a href="blog-single.html" class="block-20 img" style="background-image: url('../images/image_6.jpg');">
	              </a>
	              <h5>이벤트 제목</h5>
	              <p>이벤트 일시</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <h3 class="heading"></h3>
                <div class="meta mb-3">
                  <div><a href="#">Admin</a></div>
                </div>
                <a href="blog-single.html" class="block-20 img" style="background-image: url('../images/image_7.jpg');">
	              </a>
	              <h5>이벤트 제목</h5>
	              <p>이벤트 일시</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <h3 class="heading"></h3>
                <div class="meta mb-3">
                  <div><a href="#">Admin</a></div>
                </div>
                <a href="blog-single.html" class="block-20 img" style="background-image: url('../images/image_8.jpg');">
	              </a>
	             <h5>이벤트 제목</h5>
	              <p>이벤트 일시</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <div class="text">
                <h3 class="heading"></h3>
                <div class="meta mb-3">
                  <div><a href="#">Admin</a></div>
                </div>
                <a href="blog-single.html" class="block-20 img" style="background-image: url('../images/image_1.jpg');">
	              </a>
	             <h5>이벤트 제목</h5>
	              <p>이벤트 일시</p>
              </div>
            </div>
          </div>
        </div> -->
        <!-- <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
              </ul>
            </div>
          </div> -->
        </div>
      </div>
    </section>

    <footer class="ftco-footer ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">ABOplate</h2>
              <p>Far far away, behind the word mountains, far from the countries.</p>
              <ul class="ftco-footer-social list-unstyled mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">Community</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Search storeInfoBefore</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>For Agents</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Reviews</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>FAQs</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">About Us</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Our Story</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Meet the team</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Careers</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Company</h2>
              <ul class="list-unstyled">
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>About Us</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Press</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Contact</a></li>
                <li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Careers</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope pr-4"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">
	
            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="../js/jquery.min.js"></script>
  <script src="../js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/jquery.easing.1.3.js"></script>
  <script src="../js/jquery.waypoints.min.js"></script>
  <script src="../js/jquery.stellar.min.js"></script>
  <script src="../js/owl.carousel.min.js"></script>
  <script src="../js/jquery.magnific-popup.min.js"></script>
  <script src="../js/aos.js"></script>
  <script src="../js/jquery.animateNumber.min.js"></script>
  <script src="../js/bootstrap-datepicker.js"></script>
  <script src="../js/jquery.timepicker.min.js"></script>
  <script src="../js/scrollax.min.js"></script>
  <script src="../https://maps.googleapis.com/maps/api/js?key=&sensor=false"></script>
  <script src="../js/google-map.js"></script>
  <script src="../js/popup.js"></script>
  <script src="../js/main.js"></script>
    
  </body>
</html>