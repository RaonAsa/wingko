/*
 * @(#)CompanyQuestion.java  2013. 10. 4.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 10. 4.
 */
public class CompanyQuestion extends Page {
	private int no;
	private int question_category;
	private String company;
	private String name;
	private String url;
	private String email;
	private String phone;
	private String title;
	private String content;
	private String file;
	private String reg_date;
	
	private String search_type = "";
	private String search_string = "";
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getQuestion_category() {
		return question_category;
	}
	public void setQuestion_category(int question_category) {
		this.question_category = question_category;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
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
		return "CompanyQuestion [no=" + no + ", question_category="
				+ question_category + ", company=" + company + ", name=" + name
				+ ", url=" + url + ", email=" + email + ", phone=" + phone
				+ ", title=" + title + ", content=" + content + ", file="
				+ file + ", reg_date=" + reg_date + ", search_type="
				+ search_type + ", search_string=" + search_string + "]";
	}
	
}

