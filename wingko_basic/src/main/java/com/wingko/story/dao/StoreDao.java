/*
 * @(#)StoreDao.java 2013. 8. 6.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.HashMap;
import java.util.List;

import com.wingko.story.domain.CategoryLocation;
import com.wingko.story.domain.News;
import com.wingko.story.domain.Ripple;
import com.wingko.story.domain.SelectData;
import com.wingko.story.domain.Store;
import com.wingko.story.domain.StoreCoupon;
import com.wingko.story.domain.StoreMenu;
 
/**
 * TODO
 *
 * @author  yshsy
 * @version 1.0,  2013. 8. 6.
 */
public interface StoreDao {

	public Store getStore(Store store);
	
	public List<Store> getStoreList(Store store);
	public int getStoreListCount(Store store);

	public List<Ripple> getStoreRippleList(Ripple ripple);
	public int getStoreRippleListCount(Ripple ripple);
	public int setStoreRippleInsert(Ripple ripple);
	public int setStoreRippleUpdate(Ripple ripple);
	public int setStoreRippleDelete(Ripple ripple);
	
	
	public List<StoreMenu> getStoreMenu(Store store);
	public List<StoreCoupon> getStoreCoupon(Store store);
	
	public CategoryLocation getCategoryLocationInfo(String category_no, String location_no);
	
	
	public List<News> getNewsRand(String category_no);
	public List<Store> getStoreRand(String location_no);
	
	
	public List<SelectData> getLocationForSelect(HashMap map);
	public List<SelectData> getCategoryForSelect(HashMap map);

	public String getStoreNewReplyOrder(Ripple ripple);
	
	
}
