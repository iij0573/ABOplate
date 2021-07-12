package com.aboplate.app.restaurant;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.picture.dao.PictureBean;
import com.aboplate.app.picture.dao.PictureDAO;
import com.aboplate.app.restaurant.dao.ReviewDAO;

public class RestaurantReviewDeleteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		ReviewDAO reviewDao = new ReviewDAO();
		PictureDAO pictureDao = new PictureDAO();
		PictureBean pictureBean = new PictureBean();
		HttpSession session = request.getSession();
		
		ActionForward forward = new ActionForward();
		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
		int restaurantNum = Integer.parseInt(request.getParameter("restaurantNum"));
		String id = (String)session.getAttribute("sessionId");
		
		
		String saveFolder = request.getServletContext().getRealPath("images");
		for(PictureBean picture : pictureDao.getPictureDetail(reviewNum)) {
			File f = new File(saveFolder + "\\" + picture.getPicture_name());
			if(f.exists()) {f.delete();}
		}
		
		pictureDao.deletePicture(reviewNum);
		reviewDao.deleteOneReview(reviewNum);
		reviewDao.minusReviewStamp(id);
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/restaurant/RestaurantView.re?restaurantNum="+ restaurantNum);
		
		return forward;
	}
}
