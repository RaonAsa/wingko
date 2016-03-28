/*
 * @(#)NewsDaoImpl.java  2013. 9. 2.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.News;
import com.wingko.story.session.SqlSessionManager;
import com.wingko.story.util.CommonUtil;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 2.
 */
@Repository
public class NewsDaoImpl implements NewsDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public List<News> getTopThree(HashMap map) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<News> list;
		try {
			list = session.selectList("NewsMapper.newsTopThree", map);
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setContent(CommonUtil.removeHtml(list.get(i).getContent()));
			}
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<News> getList(News news) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<News> list;
		try {
			list = session.selectList("NewsMapper.list", news);
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
			count = session.selectOne("NewsMapper.listCount", news);
			session.commit();
		} finally {
			session.close();
		}
		return count;
	}
	

	@Override
	public List<News> getTopList(News news) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<News> list;
		try {
			list = session.selectList("NewsMapper.topList", news);
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setContent(CommonUtil.removeHtml(list.get(i).getContent()));
			}
		} finally {
			session.close();
		}
		return list;
	}


	@Override
	public News getNews(News news) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			news = session.selectOne("NewsMapper.select", news);
		} finally {
			session.close();
		}
		return news;
	}

	@Override
	public void newsRippleCount(int news_no, int increase) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("news_no", news_no);
		map.put("increase", increase);
		
		try {
			session.update("NewsMapper.newsRippleCount", map);
			session.commit();
		} finally {
			session.close();
		}
	}

	@Override
	public void newsHitUpdate(int news_no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			session.update("NewsMapper.newsHitCount", news_no);
			session.commit();
		} finally {
			session.close();
		}
	}

}

