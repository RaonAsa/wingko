/*
 * @(#)CompanyNews.java  2013. 10. 2.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 10. 2.
 */
public class CompanyNews extends Page {
	private int no;
	private String title;
	private String content;
	private int user_no;
	private String user_nickname;
	private int hit;
	private String edit_date;
	private String reg_date;
	private String use_flag;
	
	private String search_type = "";
	private String search_string = "";
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
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
	public String getUse_flag() {
		return use_flag;
	}
	public void setUse_flag(String use_flag) {
		this.use_flag = use_flag;
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
	@Override
	public String toString() {
		return "CompanyNews [no=" + no + ", title=" + title + ", content="
				+ content + ", user_no=" + user_no + ", user_nickname="
				+ user_nickname + ", hit=" + hit + ", edit_date=" + edit_date
				+ ", reg_date=" + reg_date + ", use_flag=" + use_flag
				+ ", search_type=" + search_type + ", search_string="
				+ search_string + "]";
	}
	
}

