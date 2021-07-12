package com.aboplate.app.bookmark.dao;

public class BookmarkBean {
	private int bookmark_num;
	private String member_id;
	private int restaurant_num;
	
	public BookmarkBean() {;}

	public int getBookmark_num() {
		return bookmark_num;
	}

	public void setBookmark_num(int bookmark_num) {
		this.bookmark_num = bookmark_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getRestaurant_num() {
		return restaurant_num;
	}

	public void setRestaurant_num(int restaurant_num) {
		this.restaurant_num = restaurant_num;
	}
}
