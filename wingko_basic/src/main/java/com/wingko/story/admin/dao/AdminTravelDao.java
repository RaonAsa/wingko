/*
 * @(#)AdminTravelDao.java 2013. 8. 11.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.HashMap;
import java.util.List;

import com.wingko.story.domain.SelectData;
import com.wingko.story.domain.Travel;
import com.wingko.story.domain.TravelInfo;
 
/**
 * TODO
 *
 * @author  yshsy
 * @version 1.0,  2013. 8. 11.
 */
public interface AdminTravelDao {
	public List<Travel> getList(Travel travel);
	public int getListCount(Travel travel);
	public Travel getTravel(Travel travel);
	public int setInsert(HashMap map);
	public int setUpdate(HashMap map);
	public int setDelete(Travel travel);
	
	public List<SelectData> getLocationForSelect();
	public List<SelectData> getTravelCategoryForSelect();
	
	public List<TravelInfo> travelInfoList(TravelInfo travelInfo);
	public TravelInfo travelInfo(TravelInfo travelInfo);
	public int insertTravelInfo(TravelInfo travelInfo);
	public int updateTravelInfo(TravelInfo travelInfo);
	public int deleteTravelInfo(TravelInfo travelInfo);
}
