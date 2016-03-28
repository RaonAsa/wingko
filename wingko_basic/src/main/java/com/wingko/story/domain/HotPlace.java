/*
 * @(#)HotPlace.java  2013. 9. 22.
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
public class HotPlace {
	private int no;
	private int parent_location_no = 12;
	private String parent_location_name;
	private int location_no = 0;
	private String location_name;
	private String location_name_ko;
	private int sort;
	private int org_sort;
	private String use_flag;
	private String edit_date;
	private String reg_date;
	private String image;
	private String memo;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getParent_location_no() {
		return parent_location_no;
	}
	public void setParent_location_no(int parent_location_no) {
		this.parent_location_no = parent_location_no;
	}
	public String getParent_location_name() {
		return parent_location_name;
	}
	public void setParent_location_name(String parent_location_name) {
		this.parent_location_name = parent_location_name;
	}
	public String getLocation_name_ko() {
		return location_name_ko;
	}
	public void setLocation_name_ko(String location_name_ko) {
		this.location_name_ko = location_name_ko;
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
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public int getOrg_sort() {
		return org_sort;
	}
	public void setOrg_sort(int org_sort) {
		this.org_sort = org_sort;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	@Override
	public String toString() {
		return "HotPlace [no=" + no + ", parent_location_no="
				+ parent_location_no + ", parent_location_name="
				+ parent_location_name + ", location_no=" + location_no
				+ ", location_name=" + location_name + ", location_name_ko="
				+ location_name_ko + ", sort=" + sort + ", org_sort="
				+ org_sort + ", use_flag=" + use_flag + ", edit_date="
				+ edit_date + ", reg_date=" + reg_date + ", image=" + image
				+ ", memo=" + memo + "]";
	}
	
}

