/*
 * @(#)PayAcount.java  2013. 8. 19.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;


/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 19.
 */
public class PayAcount extends Page {
	private String reg_date;
	private int pay_cnt;
	private int refund_cnt;
	private int pay_price_cn;
	private int pay_price_ko;
	private int wait_price_cn;
	private int wait_price_ko;
	private int refund_price_cn;
	private int refund_price_ko;
	private int sale_price_cn;
	private int sale_price_ko;
	
	@Override
	public String toString() {
		return "PayAcount [reg_date=" + reg_date + ", pay_cnt=" + pay_cnt
				+ ", refund_cnt=" + refund_cnt + ", pay_price_cn="
				+ pay_price_cn + ", pay_price_ko=" + pay_price_ko
				+ ", wait_price_cn=" + wait_price_cn + ", wait_price_ko="
				+ wait_price_ko + ", refund_price_cn=" + refund_price_cn
				+ ", refund_price_ko=" + refund_price_ko + ", sale_price_cn="
				+ sale_price_cn + ", sale_price_ko=" + sale_price_ko + "]";
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getPay_cnt() {
		return pay_cnt;
	}
	public void setPay_cnt(int pay_cnt) {
		this.pay_cnt = pay_cnt;
	}
	public int getRefund_cnt() {
		return refund_cnt;
	}
	public void setRefund_cnt(int refund_cnt) {
		this.refund_cnt = refund_cnt;
	}
	public int getPay_price_cn() {
		return pay_price_cn;
	}
	public void setPay_price_cn(int pay_price_cn) {
		this.pay_price_cn = pay_price_cn;
	}
	public int getPay_price_ko() {
		return pay_price_ko;
	}
	public void setPay_price_ko(int pay_price_ko) {
		this.pay_price_ko = pay_price_ko;
	}
	public int getWait_price_cn() {
		return wait_price_cn;
	}
	public void setWait_price_cn(int wait_price_cn) {
		this.wait_price_cn = wait_price_cn;
	}
	public int getWait_price_ko() {
		return wait_price_ko;
	}
	public void setWait_price_ko(int wait_price_ko) {
		this.wait_price_ko = wait_price_ko;
	}
	public int getRefund_price_cn() {
		return refund_price_cn;
	}
	public void setRefund_price_cn(int refund_price_cn) {
		this.refund_price_cn = refund_price_cn;
	}
	public int getRefund_price_ko() {
		return refund_price_ko;
	}
	public void setRefund_price_ko(int refund_price_ko) {
		this.refund_price_ko = refund_price_ko;
	}
	public int getSale_price_cn() {
		return sale_price_cn;
	}
	public void setSale_price_cn(int sale_price_cn) {
		this.sale_price_cn = sale_price_cn;
	}
	public int getSale_price_ko() {
		return sale_price_ko;
	}
	public void setSale_price_ko(int sale_price_ko) {
		this.sale_price_ko = sale_price_ko;
	}
	
	
	
}

