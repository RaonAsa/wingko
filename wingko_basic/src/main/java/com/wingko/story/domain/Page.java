/*
 * @(#)Page.java 2013. 8. 3.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;
 
/**
 * TODO
 *
 * @author  yshsy
 * @version 1.0,  2013. 8. 3.
 */
public class Page {

	private int page = 1;
	private int pageSize = 20;
	private int start_no = (page-1) * pageSize;
	private int end_no = (page * pageSize);

	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page <= 0) page = 1;
		this.page = page;
		setStart_no();
		setEnd_no();
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		setStart_no();
		setEnd_no();
	}
	public int getStart_no() {
		return start_no;
	}
	public void setStart_no() {
		this.start_no = (this.page-1) * this.pageSize;
	}
	public int getEnd_no() {
		return end_no;
	}
	public void setEnd_no() {
		this.end_no = (this.page * this.pageSize);
	}
}
