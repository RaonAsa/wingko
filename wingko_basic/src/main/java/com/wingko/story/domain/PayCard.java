/*
 * @(#)PayInicis.java  2013. 8. 15.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 15.
 * 
DROP TABLE IF EXISTS `wingko`.`pay_card`;
CREATE TABLE  `wingko`.`pay_card` (
  `pid` char(14) NOT NULL,
  `tid` char(40) NOT NULL,
  `result_code` char(2) DEFAULT NULL,
  `result_msg` varchar(200) DEFAULT NULL,
  `app_date` char(6) DEFAULT NULL,
  `app_time` char(6) DEFAULT NULL,
  `app_num` varchar(20) DEFAULT NULL,
  `card_num` varchar(16) DEFAULT NULL,
  `card_interest` char(1) DEFAULT NULL,
  `card_quota` char(2) DEFAULT NULL,
  `card_code` char(2) DEFAULT NULL,
  `card_bankcode` char(2) DEFAULT NULL,
  `org_currency` char(3) DEFAULT NULL,
  `exchange_rate` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 */
public class PayCard {
	private String pid;
	private String tid;
	
	private String result_code;
	private String result_msg;
	
	private String app_date;
	private String app_time;
	private String app_num;
	
	private String card_num;
	private String card_interest;
	private String card_quota;
	private String card_code;
	private String card_bankcode;
	private String org_currency;
	private String exchange_rate;
	
	
	
	@Override
	public String toString() {
		return "PayCard [pid=" + pid + ", tid=" + tid + ", result_code="
				+ result_code + ", result_msg=" + result_msg + ", app_date="
				+ app_date + ", app_time=" + app_time + ", app_num=" + app_num
				+ ", card_num=" + card_num + ", card_interest=" + card_interest
				+ ", card_quota=" + card_quota + ", card_code=" + card_code
				+ ", card_bankcode=" + card_bankcode + ", org_currency="
				+ org_currency + ", exchange_rate=" + exchange_rate + "]";
	}
	
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getResult_code() {
		return result_code;
	}
	public void setResult_code(String result_code) {
		this.result_code = result_code;
	}
	public String getResult_msg() {
		return result_msg;
	}
	public void setResult_msg(String result_msg) {
		this.result_msg = result_msg;
	}
	public String getApp_date() {
		return app_date;
	}
	public void setApp_date(String app_date) {
		this.app_date = app_date;
	}
	public String getApp_time() {
		return app_time;
	}
	public void setApp_time(String app_time) {
		this.app_time = app_time;
	}
	public String getApp_num() {
		return app_num;
	}
	public void setApp_num(String app_num) {
		this.app_num = app_num;
	}
	public String getCard_num() {
		return card_num;
	}
	public void setCard_num(String card_num) {
		this.card_num = card_num;
	}
	public String getCard_interest() {
		return card_interest;
	}
	public void setCard_interest(String card_interest) {
		this.card_interest = card_interest;
	}
	public String getCard_quota() {
		return card_quota;
	}
	public void setCard_quota(String card_quota) {
		this.card_quota = card_quota;
	}
	public String getCard_code() {
		return card_code;
	}
	public void setCard_code(String card_code) {
		this.card_code = card_code;
	}
	public String getCard_bankcode() {
		return card_bankcode;
	}
	public void setCard_bankcode(String card_bankcode) {
		this.card_bankcode = card_bankcode;
	}
	public String getOrg_currency() {
		return org_currency;
	}
	public void setOrg_currency(String org_currency) {
		this.org_currency = org_currency;
	}
	public String getExchange_rate() {
		return exchange_rate;
	}
	public void setExchange_rate(String exchange_rate) {
		this.exchange_rate = exchange_rate;
	}
	
	
}

