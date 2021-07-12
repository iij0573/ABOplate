package com.aboplate.app.menulist.dao;

public class MenuListBean {
	private int restaurant_num;
	private String menu_list_menu;
	private String menu_list_price;
	
	public MenuListBean() {;}

	public int getRestaurant_num() {
		return restaurant_num;
	}

	public void setRestaurant_num(int restaurant_num) {
		this.restaurant_num = restaurant_num;
	}

	public String getMenu_list_menu() {
		return menu_list_menu;
	}

	public void setMenu_list_menu(String menu_list_menu) {
		this.menu_list_menu = menu_list_menu;
	}

	public String getMenu_list_price() {
		return menu_list_price;
	}

	public void setMenu_list_price(String menu_list_price) {
		this.menu_list_price = menu_list_price;
	}
	
	
}
