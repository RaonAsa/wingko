/*
 * @(#)PayAddressDao.java  2013. 9. 29.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import com.wingko.story.domain.PayArea;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 9. 29.
 */
public interface PayAreaDao {
	public int setInsert(PayArea payarea);
	public int setUpdate(PayArea payarea);
	public PayArea getData(String pid);
}

