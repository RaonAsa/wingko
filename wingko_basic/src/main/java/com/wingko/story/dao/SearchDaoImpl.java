/*
 * @(#)SearchDaoImpl.java  2013. 9. 24.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.Search;
import com.wingko.story.domain.Store;
import com.wingko.story.session.SqlSessionManager;
import com.wingko.story.util.CommonUtil;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 24.
 */
@Repository
public class SearchDaoImpl implements SearchDao {
	
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public List<Search> getSearchList(Search search) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Search> list = null;
		try {
			if (search.getMenu() == 0) {
				list = session.selectList("SearchMapper.getSearchListAll", search);
			} else if (search.getMenu() == 1) {
				list = session.selectList("SearchMapper.getSearchTravelList", search);
			} else {
				list = session.selectList("SearchMapper.getSearchStoreList", search);	
			}
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setContent(CommonUtil.removeHtml(list.get(i).getContent()));
			}
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getSearchListCount(Search search) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			if (search.getMenu() == 1) {
				count = session.selectOne("SearchMapper.getSearchTravelListCount", search);
			} else {
				count = session.selectOne("SearchMapper.getSearchStoreListCount", search);
			}
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public Search getSearchListForQuick(HashMap map) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		Search search = new Search();
		try {
			search = session.selectOne("SearchMapper.getSearchListForQuick", map);
			search.setContent(CommonUtil.removeHtml(search.getContent()));
		} finally {
			session.close();
		}
		return search;
	}

	@Override
	public List<Store> getStoreSearchList(Store store) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Store> list = null;
		try {
			list = session.selectList("SearchMapper.getStoreSearchList", store);
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setContent(CommonUtil.removeHtml(list.get(i).getContent()));
			}
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getStoreSearchListCount(Store store) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("SearchMapper.getStoreSearchListCount", store);
		} finally {
			session.close();
		}
		return count;
	}

}

