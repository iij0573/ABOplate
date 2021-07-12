package com.aboplate.app.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.bookmark.dao.BookmarkDAO;
import com.aboplate.app.restaurant.dao.RestaurantBean;
import com.aboplate.app.restaurant.dao.RestaurantDAO;
import com.aboplate.app.restaurant.dao.ReviewBean;
import com.aboplate.app.restaurant.dao.ReviewDAO;


public class RestaurantViewOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();

		/*BookmarkDAO bDao = new BookmarkDAO();*/
		RestaurantDAO restaurantDao = new RestaurantDAO();
		ReviewDAO reviewDAO = new ReviewDAO();

		RestaurantBean restaurantBean = new RestaurantBean();
		ReviewBean reviewBean = new ReviewBean();
		/*HttpSession session = request.getSession();*/

		/*String id = session.getAttribute("sessionId").toString();*/
		
		int restaurantNum = Integer.parseInt(request.getParameter("restaurantNum"));
		restaurantBean = restaurantDao.getRestaurantInfo(restaurantNum);


		request.setAttribute("restaurantBean", restaurantBean);


		forward.setRedirect(false);
		forward.setPath("/restaurant/storeInfo.jsp");
		return forward;
	}

}
