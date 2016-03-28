/*
 * @(#)Category.java  2013. 7. 24.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 24.
 */
public class Category {
	private String category_no;
	private String name;
	private String name_ko;
	private String content;
	private String memo;
	private String image;
	private String image_thumb;
	private String depth;
	private String parent_category_no;
	private String parent_category_name;
	private String parent_category_name_ko;
	private String x;
	private String y;
	private String reg_date;
	
	public Category() {}

	public Category(String category_no, String name, String name_ko,
			String content, String memo, String image, String image_thumb,
			String depth, String parent_category_no,
			String parent_category_name, String parent_category_name_ko,
			String x, String y, String reg_date) {
		super();
		this.category_no = category_no;
		this.name = name;
		this.name_ko = name_ko;
		this.content = content;
		this.memo = memo;
		this.image = image;
		this.image_thumb = image_thumb;
		this.depth = depth;
		this.parent_category_no = parent_category_no;
		this.parent_category_name = parent_category_name;
		this.parent_category_name_ko = parent_category_name_ko;
		this.x = x;
		this.y = y;
		this.reg_date = reg_date;
	}
	
	

	@Override
	public String toString() {
		return "Category [category_no=" + category_no + ", name=" + name
				+ ", name_ko=" + name_ko + ", content=" + content + ", memo="
				+ memo + ", image=" + image + ", image_thumb=" + image_thumb
				+ ", depth=" + depth + ", parent_category_no="
				+ parent_category_no + ", parent_category_name="
				+ parent_category_name + ", parent_category_name_ko="
				+ parent_category_name_ko + ", x=" + x + ", y=" + y
				+ ", reg_date=" + reg_date + "]";
	}

	public String getcategory_no() {
		return category_no;
	}

	public void setcategory_no(String category_no) {
		this.category_no = category_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName_ko() {
		return name_ko;
	}

	public void setName_ko(String name_ko) {
		this.name_ko = name_ko;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getImage_thumb() {
		return image_thumb;
	}

	public void setImage_thumb(String image_thumb) {
		this.image_thumb = image_thumb;
	}

	public String getDepth() {
		return depth;
	}

	public void setDepth(String depth) {
		this.depth = depth;
	}

	public String getParent_category_no() {
		return parent_category_no;
	}

	public void setParent_category_no(String parent_category_no) {
		this.parent_category_no = parent_category_no;
	}

	public String getParent_category_name() {
		return parent_category_name;
	}

	public void setParent_category_name(String parent_category_name) {
		this.parent_category_name = parent_category_name;
	}

	public String getParent_category_name_ko() {
		return parent_category_name_ko;
	}

	public void setParent_category_name_ko(String parent_category_name_ko) {
		this.parent_category_name_ko = parent_category_name_ko;
	}

	public String getX() {
		return x;
	}

	public void setX(String x) {
		this.x = x;
	}

	public String getY() {
		return y;
	}

	public void setY(String y) {
		this.y = y;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
}

