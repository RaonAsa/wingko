/*
 * @(#)WingShowData.java  2013. 8. 25.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 25.
 */
public class WingShow extends MyCart {
	private String menu_name;
	private int menu_price;
	private int menu_price_cny;
	private int menu_coupon;
	private String start_date;
	private String end_date;
	private String store_title;
	private String image_thumb;
	private String location_name;
	
	public int getCouponPrice(){
		int coupon_price = menu_price * getCoupon_apply() / 100;
		int sum_price = (menu_price - coupon_price) * getMenu_cnt();
		return sum_price;
	}
	
	public int getCouponPriceCny(){
		int coupon_price = menu_price_cny * getCoupon_apply() / 100;
		int sum_price = (menu_price_cny - coupon_price) * getMenu_cnt();
		return sum_price;
	}
	
	
	@Override
	public String toString() {
		return "WingShow [menu_name=" + menu_name + ", menu_price="
				+ menu_price + ", menu_price_cny=" + menu_price_cny
				+ ", menu_coupon=" + menu_coupon + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", store_title=" + store_title
				+ ", image_thumb=" + image_thumb + ", location_name="
				+ location_name + "]" + super.toString();
	}
	
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public int getMenu_price_cny() {
		return menu_price_cny;
	}
	public void setMenu_price_cny(int menu_price_cny) {
		this.menu_price_cny = menu_price_cny;
	}
	public int getMenu_coupon() {
		return menu_coupon;
	}
	public void setMenu_coupon(int menu_coupon) {
		this.menu_coupon = menu_coupon;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getStore_title() {
		return store_title;
	}
	public void setStore_title(String store_title) {
		this.store_title = store_title;
	}
	public String getImage_thumb() {
		return image_thumb;
	}
	public void setImage_thumb(String image_thumb) {
		this.image_thumb = image_thumb;
	}
	public String getLocation_name() {
		return location_name;
	}
	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}
	
	
	
	
}


