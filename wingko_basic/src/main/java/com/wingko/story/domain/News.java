/*
 * @(#)News.java  2013. 9. 2.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 2.
 */
public class News extends Page {
	private int news_no;
	private int news_category_no = 0;
	private int store_no = 0;
	private String news_category_title;
	private String store_title;
	private String title;
	private String content;
	private String thumb_image = "";
	private String thumb_image_top = "";
	private String thumb_image_location = "";
	private String top_use_flag;
	private String use_flag;
	private int ripple_count;
	private int hit;
	private int recommend;
	private String edit_date;
	private String reg_date;
	
	private String location_no;
	
	private String search_type = "";
	private String search_string = "";
	
	public int getNews_no() {
		return news_no;
	}
	public void setNews_no(int news_no) {
		this.news_no = news_no;
	}
	public int getNews_category_no() {
		return news_category_no;
	}
	public void setNews_category_no(int news_category_no) {
		this.news_category_no = news_category_no;
	}
	public int getStore_no() {
		return store_no;
	}
	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}
	public String getNews_category_title() {
		return news_category_title;
	}
	public void setNews_category_title(String news_category_title) {
		this.news_category_title = news_category_title;
	}
	public String getStore_title() {
		return store_title;
	}
	public void setStore_title(String store_title) {
		this.store_title = store_title;
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
	public String getThumb_image() {
		return thumb_image;
	}
	public void setThumb_image(String thumb_image) {
		this.thumb_image = thumb_image;
	}
	public String getThumb_image_top() {
		return thumb_image_top;
	}
	public void setThumb_image_top(String thumb_image_top) {
		this.thumb_image_top = thumb_image_top;
	}
	public String getThumb_image_location() {
		return thumb_image_location;
	}
	public void setThumb_image_location(String thumb_image_location) {
		this.thumb_image_location = thumb_image_location;
	}
	public String getTop_use_flag() {
		return top_use_flag;
	}
	public void setTop_use_flag(String top_use_flag) {
		this.top_use_flag = top_use_flag;
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
	public String getLocation_no() {
		return location_no;
	}
	public void setLocation_no(String location_no) {
		this.location_no = location_no;
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
		return "News [news_no=" + news_no + ", news_category_no="
				+ news_category_no + ", store_no=" + store_no
				+ ", news_category_title=" + news_category_title
				+ ", store_title=" + store_title + ", title=" + title
				+ ", content=" + content + ", thumb_image=" + thumb_image
				+ ", thumb_image_top=" + thumb_image_top
				+ ", thumb_image_location=" + thumb_image_location
				+ ", top_use_flag=" + top_use_flag + ", use_flag=" + use_flag
				+ ", ripple_count=" + ripple_count + ", hit=" + hit
				+ ", recommend=" + recommend + ", edit_date=" + edit_date
				+ ", reg_date=" + reg_date + ", location_no=" + location_no
				+ ", search_type=" + search_type + ", search_string="
				+ search_string + "]";
	}
	
}

