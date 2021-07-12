<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="kor">
<head>
<title>회원가입정보입력</title>
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
	<section class="ftco-section contact-section">
      <div class="container">
        <div class="row block-9 justify-content-center mb-5">
          <div class="col-md-6 mb-md-5">
          	<a class="navbar-brand" href="../index.jsp" style="font-size:56px;"><img src="../images/ABO.png"/></a>
            <form name="joinForm" action="${pageContext.request.contextPath}/member/MemberJoinOk.me" class="p-5 bg-light" method="post">
            	  <div class="form-group">
                    <label for="id">아이디 </label>
                    <input type="text" class="form-control check" id="id" name="memberId" >
                    <p id="idCheckText"></p>
                  </div>
                  <div class="form-group">
                    <label for="name">이름</label>
                    <input type="text" class="form-control" id="name" name="memberName" >
                  </div>
                  <div class="form-group">
                    <label for="email">이메일</label>
                    <input type="email" class="form-control" id="email" name="memberEmail" >
                    <input type="button" id ="checkEmail" name="memberCerNumber" value="인증번호 받기"  onClick ="sendEmail()"class="btn btn-primary py-3 p=x-5" style="padding: 15px;">
                  	<input type="text" id="verifyNum" name="numberKey" style="padding: 15px; display: none;" >
                  	<input type="button" id="resendEmail" name="resendMail" value="재전송" onclick="sendEmail()" class="btn btn-primary py-3 p=x-5" style="padding: 15px; display: none;">
                  	<input type="button" id="checkVerifyEmail" name="verifyEmail" value="인증" onclick="clickEmail()" class="btn btn-primary py-3 p=x-5" style="padding: 15px; display: none;" >
                  	<p id="emailCheckText"></p>
                  </div>
                  <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input type="password" class="form-control" id="password" name="memberPassword">
                  
                  </div>
                  <div class="form-group">
                    <label for="password">비밀번호 확인</label>
                    <input type="password" class="form-control" id="password" name="memberRePassword" >
               
                  </div>
                  <div class="form-group">
                    <label for="nickname">닉네임</label>
                    <input type="text" class="form-control" id="nickname" name="memberNickname" >
                    <p id="nicknameCheckText"></p>
                  </div>
               
                  <div class="form-group" >
                    <label for="favorite"> 선호음식 : </label>
                    <input type="checkbox" class="check" id="favorite" name="memberFavorite" value="korean">
                    <label for="demo-human" style="position: static;"> 
					한식
					</label>
                    <input type="checkbox" id="favorite" name="memberFavorite" value="chinese">
                    <label for="demo-human" style="position: static;"> 
					중식
					</label>
                    <input type="checkbox" id="favorite" name="memberFavorite" value="japanese">
                    <label for="demo-human" style="position: static;"> 
					일식
					</label>
                    <input type="checkbox" id="favorite" name="memberFavorite" value="american">
                    <label for="demo-human" style="position: static;"> 
					양식
					</label>
                  </div>
 
                  <div class="form-group">
                    <label for="memberRegion">지역</label>
                   	<div class="form-group"><select style="width: 150px; font-size: 13px;" class="form-control check" name="memberRegion" required>
										<option value=''>선택하세요</option>
										<option value='Gwangjin'>광진구</option>
										<option value='Seocho'>서초구</option>
										<option value='Seongdong'>성동구</option>
										<option value='Yangcheon'>양천구</option>
										<option value='Yongsan'>용산구</option>
										<option value='Eunpyeong'>은평구</option>
										<option value='Jongno'>종로구</option>
										<option value='Jungnang'>중랑구</option>
										<option value='Goyang'>고양시</option>
										<option value='Suwon'>수원시</option>
										<option value='Yongin'>용인시</option>
										
								</select>
					</div>
                  </div>
                  <div class="form-group justify-content-center">
                  	<input type="button" style="width:100%;" value="가입" onclick="javascript:formSubmit()" class="btn py-3 btn-primary">
                  </div>
                </form>
                
            
          </div>
        </div>
      </div>
    </section>
	<script>
	
	
	</script>

	
</body>
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
<script src="../js/main.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
<script src="${pageContext.request.contextPath}/member/memberJs/test.js"></script>

</html>
