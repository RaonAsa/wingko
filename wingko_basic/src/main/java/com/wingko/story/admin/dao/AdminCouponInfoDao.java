/*
 * @(#)AdminCouponInfoDao.java  2013. 8. 1.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.List;

import com.wingko.story.domain.CouponInfo;
import com.wingko.story.domain.SelectData;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 1.
 */
public interface AdminCouponInfoDao {
	public List<CouponInfo> getList(CouponInfo couponinfo);
	public CouponInfo getCouponInfo(int idx);
	public int setInsert(CouponInfo couponinfo);
	public int setUpdate(CouponInfo couponinfo);
	public List<SelectData> getTypeSelect();

}

