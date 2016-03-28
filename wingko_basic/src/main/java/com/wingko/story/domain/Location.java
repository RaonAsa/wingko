/*
 * @(#)Location.java 2013. 7. 20.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;
 
/**
 * TODO
 *
 * @author  yshsy
 * @version 1.0,  2013. 7. 20.
 */
public class Location {
	private String location_no;
	private String name;
	private String name_ko;
	private String memo;
	private String image;
	private String image_thumb;
	private String depth;
	private String parent_location_no;
	private String parent_location_name;
	private String parent_location_name_ko;
	private String x;
	private String y;
	private String reg_date;
	private String header_info;
	
	public Location(){}

	public Location(String location_no, String name, String name_ko,
			String memo, String image, String image_thumb, String depth,
			String parent_location_no, String parent_location_name,
			String parent_location_name_ko, String x, String y,
			String reg_date, String header_info) {
		super();
		this.location_no = location_no;
		this.name = name;
		this.name_ko = name_ko;
		this.memo = memo;
		this.image = image;
		this.image_thumb = image_thumb;
		this.depth = depth;
		this.parent_location_no = parent_location_no;
		this.parent_location_name = parent_location_name;
		this.parent_location_name_ko = parent_location_name_ko;
		this.x = x;
		this.y = y;
		this.reg_date = reg_date;
		this.header_info = header_info;
	}

	public String getLocation_no() {
		return location_no;
	}

	public void setLocation_no(String location_no) {
		this.location_no = location_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName_ko() {
		return name_ko;
	}

	public void setName_ko(String name_ko) {
		this.name_ko = name_ko;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getImage_thumb() {
		return image_thumb;
	}

	public void setImage_thumb(String image_thumb) {
		this.image_thumb = image_thumb;
	}

	public String getDepth() {
		return depth;
	}

	public void setDepth(String depth) {
		this.depth = depth;
	}

	public String getParent_location_no() {
		return parent_location_no;
	}

	public void setParent_location_no(String parent_location_no) {
		this.parent_location_no = parent_location_no;
	}

	public String getParent_location_name() {
		return parent_location_name;
	}

	public void setParent_location_name(String parent_location_name) {
		this.parent_location_name = parent_location_name;
	}

	public String getParent_location_name_ko() {
		return parent_location_name_ko;
	}

	public void setParent_location_name_ko(String parent_location_name_ko) {
		this.parent_location_name_ko = parent_location_name_ko;
	}

	public String getX() {
		return x;
	}

	public void setX(String x) {
		this.x = x;
	}

	public String getY() {
		return y;
	}

	public void setY(String y) {
		this.y = y;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getHeader_info() {
		return header_info;
	}

	public void setHeader_info(String header_info) {
		this.header_info = header_info;
	}

	@Override
	public String toString() {
		return "Location [location_no=" + location_no + ", name=" + name
				+ ", name_ko=" + name_ko + ", memo=" + memo + ", image="
				+ image + ", image_thumb=" + image_thumb + ", depth=" + depth
				+ ", parent_location_no=" + parent_location_no
				+ ", parent_location_name=" + parent_location_name
				+ ", parent_location_name_ko=" + parent_location_name_ko
				+ ", x=" + x + ", y=" + y + ", reg_date=" + reg_date
				+ ", header_info=" + header_info + "]";
	}
	
	
}
