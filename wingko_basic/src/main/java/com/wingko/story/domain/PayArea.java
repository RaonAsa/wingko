/*
 * @(#)Pay.java  2013. 9. 29.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 9. 29.
 */
public class PayArea {
	private String pid;
	private String name;
	private String phone;
	private String area;
	private String address;
	
	
	@Override
	public String toString() {
		return "PayAddress [pid=" + pid + ", name=" + name + ", phone=" + phone
				+ ", area=" + area + ", address=" + address + "]";
	}


	public String getPid() {
		return pid;
	}


	public void setPid(String pid) {
		this.pid = pid;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getArea() {
		return area;
	}


	public void setArea(String area) {
		this.area = area;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}
	
	
}

