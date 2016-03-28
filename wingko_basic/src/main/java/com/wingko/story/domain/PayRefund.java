/*
 * @(#)PayRefund.java  2013. 8. 15.
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
 * 
DROP TABLE IF EXISTS `wingko`.`pay_refund`;
CREATE TABLE  `wingko`.`pay_refund` (
  `pid` char(14) NOT NULL,
  `bank_name` varchar(20) DEFAULT NULL,
  `bank_number` varchar(20) DEFAULT NULL,
  `bank_owner` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 */

public class PayRefund {
	private String pid;
	private String bank_name;
	private String bank_number;
	private String bank_owner;
	
	
	
	@Override
	public String toString() {
		return "PayRefund [pid=" + pid + ", bank_name=" + bank_name
				+ ", bank_number=" + bank_number + ", bank_owner=" + bank_owner
				+ "]";
	}
	
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getBank_number() {
		return bank_number;
	}
	public void setBank_number(String bank_number) {
		this.bank_number = bank_number;
	}
	public String getBank_owner() {
		return bank_owner;
	}
	public void setBank_owner(String bank_owner) {
		this.bank_owner = bank_owner;
	}
	
	
}

