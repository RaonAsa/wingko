/*
 * @(#)SelectData.java 2013. 7. 24.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;
 
/**
 * TODO
 *
 * @author  yshsy
 * @version 1.0,  2013. 7. 24.
 */
public class SelectData {
	private String title;
	private String value;
	
	public SelectData() {}
	
	public SelectData(String title, String value) {
		super();
		this.title = title;
		this.value = value;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "SelectData [title=" + title + ", value=" + value + "]";
	}
	
	

}
