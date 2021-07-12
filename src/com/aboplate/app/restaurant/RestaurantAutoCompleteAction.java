package com.aboplate.app.restaurant;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.restaurant.dao.RestaurantDAO;

public class RestaurantAutoCompleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		RestaurantDAO restaurantDao = new RestaurantDAO();
		
		String filter = request.getParameter("filter");
		String search = request.getParameter("search");

		PrintWriter out = response.getWriter();
		
		if (filter.equals("restaurant_food_category")) {
			out.println(restaurantDao.getFoodCategoryList(search).toString());
		} else if (filter.equals("restaurant_address")) {
			out.println(restaurantDao.getAddressList(search).toString());		
		} else if (filter.equals("restaurant_best")) {
			out.println(restaurantDao.getBestRestaurantList(search).toString());	
		} else {
			out.println(restaurantDao.getNameList(search).toString());
		}
		out.close();
		return null;
	}
	
}
