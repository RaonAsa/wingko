/*
 * @(#)CouponDao.java  2013. 9. 25.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.HashMap;
import java.util.List;

import com.wingko.story.domain.StoreCoupon;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 25.
 */
public interface CouponDao {
	public List<StoreCoupon> getStoreCouponList(HashMap map);
	public int getStoreCouponListCount(HashMap map);
}

