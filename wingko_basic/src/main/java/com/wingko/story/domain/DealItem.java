/*
 * @(#)DealItem.java  2013. 9. 23.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 9. 23.
 */
public class DealItem {
	private int item_id;
	private int deal_id;
	private String item_name;
	private int price_ko;
	private int price_cn;
	
	@Override
	public String toString() {
		return "DealItem [item_id=" + item_id + ", deal_id=" + deal_id
				+ ", item_name=" + item_name + ", price_ko=" + price_ko
				+ ", price_cn=" + price_cn + "]";
	}
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public int getDeal_id() {
		return deal_id;
	}
	public void setDeal_id(int deal_id) {
		this.deal_id = deal_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
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

