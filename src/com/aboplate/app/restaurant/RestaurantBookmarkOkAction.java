package com.aboplate.app.restaurant;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.bookmark.dao.BookmarkDAO;
import com.aboplate.app.restaurant.dao.RestaurantBean;
import com.aboplate.app.restaurant.dao.RestaurantDAO;

public class RestaurantBookmarkOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		BookmarkDAO bookmarkDao = new BookmarkDAO();

		String id = (String) session.getAttribute("sessionId");

		//레스토랑 번호 가져옴
		int restaurantNum = Integer.parseInt(request.getParameter("restaurantNum"));
		
		
		//boolean값으로, DB에 있으면 빼기, DB에 없으면 추가
		PrintWriter out = response.getWriter();
		if(bookmarkDao.checkBookmark(id, restaurantNum) == 1) {
			bookmarkDao.popBookmark(id, restaurantNum);
			out.print("pop");
		} else {
			bookmarkDao.addBookmark(id, restaurantNum);
			out.print("add");
			
		}
		out.close();
		return null;
	}

}
