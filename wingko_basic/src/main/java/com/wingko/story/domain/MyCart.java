/*
 * @(#)ShopInven.java  2013. 8. 25.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 25.
 * 
 * 
 * CREATE TABLE  `wingko`.`tb_mycart` (
  `cart_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` char(14) DEFAULT NULL,
  `user_no` int(11) unsigned NOT NULL,
  `menu_no` int(11) unsigned NOT NULL,
  `menu_cnt` int(11) unsigned DEFAULT '0',
  `coupon_apply` int(11) unsigned DEFAULT '0',
  `used_date` varchar(10) DEFAULT NULL,
  `sum_price_ko` int(11) unsigned DEFAULT '0',
  `sum_price_cn` int(11) unsigned DEFAULT '0',
  `reg_date` datetime DEFAULT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */
public class MyCart {
	private int cart_id;
	private String pid;
	private int user_no;
	private int menu_no;
	private int menu_cnt;
	private int coupon_apply;
	private String used_date;
	private int sum_price_ko;
	private int sum_price_cn;
	private String reg_date;
	
	
	
	@Override
	public String toString() {
		return "MyCart [cart_id=" + cart_id + ", pid=" + pid + ", user_no="
				+ user_no + ", menu_no=" + menu_no + ", menu_cnt=" + menu_cnt
				+ ", coupon_value=" + coupon_apply + ", used_date=" + used_date
				+ ", sum_price_ko=" + sum_price_ko + ", sum_price_cn="
				+ sum_price_cn + ", reg_date=" + reg_date + "]";
	}



	public int getCart_id() {
		return cart_id;
	}



	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}



	public String getPid() {
		return pid;
	}



	public void setPid(String pid) {
		this.pid = pid;
	}



	public int getUser_no() {
		return user_no;
	}



	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}



	public int getMenu_no() {
		return menu_no;
	}



	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}



	public int getMenu_cnt() {
		return menu_cnt;
	}



	public void setMenu_cnt(int menu_cnt) {
		this.menu_cnt = menu_cnt;
	}



	public int getCoupon_apply() {
		return coupon_apply;
	}



	public void setCoupon_apply(int coupon_apply) {
		this.coupon_apply = coupon_apply;
	}



	public String getUsed_date() {
		return used_date;
	}



	public void setUsed_date(String used_date) {
		this.used_date = used_date;
	}



	public int getSum_price_ko() {
		return sum_price_ko;
	}



	public void setSum_price_ko(int sum_price_ko) {
		this.sum_price_ko = sum_price_ko;
	}



	public int getSum_price_cn() {
		return sum_price_cn;
	}



	public void setSum_price_cn(int sum_price_cn) {
		this.sum_price_cn = sum_price_cn;
	}



	public String getReg_date() {
		return reg_date;
	}



	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	
	
}

