package com.aboplate.app.restaurant.dao;

public class ReviewBean {
	private int review_num;
	private int restaurant_num;
	private String member_nickname;
	private String review;
	private int review_ration;
	private int review_recommend;
	private String review_report;
	private String review_upload_date;
	
	public ReviewBean() {;}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public int getRestaurant_num() {
		return restaurant_num;
	}

	public void setRestaurant_num(int restaurant_num) {
		this.restaurant_num = restaurant_num;
	}

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	
	public int getReview_ration() {
		return review_ration;
	}

	public void setReview_ration(int review_ration) {
		this.review_ration = review_ration;
	}

	public String getReview_report() {
		return review_report;
	}

	public void setReview_report(String review_report) {
		this.review_report = review_report;
	}

	public String getReview_upload_date() {
		return review_upload_date;
	}

	public void setReview_upload_date(String review_upload_date) {
		this.review_upload_date = review_upload_date;
	}

	public int getReview_recommend() {
		return review_recommend;
	}

	public void setReview_recommend(int review_recommend) {
		this.review_recommend = review_recommend;
	}
	
	

	
	
	

}
