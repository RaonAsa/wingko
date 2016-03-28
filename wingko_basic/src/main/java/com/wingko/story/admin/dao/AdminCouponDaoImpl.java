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
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 1.
 */
@Repository
public class AdminCouponDaoImpl implements AdminCouponDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public List<Coupon> getList(CouponInfo couponinfo) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Coupon> list = new ArrayList<Coupon>();
		try {
			list = session.selectList("AdminCouponMapper.list", couponinfo);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public Coupon getCoupon(String coupon_id) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		Coupon coupon;
		try {
			coupon = session.selectOne("AdminCouponMapper.select", coupon_id);
		} finally {
			session.close();
		}
		return coupon;
	}

	@Override
	public int setInsert(Coupon coupon) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminCouponMapper.insert", coupon);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setUpdate(Coupon coupon) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminCouponMapper.update", coupon);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

}

