/*
 * @(#)PayItemDao.java  2013. 8. 28.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.List;

import com.wingko.story.domain.PayItem;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 28.
 */
public interface PayItemDao {
	
	public int setInsert(PayItem payitem);
	public int setUpdate(PayItem payitem);
	public int setCancelYN(String pid, boolean isCancel);
	public PayItem getData(String item_id);
	public List<PayItem> getItemList(String pid);
	public List<PayItem> getItemListAll(String pid);

}

