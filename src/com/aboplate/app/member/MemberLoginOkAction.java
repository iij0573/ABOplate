package com.aboplate.app.member;

import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberBean;
import com.aboplate.app.member.dao.MemberDAO;


public class MemberLoginOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward=new ActionForward();
		MemberDAO mDao=new MemberDAO();
		HttpSession session = request.getSession();
		MemberBean mBean = null;
		String id = null;
		
		if (request.getParameter("memberId") != null && request.getParameter("memberPassword") != null){
			id = request.getParameter("memberId");
			String pw=mDao.encryptPw((request.getParameter("memberPassword")));
			
			mBean = mDao.login(id, pw);
			
		} /*else if(request.getParameter("kakaoId") != null) {
			String kakaoId = request.getParameter("kakaoId");
			String kakaoNickname = "1123213213123";
			// db에 있는지 검사하는 메소드 사용
//			if(mDao.checkId(kakaoId)) {
				// 카카오 아이디가 DB에 있다면 세션에 담아서 메인 페이지로 이동
				// 이건 단순 이동
				session.setAttribute("sessionId", kakaoNickname);
				System.out.println("들어옴");
				PrintWriter out = response.getWriter();
				System.out.println("들어옴123");
				response.setContentType("text/html; charset=UTF-8");
				out.println("ok");
				System.out.println(1);
				out.close();
		}
//			} else {
//				
//				forward.setPath(request.getContextPath() + "/member/MemberJoin.me");
//			}
//		} else if (request.getParameter("googleId") != null) {
//			//카카오랑 같음
//			String googleId = request.getParameter("googleId");
//			session.setAttribute("sessionId", googleId);
//			
//			// db에 있는지 검사하는 메소드 사용
//			if(mDao.checkId(googleId)) {
//				// 카카오 아이디가 DB에 있다면 세션에 담아서 메인 페이지로 이동
//				// 이건 단순 이동
//				forward.setPath(request.getContextPath() + "../index.jsp");
//			} else {
//				// 없다면 session_id에 담아서 join.me로 이동
//				forward.setPath(request.getContextPath() + "/member/MemberJoin.me");
//			}
//		}
//		*/	
		if(mBean != null) {
			session.setAttribute("memberBean", mBean);
			session.setAttribute("sessionId", id);
			forward.setPath(request.getContextPath()+"/index.jsp");	
		} else {
			forward.setPath(request.getContextPath()+"/member/MemberLogin.me?login=false");
		}

		forward.setRedirect(true);
		return forward;
		
	}
}
