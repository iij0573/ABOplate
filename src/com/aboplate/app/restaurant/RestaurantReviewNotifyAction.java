package com.aboplate.app.restaurant;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.restaurant.dao.ReviewDAO;

public class RestaurantReviewNotifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		ReviewDAO reviewDao = new ReviewDAO();
		
		String id = session.getAttribute("sessionId").toString();
		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
		
		PrintWriter out = response.getWriter();
		
		if(reviewDao.checkReviewNotify(id, reviewNum)) {
			reviewDao.popReviewNotify(id, reviewNum);
			reviewDao.minusNotify(reviewNum);
			out.println("pop");
		} else {
			reviewDao.addReviewNotify(id, reviewNum);
			reviewDao.plusNotify(reviewNum);
			out.println("add");
		}
		out.close();
		
		return null;
	}

}
