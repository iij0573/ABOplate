<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>       
<!DOCTYPE html>
<html lang="kor">
<head>
<title>마이페이지</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap"
	rel="stylesheet">

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
		<c:set var="memberBean" value="${requestScope.memberBean}"/>
		<c:set var="List" value="${requestScope.memberReviewList}"/>
		<c:set var="nowPage" value="${requestScope.nowPage}"/>
		<c:set var="startPage" value="${requestScope.startPage}"/>
		<c:set var="endPage" value="${requestScope.endPage}"/>
		<c:set var="totalCnt" value="${requestScope.totalCnt}"/>
		<c:set var="totalPage" value="${requestScope.totalPage}"/>

	
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="${pageContext.request.contextPath}/main.jsp">ABO PLATE</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>
		
	      <div class="collapse navbar-collapse" id="ftco-nav">

	        <ul class="navbar-nav ml-auto">
			<c:choose>
			<c:when test="${sessionId eq null}">
				<li class="nav-item"><a href="../member/login.jsp" class="nav-link">로그인</a></li>
				<li class="nav-item"><a href="../member/signup.jsp" class="nav-link">회원가입</a></li>
			</c:when>
			<c:otherwise>
				<li class="nav-item"><p class="nav-p">${memberBean.getMember_nickname()}님</p></li>
		      	<li class="nav-item"><p class="nav-p">${memberBean.getMember_stamp()}점</p></li>
		      	<li class="nav-item"><a href="${pageContext.request.contextPath}/member/mypage.me" class="nav-link">마이페이지</a></li>
		      	<li class="nav-item"><a href="${pageContext.request.contextPath}/member/MemberLogOut.me" class="nav-link">로그아웃</a></li>
		        <li class="nav-item"><a href="${pageContext.request.contextPath}/restaurant/restaurantBookmark.re" class="nav-link">즐겨찾기</a></li>
			</c:otherwise>
			</c:choose>
	          <li class="nav-item"><a href="../other/event.jsp" class="nav-link">이벤트</a></li>
	          <li class="nav-item"><a href="#" class="nav-link">최근 본 맛집</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	<!-- END nav -->
	
	  <section class="hero-wrap2 hero-wrap-2 ftco-degree-bg js-fullheight" style="background-image: url('../images/main.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          
            <p class="mb-3 bread" style="position: relative; top: 50px; font-size: 30px;">마이페이지</p>

        </div>
      </div>
    </section>

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
									aria-controls="pills-description" aria-expanded="true">리뷰관리</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									id="pills-manufacturer-tab" data-toggle="pill"
									href="#pills-manufacturer" role="tab"
									aria-controls="pills-manufacturer" aria-expanded="true">회원정보</a>
								</li>
							</ul>
						</div>


						<div class="tab-content" id="pills-tabContent">
							<!-- 리뷰 -->
							<div class="tab-pane fade show active" id="pills-description"
								role="tabpanel" aria-labelledby="pills-description-tab">
											<c:choose>
											<c:when test="${List != null and fn:length(List) > 0}">	
											<c:forEach var="reviewList" items="${List}">
											<div class="row" style="margin-top:5px !important;">
								        	<div class="col-md-3" style="background-color:#ffcd3c !important;">
								        		<div class="agent">
								    					<div class="img">
										    				<img style="height:200px; width:100%;" src="${pageContext.request.contextPath}/restaurantImages/${reviewList.get(0).getRestaurant_num()}.jpg" class="img-fluid" alt="Colorlib Template">
									    				</div>
									    				<div class="desc">
									    					<h3><a href="storeInfoBefore.jsp">${reviewList.get(1).getRestaurant_name()}</a></h3>
																<p class="h-info">
																<span>
											   					<c:forEach var="i" begin="1" end="${reviewList.get(0).getReview_ration()}">
																	<i class="ion-ios-star"></i>
																</c:forEach>
										   					</span>
																</p>
									    				</div>
								    				</div>
								        	</div>
								        			<input type="text" readonly maxlength="50" style="width:50%;" value="${reviewList.get(0).getReview()}" class="sort">
								        			<input type="button" onclick="location.href ='${pageContext.request.contextPath}/restaurant/ReviewModify.re?reviewNum=${reviewList.get(0).getReview_num()}&restaurantNum=${reviewList.get(0).getRestaurant_num()}'" value="수정" style="margin-right:5px;" class="btn btn-primary py-3 p=x-5 sort">
		              								<input type="button" onclick="location.href ='${pageContext.request.contextPath}/restaurant/ReviewDeleteOk.re?reviewNum=${reviewList.get(0).getReview_num()}&restaurantNum=${reviewList.get(0).getRestaurant_num()}'" value="삭제" class="btn btn-primary py-3 p=x-5 sort">
								        	</div>
								        	</c:forEach>
										   	</c:when>
											<c:otherwise>
												<div class="review d-flex">
										   			<p>작성한 리뷰가 없습니다.</p>
										   		</div>
											</c:otherwise>
											</c:choose>
								<br/>
										<br/>

									   	<div class="review d-flex">
									   			<div class="col text-center">
            										<div class="block-27">
											              <ul>
											              <c:choose>
															<c:when test="${nowPage > 1}">
											                	<li><a href="${pageContext.request.contextPath}/member/mypage.me?page=${nowPage - 1}">&lt;</a></li>
											                </c:when>
														</c:choose>
														<c:forEach var="i" begin="${startPage}" end="${endPage}">
															<c:choose>
																<c:when test="${i eq nowPage}">
																	<li><a>${i}</a></li>
																</c:when>
																<c:otherwise>
																	<li><a href="${pageContext.request.contextPath}/member/mypage.me?page=${i}">${i}</a></li>
																</c:otherwise>
															</c:choose>
														</c:forEach>
														<c:choose>
															<c:when test="${nowPage < totalPage}">
																<li><a href="${pageContext.request.contextPath}/member/mypage.mepage=${nowPage + 1}">&gt;</a></li>
															</c:when>
														</c:choose>
											              </ul>
											            </div>
											          </div>
									   		</div>

							</div>

							<!-- 회원 정보 -->
							<div class="tab-pane fade" id="pills-manufacturer" role="tabpanel" aria-labelledby="pills-description-tab">
						     <form class="bg-light p-5 contact-form">
						     	<div class="row block-9 justify-content-center mb-5">
						     	<div class="col-md-6 mb-md-5">
						     	  <div class="form-group">
				                    <label for="id">아이디</label>
				                    <input type="text" class="form-control" id="id" value="${sessionId}" readonly>
				                  </div>
						     	  <div class="form-group">
				                    <label for="name">이름</label>
				                    <input type="text" class="form-control" id="name" readonly value="${memberBean.getMember_name()}">
				                  </div>
						     	  <div class="form-group">
				                    <label for="email">이메일</label>
				                    <input type="email" class="form-control" id="email" readonly value="${memberBean.getMember_email()}">
				                  </div>
				                  <div class="form-group">
				                    <label for="nickname">닉네임</label>
				                    <input type="text" class="form-control" id="nickname" readonly value="${memberBean.getMember_nickname()}">
				                  </div>
				                  <div class="form-group">
				                    <label for="favorite">선호음식</label>
				                    <input type="text" class="form-control" id="favorite" readonly value="${memberBean.getMember_preference_food()}">
				                  </div>
				                  <div class="form-group">
				                    <label for="">지역</label>
				                    <input type="text" class="form-control" id="" readonly value="${memberBean.getMember_region()}">
				                  </div>
							<div class="form-group">
								<div class="d-flex justify-content-center">
								<input type="button" value="수정" onclick="location.href ='${pageContext.request.contextPath}/member/MemberModify.me'" style="margin-right:10px !important;" class="btn btn-primary py-3 p=x-5" >
	              				<input type="submit" value="탈퇴" onclick="location.href ='${pageContext.request.contextPath}/member/MemberDelete.me'" class="btn btn-primary py-3 p=x-5">
								</div>
	             			 </div>
	             			 </div>
	             			 </div>
						     </form>
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
									storeInfoBefore</a></li>
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
	
	<script src="${pageContext.request.contextPath}/member/MemberInfo.me"></script>
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
	<script src="../js/main.js"></script>
	
	<script>
	function change(){
		var obj = document.querySelectorAll(".num");
		obj.forEach(function(element){
			element.style.borderColor = 'red';
		});
	}
	</script>

</body>
</html>