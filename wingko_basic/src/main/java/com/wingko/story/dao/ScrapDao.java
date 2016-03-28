/*
 * @(#)RecommendDao.java  2013. 9. 27.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import com.wingko.story.domain.Scrap;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 27.
 */
public interface ScrapDao {
	public int insert(Scrap scrap);
	public int check(Scrap scrap);
	public int delete(Scrap scrap);

}

