package com.aboplate.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;

public class MemberLogOutAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		ActionForward forward=new ActionForward();
		
		session.invalidate();
		System.out.println(1);
		
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/index.jsp");
		return forward;
	}
}