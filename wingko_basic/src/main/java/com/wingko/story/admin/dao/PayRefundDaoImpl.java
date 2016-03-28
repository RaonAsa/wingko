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

import com.wingko.story.domain.PayRefund;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 1.
 */
@Repository
public class PayRefundDaoImpl implements PayRefundDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();
	
	@Override
	public List<PayRefund> getList(PayRefund payrefund) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<PayRefund> list = new ArrayList<PayRefund>();
		try {
			list = session.selectList("AdminPayRefundMapper.list", payrefund);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public PayRefund getData(String pid) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		PayRefund payrefund= null;
		try {
			payrefund = session.selectOne("AdminPayRefundMapper.select", pid);
		} finally {
			session.close();
		}
		return payrefund;
	}

	@Override
	public int setInsert(PayRefund payrefund) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminPayRefundMapper.insert", payrefund);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setUpdate(PayRefund payrefund) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminPayRefundMapper.update", payrefund);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	
}

