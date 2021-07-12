Kakao.init('056b94bb5df03a78a04b2c7f67882c60'); // 여기서 아까 발급받은 키 중 javascript키를
												// 사용해준다.
// 카카오 로그인 버튼을 생성합니다.
Kakao.Auth.createLoginButton({

	container : '#kakao-login-btn',
	success : function(authObj) {
		Kakao.API.request({

			url : '/v2/user/me',

			success : function(res) {
				$.ajax({
					url : contextPath + "/member/MemberLoginOk.me?kakaoId=" + res.id,
					type : 'get',
					dataType : 'text'
				})
			}
		})
	},
	fail : function(err) {
		console.log(JSON.stringify(err));
	}
});