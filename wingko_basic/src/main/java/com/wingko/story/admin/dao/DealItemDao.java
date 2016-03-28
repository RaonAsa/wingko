/*
 * @(#)DealItemDao.java  2013. 9. 23.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.List;

import com.wingko.story.domain.DealItem;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 9. 23.
 */
public interface DealItemDao {
	public int setInsert(DealItem dealitem);
	public int setUpdate(DealItem dealitem);
	public int setDelete(int item_id);
	public DealItem getData(int item_id);
	
	public List<DealItem> getDealList(int deal_id);

}

