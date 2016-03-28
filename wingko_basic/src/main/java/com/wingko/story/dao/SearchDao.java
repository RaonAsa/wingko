/*
 * @(#)SearchDao.java  2013. 9. 24.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.HashMap;
import java.util.List;

import com.wingko.story.domain.Search;
import com.wingko.story.domain.Store;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 24.
 */
public interface SearchDao {
	public List<Search> getSearchList(Search search);
	public int getSearchListCount(Search search);
	
	
	public Search getSearchListForQuick(HashMap map);
	
	public List<Store> getStoreSearchList(Store store);
	public int getStoreSearchListCount(Store store);

}

