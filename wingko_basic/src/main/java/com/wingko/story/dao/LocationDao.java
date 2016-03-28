/*
 * @(#)LocationDao.java  2013. 8. 15.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wingko.story.domain.Community;
import com.wingko.story.domain.Location;
import com.wingko.story.domain.News;
import com.wingko.story.domain.Store;
import com.wingko.story.domain.Travel;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 15.
 */
public interface LocationDao {

	public Location headerInfo(String location_no);
	public List<Map<String, String>> subList(String parent_location_no);
	public List<Store> hotPlace(String parent_location_no);
	
	public List<Store> storeList( HashMap<String, Object> map );
	public int storeListCount(String location_no, String parent_category_no );
	
	public List<News> newsList( News news);
	public int newsListCount(News news);
	public List<Travel> travelList( Travel travel);
	public int travelListCount(Travel travel);
	public List<Community> blogList( Community blog);
	public int blogListCount(Community blog);
	public List<News> newsPickupList( News news);
	public int newsPickupListCount(News news);
	
}

