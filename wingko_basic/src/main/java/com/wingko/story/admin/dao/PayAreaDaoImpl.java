/*
 * @(#)PayAddressDaoImpl.java  2013. 9. 29.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.PayArea;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 9. 29.
 */
@Repository
public class PayAreaDaoImpl implements PayAreaDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();
	
	@Override
	public int setInsert(PayArea payarea) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminPayAreaMapper.insert", payarea);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setUpdate(PayArea payarea) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.update("AdminPayAreaMapper.update", payarea);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public PayArea getData(String pid) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		PayArea payarea = null;
		try {
			payarea = session.selectOne("AdminPayAreaMapper.select", pid);
		} finally {
			session.close();
		}
		return payarea;
	}

}

