/*
 * @(#)AdminCouponDao.java  2013. 8. 14.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.List;

import com.wingko.story.domain.PayCard;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 1.
 */
public interface PayCardDao {
	public List<PayCard> getList(PayCard paycard);
	public PayCard getData(String pid);
	public int setInsert(PayCard paycard);
	public int setUpdate(PayCard paycard);
}

