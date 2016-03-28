/*
 * @(#)JoinCode.java  2013. 8. 26.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 26.
 */
public class JoinCode extends Page {
	private int join_no;
	private String title;
	private String description;
	private String use_flag;
	private String edit_date;
	private String reg_date;

	public int getJoin_no() {
		return join_no;
	}
	public void setJoin_no(int join_no) {
		this.join_no = join_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUse_flag() {
		return use_flag;
	}
	public void setUse_flag(String use_flag) {
		this.use_flag = use_flag;
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
	

	@Override
	public String toString() {
		return "JoinCode [join_no=" + join_no + ", title=" + title
				+ ", description=" + description + ", use_flag=" + use_flag
				+ ", edit_date=" + edit_date + ", reg_date=" + reg_date + "]";
	}
	
	
	
	

}

