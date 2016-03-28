/*
 * @(#)PrintCoupon.java 2013. 8. 6.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;
 
/**
 * TODO
 *
 * @author  yshsy
 * @version 1.0,  2013. 8. 6.
 */
public class PrintCoupon {

	private int no;
	private String title;
	private String content;
	private String image;
	private String print_count;
	private String image_sort;
	private String reg_date;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPrint_count() {
		return print_count;
	}
	public void setPrint_count(String print_count) {
		this.print_count = print_count;
	}
	public String getImage_sort() {
		return image_sort;
	}
	public void setImage_sort(String image_sort) {
		this.image_sort = image_sort;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "PrintCoupon [no=" + no + ", title=" + title + ", content="
				+ content + ", image=" + image + ", print_count=" + print_count
				+ ", image_sort=" + image_sort + ", reg_date=" + reg_date + "]";
	}
	
	
	
	
}
