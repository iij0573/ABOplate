<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="kor">
<head>
<title>메인페이지</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link "WebContent/main.jsp"rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">

<link href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" rel="Stylesheet"></link>

</head>
<!-- 페이지 시작 때 popular list 불러옴 -->
<body onload="javascript:goDetail();">
	
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">ABO PLATE</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse dropmenu" id="ftco-nav">

				<ul class="navbar-nav ml-auto" id="dm_ul">
					<c:choose>
						<c:when test="${memberBean ne null}">
						  <li class="nav-item"><p class="nav-p">${memberBean.getMember_nickname()}님</p></li>
				      <li class="nav-item"><p class="nav-p">${memberBean.getMember_stamp()}점</p></li>
				    </c:when>
				  </c:choose>
					<c:choose>
					<c:when test="${sessionId eq null}">
						<li class="nav-item"><a href="./member/login.jsp" class="nav-link">로그인</a></li>
						<li class="nav-item"><a href="./member/signup.jsp" class="nav-link">회원가입</a></li>
					</c:when>
					<c:otherwise>
						  <li class="nav-item"><a href="${pageContext.request.contextPath}/restaurant/restaurantBookmark.re" class="nav-link">즐겨찾기</a></li>
				          <li class="nav-item"><a href="${pageContext.request.contextPath}/member/mypage.me" class="nav-link">마이페이지</a></li>
				          <li class="nav-item"><a href="${pageContext.request.contextPath}/member/MemberLogOut.me" class="nav-link">로그아웃</a></li>
					</c:otherwise>
					</c:choose>
					<li class="nav-item"><a href="other/event.jsp" class="nav-link">이벤트</a></li>
					<li class="nav-item"><a class="nav-link">최근본 맛집</a>
						<ul>
							<li>
								<div class="flavor">
									<div class="d-flex">
										<a href="restaurant/storeInfoBefore.jsp"> <img
											src="images/image_1.jpg" style="width: 100px;"></img>aaaa
										</a>
									</div>
								</div>
							</li>
							<li>
								<div class="flavor">
									<div class="d-flex">
										<a href="restaurant/storeInfoBefore.jsp"> <img
											src="images/image_2.jpg" style="width: 100px;"></img>bbbb
										</a>
									</div>
								</div>
							</li>
							<li>
								<div class="flavor">
									<div class="d-flex">
										<a href="restaurant/storeInfoBefore.jsp"> <img
											src="images/image_3.jpg" style="width: 100px;"></img>cccc
										</a>
									</div>
								</div>
							</li>
							<li>
								<div class="flavor">
									<div class="d-flex">
										<a href="restaurant/storeInfoBefore.jsp"> <img
											src="images/image_4.jpg" style="width: 100px;"></img>dddd
										</a>
									</div>
								</div>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<section class="hero-wrap hero-wrap-2 ftco-degree-bg js-fullheight"
		style="background-image: url('images/main.jpg'); background-position: center bottom; background-size: cover;"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate pb-5 text-center fadeInUp ftco-animated">
					<div style="margin: 0 auto;">
						<form method="get" action="${pageContext.request.contextPath}/restaurant/RestaurantSearch.re" class="search-location mt-md-5">
							<div class="row justify-content-center">
								<div class="form-group">
									<div class="form-field">
										<select class="form-control" id="filter" name="keyField">
											<option value='restaurant_name' selected>전체</option>
											<option value='restaurant_food_category'>음식 종류</option>
											<option value='restaurant_address'>주소</option>
											<option value='restaurant_best'>모범 음식점</option>
										</select>
									</div>
								</div>
								<div class="col-lg-8 align-items-end">
									<div class="form-group">
										<div class="form-field">
											<input type="text" class="form-control" placeholder="Search location" id="search" name="keyWord">
											<button onclick="${pageContext.request.contextPath}/restaurant/RestaurantSearch.re">
												<span class="ion-ios-search"></span>
											</button>
										</div>
									</div>
								</div>
								
								<p>${requestScope.restaurantBean}</p>
								<div class="col-lg-5 align-items-end">
									<!-- 실검 -->
									<div style="color:white;">실시간 차트</div>
									<ul id="scroll" style="background-color:white; margin-bottom:5px; padding:0; height:30px;" >
										<c:choose>
											<c:when test="${list ne null and fn:length(list) > 0}">
												<c:forEach var="restaurantBean" items="${list}">
														<li>
															<a href="${pageContext.request.contextPath}/restaurant/RestaurantView.re?restaurantNum=${restaurantBean.getRestaurant_num()}">${restaurantBean.getRestaurant_name()}</a>
														</li>
												</c:forEach>
											</c:when>
										</c:choose>
									</ul>
									
									<div class="form-group">
										<div class="form-field">
											<input type="button" value="지역화폐"
												class="btn btn-primary py-3 px-5"
												onclick="location.href = '${pageContext.request.contextPath}/restaurant/restaurantLocalCurrency.re'"
												style="position: relative;">
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
	<div class="container">
		<div id="layerbox" class="layerpop"
			style="height: 300px; border-radius: 5% !important;">
			<article class="layerpop_area">
				<div class="title"
					style="color: red; border-radius: 15% 15% 0% 0% !important;">경고
					회원가입 금지</div>
				<a href="javascript:popupClose();" class="layerpop_close"
					id="layerbox_close">X</a><br>
				<div class="content">
					<p>이 페이지는 테스트용 페이지입니다.</p>
					<br>
					<p>따라서 회원가입으로 어떠한 혜택도 받으실 수 없고 넘겨진 개인정보는 즉시 파기할 것입니다.</p>
					<br>
				</div>
			</article>
		</div>
	</div>

	<section class="ftco-section ftco-agent">
		<div class="container">
			<div class="row">
				<div class="col-md-12 pills">
					<div class="bd-example bd-example-tabs">
						<div class="d-flex justify-content-center">
							<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="pills-description-tab" data-toggle="pill"
									href="#pills-description" role="tab"
									aria-controls="pills-description" aria-expanded="true">인기맛집</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									id="pills-manufacturer-tab" data-toggle="pill"
									href="#pills-manufacturer" role="tab"
									aria-controls="pills-manufacturer" aria-expanded="true">회원추천</a>
								</li>
							</ul>
						</div>


						<div class="tab-content" id="pills-tabContent">
							<!-- 인기 맛집 -->
							<div class="tab-pane fade show active" id="pills-description"
								role="tabpanel" aria-labelledby="pills-description-tab">
								<div class="row">
									<c:choose>
									<c:when test="${popularList ne null and fn:length(popularList) > 0}">
										<c:forEach var="restaurantBean" items="${popularList}">
											<div class="col-md-3">
												<div class="agent">
													<div class="img">
														<a href="${pageContext.request.contextPath}/restaurant/RestaurantView.re?restaurantNum=${restaurantBean.getRestaurant_num()}">
															<img style="width: 100%; height: 300px;"
																src="${pageContext.request.contextPath}/restaurantImages/${restaurantBean.getRestaurant_num()}.jpg"
																class="img-fluid" alt="Colorlib Template">
														</a>
													</div>
													<div class="desc">
														<h3>
															<a href="${pageContext.request.contextPath}/restaurant/RestaurantView.re?restaurantNum=${restaurantBean.getRestaurant_num()}">
															${restaurantBean.getRestaurant_name()}
															</a>
														</h3>
														<p class="h-info">
															<a href="${pageContext.request.contextPath}/restaurant/RestaurantView.re?restaurantNum=${restaurantBean.getRestaurant_num()}">
																<span class="location">${restaurantBean.getRestaurant_address()}</span>
																<span class="details">${restaurantBean.getRestaurant_food_category()}</span>
															</a>
														</p>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:when>
									</c:choose>
								</div>
							</div>

							<!-- 회원 추천 -->
							<div class="tab-pane fade" id="pills-manufacturer"
								role="tabpanel" aria-labelledby="pills-description-tab">
								<div class="row">
									<c:choose>
									<c:when test="${sessionId eq null}">
										<div style="margin: 0 auto;">
											<h5 style="text-align: center;">로그인(회원가입)을 하시면 맞춤 맛집을
												추천해드립니다</h5>
											<div class="justify-content-center"
												style="text-align: center;">
												<input type="button" style="margin-bottom: 15px" value="로그인"
													class="btn btn-primary py-3"
													onClick="location.href='./member/login.jsp'"> <input
													type="button" style="margin-bottom: 15px" value="회원가입"
													class="btn btn-primary py-3"
													onClick="location.href='./member/signup.jsp'">
											</div>
										</div>
									</c:when>

									<c:when test="${memberBean.getMember_type() == 2}">
										<div style="margin: 0 auto;">
											<h5 style="text-align: center;">회원정보를 입력하시면 맞춤 맛집을 추천해드립니다.</h5>
											<div class="justify-content-center"
												style="text-align: center;">
												<input type="button" style="margin-bottom: 15px" value="마이페이지"
													class="btn btn-primary py-3"
													onClick="location.href='./member/mypage.me">
											</div>
										</div>
									</c:when>

									<c:when test="${memberBean.getMember_type() == 1}">
										<c:choose>
											<c:when test="${recommendList != null and fn:length(recommendList) > 0}">
												<c:forEach var="restaurantBean" items="${recommendList}">
													<div class="col-md-3">
														<div class="agent">
															<div class="img">
															<a href="${pageContext.request.contextPath}/restaurant/RestaurantView.re?restaurantNum=${restaurantBean.getRestaurant_num()}">
																<img style="width: 100%; height: 300px;"
																src="${pageContext.request.contextPath}/restaurantImages/${restaurantBean.getRestaurant_num()}.jpg"
																	class="img-fluid" alt="Colorlib Template"></a>
															</div>
															<div class="desc">
																<h3>
																	<a href="${pageContext.request.contextPath}/restaurant/RestaurantView.re?restaurantNum=${restaurantBean.getRestaurant_num()}">
																	${restaurantBean.getRestaurant_name()}
																	</a>
																</h3>
																<a href="${pageContext.request.contextPath}/restaurant/RestaurantView.re?restaurantNum=${restaurantBean.getRestaurant_num()}">
																	<span class="location">${restaurantBean.getRestaurant_address()}</span>
																	<span class="details">${restaurantBean.getRestaurant_food_category()}</span>
																</a>
															</div>
														</div>
													</div>
												</c:forEach>
											</c:when>
										</c:choose>
									</c:when>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="ftco-footer ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">ABOplate</h2>
						<p>Far far away, behind the word mountains, far from the
							countries.</p>
						<ul class="ftco-footer-social list-unstyled mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-4">
						<h2 class="ftco-heading-2">Community</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Search
									restaurant</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>For
									Agents</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Reviews</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>FAQs</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-4">
						<h2 class="ftco-heading-2">About Us</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Our
									Story</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Meet
									the team</a></li>
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Careers</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Company</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>About
									Us</a></li>
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
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope pr-4"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>


	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>
	
	<script src="./js/jquery.min.js"></script>
	<script src="./js/jquery-migrate-3.0.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/jquery.easing.1.3.js"></script>
	<script src="./js/jquery.waypoints.min.js"></script>
	<script src="./js/jquery.stellar.min.js"></script>
	<script src="./js/owl.carousel.min.js"></script>
	<script src="./js/jquery.magnific-popup.min.js"></script>
	<script src="./js/aos.js"></script>
	<script src="./js/jquery.animateNumber.min.js"></script>
	<script src="./js/bootstrap-datepicker.js"></script>
	<script src="./js/jquery.timepicker.min.js"></script>
	<script src="./js/scrollax.min.js"></script>
	<script src="./js/main.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- 	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script> -->
	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
	<script src="./js/search.autocomplete.js?ver=123"></script>
	<script src="./js/popup.js"></script>
	<script>var contextPath = "${pageContext.request.contextPath}";</script>
</html>
