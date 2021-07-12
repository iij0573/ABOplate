/**
 * formSubmit() 회원가입 필수항목 검사 checkid(id) 회원가입 아이디 중복검사
 * signup2에서 쓰이는 메소드
 */
var idCheck = false;
var nicknameCheck = false;
var emailCheck = false;
var favoriteOk = false;

function formSubmit() {
  	var form = document.joinForm;

	if ('' == form.memberId.value || !idCheck) {
		alert("아이디를 확인해주세요");
		form.memberId.focus();
		return false;

	} else if ('' == form.memberName.value) {
		alert("이름을 입력해주세요");
		form.memberName.focus();
		return false;
	} else if ('' == form.memberEmail.value || !emailCheck) {
		alert("이메일을 입력해주세요");
		
		form.memberEmail.focus();
		return false;

	} else if ('' == form.memberPassword.value) {
		alert("비밀번호를 입력해주세요");
		form.memberPassword.focus();
		return false;
	} else if ('' == form.memberRePassword.value) {
		alert("비밀번호 확인을 입력해주세요");
		form.memberRePassword.focus();
		return false;
	} else if (form.memberPassword.value != form.memberRePassword.value) {
		form.memberRePassword.focus();
		alert("비밀번호 확인이 일치하지 않습니다");
		return false;
	} else if ('' == form.memberNickname.value || !nicknameCheck) {
		alert("닉네임을 확인해주세요");
		form.memberNickname.focus();
		return false;
	}else if(!$("input:checkbox[name=memberFavorite]").is(":checked")){
			
			
				alert("선호음식을 입력하세요");
			
		return false;
	} 
	else if(!$("select[name=memberRegion] option:selected").val()){
		console.log("regioncheck1");
		
		
			alert("지역을 선택하세요");
		
		return false;
	}
		
	

	form.submit();
}

function checkid(id) {

	if (id == "") {

		$("#idCheckText").text("아이디를 작성해주세요.");

	} else {
		$.ajax({
			url : contextPath + "/member/MemberCheckIdOk.me?id=" + id,

			type : 'get',
			dataType : 'text',
			success : function(data) {

				if (data.trim() == 'ok') {
					$("#idCheckText").text("사용할 수 있는 아이디입니다.");
					idCheck = true;
				} else {

					$("#idCheckText").text("중복된 아이디입니다.");
					idCheck = false;
				}
			},
			error : function() {
				console.log("오류");
			}
		})
	}
}
$("input[name='memberId']").focusout(function(event) {
	var id = $("input[name='memberId']").val();
	checkid(id);

})


function checknickname(nickname) {

	if (nickname == "") {
		$("#nicknameCheckText").text("nickname을 작성해주세요.");
	} else {
		$.ajax({
			url : contextPath + "/member/MemberCheckNickname.me?nickname="
					+ nickname,

			type : 'get',
			dataType : 'text',
			success : function(data) {

				if (data.trim() == 'ok') {
					$("#nicknameCheckText").text("사용할 수 있는 닉네임입니다.");
					nicknameCheck = true;

				} else {
					$("#nicknameCheckText").text("중복된 닉네임입니다.");
					nicknameCheck = false;
				}
			},
			error : function() {
				console.log("오류");
			}
		})
	}
}
$("input[name='memberNickname']").focusout(function(event) {
	var nickname = $("input[name='memberNickname']").val();
	checknickname(nickname);
})


/*
 * 인증번호 받기 버튼을 누르면 ajax를 써서 sendEmailOkAction으로 보내줌(.me를 통해) 그러면 action통해서 위에
 * ajax처럼 pw가 매개변수로 전달됨 거기서 받은 값 변수에 저장, 버튼 이름 재전송으로 바꾸고 input태그랑 버튼 생성(보이게)
 *
 * input태그에 적은 값 버튼을 통해 받으면 받은 변수를 비교 같으면 input이랑 버튼 없애고 인증 표시 근데 인증 받고 다른 이메일 칠
 * 수도 있으니까 1. 이메일은 readonly를 주든 해서 못바꾸게 하기 2. 이메일 바꾸면 다시 인증버튼 만들어주고 재 인증 받게 하기
 * 둘중에 선택해서 하시면 될듯
 */
/* 인증번호 받기를 누를때 checkemail해주기 */
// 클릭 할 때 마다 비밀번호 받아오기 function sendEmail
var verifyKey;
function sendEmail() {
	
	var regEmail= /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		
		if(!regEmail.test($("input[name='memberEmail']").val())){
					alert("이메일 주소가 유효하지 않습니다.");
					form.memberEmail.focus();
					
			}
		
		else{
			$.ajax({
		url : contextPath + "/member/MemberVerifyEmail.me?memberEmail="
				+ $("input[name='memberEmail']").val(),
		type : 'get',
		dataType : 'text',
		success : function(pw) {
			verifyKey = pw.trim();
			console.log(pw.trim());
			$("#checkEmail").hide();
			$("#resendEmail").show();
			$("#verifyNum").show();
			$("#checkVerifyEmail").show();
		},
		error : function() {
			console.log("오류");
		}
	})
				}
}

function clickEmail() {
	var checkkey = $("input[name='numberKey']").val();
	console.log(verifyKey);
	console.log(checkkey);
	if (checkkey == verifyKey) {
		$("#resendEmail").hide();
		$("#verifyNum").hide();
		$("#checkVerifyEmail").hide();
		$("#emailCheckText").text("인증완료");
		$("input[name='memberEmail']").attr("readonly", true);
		emailCheck = true;
		// email 인증 체크 boolean 변수 true
	} else {
		console.log("다름");
		emailCheck = false;
	}
}

// signup 에서 쓰이는 메소드
$(document).ready(function() {
	$('.check-all').click(function() {
		$('.check').prop('checked', this.checked);
	})
})

$(document).ready(function() {
	$('.check').click(function() {
		$('.check-all').prop('checked', this.checked);
	})
})
