/*
 * @(#)WingShowDao.java  2013. 8. 26.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.List;
import java.util.Map;

import com.wingko.story.domain.PayMain;
import com.wingko.story.domain.User;
import com.wingko.story.domain.WingMyItem;
import com.wingko.story.domain.WingShow;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 26.
 */
public interface WingShowDao {
	
	public int removeCart(int user_no, String[] arr_id);
	public int removeCartLast(int user_no);
	
	public List<WingShow> getPidList(String pid);
	public List<WingShow> getListUser(int user_no);
	public WingShow getWingShow(int user_no, int cart_id);
	
	public User getUserInfo(int user_no);
	
	public List<PayMain> getMyReservationOrder(PayMain paymain);
	public List<WingMyItem> getMyCalendarItem(int user_no, String used_date);
	public List<WingMyItem> getMyPaymentItem(String pid);
	
	public List<PayMain> getMyPaymentOrder(PayMain paymain);
	public List<PayMain> getMyRefundOrder(PayMain paymain);
	
	public List<Map> getMyPayDealOrder(PayMain paymain);
	public List<Map> getMyRefundDealOrder(PayMain paymain);
	
	
	
}

