/*
 * @(#)StoreCoupon.java 2013. 8. 10.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;
 
/**
 * TODO
 *
 * @author  yshsy
 * @version 1.0,  2013. 8. 10.
 */
public class StoreCoupon {
	private int coupon_no;
	private int store_no;
	private String store_name;
	private String coupon_name;
	private String coupon_desc;
	private String start_date;
	private String end_date;
	private String image = "";
	private String use_flag;
	private String edit_date;
	private String reg_date;
	private int print_count;


	public int getCoupon_no() {
		return coupon_no;
	}
	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
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
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public String getCoupon_desc() {
		return coupon_desc;
	}
	public void setCoupon_desc(String coupon_desc) {
		this.coupon_desc = coupon_desc;
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
	public int getPrint_count() {
		return print_count;
	}
	public void setPrint_count(int print_count) {
		this.print_count = print_count;
	}
	@Override
	public String toString() {
		return "StoreCoupon [coupon_no=" + coupon_no + ", store_no=" + store_no
				+ ", store_name=" + store_name + ", coupon_name=" + coupon_name
				+ ", coupon_desc=" + coupon_desc + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", image=" + image + ", use_flag="
				+ use_flag + ", edit_date=" + edit_date + ", reg_date="
				+ reg_date + ", print_count=" + print_count + "]";
	}
	
	
}
