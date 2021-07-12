package com.aboplate.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberDAO;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		MemberDAO memberDao = new MemberDAO();
		ActionForward forward = new ActionForward();
		
		String id = (String)session.getAttribute("sessionId");
		System.out.println(id);
		memberDao.deleteMember(id);
		
		
		session.invalidate();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/index.jsp");
		return forward;
	
	}
}
