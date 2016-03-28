/*
 * @(#)AdminCouponDao.java  2013. 8. 14.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.List;

import com.wingko.story.domain.PayRefund;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 1.
 */
public interface PayRefundDao {
	public List<PayRefund> getList(PayRefund payrefund);
	public PayRefund getData(String pid);
	public int setInsert(PayRefund payrefund);
	public int setUpdate(PayRefund payrefund);
}

