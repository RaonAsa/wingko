/*
 * @(#)MailData.java  2013. 10. 5.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 10. 5.
 */
public class MailData extends Page{
	public static String MAIL_TYPE_ALL = "ALL";


	private int mail_no;
	private String mail_type;
	private String addr_to;
	private String mail_title;
	private String mail_body;
	private int send_count;
	private String reg_date;
	
	
	@Override
	public String toString() {
		return "MailData [mail_no=" + mail_no + ", mail_type=" + mail_type
				+ ", addr_to=" + addr_to + ", mail_title=" + mail_title
				+ ", mail_body=" + mail_body + ", send_count=" + send_count
				+ ", reg_date=" + reg_date + "]";
	}
	public int getMail_no() {
		return mail_no;
	}
	public void setMail_no(int mail_no) {
		this.mail_no = mail_no;
	}
	public String getMail_type() {
		return mail_type;
	}
	public void setMail_type(String mail_type) {
		this.mail_type = mail_type;
	}
	public String getAddr_to() {
		return addr_to;
	}
	public void setAddr_to(String addr_to) {
		this.addr_to = addr_to;
	}
	public String getMail_title() {
		return mail_title;
	}
	public void setMail_title(String mail_title) {
		this.mail_title = mail_title;
	}
	public String getMail_body() {
		return mail_body;
	}
	public void setMail_body(String mail_body) {
		this.mail_body = mail_body;
	}
	public int getSend_count() {
		return send_count;
	}
	public void setSend_count(int send_count) {
		this.send_count = send_count;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
}

