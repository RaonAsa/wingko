/*
 * @(#)Login.java  2013. 7. 30.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

import javax.validation.constraints.Size;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 30.
 */
public class Login {
	@Size(min=4, max=15)
	String user_id;
	@Size(min=6, max=15)
	String user_password;
	int user_no;
	String url;

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
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	

}

