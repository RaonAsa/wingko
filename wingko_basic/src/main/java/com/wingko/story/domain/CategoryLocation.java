/*
 * @(#)CategoryLocation.java  2013. 9. 22.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 22.
 */
public class CategoryLocation {
	private int no;
	private int category_no;
	private String category_name;
	private int location_no;
	private String location_name;
	private String info;
	private String map_info;
	private String edit_date;
	private String reg_date;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCategory_no() {
		return category_no;
	}
	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public int getLocation_no() {
		return location_no;
	}
	public void setLocation_no(int location_no) {
		this.location_no = location_no;
	}
	public String getLocation_name() {
		return location_name;
	}
	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getMap_info() {
		return map_info;
	}
	public void setMap_info(String map_info) {
		this.map_info = map_info;
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
		return "CategoryLocation [no=" + no + ", category_no=" + category_no
				+ ", category_name=" + category_name + ", location_no="
				+ location_no + ", location_name=" + location_name + ", info="
				+ info + ", map_info=" + map_info + ", edit_date=" + edit_date
				+ ", reg_date=" + reg_date + "]";
	}
	
	
}

