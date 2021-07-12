package com.aboplate.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberDAO;


public class MemberCheckIdOkAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		MemberDAO mDao = new MemberDAO();
		
		String id = request.getParameter("id");
		PrintWriter out = response.getWriter();
		System.out.println("들어옴");
		if(mDao.checkId(id)) {
			//중복된 아이디입니다.
			out.println("not-ok");
		}else {
			//사용할 수 있는 아이디입니다.
			out.println("ok");
		}
		out.close();
		return null;
	}
}
