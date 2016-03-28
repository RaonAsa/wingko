/*
 * @(#)DealMain.java  2013. 9. 23.
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
public class DealMain extends Page{
	public static int MAX_SALE_COUNT = 3; // 최대 구매수량
	
	
	private int deal_id;
	private String title;
	private String content;
	private String summary;
	
	private String start_date;
	private String end_date;
	
	private String info_origin;
	private String info_transfer;
	private String info_faq;
	
	private int discount;
	private int cost_sale;
	private int cost_discount;
	
	private String image;
	private String image_thumb;
	private int limit_count = 0;
	private int sale_count = 0;
	
	private int used_sort;
	private String reg_date;
	
	@Override
	public String toString() {
		return "DealMain [deal_id=" + deal_id + ", title=" + title
				+ ", content=" + content + ", summary=" + summary
				+ ", start_date=" + start_date + ", end_date=" + end_date
				+ ", info_origin=" + info_origin + ", info_transfer="
				+ info_transfer + ", info_faq=" + info_faq + ", discount="
				+ discount + ", cost_sale=" + cost_sale + ", cost_discount="
				+ cost_discount + ", image=" + image + ", image_thumb="
				+ image_thumb + ", limit_count=" + limit_count
				+ ", sale_count=" + sale_count + ", used_sort=" + used_sort
				+ ", reg_date=" + reg_date + "]" + super.toString();
	}
	
	public int getDeal_id() {
		return deal_id;
	}
	public void setDeal_id(int deal_id) {
		this.deal_id = deal_id;
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
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getInfo_origin() {
		return info_origin;
	}
	public void setInfo_origin(String info_origin) {
		this.info_origin = info_origin;
	}
	public String getInfo_transfer() {
		return info_transfer;
	}
	public void setInfo_transfer(String info_transfer) {
		this.info_transfer = info_transfer;
	}
	public String getInfo_faq() {
		return info_faq;
	}
	public void setInfo_faq(String info_faq) {
		this.info_faq = info_faq;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getCost_sale() {
		return cost_sale;
	}
	public void setCost_sale(int cost_sale) {
		this.cost_sale = cost_sale;
	}
	public int getCost_discount() {
		return cost_discount;
	}
	public void setCost_discount(int cost_discount) {
		this.cost_discount = cost_discount;
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
	public int getLimit_count() {
		return limit_count;
	}
	public void setLimit_count(int limit_count) {
		this.limit_count = limit_count;
	}
	public int getSale_count() {
		return sale_count;
	}
	public void setSale_count(int sale_count) {
		this.sale_count = sale_count;
	}
	public int getUsed_sort() {
		return used_sort;
	}
	public void setUsed_sort(int used_sort) {
		this.used_sort = used_sort;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	

}

