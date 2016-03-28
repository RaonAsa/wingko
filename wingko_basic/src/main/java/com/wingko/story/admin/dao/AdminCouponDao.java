/*
 * @(#)AdminCouponDao.java  2013. 8. 1.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.List;

import com.wingko.story.domain.Coupon;
import com.wingko.story.domain.CouponInfo;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 1.
 */
public interface AdminCouponDao {
	public List<Coupon> getList(CouponInfo couponinfo);
	public Coupon getCoupon(String coupon_id);
	public int setInsert(Coupon coupon);
	public int setUpdate(Coupon coupon);
}

