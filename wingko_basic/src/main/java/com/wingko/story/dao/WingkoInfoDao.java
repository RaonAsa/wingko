/*
 * @(#)WingkoInfoDao.java  2013. 9. 5.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import com.wingko.story.domain.WingkoInfo;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 9. 5.
 */
public interface WingkoInfoDao {
	public int setInsert(WingkoInfo wingkoinfo);
	public int setUpdate(WingkoInfo wingkoinfo);
	public int setDelete(WingkoInfo wingkoinfo);
	
	public WingkoInfo getData();
	public WingkoInfo getData(int idx);
	
}

