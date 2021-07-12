package com.aboplate.app.restaurant.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aboplate.mybatis.config.SqlMapConfig;

public class ReviewDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public ReviewDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	
	public List<ReviewBean> getReviewList(int startRow, int endRow, int restaurantNum) {
		
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		datas.put("restaurantNum", restaurantNum);
		
		List<ReviewBean> reviewList = sqlsession.selectList("Review.getReviewList", datas);
		
		return reviewList;
		
	}
	
	public int getReviewCnt(int restaurantNum) {
		
		return sqlsession.selectOne("Review.getReviewCnt", restaurantNum);
	}
	
	public void deleteOneReview(int reviewNum) {
		sqlsession.delete("Review.deleteOneReview", reviewNum);
	}
	
	public boolean insertReview(ReviewBean reviewBean) {
		boolean check = false;
		
		if(sqlsession.insert("Review.insertReview", reviewBean) == 1) {
			check = true;
		}
		return check;
	}
	
	public boolean checkReviewRecommend(String id, int reviewNum) {
		boolean check = false;
		HashMap<String, Object> datas = new HashMap<>();
		
		datas.put("id", id);
		datas.put("reviewNum", reviewNum);
		if((Integer)sqlsession.selectOne("Review.checkReviewRecommend", datas) == 1) {
			check = true;
		}
		
		return check;
	}
	
	public void popReviewRecommend(String id, int reviewNum) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("id", id);
		datas.put("reviewNum", reviewNum);
		sqlsession.delete("Review.popReviewRecommend", datas);
	}
	
	public void addReviewRecommend(String id, int reviewNum) {
		
		HashMap<String, Object> datas = new HashMap<>();
		
		datas.put("id", id);
		datas.put("reviewNum", reviewNum);
		sqlsession.insert("Review.addReviewRecommend", datas);
	}
	
	public ReviewBean getReviewDetail(int reviewNum) {
		
		return sqlsession.selectOne("Review.getReviewDetail", reviewNum);
	}
	
	public void updateReview(ReviewBean reviewBean) {
		sqlsession.update("Review.updateReview", reviewBean);
	}
	
	public int getMemberReviewCnt(String nickname) {
		int reviewCnt = sqlsession.selectOne("Review.getMemberReviewCnt", nickname);
		
		return reviewCnt;
	}
	
	public List<ReviewBean> getMemberReviewList(int startRow, int endRow, String nickname){
		HashMap<String, Object> datas = new HashMap<>();
		
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		datas.put("nickname", nickname);
		
		List<ReviewBean> reviewList = sqlsession.selectList("Review.getMemberReviewList", datas);
		
		return reviewList;
	}
	
	public int getReviewSeq() {
		return sqlsession.selectOne("Restaurant.getReviewSeq");
	}
	
	public void updateReviewStamp(String id) {
		sqlsession.update("Review.updateReviewStamp", id);
	}
	
	public void minusRecommend(int reviewNum) {
		sqlsession.update("Review.minusRecommend", reviewNum);
	}
	
	public void plusRecommend(int reviewNum) {
		sqlsession.update("Review.plusRecommend", reviewNum);
	}
	
	public boolean checkReviewNotify(String id, int reviewNum) {
		boolean check = false;
		HashMap<String, Object> datas = new HashMap<>();
		
		datas.put("reviewNum", reviewNum);
		datas.put("id", id);
		
		if((Integer)sqlsession.selectOne("Review.checkReviewNotify", datas) == 1) {
			check = true;
		}
		
		return check;
	}
	
	public void popReviewNotify(String id, int reviewNum) {
		HashMap<String, Object> datas = new HashMap<>();
		
		datas.put("reviewNum", reviewNum);
		datas.put("id", id);
		
		sqlsession.delete("Review.popReviewNotify", datas);
	}
	
	public void addReviewNotify(String id, int reviewNum) {
		HashMap<String, Object> datas = new HashMap<>();
		
		datas.put("reviewNum", reviewNum);
		datas.put("id", id);
		
		sqlsession.insert("Review.addReviewNotify", datas);
	}
	
	public void minusNotify(int reviewNum) {
		sqlsession.update("Review.minusNotify", reviewNum);
	}
	
	public void plusNotify(int reviewNum) {
		sqlsession.update("Review.plusNotify", reviewNum);
	}
	
	public void minusReviewStamp(String id) {
		sqlsession.update("Review.minusReviewStamp", id);
	}
	
	
	
	
}
