package com.aboplate.app.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;

public class MemberFrontController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());

		ActionForward forward = null;
		Action action = null;
		
		if (command.equals("/member/MemberJoin.me")) {
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/member/signup.jsp");
		} else if (command.equals("/member/MemberJoinOk.me")) {
			action=new MemberJoinOkAction();
			try {
				forward=action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("MemberJoinOkAction 에러");
				System.out.println(e);
			}
		} else if (command.equals("/member/MemberLogin.me")) {
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/member/login.jsp");
			
		} else if (command.equals("/member/MemberDelete.me")) {
			action=new MemberDeleteAction();
			try {
				forward=action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("MemberDeleteAction 에러");
				System.out.println(e);
			}
			
		}else if (command.equals("/member/MemberLoginOk.me")) {
			action = new MemberLoginOkAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
				System.out.println("MemberLoginOkAction 에러");
			}
		} else if (command.equals("/member/MemberLogOut.me")) {
			action = new MemberLogOutAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
				System.out.println("MemberLoginOkAction 에러");
			}
		} else if (command.equals("/member/MemberCheckIdOk.me")) {
			action = new MemberCheckIdOkAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
				System.out.println("MemberCheckIdOkAction 에러");
			}
		} else if (command.equals("/member/MemberVerifyEmail.me")) {
			action = new MemberVerifyOkAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
				System.out.println("memberVerifyOkAction 에러");
			}
		} else if (command.equals("/member/MemberFindId.me")) {
			action = new MemberFindIdAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
				System.out.println("MemberFindId 에러");
			}
		} else if (command.equals("/member/MemberFindPw.me")) {
			action = new MemberFindPwAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
				System.out.println("MemberFindPw 에러");
			}
		}
		else if (command.equals("/member/MemberCheckNickname.me")) {
			action = new MemberCheckNicknameAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
				System.out.println("memberCheckNickName 에러");
			}
		} else if (command.equals("/member/MemberModify.me")) {
			action = new MemberModifyAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println("MemberModify 에러");
				
			}
		}else if (command.equals("/member/MemberModifyOk.me")) {
			action = new MemberModifyOkAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println("MemberModifyOk 에러");
				
			}
		}else if (command.equals("/member/mypage.me")) {
			action = new MemberMypageAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println("mypage 에러");
				
			}
		}
		
		else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/error/404.jsp");
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispather = req.getRequestDispatcher(forward.getPath());
				dispather.forward(req, resp);
			}
		}
		
	}
}