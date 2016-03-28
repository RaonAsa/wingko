/*
 * @(#)AdminNewsDaoImpl.java  2013. 9. 2.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.News;
import com.wingko.story.domain.SelectData;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 2.
 */
@Repository
public class AdminNewsDaoImpl implements AdminNewsDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public List<News> getList(News news) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<News> list;
		try {
			list = session.selectList("AdminNewsMapper.list", news);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getListCount(News news) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("AdminNewsMapper.listCount", news);
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public News getNews(News news) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			news = session.selectOne("AdminNewsMapper.select", news);
		} finally {
			session.close();
		}
		return news;
	}

	@Override
	public int setInsert(HashMap map) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("AdminNewsMapper.insert", map);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setUpdate(HashMap map) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.update("AdminNewsMapper.update", map);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setDelete(News news) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.delete("AdminNewsMapper.delete", news);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}


	@Override
	public List<SelectData> getNewsCategory() {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<SelectData> list;
		try {
			list = session.selectList("AdminNewsMapper.newsCategoryList");
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<SelectData> getStore() {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<SelectData> list;
		try {
			list = session.selectList("AdminNewsMapper.storeList");
		} finally {
			session.close();
		}
		return list;
	}
}

