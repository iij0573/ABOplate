function onSignIn(googleUser) {
        var profile = googleUser.getBasicProfile();        
        $.ajax({
			url : contextPath + "/member/MemberLoginOk.me?googleId=" + profile.getId(),
			type : 'get',
			dataType : 'text'
		})       
}