/*
 * @(#)DealEmsDao.java  2013. 9. 24.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.List;

import com.wingko.story.domain.DealEms;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 9. 24.
 */
public interface DealEmsDao {
	public int setInsert(DealEms dealems);
	public int setUpdate(DealEms dealems);
	public DealEms getData(int ems_id);
	public List<DealEms> getListAll();
	public DealEms getItemCnt(int item_cnt);
}

