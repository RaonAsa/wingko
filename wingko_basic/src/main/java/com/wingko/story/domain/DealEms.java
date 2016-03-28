/*
 * @(#)DealEms.java  2013. 9. 24.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 9. 24.
 */
public class DealEms {
	private int ems_id;
	private int item_cnt;
	private int gram;
	private int price_ko;
	private int price_cn;
	
	
	@Override
	public String toString() {
		return "DealEms [ems_id=" + ems_id + ", item_cnt=" + item_cnt
				+ ", gram=" + gram + ", price_ko=" + price_ko + ", price_cn="
				+ price_cn + "]";
	}


	public int getEms_id() {
		return ems_id;
	}


	public void setEms_id(int ems_id) {
		this.ems_id = ems_id;
	}


	public int getItem_cnt() {
		return item_cnt;
	}


	public void setItem_cnt(int item_cnt) {
		this.item_cnt = item_cnt;
	}


	public int getGram() {
		return gram;
	}


	public void setGram(int gram) {
		this.gram = gram;
	}


	public int getPrice_ko() {
		return price_ko;
	}


	public void setPrice_ko(int price_ko) {
		this.price_ko = price_ko;
	}


	public int getPrice_cn() {
		return price_cn;
	}


	public void setPrice_cn(int price_cn) {
		this.price_cn = price_cn;
	}
	
}

