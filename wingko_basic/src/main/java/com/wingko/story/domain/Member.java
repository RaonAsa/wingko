/*
 * @(#)Member.java  2013. 8. 12.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 12.
 */
public class Member extends Page {
	private int user_no;
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_nickname;
	private String email;
	private String sex;
	private String phone;
	private int level = 0;
	private int login_count;
	private String edit_date;
	private String reg_date;
	private String address;
	private String join_no;
	private String title;
	private String leave;
	private String province;
	private String city;
	private String area;
	private String last_login;
	
	private String start_date;
	private String end_date;
	
	private String search_id;
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getLogin_count() {
		return login_count;
	}
	public void setLogin_count(int login_count) {
		this.login_count = login_count;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getJoin_no() {
		return join_no;
	}
	public void setJoin_no(String join_no) {
		this.join_no = join_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLeave() {
		return leave;
	}
	public void setLeave(String leave) {
		this.leave = leave;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getLast_login() {
		return last_login;
	}
	public void setLast_login(String last_login) {
		this.last_login = last_login;
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
	public String getSearch_id() {
		return search_id;
	}
	public void setSearch_id(String search_id) {
		this.search_id = search_id;
	}
	@Override
	public String toString() {
		return "Member [user_no=" + user_no + ", user_id=" + user_id
				+ ", user_password=" + user_password + ", user_name="
				+ user_name + ", user_nickname=" + user_nickname + ", email="
				+ email + ", sex=" + sex + ", phone=" + phone + ", level="
				+ level + ", login_count=" + login_count + ", edit_date="
				+ edit_date + ", reg_date=" + reg_date + ", address=" + address
				+ ", join_no=" + join_no + ", title=" + title + ", leave="
				+ leave + ", province=" + province + ", city=" + city
				+ ", area=" + area + ", last_login=" + last_login
				+ ", start_date=" + start_date + ", end_date=" + end_date
				+ ", search_id=" + search_id + "]";
	}
	
	
	
}

