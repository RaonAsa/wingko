/*
 * @(#)RecommendDaoImpl.java  2013. 9. 27.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.Recommend;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 27.
 */
@Repository
public class RecommendDaoImpl implements RecommendDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public int insert(Recommend recommend) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.insert("RecommendMapper.insert", recommend);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int check(Recommend recommend) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.selectOne("RecommendMapper.check", recommend);
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int travelRecommendUpdate(Recommend recommend) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.update("RecommendMapper.travelRecommendUpdate", recommend);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int communityRecommendUpdate(Recommend recommend) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.update("RecommendMapper.communityRecommendUpdate", recommend);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

}

