package com.aboplate.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberDAO;

public class MemberFindIdAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		MemberDAO mDao = new MemberDAO();
		String email = request.getParameter("memberEmail");
		String name = request.getParameter("memberName");
		
		String id = mDao.findId(email, name);
		
		PrintWriter out = response.getWriter();
		if(id != null) {
			System.out.println(id);
			response.setContentType("text/html; charset=UTF-8");
			out.println("<script>");
			out.println("alert('당신의 아이디는"+id+"입니다.'); location.href='login.jsp'; ");
			out.println("</script>");
			out.close();
			}else {
			response.setContentType("text/html; charset=UTF-8");
			out.println("<script>");
			out.println("alert('등록된 아이디가 없습니다. 다시 시도해주세요.'); history.back(); ");
			out.println("</script>");
			out.close();
		}
		forward.setRedirect(true);
		return forward;
	}
}
