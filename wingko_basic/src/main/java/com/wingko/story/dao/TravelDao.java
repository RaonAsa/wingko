/*
 * @(#)TravelDao.java  2013. 8. 16.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.List;

import com.wingko.story.domain.Ripple;
import com.wingko.story.domain.Travel;
import com.wingko.story.domain.TravelInfo;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 16.
 */
public interface TravelDao {
	
	public TravelInfo travelInfo(TravelInfo travelInfo);
	
	public List<Travel> travelList(Travel travel);
	public int travelListCount(Travel travel);
	public Travel travel(Travel travel);
	
	public Travel travelRailOne();
	
	public void tarvelRippleCountPlus(int travel_no);
	public void tarvelRippleCountMinus(int travel_no);
	
}

