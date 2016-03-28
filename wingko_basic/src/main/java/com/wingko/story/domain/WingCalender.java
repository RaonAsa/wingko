/*
 * @(#)WingCalender.java  2013. 8. 23.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 23.
 */
public class WingCalender extends Page{
	private int calender_id;
	private String wing_date;
	private String wing_type;
	private String wing_name;
	private String used;
	
	
	
	@Override
	public String toString() {
		return "WingCalender [calender_id=" + calender_id + ", wing_date="
				+ wing_date + ", wing_type=" + wing_type + ", wing_name="
				+ wing_name + ", used=" + used + "]" + super.toString();
	}
	
	public int getCalender_id() {
		return calender_id;
	}
	public void setCalender_id(int calender_id) {
		this.calender_id = calender_id;
	}
	public String getWing_date() {
		return wing_date;
	}
	public void setWing_date(String wing_date) {
		this.wing_date = wing_date;
	}
	public String getWing_type() {
		return wing_type;
	}
	public void setWing_type(String wing_type) {
		this.wing_type = wing_type;
	}
	public String getWing_name() {
		return wing_name;
	}
	public void setWing_name(String wing_name) {
		this.wing_name = wing_name;
	}
	public String getUsed() {
		return used;
	}
	public void setUsed(String used) {
		this.used = used;
	}
	
	
	
}

