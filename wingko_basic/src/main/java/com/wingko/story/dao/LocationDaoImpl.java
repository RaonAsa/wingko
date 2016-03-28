/*
 * @(#)LocationDaoImpl.java  2013. 8. 15.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.Community;
import com.wingko.story.domain.HotPlace;
import com.wingko.story.domain.Location;
import com.wingko.story.domain.News;
import com.wingko.story.domain.Store;
import com.wingko.story.domain.Travel;
import com.wingko.story.session.SqlSessionManager;
import com.wingko.story.util.CommonUtil;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 15.
 */
@Repository
public class LocationDaoImpl implements LocationDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public Location headerInfo(String location_no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		Location location;
		try {
			location = session.selectOne("LocationMapper.headerInfo", location_no);
		} finally {
			session.close();
		}
		return location;
	}

	@Override
	public List<Map<String, String>> subList(String parent_location_no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Map<String, String>> list;
		try {
			list = session.selectList("LocationMapper.subList", parent_location_no);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Store> hotPlace(String parent_location_no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Store> list;
		try {
			list = session.selectList("LocationMapper.hotPlace", parent_location_no);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Store> storeList(HashMap<String, Object> map ) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Store> list;
		try {
			list = session.selectList("LocationMapper.storeList", map);
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setContent(CommonUtil.removeHtml(list.get(i).getContent()));
			}			
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int storeListCount(String location_no, String parent_category_no) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("location_no", location_no);
		map.put("parent_category_no", parent_category_no);
		
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("LocationMapper.storeListCount", map);
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public List<News> newsList(News news) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<News> list;
		try {
			list = session.selectList("LocationMapper.newsList", news);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int newsListCount(News news) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("LocationMapper.newsListCount", news);
		} finally {
			session.close();
		}
		return count;
	}


	@Override
	public List<Travel> travelList(Travel travel) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Travel> list;
		try {
			list = session.selectList("LocationMapper.travelList", travel);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int travelListCount(Travel travel) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("LocationMapper.travelListCount", travel);
		} finally {
			session.close();
		}
		return count;
	}
	
	@Override
	public List<Community> blogList(Community blog) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Community> list;
		try {
			list = session.selectList("LocationMapper.blogList", blog);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int blogListCount(Community blog) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("LocationMapper.blogListCount", blog);
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public List<News> newsPickupList(News news) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<News> list;
		try {
			list = session.selectList("LocationMapper.newsPickupList", news);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int newsPickupListCount(News news) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("LocationMapper.newsPickupListCount", news);
		} finally {
			session.close();
		}
		return count;
	}



}

