/*
 * @(#)AdminADDao.java  2013. 8. 28.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.HashMap;
import java.util.List;

import com.wingko.story.domain.AdData;
import com.wingko.story.domain.SelectData;
import com.wingko.story.domain.TopWord;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 28.
 */
public interface AdminAdDao {
	
	public List<AdData> getList(AdData adData);
	public int getListCount(AdData adData);
	public AdData getAdData(AdData adData);
	public int setInsert(HashMap map);
	public int setUpdate(HashMap map);
	public int setDelete(AdData adData);

	public List<SelectData> getAdManage();
	
	public List<TopWord> getWordList();
	public int setWordUpdate(TopWord topWord);

}

