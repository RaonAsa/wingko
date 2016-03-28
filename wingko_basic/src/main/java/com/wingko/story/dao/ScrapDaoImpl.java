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
import com.wingko.story.domain.Scrap;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 27.
 */
@Repository
public class ScrapDaoImpl implements ScrapDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public int insert(Scrap scrap) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.insert("ScrapMapper.insert", scrap);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int check(Scrap scrap) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.selectOne("ScrapMapper.check", scrap);
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int delete(Scrap scrap) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.delete("ScrapMapper.delete", scrap);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}
}

