/**
 * 
 */

		var findIdCheck=false;

function FindId() {
	var forward = new ActionForward();
	
	var mDao = new MemberDAO();
	var email = request.getParameter("member_email");
	var name = request.getParameter("member_nickname");
	var  out = response.getWriter();
	
	var id = mDao.findId(email, name);
		
		
		if(id!=null) {
			$.ajax({
				url : contextPath + "/member/MemberCheckIdOk.me?id=" + id,

				type : 'get',
				dataType : 'text',
				success : function(data) {

					if (data.trim() == 'ok') {
						$("#findIdCheckText").text("당신의 아이디는"+id+"입니다.");
						findIdCheck = true;
					} else {

						$("#findIdCheckText").text("없는 회원입니다.");
						findIdCheck= false;
					}
				},
				error : function() {
					console.log("오류");
				}
			})
		}
				
			
			

	}


