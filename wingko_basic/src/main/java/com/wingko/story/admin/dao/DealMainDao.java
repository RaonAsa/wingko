/*
 * @(#)DealMainDao.java  2013. 9. 23.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.HashMap;
import java.util.List;

import com.wingko.story.domain.DealMain;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 9. 23.
 */
public interface DealMainDao {
	public int setInsert(HashMap<String, String> map);
	public int setUpdate(HashMap<String, String> map);
	public int setDelete(DealMain dealmain);
	
	public DealMain getData(int deal_id);
	public DealMain getTopData();
	
	public List<DealMain> getSearchAll(DealMain dealmain);
	public int getSearchCount(DealMain dealmain);

	
}

