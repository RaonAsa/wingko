/*
 * @(#)Travel.java 2013. 8. 11.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;
 
/**
 * TODO
 *
 * @author  yshsy
 * @version 1.0,  2013. 8. 11.
 */
public class Travel extends Page {
	private String travel_no;
	private String location_no;
	private String location_name;
	private String location_name_ko;
	private String travel_category_no;
	private String travel_category_name;
	private String travel_category_name_ko;
	private String title;
	private String content;
	private String image = "";
	private String use_flag;
	private int ripple_count = 0;
	private int hit = 0;
	private int recommend = 0;
	private String edit_date;
	private String reg_date;
	private String sort;
	private String top;
	
	private String search_title = "";
	
	public Travel() {
		super();
	}
	
	
	public Travel(String travel_category_no, String sort, int pageSize) {
		super();
		this.travel_category_no = travel_category_no;
		this.sort = sort;
		super.setPageSize(pageSize);
	}


	public String getTravel_no() {
		return travel_no;
	}
	public void setTravel_no(String travel_no) {
		this.travel_no = travel_no;
	}
	public String getLocation_no() {
		return location_no;
	}
	public void setLocation_no(String location_no) {
		this.location_no = location_no;
	}
	public String getLocation_name() {
		return location_name;
	}
	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}
	public String getLocation_name_ko() {
		return location_name_ko;
	}
	public void setLocation_name_ko(String location_name_ko) {
		this.location_name_ko = location_name_ko;
	}
	public String getTravel_category_no() {
		return travel_category_no;
	}
	public void setTravel_category_no(String travel_category_no) {
		this.travel_category_no = travel_category_no;
	}
	public String getTravel_category_name() {
		return travel_category_name;
	}
	public void setTravel_category_name(String travel_category_name) {
		this.travel_category_name = travel_category_name;
	}
	public String getTravel_category_name_ko() {
		return travel_category_name_ko;
	}
	public void setTravel_category_name_ko(String travel_category_name_ko) {
		this.travel_category_name_ko = travel_category_name_ko;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getUse_flag() {
		return use_flag;
	}
	public void setUse_flag(String use_flag) {
		this.use_flag = use_flag;
	}
	public int getRipple_count() {
		return ripple_count;
	}
	public void setRipple_count(int ripple_count) {
		this.ripple_count = ripple_count;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
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
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getTop() {
		return top;
	}
	public void setTop(String top) {
		this.top = top;
	}	
	public String getSearch_title() {
		return search_title;
	}


	public void setSearch_title(String search_title) {
		this.search_title = search_title;
	}


	@Override
	public String toString() {
		return "Travel [travel_no=" + travel_no + ", location_no="
				+ location_no + ", location_name=" + location_name
				+ ", location_name_ko=" + location_name_ko
				+ ", travel_category_no=" + travel_category_no
				+ ", travel_category_name=" + travel_category_name
				+ ", travel_category_name_ko=" + travel_category_name_ko
				+ ", title=" + title + ", content=" + content + ", image="
				+ image + ", use_flag=" + use_flag + ", ripple_count="
				+ ripple_count + ", hit=" + hit + ", recommend=" + recommend
				+ ", edit_date=" + edit_date + ", reg_date=" + reg_date
				+ ", sort=" + sort + ", top=" + top + ", search_title="
				+ search_title + "]";
	}
	
	
}
