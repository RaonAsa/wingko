/*
 * @(#)AdminProductDao.java  2013. 7. 25.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.HashMap;
import java.util.List;

import com.wingko.story.domain.Store;
import com.wingko.story.domain.SelectData;
import com.wingko.story.domain.StoreCoupon;
import com.wingko.story.domain.StoreMenu;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 25.
 */
public interface AdminStoreDao {
	public List<Store> getList(Store store);
	public int getListCount(Store store);
	public Store getStore(String store_no);
	public int setInsert(HashMap map);
	public int setUpdate(HashMap map);
	public int setDelete(String store_no);
	
	public List<SelectData> getLocationForSelect();
	public List<SelectData> getCategoryForSelect();
	
	public List<StoreMenu> getStoreMenuList(StoreMenu storeMenu);
	public StoreMenu getStoreMenu(StoreMenu storeMenu);
	public int setStoreMenuInsert(HashMap map);
	public int setStoreMenuUpdate(HashMap map);
	public int setStoreMenuDelete(StoreMenu storeMenu);
	
	public List<StoreCoupon> getStoreCouponList(StoreCoupon storeCoupon);
	public StoreCoupon getStoreCoupon(StoreCoupon storeCoupon);
	public int setStoreCouponInsert(HashMap map);
	public int setStoreCouponUpdate(HashMap map);
	public int setStoreCouponDelete(StoreCoupon storeCoupon);
}

