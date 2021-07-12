package com.aboplate.app.restaurant;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.picture.dao.PictureBean;
import com.aboplate.app.picture.dao.PictureDAO;
import com.aboplate.app.restaurant.dao.ReviewBean;
import com.aboplate.app.restaurant.dao.ReviewDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RestaurantReviewModifyOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ReviewDAO reviewDao = new ReviewDAO();
		ReviewBean reviewBean = new ReviewBean();
		PictureDAO pictureDao = new PictureDAO();
		ActionForward forward = null;
		
		String saveFolder = request.getServletContext().getRealPath("images");	
		int fileSize = 5 * 1024 * 1024;
		try {
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());;
			
			int reviewNum = Integer.parseInt(multi.getParameter("reviewNum"));
			int starRating =  Integer.parseInt(multi.getParameter("starRating"));
			int restaurantNum = Integer.parseInt(multi.getParameter("restaurantNum"));
			
			String review = multi.getParameter("review");
			
			for(PictureBean picture : pictureDao.getPictureDetail(reviewNum)) {
				System.out.println(picture);
				File f = new File(saveFolder + "\\" + picture.getPicture_name());
				if(f.exists()) {f.delete();}
			}
			pictureDao.deletePicture(reviewNum);
			reviewBean.setReview_num(reviewNum);
			reviewBean.setReview(review);
			reviewBean.setReview_ration(starRating);
			reviewDao.updateReview(reviewBean);
			pictureDao.insertPicture(multi, reviewNum);
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/restaurant/RestaurantView.re?restaurantNum=" + restaurantNum);
			
		}catch(Exception e) {
			System.out.println(e);
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('게시글 수정 실패. 다시 시도해주세요.');history.back();");
			out.println("</script>");
		}
		
		return forward;
	}
}
