/*
 * @(#)PayMain.java  2013. 8. 15.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 15.
 * 
 */

public class PayMain extends Page {
	// type
	public static final char PAYUSED_NO = 'N';
	public static final char PAYUSED_YES = 'Y';
	public static final char PAYUSED_FAIL = 'F';
	
	// method
	public static final String PAYMETHOD_BANK = "BANK";
	public static final String PAYMETHOD_CARD = "CARD";
		
	// type
	//public static final String PAYTYPE_NONE = "00";
	public static final String PAYTYPE_STORE = "10";
	public static final String PAYTYPE_RESERVATION = "30";
	public static final String PAYTYPE_DEAL = "40";
	
	// STATE
	public static final String PAYSTATE_PAY_WAIT = "10";
	public static final String PAYSTATE_PAY_COMPLETE = "19";
	public static final String PAYSTATE_CANCEL_COMPLETE = "29";
	public static final String PAYSTATE_REFUND_REQUEST = "30";
	public static final String PAYSTATE_REFUND_NOT_CANCEL = "38";
	public static final String PAYSTATE_REFUND_COMPLETE = "39";
	
	public static final String PAYSTATE_PAY_ALLSEARCH = "1";
	public static final String PAYSTATE_REFUND_ALLSEARCH = "3";
		
		
		
	private static int unique_count = 0;
	
	
	private String pid;
	private int user_no;
	private String user_id;
	private String user_name;
	private String user_email;
	private String user_phone;
	
	private String pay_method;
	private String pay_state;
	private String pay_type;
	private String pay_title;
	private int pay_price_ko;
	private int pay_price_cn;
	private int cancel_price_ko;
	private int cancel_price_cn;
	private int sale_price_ko;
	private int sale_price_cn;
	
	private String cancel_msg;
	private String cancel_date;
	private String refund_date;
	private String pay_date;
	private String reg_date;
	private char pay_used;
	
	// return yymmddhhMMss + count(2)
	public static String createPID()
	{
		unique_count++;
		if(unique_count >= 100) unique_count = 0;
		String str_num = String.format("%02d", unique_count);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMddHHmmss");
		String pid = dateFormat.format(new Date()) + str_num;
		return pid;
	}
	

	


	@Override
	public String toString() {
		return "PayMain [pid=" + pid + ", user_no=" + user_no + ", user_id="
				+ user_id + ", user_name=" + user_name + ", user_email="
				+ user_email + ", user_phone=" + user_phone + ", pay_method="
				+ pay_method + ", pay_state=" + pay_state + ", pay_type="
				+ pay_type + ", pay_title=" + pay_title + ", pay_price_ko="
				+ pay_price_ko + ", pay_price_cn=" + pay_price_cn
				+ ", cancel_price_ko=" + cancel_price_ko + ", cancel_price_cn="
				+ cancel_price_cn + ", sale_price_ko=" + sale_price_ko
				+ ", sale_price_cn=" + sale_price_cn + ", cancel_msg="
				+ cancel_msg + ", cancel_date=" + cancel_date
				+ ", refund_date=" + refund_date + ", pay_date=" + pay_date
				+ ", reg_date=" + reg_date + ", pay_used=" + pay_used + "]" + super.toString();
	}



	public static int getUnique_count() {
		return unique_count;
	}

	public static void setUnique_count(int unique_count) {
		PayMain.unique_count = unique_count;
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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	
	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}


	public String getPay_state() {
		return pay_state;
	}

	public void setPay_state(String pay_state) {
		this.pay_state = pay_state;
	}

	public String getPay_type() {
		return pay_type;
	}

	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}

	public String getPay_title() {
		return pay_title;
	}

	public void setPay_title(String pay_title) {
		this.pay_title = pay_title;
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

	public int getCancel_price_ko() {
		return cancel_price_ko;
	}

	public void setCancel_price_ko(int cancel_price_ko) {
		this.cancel_price_ko = cancel_price_ko;
	}

	public int getCancel_price_cn() {
		return cancel_price_cn;
	}

	public void setCancel_price_cn(int cancel_price_cn) {
		this.cancel_price_cn = cancel_price_cn;
	}

	public int getSale_price_ko() {
		return sale_price_ko;
	}

	public void setSale_price_ko(int sale_price_ko) {
		this.sale_price_ko = sale_price_ko;
	}

	public int getSale_price_cn() {
		return sale_price_cn;
	}

	public void setSale_price_cn(int sale_price_cn) {
		this.sale_price_cn = sale_price_cn;
	}

	public String getCancel_msg() {
		return cancel_msg;
	}

	public void setCancel_msg(String cancel_msg) {
		this.cancel_msg = cancel_msg;
	}

	public String getCancel_date() {
		return cancel_date;
	}

	public void setCancel_date(String cancel_date) {
		this.cancel_date = cancel_date;
	}

	public String getRefund_date() {
		return refund_date;
	}

	public void setRefund_date(String refund_date) {
		this.refund_date = refund_date;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public char getPay_used() {
		return pay_used;
	}

	public void setPay_used(char pay_used) {
		this.pay_used = pay_used;
	}

	
}

