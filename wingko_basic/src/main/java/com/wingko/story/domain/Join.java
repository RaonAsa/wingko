/*
 * @(#)Join.java  2013. 7. 31.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 31.
 */
public class Join {
	private String id;
	private String id_check;
	private String email;
	private String email_check;
	private String nickname;
	private String nickname_check;
	private String password;
	private String password_repeat;
	private String password_check;
	private String name;
	private String sex;
	private String phone;
	
	private String join_no;
	private String province_id = "";
	private String city_id = "";
	private String area_id = "";
	private String address = ""; 

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getId_check() {
		return id_check;
	}
	public void setId_check(String id_check) {
		this.id_check = id_check;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail_check() {
		return email_check;
	}
	public void setEmail_check(String email_check) {
		this.email_check = email_check;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getNickname_check() {
		return nickname_check;
	}
	public void setNickname_check(String nickname_check) {
		this.nickname_check = nickname_check;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword_repeat() {
		return password_repeat;
	}
	public void setPassword_repeat(String password_repeat) {
		this.password_repeat = password_repeat;
	}
	public String getPassword_check() {
		return password_check;
	}
	public void setPassword_check(String password_check) {
		this.password_check = password_check;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
	public String getJoin_no() {
		return join_no;
	}
	public void setJoin_no(String join_no) {
		this.join_no = join_no;
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
	@Override
	public String toString() {
		return "Join [id=" + id + ", id_check=" + id_check + ", email=" + email
				+ ", email_check=" + email_check + ", nickname=" + nickname
				+ ", nickname_check=" + nickname_check + ", password="
				+ password + ", password_repeat=" + password_repeat
				+ ", password_check=" + password_check + ", name=" + name
				+ ", sex=" + sex + ", phone=" + phone + ", join_no=" + join_no
				+ ", province_id=" + province_id + ", city_id=" + city_id
				+ ", area_id=" + area_id + ", address=" + address + "]";
	}
	
	
}

