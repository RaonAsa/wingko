/*
 * @(#)CouponeType.java  2013. 8. 1.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 1.
 */
public class CouponInfo {
	
	// count_type
	public static final String COUPONINFO_PRICE = "1"; // 가격
	public static final String COUPONINFO_PERCENT = "2"; // 할인율
	
	 
	private int idx;
	private int coupon_type;
	private int coupon_value;
	private String info_desc; // 쿠폰 설명
	private String info_desc_ko;
	private String used; // Y, N
	private String start_date;
	private String end_date;
	private String reg_date;
	
		

	@Override
	public String toString() {
		return "CouponInfo [idx=" + idx + ", coupon_type=" + coupon_type
				+ ", coupon_value=" + coupon_value + ", info_desc=" + info_desc
				+ ", info_desc_ko=" + info_desc_ko + ", used=" + used
				+ ", start_date=" + start_date + ", end_date=" + end_date
				+ ", reg_date=" + reg_date + "]";
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getCoupon_type() {
		return coupon_type;
	}

	public void setCoupon_type(int coupon_type) {
		this.coupon_type = coupon_type;
	}

	public int getCoupon_value() {
		return coupon_value;
	}
	
	public String getUsed() {
		return used;
	}

	public void setCoupon_value(int coupon_value) {
		this.coupon_value = coupon_value;
	}

	public String getInfo_desc() {
		return info_desc;
	}

	public void setInfo_desc(String info_desc) {
		this.info_desc = info_desc;
	}

	public String getInfo_desc_ko() {
		return info_desc_ko;
	}

	public void setInfo_desc_ko(String info_desc_ko) {
		this.info_desc_ko = info_desc_ko;
	}

	public void setUsed(String used) {
		this.used = used;
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

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	
	
}

