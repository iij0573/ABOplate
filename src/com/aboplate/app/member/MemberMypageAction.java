package com.aboplate.app.member;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberBean;
import com.aboplate.app.member.dao.MemberDAO;
import com.aboplate.app.restaurant.dao.RestaurantDAO;
import com.aboplate.app.restaurant.dao.ReviewBean;
import com.aboplate.app.restaurant.dao.ReviewDAO;

public class MemberMypageAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		MemberDAO memberDao = new MemberDAO();
		MemberBean memberBean = new MemberBean();
		ReviewDAO reviewDao = new ReviewDAO();
		HttpSession session = request.getSession();
		
		String id = session.getAttribute("sessionId").toString();
		session.setAttribute("memberBean", memberDao.getMemberInfo(id));
		String nickname = memberDao.getMemberNickname(id);
		
		String temp = request.getParameter("page");
		int page = temp == null ? 1 : Integer.parseInt(temp);
		int pageSize = 5;
		int totalCnt = reviewDao.getMemberReviewCnt(nickname);
		
		int endRow = page * 5;
		int startRow = endRow - 4;
		
		int startPage = ((page-1) / pageSize) * pageSize + 1;
		int endPage = startPage + 4;
		int totalPage = (totalCnt-1) / pageSize + 1;
		
		endPage = endPage > totalPage ? totalPage : endPage;
		memberBean = memberDao.getMemberInfo(id);
		
		request.setAttribute("memberBean", memberBean);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("nowPage", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		List<Object> reviewList = new ArrayList<Object>();
		for (ReviewBean reviewBean : reviewDao.getMemberReviewList(startRow, endRow, nickname)) {
			List<Object> tempList = new ArrayList<>();
			tempList.add(reviewBean);
			tempList.add(new RestaurantDAO().getRestaurantInfo(reviewBean.getRestaurant_num()));
			reviewList.add(tempList);
		}
		request.setAttribute("memberReviewList", reviewList);

		forward.setRedirect(false);
		System.out.println("1211212121212");
		forward.setPath("/member/mypage.jsp");
		
		return forward;
	}

}
