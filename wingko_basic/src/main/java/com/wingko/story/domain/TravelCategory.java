/*
 * @(#)TravelCategory.java 2013. 8. 11.
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
public class TravelCategory {

	private int travel_category_no;
	private String travel_category_name;
	private String travel_category_name_ko;
	
	
	public int getTravel_category_no() {
		return travel_category_no;
	}
	public void setTravel_category_no(int travel_category_no) {
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
	
	@Override
	public String toString() {
		return "TravelCategory [travel_category_no=" + travel_category_no
				+ ", travel_category_name=" + travel_category_name
				+ ", travel_category_name_ko=" + travel_category_name_ko + "]";
	}
	
	
}
