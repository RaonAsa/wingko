/*
 * @(#)Search.java  2013. 9. 24.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 24.
 */
public class Search extends Page {
	private int no;
	private String content_type;
	private String title;
	private String content;
	private String image;
	private int menu = 0;
	private String searchType = "title";
	private String searchString = "";

	// 스크랩 위해 추가..
	private int user_no;
	private String location_name;
	private String category_name;
	private int scrap_no;

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getContent_type() {
		return content_type;
	}
	public void setContent_type(String content_type) {
		this.content_type = content_type;
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
	public int getMenu() {
		return menu;
	}
	public void setMenu(int menu) {
		this.menu = menu;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchString() {
		return searchString;
	}
	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getLocation_name() {
		return location_name;
	}
	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	
	public int getScrap_no() {
		return scrap_no;
	}
	public void setScrap_no(int scrap_no) {
		this.scrap_no = scrap_no;
	}
	@Override
	public String toString() {
		return "Search [no=" + no + ", content_type=" + content_type
				+ ", title=" + title + ", content=" + content + ", image="
				+ image + ", menu=" + menu + ", searchType=" + searchType
				+ ", searchString=" + searchString + ", user_no=" + user_no
				+ ", location_name=" + location_name + ", category_name="
				+ category_name + ", scrap_no=" + scrap_no + "]";
	}

}

