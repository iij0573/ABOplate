package com.aboplate.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberDAO;

public class MemberCheckNicknameAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MemberDAO mDao = new MemberDAO();
		String nickname = request.getParameter("nickname");
		PrintWriter out = response.getWriter();
		if(mDao.checkNickname(nickname)) {
			//중복가능한 닉네임
			out.println("not-ok");
		}else {
			//사용가능한 닉네임
			out.println("ok");
		}
		out.close();
		
		return null;
	}
}
