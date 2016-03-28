/*
 * @(#)DealShopDao.java  2013. 9. 25.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.List;
import java.util.Map;

import com.wingko.story.domain.DealItem;
import com.wingko.story.domain.DealMain;
import com.wingko.story.domain.Ripple;
import com.wingko.story.domain.User;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 9. 25.
 */
public interface DealShopDao {
	public DealMain getDealShop();
	public DealMain getDealMain(int deal_id);
	public List<DealItem> getDealItemList(int deal_id);
	
	public List<Ripple> getRippleList(Ripple ripple);
	public int getRippleListCount(Ripple ripple);
	
	public int addRipple(Ripple ripple);
	public int delRipple(Ripple ripple);
	
	public User getUserInfo(int user_no);
	public Map getUserInfoAddress(int user_no);
	
	
	public int setDealItemSaleCount(int deal_id);
	public int getDealItemSaleCount(int deal_id);
	public int getOrderDealID(String pid);
}

