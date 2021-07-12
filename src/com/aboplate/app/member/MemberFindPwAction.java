package com.aboplate.app.member;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberDAO;

public class MemberFindPwAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		MemberDAO mDao = new MemberDAO();
		
		String id = request.getParameter("memberId");
		String email = request.getParameter("memberEmail");
		
		
		String newPw = mDao.createRandomPw();

		//request.setAttribute("memberPassword", newPw);
		PrintWriter out = response.getWriter(); 
		if(mDao.updatePw(mDao.encryptPw(newPw), id)) {
			mDao.sendEmail(email, "ABOplate 새로운 비밀번호 입니다.", newPw);
			System.out.println(newPw);
			response.setContentType("text/html; charset=UTF-8");
			out.println("<script>");
			out.println("alert('새로운 비밀번호가 발급되었습니다. 다시 로그인해주세요'); location.href='login.jsp'; ");
			out.println("</script>");
			out.close();
		}else {
			response.setContentType("text/html; charset=UTF-8");
			out.println("<script>");
			out.println("alert('가입된 정보가 없습니다. 다시  시도해주세요'); history.back(); ");
			out.println("</script>");
			out.close();
		}
		forward.setRedirect(true);
		//forward.setPath(request.getContextPath() + "/member/MemberLogin.me");
		return forward;
	}
}