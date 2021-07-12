package com.aboplate.app.bookmark.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aboplate.app.restaurant.dao.RestaurantBean;
import com.aboplate.mybatis.config.SqlMapConfig;

public class BookmarkDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public BookmarkDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	public List<RestaurantBean> getBookmarkList(int startRow, int endRow, String sessionId) {
		
		HashMap<String , Object> datas = new HashMap<>();
		
		List<Integer> restaurantNumList = sqlsession.selectList("Bookmark.getRestaurantNumList", sessionId);
	
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		datas.put("restaurantNum", restaurantNumList);
		
		List<RestaurantBean> bookmarkList = new ArrayList<>();
		
		bookmarkList = sqlsession.selectList("Bookmark.getBookmarkList", datas);
		

		return bookmarkList;
		
	}
	
	public int checkBookmark(String id, int restaurantNum) {
		
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("id", id);
		datas.put("restaurantNum", restaurantNum);
		
		return sqlsession.selectOne("Bookmark.checkBookmark", datas);
	}
	
	public void popBookmark(String id, int restaurantNum) {
		
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("id", id);
		datas.put("restaurantNum", restaurantNum);
		
		sqlsession.delete("Bookmark.popBookmark", datas);
	}
	
	public void addBookmark(String id, int restaurantNum) {
		
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("id", id);
		datas.put("restaurantNum", restaurantNum);
		
		sqlsession.insert("Bookmark.addBookmark", datas);
	}
	
	public int getBookmarkCnt(String memberId) {
		
		return sqlsession.selectOne("Bookmark.getBookmarkCnt", memberId);
	}
}


















