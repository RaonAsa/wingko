/*
 * @(#)PayItem.java  2013. 8. 27.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 27.
 * 
CREATE TABLE  `wingko`.`pay_item` (
  `item_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` char(14) NOT NULL,
  `item_type` char(2) DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `used_date` varchar(10) DEFAULT NULL,
  `coupon_price` int(11) unsigned DEFAULT '0',
  `pay_price_ko` int(11) unsigned DEFAULT '0',
  `pay_price_cn` int(11) unsigned DEFAULT '0',

  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */
public class PayItem {
	// type
	public static final String ITEMTYPE_NONE = "00";
	public static final String ITEMTYPE_MENU = "01";
	public static final String ITEMTYPE_RESERVATION = "02";
	public static final String ITEMTYPE_DEAL = "03";
	public static final String ITEMTYPE_DEAL_COST = "09";
	
		
		
	private int item_id;
	private String pid;
	private int menu_no;
	private int menu_cnt;
	private String item_type;
	private String item_location;
	private String item_store;
	private String item_name;
	private String used_date;
	private int coupon_value;
	private int pay_price_ko;
	private int pay_price_cn;
	private char cancel_yn;
	private String reg_date;
	
	
	@Override
	public String toString() {
		return "PayItem [item_id=" + item_id + ", pid=" + pid + ", menu_no="
				+ menu_no + ", menu_cnt=" + menu_cnt + ", item_type="
				+ item_type + ", item_location=" + item_location
				+ ", item_store=" + item_store + ", item_name=" + item_name
				+ ", used_date=" + used_date + ", coupon_value=" + coupon_value
				+ ", pay_price_ko=" + pay_price_ko + ", pay_price_cn="
				+ pay_price_cn + ", cancel_yn=" + cancel_yn + ", reg_date=" + reg_date + "]";
	}
	
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
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
	public String getItem_type() {
		return item_type;
	}
	
	public String getItem_location() {
		return item_location;
	}


	public void setItem_location(String item_location) {
		this.item_location = item_location;
	}


	public String getItem_store() {
		return item_store;
	}


	public void setItem_store(String item_store) {
		this.item_store = item_store;
	}


	public void setItem_type(String item_type) {
		this.item_type = item_type;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getUsed_date() {
		return used_date;
	}
	public void setUsed_date(String used_date) {
		this.used_date = used_date;
	}
	public int getCoupon_value() {
		return coupon_value;
	}
	public void setCoupon_value(int coupon_value) {
		this.coupon_value = coupon_value;
	}
	public int getPay_price_ko() {
		return pay_price_ko;
	}
	public void setPay_price_ko(int pay_price_ko) {
		this.pay_price_ko = pay_price_ko;
	}
	public int getPay_price_cn() {
		return pay_price_cn;
	}
	public void setPay_price_cn(int pay_price_cn) {
		this.pay_price_cn = pay_price_cn;
	}

	public char getCancel_yn() {
		return cancel_yn;
	}

	public void setCancel_yn(char cancel_yn) {
		this.cancel_yn = cancel_yn;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
}

