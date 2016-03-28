/*
 * @(#)WingkoInfoDaoImpl.java  2013. 9. 5.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.WingkoInfo;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 9. 5.
 */
@Repository
public class WingkoInfoDaoImpl implements WingkoInfoDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();
	
	@Override
	public int setInsert(WingkoInfo wingkoinfo) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("WingkoInfoMapper.insert", wingkoinfo);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setUpdate(WingkoInfo wingkoinfo) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("WingkoInfoMapper.update", wingkoinfo);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setDelete(WingkoInfo wingkoinfo) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("WingkoInfoMapper.delete", wingkoinfo);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public WingkoInfo getData() {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		WingkoInfo wingkoinfo;
		try {
			wingkoinfo = session.selectOne("WingkoInfoMapper.select_info", 1);
		} finally {
			session.close();
		}
		return wingkoinfo;
	}
	
	@Override
	public WingkoInfo getData(int idx) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		WingkoInfo wingkoinfo;
		try {
			wingkoinfo = session.selectOne("WingkoInfoMapper.select", idx);
		} finally {
			session.close();
		}
		return wingkoinfo;
	}

}

