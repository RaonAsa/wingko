/*
 * @(#)AdminCouponDaoImpl.java  2013. 8. 1.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.Coupon;
import com.wingko.story.domain.CouponInfo;
import com.wingko.story.domain.SelectData;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 1.
 */
@Repository
public class AdminCouponInfoDaoImpl implements AdminCouponInfoDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public List<CouponInfo> getList(CouponInfo couponinfo) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<CouponInfo> list = new ArrayList<CouponInfo>();
		try {
			list = session.selectList("AdminCouponInfoMapper.list", couponinfo);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public CouponInfo getCouponInfo(int idx) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		CouponInfo couponinfo;
		try {
			couponinfo = session.selectOne("AdminCouponInfoMapper.select", idx);
		} finally {
			session.close();
		}
		return couponinfo;
	}

	@Override
	public int setInsert(CouponInfo couponinfo) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminCouponInfoMapper.insert", couponinfo);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setUpdate(CouponInfo couponinfo) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminCouponInfoMapper.update", couponinfo);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public List<SelectData> getTypeSelect()
	{
		List<SelectData> list = new ArrayList<SelectData>();
		list.add( new SelectData("price", CouponInfo.COUPONINFO_PRICE) );
		list.add( new SelectData("percent", CouponInfo.COUPONINFO_PERCENT) );
		return list;
	}

}

