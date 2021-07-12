var idCheck = false;
var nicknameCheck = false;

function modifySubmit() {
  	var form = document.modifyForm;
 	 if ('' == form.newMemberPassword.value) {
		alert("새로운 비밀번호 확인을 입력해주세요");
		form.newMemberPassword.focus();
		return false;
	} else if (form.newMemberPassword.value != form.newMemberRePassword.value) {
		form.newMemberRePassword.focus();
		alert("비밀번호 확인이 일치하지 않습니다");
		return false;
	} 
	
	form.submit();
}
