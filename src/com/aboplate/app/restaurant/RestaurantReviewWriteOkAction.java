package com.aboplate.app.restaurant;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberDAO;
import com.aboplate.app.picture.dao.PictureDAO;
import com.aboplate.app.restaurant.dao.ReviewBean;
import com.aboplate.app.restaurant.dao.ReviewDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RestaurantReviewWriteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		ReviewDAO reviewDao = new ReviewDAO();
		ReviewBean reviewBean = new ReviewBean();
		PictureDAO pictureDao = new PictureDAO();
		HttpSession session = request.getSession();
		MemberDAO memberDao = new MemberDAO();
		
		ActionForward forward = new ActionForward();		
		
		String memberId = (String)session.getAttribute("sessionId");
		
		String nickName = memberDao.getMemberNickname(memberId);
		
		String saveFolder = request.getServletContext().getRealPath("images");		
		
		int fileSize = 5 * 1024 * 1024;	//5M
		
		boolean reviewResult = false;
		boolean pictureResult = false;

		try {
			MultipartRequest multi = null;
			
			multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			
			int restaurantNum = Integer.parseInt(multi.getParameter("restaurantNum"));
			
			
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			
			reviewBean.setRestaurant_num(restaurantNum);
			reviewBean.setMember_nickname(nickName);
			reviewBean.setReview(multi.getParameter("review"));
			reviewBean.setReview_ration(Integer.parseInt(multi.getParameter("starRating")));
			reviewResult = reviewDao.insertReview(reviewBean);
			pictureResult = pictureDao.insertPicture(multi, reviewDao.getReviewSeq());
						
			int reviewNum = reviewDao.getReviewSeq();
			
			if(!pictureResult) {
				response.setContentType("text/html;charset=UTF-8");
				out.println("<script>");
				out.println("alert('리뷰 등록 실패. 다시 시도해주세요.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
				return null;
			}
			reviewDao.updateReviewStamp(memberId);
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/restaurant/RestaurantView.re?restaurantNum=" + restaurantNum + "&reviewNum=" + reviewNum);
			System.out.println(reviewNum + "받음");
			return forward;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

}
