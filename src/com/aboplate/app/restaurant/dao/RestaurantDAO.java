package com.aboplate.app.restaurant.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aboplate.app.member.dao.MemberBean;
import com.aboplate.app.member.dao.MemberDAO;
import com.aboplate.mybatis.config.SqlMapConfig;

public class RestaurantDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public RestaurantDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	// 연관검색어 전용 리스트
	public List<String> getNameList(String search) {
		
		List<String> nameList = sqlsession.selectList("Restaurant.getNameList", search);
		
		return nameList;
	}
	
	public List<String> getLocalCurrencyList(String search){
		
		List<String> localCurrencyList = sqlsession.selectList("Restaurant.getLocalCurrencyList", search);
		
		return localCurrencyList;
	}
	
	public List<String> getFoodCategoryList(String search){
		
		List<String> foodCategoryList = sqlsession.selectList("Restaurant.getFoodCategoryList", search);
		
		return foodCategoryList;
	}
	
	public List<String> getAddressList(String search){
		
		List<String> addressList = sqlsession.selectList("Restaurant.getAddressList", search);
		
		return addressList;
	}
	
	public List<String> getBestRestaurantList(String search){
		
		List<String> bestRestaurantList = sqlsession.selectList("Restaurant.getBestRestaurantList", search);
		
		return bestRestaurantList; 
	}
	// 여기까지 연관검색어
	
	// 회원 맞춤 맛집 추천
	public List<RestaurantBean> getMemberChoiceList(String session_id, String foodCategory){
		System.out.println(session_id);
		
		HashMap<String, String> datas = new HashMap<>();
		MemberBean memberBean = sqlsession.selectOne("Member.getJoinList", session_id);
		 
		datas.put("category",foodCategory);
		datas.put("address", memberBean.getMember_region());
		
		List<RestaurantBean> memberChoicerestaurantList = sqlsession.selectList("Restaurant.getMemberChoiceRestaurantList", datas);
		
		return memberChoicerestaurantList;
	}
	
	public List<RestaurantBean> getPopularList(){
			
		List<RestaurantBean> popularList = sqlsession.selectList("Restaurant.getPopularRestaurant");
			
		return popularList;
	}
	
	public List<RestaurantBean> getRecommendList(String id) {
		
		List<String> foodCategoryList = sqlsession.selectList("Member.getFoodCategory", id);
		List<RestaurantBean> recommendList = new ArrayList<RestaurantBean>();
		
		String category = foodCategoryList.toString();
		
		category = category.substring(1, foodCategoryList.toString().length() - 2);
		
		String[] arCategory = category.split(",");
		for(String foodCategory : arCategory) {
			recommendList.addAll(getMemberChoiceList(id, foodCategory));
		}
		return recommendList;
	}
	
	public List<RestaurantBean> search(String keyField, String keyWord) {
		
		HashMap<String, String> datas = new HashMap<>();
		datas.put("keyField", keyField);
		datas.put("keyWord", keyWord);
		
		List<RestaurantBean> searchList = sqlsession.selectList("Restaurant.searchRestaurant", datas);
		
		return searchList;
	}
	
	public RestaurantBean getRestaurantInfo(int restaurantNum) {
		
		return sqlsession.selectOne("Restaurant.getRestaurantInfo", restaurantNum); 
	}
	
	public int getLocalCurrencyCnt() {
		
		return sqlsession.selectOne("Restaurant.getLocalCurrencyCnt");
	}
	
	public void updateReadCount(int board_num) {
		sqlsession.update("Restaurant.updateReadCount", board_num);
	}
	
	public List<RestaurantBean> getLocalCurrencyRestaurantList(int startRow, int endRow){
		HashMap<String, Integer> pageMap = new HashMap<>();
		pageMap.put("startRow", startRow);
		pageMap.put("endRow", endRow);
		List<RestaurantBean> localCurrencyList = sqlsession.selectList("Restaurant.getLocalCurrencyRestaurantList", pageMap);
		
		return localCurrencyList;
	}
	
	public List<RestaurantBean> list(int startRow, int endRow){
		HashMap<String, Integer> pageMap = new HashMap<>();
		pageMap.put("startRow", startRow);
		pageMap.put("endRow", endRow);
		List<RestaurantBean> list = sqlsession.selectList("Restaurant.list", pageMap);
		return list;
	}
	
}


