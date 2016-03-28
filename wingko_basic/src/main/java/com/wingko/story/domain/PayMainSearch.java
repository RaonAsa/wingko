/*
 * @(#)PayMain.java  2013. 8. 15.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;


/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 15.
 */
public class PayMainSearch extends PayMain {
	
	private String start_date;
	private String end_date;
	private boolean is_paging = true;
	

	@Override
	public String toString() {
		return "PayMainSearch [start_date=" + start_date + ", end_date="
				+ end_date + ", is_paging=" + is_paging + "]" + super.toString();
	}

	public String getStart_date() {
		return start_date;
	}
	
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}


	public boolean isIs_paging() {
		return is_paging;
	}


	public void setIs_paging(boolean is_paging) {
		this.is_paging = is_paging;
	}

	
}

