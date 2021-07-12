package com.aboplate.app.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.restaurant.dao.RestaurantDAO;

public class RestaurantLocalCurrency implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		RestaurantDAO restaurantDao = new RestaurantDAO();
		
		String temp = request.getParameter("page");
		int page = temp == null ? 1 : Integer.parseInt(temp);
		System.out.println(page + "여기다");
		int pageSize = 10;
		int totalCnt = restaurantDao.getLocalCurrencyCnt();
		
		int endRow = page * 8 ; 
		int startRow = endRow - 7 ; 
		
		int startPage = ((page - 1) / pageSize) * pageSize + 1;
		int endPage = startPage + 9;
		int totalPage = (totalCnt - 1) / pageSize + 1;
		
		endPage = endPage > totalPage ? totalPage : endPage;
		
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("currentPage", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("restaurantBeanList", restaurantDao.getLocalCurrencyRestaurantList(startRow,endRow));
		
		forward.setRedirect(false);

		forward.setPath("/restaurant/restaurantList.jsp");
		return forward;
	}

}
