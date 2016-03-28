/*
 * @(#)Qna.java  2013. 9. 21.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 21.
 */
public class Qna extends Page {
	private int no;
	private int ref = 0;
	private int ref_level = 0;
	private int sort = 0;
	private String title;
	private String content;
	private int user_no;
	private String user_name;
	private String user_nickname;
	private String edit_date;
	private String reg_date;
	private int hit;
	private String qna_flag;
	
	private String search_type = "";
	private String search_string = "";
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRef_level() {
		return ref_level;
	}
	public void setRef_level(int ref_level) {
		this.ref_level = ref_level;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getQna_flag() {
		return qna_flag;
	}
	public void setQna_flag(String qna_flag) {
		this.qna_flag = qna_flag;
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
		return "Qna [no=" + no + ", ref=" + ref + ", ref_level=" + ref_level
				+ ", sort=" + sort + ", title=" + title + ", content="
				+ content + ", user_no=" + user_no + ", user_name=" + user_name
				+ ", user_nickname=" + user_nickname + ", edit_date="
				+ edit_date + ", reg_date=" + reg_date + ", hit=" + hit
				+ ", qna_flag=" + qna_flag + ", search_type=" + search_type
				+ ", search_string=" + search_string + "]";
	}
	
	
}

