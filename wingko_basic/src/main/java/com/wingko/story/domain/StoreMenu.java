/*
 * @(#)StoreMenu.java  2013. 8. 7.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 7.
 */
public class StoreMenu {
	private int menu_no;
	private int store_no;
	private String store_name;
	private String menu_name;
	private String menu_price;
	private String menu_price_cny;
	private int menu_coupon;
	private String start_date;
	private String end_date;
	private String image = "";
	private String image_thumb = "";
	private String use_flag;
	private String edit_date;
	private String reg_date;
	
	
	public int getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}
	public int getStore_no() {
		return store_no;
	}
	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(String menu_price) {
		this.menu_price = menu_price;
	}
	public String getMenu_price_cny() {
		return menu_price_cny;
	}
	public void setMenu_price_cny(String menu_price_cny) {
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getImage_thumb() {
		return image_thumb;
	}
	public void setImage_thumb(String image_thumb) {
		this.image_thumb = image_thumb;
	}
	public String getUse_flag() {
		return use_flag;
	}
	public void setUse_flag(String use_flag) {
		this.use_flag = use_flag;
	}
	public String getEdit_date() {
		return edit_date;
	}
	public void setEdit_date(String edit_date) {
		this.edit_date = edit_date;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "StoreMenu [menu_no=" + menu_no + ", store_no=" + store_no
				+ ", store_name=" + store_name + ", menu_name=" + menu_name
				+ ", menu_price=" + menu_price + ", menu_price_cny="
				+ menu_price_cny + ", menu_coupon=" + menu_coupon
				+ ", start_date=" + start_date + ", end_date=" + end_date
				+ ", image=" + image + ", image_thumb=" + image_thumb
				+ ", use_flag=" + use_flag + ", edit_date=" + edit_date
				+ ", reg_date=" + reg_date + "]";
	}
	
	
}

