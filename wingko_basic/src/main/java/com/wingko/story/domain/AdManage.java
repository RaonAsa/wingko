/*
 * @(#)ADManage.java  2013. 8. 28.
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
public class AdManage {
	private int ad_no;
	private String ad_name;
	private String image_size;
	public int getAd_no() {
		return ad_no;
	}
	public void setAd_no(int ad_no) {
		this.ad_no = ad_no;
	}
	public String getAd_name() {
		return ad_name;
	}
	public void setAd_name(String ad_name) {
		this.ad_name = ad_name;
	}
	public String getImage_size() {
		return image_size;
	}
	public void setImage_size(String image_size) {
		this.image_size = image_size;
	}
	@Override
	public String toString() {
		return "AdManage [ad_no=" + ad_no + ", ad_name=" + ad_name
				+ ", image_size=" + image_size + "]";
	}
	
	
}

