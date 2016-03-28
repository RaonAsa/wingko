/*
 * @(#)AdminLocationDao.java  2013. 7. 23.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.HashMap;
import java.util.List;

import com.wingko.story.domain.HotPlace;
import com.wingko.story.domain.Location;
import com.wingko.story.domain.SelectData;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 23.
 */
public interface AdminLocationDao {

	public List<Location> getList(Location location);
	public Location getLocation(String location_no);
	public int setInsert(HashMap map);
	public int setUpdate(HashMap map);
	public int setDelete(String location_no);
	
	public String getDepthForInsert(String location_no);
	public List<SelectData> getLocationForSelect();
	
	public List<HotPlace> getHotPlaceList(HotPlace hotPlace);
	public HotPlace getHotPlaceSelect(int no);
	public int setHotPlaceInsert(HotPlace hotPlace);
	public int setHotPlaceUpdate(HotPlace hotPlace);
	public int setHotPlaceDelete(HotPlace hotPlace);
	public int setHotPlaceUpdatePlus(HotPlace hotPlace);
	public int setHotPlaceUpdateMinus(HotPlace hotPlace);
	public List<SelectData> getLocationForHotPlaceInsert(int parent_location_no);
}