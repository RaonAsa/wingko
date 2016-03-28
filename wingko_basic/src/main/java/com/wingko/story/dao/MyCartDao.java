/*
 * @(#)ShopInvenDao.java  2013. 8. 25.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.List;

import com.wingko.story.domain.MyCart;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 25.
 */
public interface MyCartDao {
	public int setInsert(MyCart mycart);
	public int setUpdate(MyCart mycart);
	public int setDelete(MyCart mycart);
	
	public MyCart getData(int cart_id);
	public List<MyCart> getListUser(MyCart mycart);
	
	public int setAddMyCart(int user_no, int menu_no, int menu_cnt);
}

