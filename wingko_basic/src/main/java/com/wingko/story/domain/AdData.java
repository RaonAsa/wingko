/*
 * @(#)ADData.java  2013. 8. 28.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 28.
 */
public class AdData extends Page {
	private int no;
	private int ad_no = 0;
	private int parent_ad_no = 0;
	private int position = 0;
	private String ad_name;
	private String title;
	private String content;
	private String link;
	private String image = "";
	private String image_size;
	private String use_flag;
	private String edit_date;
	private String reg_date;

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getAd_no() {
		return ad_no;
	}
	public void setAd_no(int ad_no) {
		this.ad_no = ad_no;
	}
	public int getParent_ad_no() {
		return parent_ad_no;
	}
	public void setParent_ad_no(int parent_ad_no) {
		this.parent_ad_no = parent_ad_no;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public String getAd_name() {
		return ad_name;
	}
	public void setAd_name(String ad_name) {
		this.ad_name = ad_name;
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
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getImage_size() {
		return image_size;
	}
	public void setImage_size(String image_size) {
		this.image_size = image_size;
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
	@Override
	public String toString() {
		return "AdData [no=" + no + ", ad_no=" + ad_no + ", parent_ad_no="
				+ parent_ad_no + ", position=" + position + ", ad_name="
				+ ad_name + ", title=" + title + ", content=" + content
				+ ", link=" + link + ", image=" + image + ", image_size="
				+ image_size + ", use_flag=" + use_flag + ", edit_date="
				+ edit_date + ", reg_date=" + reg_date + "]";
	}
	
	

}

