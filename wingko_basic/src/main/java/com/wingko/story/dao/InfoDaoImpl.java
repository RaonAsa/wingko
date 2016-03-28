/*
 * @(#)InfoDaoImpl.java  2013. 9. 26.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.Info;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 26.
 */
@Repository
public class InfoDaoImpl implements InfoDao {

	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public Info info(int no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		Info info = new Info();
		try {
			info = session.selectOne("InfoMapper.info", no);
		} finally {
			session.close();
		}
		return info;
	}
}

