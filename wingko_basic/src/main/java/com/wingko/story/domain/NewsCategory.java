/*
 * @(#)NewsCategory.java  2013. 9. 2.
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
public class NewsCategory {
	private int news_category_no;
	private String title;
	private String title_ko;
	public int getNews_category_no() {
		return news_category_no;
	}
	public void setNews_category_no(int news_category_no) {
		this.news_category_no = news_category_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle_ko() {
		return title_ko;
	}
	public void setTitle_ko(String title_ko) {
		this.title_ko = title_ko;
	}
	@Override
	public String toString() {
		return "NewsCategory [news_category_no=" + news_category_no
				+ ", title=" + title + ", title_ko=" + title_ko + "]";
	}

}

