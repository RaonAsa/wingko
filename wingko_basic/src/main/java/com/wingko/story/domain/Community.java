/*
 * @(#)Commnunity.java  2013. 9. 15.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 15.
 */
public class Community extends Page {
	private int no;
	private int location_no = 0;
	private String category = "";
	private String notice_flag = "";
	private String title;
	private String content;
	private int user_no;
	private int hit;
	private int recommend;
	private String use_flag = "";
	private String edit_date;
	private String reg_date;
	private String image_thumb = "";
	
	private String location_name;
	private int ripple_count;
	private String user_name;
	private String user_nickname;
	
	private String search_type = "";
	private String search_string = "";
	
	private String sort = "no";

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getLocation_no() {
		return location_no;
	}
	public void setLocation_no(int location_no) {
		this.location_no = location_no;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getNotice_flag() {
		return notice_flag;
	}
	public void setNotice_flag(String notice_flag) {
		this.notice_flag = notice_flag;
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
	public String getImage_thumb() {
		return image_thumb;
	}
	public void setImage_thumb(String image_thumb) {
		this.image_thumb = image_thumb;
	}
	public String getLocation_name() {
		return location_name;
	}
	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}
	public int getRipple_count() {
		return ripple_count;
	}
	public void setRipple_count(int ripple_count) {
		this.ripple_count = ripple_count;
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
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
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
		return "Community [no=" + no + ", location_no=" + location_no
				+ ", category=" + category + ", notice_flag=" + notice_flag
				+ ", title=" + title + ", content=" + content + ", user_no="
				+ user_no + ", hit=" + hit + ", recommend=" + recommend
				+ ", use_flag=" + use_flag + ", edit_date=" + edit_date
				+ ", reg_date=" + reg_date + ", image_thumb=" + image_thumb
				+ ", location_name=" + location_name + ", ripple_count="
				+ ripple_count + ", user_name=" + user_name
				+ ", user_nickname=" + user_nickname + ", search_type="
				+ search_type + ", search_string=" + search_string + ", sort="
				+ sort + "]";
	}
}

