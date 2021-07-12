package com.aboplate.app.page;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberBean;
import com.aboplate.app.member.dao.MemberDAO;
import com.aboplate.app.restaurant.dao.RestaurantBean;
import com.aboplate.app.restaurant.dao.RestaurantDAO;

public class MainPageOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		RestaurantDAO restaurantDao = new RestaurantDAO();
		HttpSession session = request.getSession();
		RestaurantBean restaurantBean = null;
		String id = null;
		
		if(session.getAttribute("sessionId") != null) {
			id = session.getAttribute("sessionId").toString();
			session.setAttribute("memberBean", new MemberDAO().getMemberInfo(id));
		}
		List<RestaurantBean> tempPopularList = restaurantDao.getPopularList();
		List<RestaurantBean> popularList = new ArrayList<>();
		int tempPopularListLength = tempPopularList.size();
		
		
		while(popularList.size() < 8) {
			restaurantBean = tempPopularList.get((int)(Math.random()*tempPopularListLength));
			if(popularList.contains(restaurantBean)) {
				continue;
			} else {
				popularList.add(restaurantBean);
			}
		}
		
		if(id != null) {
			List<RestaurantBean> tempRecommendList = restaurantDao.getRecommendList(id);
			List<RestaurantBean> recommendList = new ArrayList<>();
			int tempRecommendListLength = tempRecommendList.size();
			
			while(recommendList.size() < 8) {
				restaurantBean = tempRecommendList.get((int)(Math.random()*tempRecommendListLength));
				if(recommendList.contains(restaurantBean)) {
					continue;
				} else {
					recommendList.add(restaurantBean);
				}
			}
			
			session.setAttribute("recommendList", recommendList);
		}
		
		session.setAttribute("popularList", popularList);
		session.setAttribute("list", restaurantDao.list(0, 1000));
		
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/main.jsp");
		
		return forward;
	}
}
