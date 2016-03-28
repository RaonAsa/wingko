/*
 * @(#)Coupon.java  2013. 8. 1.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Random;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 1.
 */
public class Coupon {
	private String coupon_id;
	private int info_idx; // CouponInfo idx
	private int user_no;
	private String used; // Y, N
	private int payment_id; // 사용 관련 table id
	private String give_desc; // 사용자 발급 사유(ex: 회원가입 지급, 로그인 지급, 프로모션 지급...)
	private String give_date; // 사용자 발급일
	private String used_date; // 쿠폰 사용일
	private String reg_date; // 쿠폰 생성일
	
	public static String getRndID(int nSize)
	{
		final String strCouponChar = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		final int char_len = 36; // strCouponChar.length();
		
		Random rnd = new Random();
		StringBuffer buf = new StringBuffer();
		for(int i=0; i<nSize; ++i)
		{
			buf.append(strCouponChar.charAt( rnd.nextInt(char_len) ));
		}
		
		return buf.toString();
	}
	
	public static Coupon getCreateCoupon()
	{
		Coupon coupon = new Coupon();
		coupon.setCoupon_id(getRndID(16));

		
		long time = System.currentTimeMillis();
		SimpleDateFormat formatDate = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss D");
		String strNowDate = formatDate.format(new Date(time));

		coupon.setReg_date(strNowDate);
		
		return coupon;
	}

	@Override
	public String toString() {
		return "Coupon [coupon_id=" + coupon_id + ", info_idx=" + info_idx
				+ ", user_no=" + user_no + ", used=" + used + ", payment_id="
				+ payment_id + ", give_desc=" + give_desc + ", give_date="
				+ give_date + ", used_date=" + used_date + ", reg_date="
				+ reg_date + "]";
	}

	public String getCoupon_id() {
		return coupon_id;
	}

	public void setCoupon_id(String coupon_id) {
		this.coupon_id = coupon_id;
	}

	

	public int getInfo_idx() {
		return info_idx;
	}

	public void setInfo_idx(int info_idx) {
		this.info_idx = info_idx;
	}

	public int getUser_no() {
		return user_no;
	}
	
	

	public String getUsed() {
		return used;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}


	public void setUsed(String used) {
		this.used = used;
	}

	public int getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}

	public String getGive_desc() {
		return give_desc;
	}

	public void setGive_desc(String give_desc) {
		this.give_desc = give_desc;
	}

	public String getGive_date() {
		return give_date;
	}

	public void setGive_date(String give_date) {
		this.give_date = give_date;
	}

	public String getUsed_date() {
		return used_date;
	}

	public void setUsed_date(String used_date) {
		this.used_date = used_date;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	
}

