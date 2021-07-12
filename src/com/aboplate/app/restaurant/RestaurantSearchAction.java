package com.aboplate.app.restaurant;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.FontUIResource;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.restaurant.dao.RestaurantBean;
import com.aboplate.app.restaurant.dao.RestaurantDAO;

import sun.font.FontRunIterator;

public class RestaurantSearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		RestaurantDAO r_dao = new RestaurantDAO();
		
		
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
		
		List<RestaurantBean> restaurantBeanList = null;
		try {
			restaurantBeanList = r_dao.search(keyField, keyWord);
			request.setAttribute("restaurantBeanList", restaurantBeanList);
			forward.setPath("/restaurant/restaurantList.jsp");
		} catch (Exception e) {
			request.setAttribute("restaurantBeanList", restaurantBeanList);
			System.out.println("들어옴");
			forward.setPath("/restaurant/restaurantList.jsp");
		}
			
		System.out.println(restaurantBeanList);
		forward.setRedirect(false);
		return forward;
	}
}