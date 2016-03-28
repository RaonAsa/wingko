/*
 * @(#)Ripple.java 2013. 8. 6.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;
 
/**
 * Reply 관리 VO
 *
 * @author  yshsy
 * @version 1.0,  2013. 8. 6.
 */
public class Ripple extends Page {
	private int no;
	private int parent_no;
	private String parent_code;			// store(상점상세정보)
	private int user_no;
	private String user_id;
	private String user_nickname;
	private String content;
	private String reg_date;
	private String reply_check;
	private String reqply_check_date;
	private String reply_order;
	private int level;
	
	private String search_type = "";
	private String search_string = "";
	
	public Ripple() {
		super();
	}

	public Ripple(int parent_no, String parent_code) {
		this.parent_no = parent_no;
		this.parent_code = parent_code;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getParent_no() {
		return parent_no;
	}
	public void setParent_no(int parent_no) {
		this.parent_no = parent_no;
	}
	public String getParent_code() {
		return parent_code;
	}
	public void setParent_code(String parent_code) {
		this.parent_code = parent_code;
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
	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	@Override
	public String toString() {
		return "Ripple [no=" + no + ", parent_no=" + parent_no
				+ ", parent_code=" + parent_code + ", user_no=" + user_no
				+ ", user_id=" + user_id + ", user_nickname=" + user_nickname
				+ ", content=" + content + ", reg_date=" + reg_date 
				+ ", reply_order=" + reply_order + "]";
	}

	public String getSearch_type() {
		return search_type;
	}

	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}

	public String getSearch_string() {
		return search_string;
	}

	public void setSearch_string(String search_string) {
		this.search_string = search_string;
	}

	public String getReply_check() {
		return reply_check;
	}

	public void setReply_check(String reply_check) {
		this.reply_check = reply_check;
	}

	public String getReqply_check_date() {
		return reqply_check_date;
	}

	public void setReqply_check_date(String reqply_check_date) {
		this.reqply_check_date = reqply_check_date;
	}

	public String getReply_order() {
		return reply_order;
	}

	public void setReply_order(String reply_order) {
		this.reply_order = reply_order;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}
	
	
}
