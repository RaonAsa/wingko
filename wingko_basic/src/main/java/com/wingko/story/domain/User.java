/*
 * @(#)User.java  2013. 7. 30.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 30.
 */
public class User {
	private int user_no;
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_nickname;
	private String email;
	private String sex;
	private String phone;
	private int level;
	private int login_count;
	private String edit_date;
	private String reg_date;
	private String province_id;
	private String city_id;
	private String area_id;
	private String address; 
	private String join_no;
	
	public User() { }

	public User(String user_id, String user_password, String user_name,
			String user_nickname, String email, String sex, String phone,
			String province_id, String city_id, String area_id, String address, String join_no) {
		super();
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_nickname = user_nickname;
		this.email = email;
		this.sex = sex;
		this.phone = phone;
		this.province_id = province_id;
		this.city_id = city_id;
		this.area_id = area_id;
		this.address = address;
		this.join_no = join_no;
	}
	
	

	public User(int user_no, String user_password, String user_nickname,
			String email, String phone) {
		super();
		this.user_no = user_no;
		this.user_password = user_password;
		this.user_nickname = user_nickname;
		this.email = email;
		this.phone = phone;
	}

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
	public String getProvince_id() {
		return province_id;
	}

	public void setProvince_id(String province_id) {
		this.province_id = province_id;
	}

	public String getCity_id() {
		return city_id;
	}

	public void setCity_id(String city_id) {
		this.city_id = city_id;
	}

	public String getArea_id() {
		return area_id;
	}

	public void setArea_id(String area_id) {
		this.area_id = area_id;
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
	@Override
	public String toString() {
		return "User [user_no=" + user_no + ", user_id=" + user_id
				+ ", user_password=" + user_password + ", user_name="
				+ user_name + ", user_nickname=" + user_nickname + ", email="
				+ email + ", sex=" + sex + ", phone=" + phone + ", level="
				+ level + ", login_count=" + login_count + ", edit_date="
				+ edit_date + ", reg_date=" + reg_date + ", province_id="
				+ province_id + ", city_id=" + city_id + ", area_id=" + area_id
				+ ", address=" + address + ", join_no=" + join_no + "]";
	}
	
	
}

