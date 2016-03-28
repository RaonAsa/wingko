/*
 * @(#)NewsDao.java  2013. 9. 2.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.HashMap;
import java.util.List;

import com.wingko.story.domain.News;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 2.
 */
public interface NewsDao {

	public List<News> getTopThree(HashMap map);
	public List<News> getList(News news);
	public int getListCount(News news);
	public List<News> getTopList(News news);
	public News getNews(News news);

	
	public void newsRippleCount(int news_no, int increase);
	public void newsHitUpdate(int news_no);

	
}

