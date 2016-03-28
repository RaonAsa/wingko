/*
 * @(#)TravelInfo.java  2013. 8. 15.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 15.
 */
public class TravelInfo {
	private int no = 0;
	private String menu;
	private String title;
	private String content;
	private String reg_date;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
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
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	

	@Override
	public String toString() {
		return "TravelInfo [no=" + no + ", menu=" + menu + ", title=" + title
				+ ", content=" + content + ", reg_date=" + reg_date + "]";
	}
	
	

}

