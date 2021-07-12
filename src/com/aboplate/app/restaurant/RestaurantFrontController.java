package com.aboplate.app.restaurant;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;

public class RestaurantFrontController extends HttpServlet{
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
		

		if(command.equals("/restaurant/RestaurantSearch.re")) {
			action = new RestaurantSearchAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println(e);
				System.out.println("RestaurantSearchAction 에러");
			}

		}else if(command.equals("/restaurant/RestaurantView.re")) {
			action = new RestaurantViewAction();
			try {
				forward = action.execute(req, resp);
			}catch(Exception e) {
				System.out.println(e);
				System.out.println("RestaurantViewAction 에러");
			}
		}else if(command.equals("/restaurant/restaurantAutoComplete.re")) {
			action = new RestaurantAutoCompleteAction();
			try {
				forward = action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("RestaurantAutoCompleteAction 에러");
				System.out.println(e);
			}
		} else if(command.equals("/restaurant/ReviewModify.re")) {
			action = new RestaurantReviewModifyAction();
			try {
				forward = action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("RestaurantReviewModifyAction 에러");
				System.out.println(e);
			}
		} else if(command.equals("/restaurant/ReviewDeleteOk.re")) {
			action = new RestaurantReviewDeleteOkAction();
			try {
				forward = action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("RestaurantReviewDeleteOkAction 에러");
				System.out.println(e);
			}
		} else if(command.equals("/restaurant/restaurantLocalCurrency.re")) {
			action = new RestaurantLocalCurrency();
			try {
				forward = action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("RestaurantLocalCurrency 에러");
				System.out.println(e);
			}
		} else if(command.equals("/restaurant/restaurantBookmark.re")) {
			action = new RestaurantBookmarkAction();
			System.out.println("들어옴3");
			try {
				forward = action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("RestaurantBookmarkAction 에러");
				System.out.println(e);
			}
		} else if(command.equals("/restaurant/restaurantBookmarkOk.re")) {
			action = new RestaurantBookmarkOkAction();
			try {
				forward = action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("RestaurantBookmarkOkAction 에러");
				System.out.println(e);
			}
		} else if(command.equals("/restaurant/ReviewModify.re")) {
			action = new RestaurantReviewModifyAction();
			try {
				forward = action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("RestaurantReviewModifyAction 에러");
				System.out.println(e);
			}
		}else if(command.equals("/restaurant/ReviewModifyOk.re")) {
			action = new RestaurantReviewModifyOkAction();
			try {
				forward = action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("RestaurantReviewModifyOkAction 에러");
				System.out.println(e);
			}
		} else if(command.equals("/restaurant/ReviewWrite.re")) {
			action = new RestaurantReviewWriteAction();
			try {
				forward = action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("RestaurantReviewWriteAction 에러");
				System.out.println(e);
			}
		}else if(command.equals("/restaurant/ReviewWriteOk.re")) {
			action = new RestaurantReviewWriteOkAction();
			try {
				forward = action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("RestaurantReviewWriteOkAction 에러");
				System.out.println(e);
			}
		}else if(command.equals("/restaurant/RestaurantView.re")) {
			action = new RestaurantViewOkAction();
			try {
				forward = action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("RestaurantViewOkAction 에러");
				System.out.println(e);
			}
		}else if(command.equals("/restaurant/RestaurantView.re")) {
			action = new RestaurantViewOkAction();
			try {
				forward = action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("RestaurantViewOkAction 에러");
				System.out.println(e);
			}
		}else if(command.equals("/restaurant/ReviewRecommend.re")) {
			action = new RestaurantReviewRecommendAction();
			try {
				forward = action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("RestaurantReviewRecommendAction 에러");
				System.out.println(e);
			}
		}else if(command.equals("/restaurant/ReviewNotify.re")) {
			action = new RestaurantReviewNotifyAction();
			try {
				forward = action.execute(req, resp);
			}catch(Exception e) {
				System.out.println("RestaurantReviewNotifyAction 에러");
				System.out.println(e);
			}
		}else {
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
