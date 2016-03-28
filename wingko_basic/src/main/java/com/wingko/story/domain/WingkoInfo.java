/*
 * @(#)WingkoInfo.java  2013. 9. 5.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 9. 5.
 */


public class WingkoInfo {
	private int idx;
	private String bank_info;
	private String faq_tel;
	private String faq_email;
	private int cancel_pay_day;
	private int cancel_reservation_day;
	
	
	@Override
	public String toString() {
		return "WingkoInfo [idx=" + idx + ", bank_info=" + bank_info
				+ ", faq_tel=" + faq_tel + ", faq_email=" + faq_email
				+ ", cancel_pay_day=" + cancel_pay_day
				+ ", cancel_reservation_day=" + cancel_reservation_day + "]";
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getBank_info() {
		return bank_info;
	}
	public void setBank_info(String bank_info) {
		this.bank_info = bank_info;
	}
	public String getFaq_tel() {
		return faq_tel;
	}
	public void setFaq_tel(String faq_tel) {
		this.faq_tel = faq_tel;
	}
	public String getFaq_email() {
		return faq_email;
	}
	public void setFaq_email(String faq_email) {
		this.faq_email = faq_email;
	}
	public int getCancel_pay_day() {
		return cancel_pay_day;
	}
	public void setCancel_pay_day(int cancel_pay_day) {
		this.cancel_pay_day = cancel_pay_day;
	}
	public int getCancel_reservation_day() {
		return cancel_reservation_day;
	}
	public void setCancel_reservation_day(int cancel_reservation_day) {
		this.cancel_reservation_day = cancel_reservation_day;
	}
	
	
}

