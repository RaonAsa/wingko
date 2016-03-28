/*
 * @(#)RecommendDao.java  2013. 9. 27.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import com.wingko.story.domain.Recommend;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 27.
 */
public interface RecommendDao {
	public int insert(Recommend recommend);
	public int check(Recommend recommend);
	
	public int travelRecommendUpdate(Recommend recommend);
	public int communityRecommendUpdate(Recommend recommend);
}

