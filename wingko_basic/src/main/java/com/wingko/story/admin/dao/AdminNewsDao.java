/*
 * @(#)AdminNewsDaoi.java  2013. 9. 2.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.HashMap;
import java.util.List;

import com.wingko.story.domain.News;
import com.wingko.story.domain.SelectData;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 2.
 */
public interface AdminNewsDao {
	public List<News> getList(News news);
	public int getListCount(News news);
	public News getNews(News news);
	public int setInsert(HashMap map);
	public int setUpdate(HashMap map);
	public int setDelete(News news);
	
	public List<SelectData> getNewsCategory();
	public List<SelectData> getStore();

}

