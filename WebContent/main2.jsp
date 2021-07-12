<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
  <head>
    <title>ABO_main2</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
    
    	<!-- nav -->
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="main2.jsp">ABO PLATE</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>
		
	      <div class="collapse navbar-collapse" id="ftco-nav">

	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><p class="nav-p">***님</p></li>
	          <li class="nav-item"><p class="nav-p">★ 포인트</p></li>
	          <li class="nav-item"><a href="mypage.jsp" class="nav-link">마이페이지</a></li>
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/member/MemberLogOut.me" class="nav-link">로그아웃</a></li>
	          <li class="nav-item"><a href="event.jsp" class="nav-link">이벤트</a></li>
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/restaurant/restaurantBookmark.re" class="nav-link">즐겨찾기</a></li>
	          <li class="nav-item"><a href="javascript:goDetail('테스트');" class="nav-link">최근 본 맛집</a></li>
	          
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    
    
    <!-- header -->
    <section class="hero-wrap hero-wrap-2 ftco-degree-bg js-fullheight"
		style="background-image: url('images/main.jpg'); background-position: center bottom; background-size: cover;"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
				<div
					class="col-md-9 ftco-animate pb-5 text-center fadeInUp ftco-animated">
					<div style="margin: 0 auto;">
						<p style="font-size: 18px; visibility: hidden;">A small river
							named Duden flows by their place and supplies it with the
							necessary regelialia.</p>
						<form action="#" class="search-location mt-md-5">
							<div class="row justify-content-center">
								<div class="col-lg-10 align-items-end">
									<div class="form-group">
										<div class="form-field">
											<input type="text" class="form-control"
												placeholder="Search location">
											<button>
												<span class="ion-ios-search"></span>
											</button>
										</div>
										<!-- <select style="width: 110px; font-size: 13px;" name="emailaddr" class="form-control search-location">
                               <option value='' selected>-- 선택 --</option>
                               <option value='메뉴검색'>메뉴검색</option>
                               <option value='지역검색'>지역검색</option>
                               <option value='가격검색'>가격검색</option>
                           </select> -->
									</div>

									<div class="form-group">
										<div class="form-field">

											실시간 차트
											<table style="margin: 0 auto; background-color: white;"
												class="form-control-tablel">
												<tbody>
													<tr>
														<td><div id="ranking" style="padding: 10px;">키워드</div></td>
													</tr>

												</tbody>
											</table>
										</div>
									</div>
									<div class="form-group">
										<div class="form-field">
											<input type="submit" value="지역화폐"
												class="btn btn-primary py-3 px-5"
												style="position: relative; top: 130px; left: 530px;">
										</div>
									</div>
								</div>


							</div>

						</form>
					</div>
				</div>

			</div>
		</div>
	</section>
		
   <div id="mask"></div>
		    <!--Popup Start -->
		    <div id="layerbox" class="layerpop" style="width:700px; height:500px;">
		        <article class="layerpop_area">
		        <div class="title">최근 본 맛집</div>
		        <a href="javascript:popupClose();" class="layerpop_close" id="layerbox_close">X</a><br>
		        		<div class="content" style="display:flex;">
					          <div class="col-md-4 d-flex ftco-animate">
					          	<div class="blog-entry justify-content-end">
					              <div class="text">
					                <a href="blog-single.jsp" class="block-20 img" style="background-image: url('images/image_1.jpg');">
						              </a>
						              <p>맛있어보이는 돈까스!</p>
					                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
					              </div>
					            </div>
					          </div>
					          <div class="col-md-4 d-flex ftco-animate">
					          	<div class="blog-entry justify-content-end">
					              <div class="text">
					                <a href="blog-single.html" class="block-20 img" style="background-image: url('images/image_2.jpg');">
						              </a>
						              <p>맛있어보이는 냉면!</p>
					                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
					              </div>
					            </div>
					          </div>
					          <div class="col-md-4 d-flex ftco-animate">
					          	<div class="blog-entry justify-content-end">
					              <div class="text">
					                <a href="blog-single.html" class="block-20 img" style="background-image: url('images/image_3.jpg');">
						              </a>
						              <p>맛있어보이는 아이스크림!</p>
					                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
					              </div>
					            </div>
					          </div>
		        		</div>
					          <div class="row mt-5">
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
						          </div>
					        	</div>
		        </article>
		    </div>  
   <!-- main -->
    <section class="ftco-section ftco-agent">
    	<div class="container">
    		<div class="row">
      		<div class="col-md-12 pills">
						<div class="bd-example bd-example-tabs">
							<div class="d-flex justify-content-center">
							  <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
							  	<li class="nav-item">
							      <a class="nav-link active" id="pills-description-tab" data-toggle="pill" href="#pills-descriptio" role="tab" aria-controls="pills-description" aria-expanded="true">인기 맛집</a>
							    </li>
							    <li class="nav-item">
							      <a class="nav-link" id="pills-description-tab" data-toggle="pill" href="#pills-description" role="tab" aria-controls="pills-description" aria-expanded="true">회원 추천</a>
							    </li>

							  </ul>
							</div>
						
						
						  <div class="tab-content" id="pills-tabContent">
						  
						  <!-- 인기 맛집 -->
						  	<div class="tab-pane fade show active" id="pills-descriptio" role="tabpanel" aria-labelledby="pills-description-tab">
						    						      <div class="row">
					        	<div class="col-md-3">
					        		<div class="agent">
					    					<div class="img">
							    				<img style="width: 100%; height: 300px;" src="images/1.jpg" class="img-fluid" alt="Colorlib Template">
						    				</div>
						    				<div class="desc">
						    					<h3><a href="storeInfoBefore.jsp">James Stallon</a></h3>
													<p class="h-info"><span class="location">Listing</span> <span class="details">— 10 storeInfoBefore</span></p>
						    				</div>
					    				</div>
					        	</div>
					        	<div class="col-md-3">
					        		<div class="agent">
					    					<div class="img">
							    				<img style="width: 100%; height: 300px;" src="images/2.jpg" class="img-fluid" alt="Colorlib Template">
						    				</div>
						    				<div class="desc">
						    					<h3><a href="storeInfoBefore.jsp">James Stallon</a></h3>
													<p class="h-info"><span class="location">Listing</span> <span class="details">— 10 storeInfoBefore</span></p>
						    				</div>
					    				</div>
					        	</div>
					        	<div class="col-md-3">
					        		<div class="agent">
					    					<div class="img">
							    				<img style="width: 100%; height: 300px;" src="images/3.jpg" class="img-fluid" alt="Colorlib Template">
						    				</div>
						    				<div class="desc">
						    					<h3><a href="storeInfoBefore.jsp">James Stallon</a></h3>
													<p class="h-info"><span class="location">Listing</span> <span class="details">— 10 storeInfoBefore</span></p>
						    				</div>
					    				</div>
					        	</div>
					        	<div class="col-md-3">
					        		<div class="agent">
					    					<div class="img">
							    				<img style="width: 100%; height: 300px;" src="images/4.jpg" class="img-fluid" alt="Colorlib Template">
						    				</div>
						    				<div class="desc">
						    					<h3><a href="storeInfoBefore.jsp">James Stallon</a></h3>
													<p class="h-info"><span class="position">Listing</span> <span class="details">— 10 storeInfoBefore</span></p>
						    				</div>
					    				</div>
					        	</div>
					
					        	<div class="col-md-3">
					        		<div class="agent">
					    					<div class="img">
							    				<img style="width: 100%; height: 300px;" src="images/5.jpg" class="img-fluid" alt="Colorlib Template">
						    				</div>
						    				<div class="desc">
						    					<h3><a href="storeInfoBefore.jsp">James Stallon</a></h3>
													<p class="h-info"><span class="location">Listing</span> <span class="details">— 10 storeInfoBefore</span></p>
						    				</div>
					    				</div>
					        	</div>
					        	<div class="col-md-3">
					        		<div class="agent">
					    					<div class="img">
							    				<img style="width: 100%; height: 300px;" src="images/6.jpg" class="img-fluid" alt="Colorlib Template">
						    				</div>
						    				<div class="desc">
						    					<h3><a href="storeInfoBefore.jsp">James Stallon</a></h3>
													<p class="h-info"><span class="location">Listing</span> <span class="details">— 10 storeInfoBefore</span></p>
						    				</div>
					    				</div>
					        	</div>
					        	<div class="col-md-3">
					        		<div class="agent">
					    					<div class="img">
							    				<img style="width: 100%; height: 300px;" src="images/7.jpg" class="img-fluid" alt="Colorlib Template">
						    				</div>
						    				<div class="desc">
						    					<h3><a href="storeInfoBefore.jsp">James Stallon</a></h3>
													<p class="h-info"><span class="location">Listing</span> <span class="details">— 10 storeInfoBefore</span></p>
						    				</div>
					    				</div>
					        	</div>
					        	<div class="col-md-3">
					        		<div class="agent">
					    					<div class="img">
							    				<img style="width: 100%; height: 300px;" src="images/8.jpg" class="img-fluid" alt="Colorlib Template">
						    				</div>
						    				<div class="desc">
						    					<h3><a href="storeInfoBefore.jsp">James Stallon</a></h3>
													<p class="h-info"><span class="position">Listing</span> <span class="details">— 10 storeInfoBefore</span></p>
						    				</div>
					    				</div>
					        	</div>
						    </div>
						    </div>
						  
						  <!-- 회원 추천 -->
						    <div class="tab-pane fade" id="pills-description" role="tabpanel" aria-labelledby="pills-description-tab">
						    						      <div class="row">
					        	<div class="col-md-3">
					        		<div class="agent">
					    					<div class="img">
							    				<img style="width: 100%; height: 300px;" src="images/2.jpg" class="img-fluid" alt="Colorlib Template">
						    				</div>
						    				<div class="desc">
						    					<h3><a href="storeInfoBefore.jsp">James Stallon</a></h3>
													<p class="h-info"><span class="location">Listing</span> <span class="details">— 10 storeInfoBefore</span></p>
						    				</div>
					    				</div>
					        	</div>
					        	<div class="col-md-3">
					        		<div class="agent">
					    					<div class="img">
							    				<img style="width: 100%; height: 300px;" src="images/1.jpg" class="img-fluid" alt="Colorlib Template">
						    				</div>
						    				<div class="desc">
						    					<h3><a href="storeInfoBefore.jsp">James Stallon</a></h3>
													<p class="h-info"><span class="location">Listing</span> <span class="details">— 10 storeInfoBefore</span></p>
						    				</div>
					    				</div>
					        	</div>
					        	<div class="col-md-3">
					        		<div class="agent">
					    					<div class="img">
							    				<img style="width: 100%; height: 300px;" src="images/3.jpg" class="img-fluid" alt="Colorlib Template">
						    				</div>
						    				<div class="desc">
						    					<h3><a href="storeInfoBefore.jsp">James Stallon</a></h3>
													<p class="h-info"><span class="location">Listing</span> <span class="details">— 10 storeInfoBefore</span></p>
						    				</div>
					    				</div>
					        	</div>
					        	<div class="col-md-3">
					        		<div class="agent">
					    					<div class="img">
							    				<img style="width: 100%; height: 300px;" src="images/4.jpg" class="img-fluid" alt="Colorlib Template">
						    				</div>
						    				<div class="desc">
						    					<h3><a href="storeInfoBefore.jsp">James Stallon</a></h3>
													<p class="h-info"><span class="position">Listing</span> <span class="details">— 10 storeInfoBefore</span></p>
						    				</div>
					    				</div>
					        	</div>
					
					        	<div class="col-md-3">
					        		<div class="agent">
					    					<div class="img">
							    				<img style="width: 100%; height: 300px;" src="images/5.jpg" class="img-fluid" alt="Colorlib Template">
						    				</div>
						    				<div class="desc">
						    					<h3><a href="storeInfoBefore.jsp">James Stallon</a></h3>
													<p class="h-info"><span class="location">Listing</span> <span class="details">— 10 storeInfoBefore</span></p>
						    				</div>
					    				</div>
					        	</div>
					        	<div class="col-md-3">
					        		<div class="agent">
					    					<div class="img">
							    				<img style="width: 100%; height: 300px;" src="images/6.jpg" class="img-fluid" alt="Colorlib Template">
						    				</div>
						    				<div class="desc">
						    					<h3><a href="storeInfoBefore.jsp">James Stallon</a></h3>
													<p class="h-info"><span class="location">Listing</span> <span class="details">— 10 storeInfoBefore</span></p>
						    				</div>
					    				</div>
					        	</div>
					        	<div class="col-md-3">
					        		<div class="agent">
					    					<div class="img">
							    				<img style="width: 100%; height: 300px;" src="images/7.jpg" class="img-fluid" alt="Colorlib Template">
						    				</div>
						    				<div class="desc">
						    					<h3><a href="storeInfoBefore.jsp">James Stallon</a></h3>
													<p class="h-info"><span class="location">Listing</span> <span class="details">— 10 storeInfoBefore</span></p>
						    				</div>
					    				</div>
					        	</div>
					        	<div class="col-md-3">
					        		<div class="agent">
					    					<div class="img">
							    				<img style="width: 100%; height: 300px;" src="images/8.jpg" class="img-fluid" alt="Colorlib Template">
						    				</div>
						    				<div class="desc">
						    					<h3><a href="storeInfoBefore.jsp">James Stallon</a></h3>
													<p class="h-info"><span class="position">Listing</span> <span class="details">— 10 storeInfoBefore</span></p>
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
    </section>
 

	<!-- footer -->
    <footer class="ftco-footer ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Uptown</h2>
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


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
  
  <script src="js/popup.js"></script>
  <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
  <script>var contextPath = "${pageContext.request.contextPath}";</script>
  
    
  </body>
</html>