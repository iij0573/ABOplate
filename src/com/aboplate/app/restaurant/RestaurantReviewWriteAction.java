package com.aboplate.app.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.restaurant.dao.RestaurantBean;
import com.aboplate.app.restaurant.dao.RestaurantDAO;


public class RestaurantReviewWriteAction implements Action{
	public static boolean check = false;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		String memberId = (String)session.getAttribute("sessionId");
		RestaurantBean restaurantBean = new RestaurantBean();

		int restaurantNum = Integer.parseInt(request.getParameter("restaurantNum"));

		RestaurantDAO restaurantDao = new RestaurantDAO();
		restaurantBean = restaurantDao.getRestaurantInfo(restaurantNum);

		
		
		if(memberId != null) {
			request.setAttribute("restaurantBean", restaurantBean);
			forward.setPath("/restaurant/ReviewWrite.jsp");
		}else {
			request.setAttribute("restaurantBean", restaurantBean);
			forward.setPath("/restaurant/RestaurantView.re?login=false");
		}

		forward.setRedirect(false);
		return forward;
	}
}
