/*
 * @(#)JsonDaoImpl.java  2013. 8. 6.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.Store;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 6.
 */
@Repository
public class JsonDaoImpl implements JsonDao {
	
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public List<Store> getMapListByProduct(Map map) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Store> list;
		try {
			list = session.selectList("JsonMapper.maplist", map);
		} finally {
			session.close();
		}
		return list;
	}

}

