package com.aboplate.app.menulist.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aboplate.app.member.dao.MemberBean;
import com.aboplate.app.restaurant.dao.RestaurantBean;
import com.aboplate.mybatis.config.SqlMapConfig;

public class MenuListDAO {
	
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public List<RestaurantBean> getMemberChoiceList(String session_id, String foodCategory){
		System.out.println(session_id);
		
		HashMap<String, Object> datas = new HashMap<>();
		MemberBean memberBean = sqlsession.selectOne("Member.getJoinList", session_id);
		
		 
		datas.put("category",foodCategory);
		datas.put("address", memberBean.getMember_region());
		
		List<RestaurantBean> memberChoicerestaurantList = sqlsession.selectList("Restaurant.getMemberChoiceRestaurantList", datas);
		
		return memberChoicerestaurantList;
	}
}
