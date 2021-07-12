package com.aboplate.app.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.restaurant.dao.RestaurantBean;
import com.aboplate.app.restaurant.dao.RestaurantDAO;
import com.aboplate.app.restaurant.dao.ReviewBean;
import com.aboplate.app.restaurant.dao.ReviewDAO;

public class RestaurantReviewModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		ReviewDAO reviewDao = new ReviewDAO();
		RestaurantDAO restaurantDao = new RestaurantDAO();
		RestaurantBean restaurantBean = new RestaurantBean();
		ReviewBean reviewBean = new ReviewBean();
		
		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
		int restaurantNum = Integer.parseInt(request.getParameter("restaurantNum"));
		reviewBean = reviewDao.getReviewDetail(reviewNum);
		restaurantBean = restaurantDao.getRestaurantInfo(restaurantNum);
		
		request.setAttribute("reviewBean", reviewBean);
		request.setAttribute("restaurantBean", restaurantBean);
		
		
		forward.setRedirect(false);
		forward.setPath("/restaurant/ReviewPage.jsp");
		System.out.println("들어옴");
		return forward;
	}

}
