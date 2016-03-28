/*
 * @(#)CouponDaoImpl.java  2013. 9. 25.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.StoreCoupon;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 25.
 */
@Repository
public class CouponDaoImpl implements CouponDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public List<StoreCoupon> getStoreCouponList(HashMap map) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<StoreCoupon> list = null;
		try {
			list = session.selectList("CouponMapper.getStoreCouponList", map);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getStoreCouponListCount(HashMap map) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("CouponMapper.getStoreCouponListCount", map);
		} finally {
			session.close();
		}
		return count;
	}
	

}

