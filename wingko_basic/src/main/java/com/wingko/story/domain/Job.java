/*
 * @(#)Job.java  2013. 9. 15.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 15.
 */
public class Job extends Page {
	private int job_no;
	private String job_type;
	private String title;
	private String writer;
	private String pwd;
	private String company_title;
	private String company_type;
	private String company_desc;
	private String company_address;
	private String company_tel;
	private String company_contact;
	private String company_email;
	private String company_location;
	private String company_jobs;
	private String company_employ;
	private String company_recruite;
	private String company_pay;
	private String company_career;
	private String company_etc;
	private String hunter_name;
	private String hunter_photo;
	private String hunter_pay;
	private String hunter_email;
	private String hunter_education1;
	private String hunter_education2;
	private String hunter_education3;
	private String hunter_education4;
	private String hunter_education5;
	private String hunter_career1;
	private String hunter_career2;
	private String hunter_career3;
	private String hunter_career4;
	private String hunter_career5;
	private String hunter_about;
	private String edit_date;
	private String reg_date;
	private int hit;
	private String captcha;
	
	private String search_type = "";
	private String search_string = "";
	
	public Job() {
		
	}
	
	public int getJob_no() {
		return job_no;
	}
	public void setJob_no(int job_no) {
		this.job_no = job_no;
	}
	public String getJob_type() {
		return job_type;
	}
	public void setJob_type(String job_type) {
		this.job_type = job_type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getCompany_title() {
		return company_title;
	}
	public void setCompany_title(String company_title) {
		this.company_title = company_title;
	}
	public String getCompany_type() {
		return company_type;
	}
	public void setCompany_type(String company_type) {
		this.company_type = company_type;
	}
	public String getCompany_desc() {
		return company_desc;
	}
	public void setCompany_desc(String company_desc) {
		this.company_desc = company_desc;
	}
	public String getCompany_address() {
		return company_address;
	}
	public void setCompany_address(String company_address) {
		this.company_address = company_address;
	}
	public String getCompany_tel() {
		return company_tel;
	}
	public void setCompany_tel(String company_tel) {
		this.company_tel = company_tel;
	}
	public String getCompany_contact() {
		return company_contact;
	}
	public void setCompany_contact(String company_contact) {
		this.company_contact = company_contact;
	}
	public String getCompany_email() {
		return company_email;
	}
	public void setCompany_email(String company_email) {
		this.company_email = company_email;
	}
	public String getCompany_location() {
		return company_location;
	}
	public void setCompany_location(String company_location) {
		this.company_location = company_location;
	}
	public String getCompany_jobs() {
		return company_jobs;
	}
	public void setCompany_jobs(String company_jobs) {
		this.company_jobs = company_jobs;
	}
	public String getCompany_employ() {
		return company_employ;
	}
	public void setCompany_employ(String company_employ) {
		this.company_employ = company_employ;
	}
	public String getCompany_recruite() {
		return company_recruite;
	}
	public void setCompany_recruite(String company_recruite) {
		this.company_recruite = company_recruite;
	}
	public String getCompany_pay() {
		return company_pay;
	}
	public void setCompany_pay(String company_pay) {
		this.company_pay = company_pay;
	}
	public String getCompany_career() {
		return company_career;
	}
	public void setCompany_career(String company_career) {
		this.company_career = company_career;
	}
	public String getCompany_etc() {
		return company_etc;
	}
	public void setCompany_etc(String company_etc) {
		this.company_etc = company_etc;
	}
	public String getHunter_name() {
		return hunter_name;
	}
	public void setHunter_name(String hunter_name) {
		this.hunter_name = hunter_name;
	}
	public String getHunter_photo() {
		return hunter_photo;
	}
	public void setHunter_photo(String hunter_photo) {
		this.hunter_photo = hunter_photo;
	}
	public String getHunter_pay() {
		return hunter_pay;
	}
	public void setHunter_pay(String hunter_pay) {
		this.hunter_pay = hunter_pay;
	}
	public String getHunter_email() {
		return hunter_email;
	}
	public void setHunter_email(String hunter_email) {
		this.hunter_email = hunter_email;
	}
	public String getHunter_education1() {
		return hunter_education1;
	}
	public void setHunter_education1(String hunter_education1) {
		this.hunter_education1 = hunter_education1;
	}
	public String getHunter_education2() {
		return hunter_education2;
	}
	public void setHunter_education2(String hunter_education2) {
		this.hunter_education2 = hunter_education2;
	}
	public String getHunter_education3() {
		return hunter_education3;
	}
	public void setHunter_education3(String hunter_education3) {
		this.hunter_education3 = hunter_education3;
	}
	public String getHunter_education4() {
		return hunter_education4;
	}
	public void setHunter_education4(String hunter_education4) {
		this.hunter_education4 = hunter_education4;
	}
	public String getHunter_education5() {
		return hunter_education5;
	}
	public void setHunter_education5(String hunter_education5) {
		this.hunter_education5 = hunter_education5;
	}
	public String getHunter_career1() {
		return hunter_career1;
	}
	public void setHunter_career1(String hunter_career1) {
		this.hunter_career1 = hunter_career1;
	}
	public String getHunter_career2() {
		return hunter_career2;
	}
	public void setHunter_career2(String hunter_career2) {
		this.hunter_career2 = hunter_career2;
	}
	public String getHunter_career3() {
		return hunter_career3;
	}
	public void setHunter_career3(String hunter_career3) {
		this.hunter_career3 = hunter_career3;
	}
	public String getHunter_career4() {
		return hunter_career4;
	}
	public void setHunter_career4(String hunter_career4) {
		this.hunter_career4 = hunter_career4;
	}
	public String getHunter_career5() {
		return hunter_career5;
	}
	public void setHunter_career5(String hunter_career5) {
		this.hunter_career5 = hunter_career5;
	}
	public String getHunter_about() {
		return hunter_about;
	}
	public void setHunter_about(String hunter_about) {
		this.hunter_about = hunter_about;
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
	
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
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
		return "Job [job_no=" + job_no + ", job_type=" + job_type + ", title="
				+ title + ", writer=" + writer + ", pwd=" + pwd
				+ ", company_title=" + company_title + ", company_type="
				+ company_type + ", company_desc=" + company_desc
				+ ", company_address=" + company_address + ", company_tel="
				+ company_tel + ", company_contact=" + company_contact
				+ ", company_email=" + company_email + ", company_location="
				+ company_location + ", company_jobs=" + company_jobs
				+ ", company_employ=" + company_employ + ", company_recruite="
				+ company_recruite + ", company_pay=" + company_pay
				+ ", company_career=" + company_career + ", company_etc="
				+ company_etc + ", hunter_name=" + hunter_name
				+ ", hunter_photo=" + hunter_photo + ", hunter_pay="
				+ hunter_pay + ", hunter_email=" + hunter_email
				+ ", hunter_education1=" + hunter_education1
				+ ", hunter_education2=" + hunter_education2
				+ ", hunter_education3=" + hunter_education3
				+ ", hunter_education4=" + hunter_education4
				+ ", hunter_education5=" + hunter_education5
				+ ", hunter_career1=" + hunter_career1 + ", hunter_career2="
				+ hunter_career2 + ", hunter_career3=" + hunter_career3
				+ ", hunter_career4=" + hunter_career4 + ", hunter_career5="
				+ hunter_career5 + ", hunter_about=" + hunter_about
				+ ", edit_date=" + edit_date + ", reg_date=" + reg_date
				+ ", hit=" + hit + ", search_type=" + search_type
				+ ", search_string=" + search_string + ",captcha=" + captcha + "]";
	}
	public String getCaptcha() {
		return captcha;
	}
	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}
	
}

