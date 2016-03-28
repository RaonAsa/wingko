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
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.admin.controller.AdminPayMgrController;
import com.wingko.story.domain.PayCard;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 1.
 */
@Repository
public class PayCardDaoImpl implements PayCardDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();
	
	@Override
	public List<PayCard> getList(PayCard paycard) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<PayCard> list = new ArrayList<PayCard>();
		try {
			list = session.selectList("AdminPayCardMapper.list", paycard);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public PayCard getData(String pid) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		PayCard payinicis = null;
		try {
			payinicis = session.selectOne("AdminPayCardMapper.select", pid);
		} finally {
			session.close();
		}
		return payinicis;
	}

	@Override
	public int setInsert(PayCard paycard) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminPayCardMapper.insert", paycard);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setUpdate(PayCard paycard) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminPayCardMapper.update", paycard);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	
}

