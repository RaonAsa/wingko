/*
 * @(#)Product.java  2013. 7. 25.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 25.
 */
@JsonIgnoreProperties(ignoreUnknown=true)
public class Store extends Page {
	private String store_no;
	private String location_no;
	private String location_name;
	private String location_name_ko;
	private String category_no;
	private String parent_category_no;
	private String sub_category_no;
	private String category_name;
	private String category_name_ko;
	private String title;
	private String content;
	private String address;
	private String tel;
	private String tel2;
	private String email;
	private String office_hour;
	private String holiday;
	private String language_service;
	private String payment;
	private String traffic;
	private String traffic_bus;
	private String traffic_subway;
	private String etc;
	private String image = "";
	private String image_thumb = "";
	private String image1 = "";
	private String image2 = "";
	private String image3 = "";
	private String image_map = "";
	private String x;
	private String y;
	private String review_count;
	private String use_flag;
	private String edit_date;
	private String reg_date;
	private String checked;
	private String description;
	
	private String search_type = "";
	private String search_string = "";
	
	
	public String getStore_no() {
		return store_no;
	}
	public void setStore_no(String store_no) {
		this.store_no = store_no;
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
	public String getCategory_no() {
		return category_no;
	}
	public void setCategory_no(String category_no) {
		this.category_no = category_no;
	}
	public String getParent_category_no() {
		return parent_category_no;
	}
	public void setParent_category_no(String parent_category_no) {
		this.parent_category_no = parent_category_no;
	}
	public String getSub_category_no() {
		return sub_category_no;
	}
	public void setSub_category_no(String sub_category_no) {
		this.sub_category_no = sub_category_no;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getCategory_name_ko() {
		return category_name_ko;
	}
	public void setCategory_name_ko(String category_name_ko) {
		this.category_name_ko = category_name_ko;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getOffice_hour() {
		return office_hour;
	}
	public void setOffice_hour(String office_hour) {
		this.office_hour = office_hour;
	}
	public String getHoliday() {
		return holiday;
	}
	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}
	public String getLanguage_service() {
		return language_service;
	}
	public void setLanguage_service(String language_service) {
		this.language_service = language_service;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getTraffic() {
		return traffic;
	}
	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}
	public String getTraffic_bus() {
		return traffic_bus;
	}
	public void setTraffic_bus(String traffic_bus) {
		this.traffic_bus = traffic_bus;
	}
	public String getTraffic_subway() {
		return traffic_subway;
	}
	public void setTraffic_subway(String traffic_subway) {
		this.traffic_subway = traffic_subway;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
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
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public String getImage_map() {
		return image_map;
	}
	public void setImage_map(String image_map) {
		this.image_map = image_map;
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
	public String getReview_count() {
		return review_count;
	}
	public void setReview_count(String review_count) {
		this.review_count = review_count;
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
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
		return "Store [store_no=" + store_no + ", location_no=" + location_no
				+ ", location_name=" + location_name + ", location_name_ko="
				+ location_name_ko + ", category_no=" + category_no
				+ ", parent_category_no=" + parent_category_no
				+ ", sub_category_no=" + sub_category_no + ", category_name="
				+ category_name + ", category_name_ko=" + category_name_ko
				+ ", title=" + title + ", content=" + content + ", address="
				+ address + ", tel=" + tel + ", tel2=" + tel2 + ", email=" + email
				+ ", office_hour=" + office_hour + ", holiday=" + holiday
				+ ", language_service=" + language_service + ", payment="
				+ payment + ", traffic=" + traffic + ", traffic_bus="
				+ traffic_bus + ", traffic_subway=" + traffic_subway + ", etc="
				+ etc + ", image=" + image + ", image_thumb=" + image_thumb
				+ ", image1=" + image1 + ", image2=" + image2 + ", image3="
				+ image3 + ", image_map=" + image_map + ", x=" + x + ", y=" + y
				+ ", review_count=" + review_count + ", use_flag=" + use_flag
				+ ", edit_date=" + edit_date + ", reg_date=" + reg_date
				+ ", checked=" + checked + ", description=" + description
				+ ", search_type=" + search_type + ", search_string="
				+ search_string + "]";
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

}

