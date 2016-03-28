/*
 * @(#)AdminCouponDao.java  2013. 8. 14.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.List;

import com.wingko.story.domain.PayAcount;
import com.wingko.story.domain.PayMain;
import com.wingko.story.domain.PayMainSearch;
import com.wingko.story.domain.SelectData;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 1.
 */
public interface PayMainDao {
	public int setInsert(PayMain paymain);
	public int setUpdate(PayMain paymain);
	public PayMain getData(String pid);
	public PayMain getData(String pid, int user_no);
	
	public int getSearchCount(PayMainSearch search);
	public List<PayMain> getSearchAll(PayMainSearch search);
	public List<PayMain> getSearchList(PayMainSearch search);
	public List<PayMain> getCheckList(String[] arr_pid);
	
	public List<PayMain> getSearchListStatus(PayMainSearch search);
	public int getSearchStatusCount(PayMainSearch search);
	
	
	public List<PayAcount> getAcountList(PayMainSearch search);
	public int getAcountCount(PayMainSearch search);
	
	public List<PayAcount> getAcountCheckList(String[] arr_regdate);
	
	
	
	public int setComplete(String pid);
	public int setCancelComplete(String pid, String cancel_msg);
	
	public List<SelectData> getStateSelect();
	public List<SelectData> getStateSelectPay();
	public List<SelectData> getStateSelectCancel();
	public List<SelectData> getTypeSelect();
	public List<SelectData> getMethodSelect();
	
	
}

