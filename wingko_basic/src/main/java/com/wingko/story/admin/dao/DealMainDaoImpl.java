/*
 * @(#)DealMainDaoImpl.java  2013. 9. 23.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.DealMain;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 9. 23.
 */
@Repository
public class DealMainDaoImpl implements DealMainDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();
	
	@Override
	public int setInsert(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminDealMainMapper.insert", map);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setUpdate(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminDealMainMapper.update", map);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public int setDelete(DealMain dealmain) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.delete("AdminDealMainMapper.delete", dealmain);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public DealMain getData(int deal_id) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		DealMain dealmain = null;
		try {
			dealmain = session.selectOne("AdminDealMainMapper.select", deal_id);
		} finally {
			session.close();
		}
		return dealmain;
	}
	
	@Override
	public DealMain getTopData(){
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		DealMain dealmain = null;
		try {
			dealmain = session.selectOne("AdminDealMainMapper.select_top");
		} finally {
			session.close();
		}
		return dealmain;
	}

	@Override
	public List<DealMain> getSearchAll(DealMain dealmain) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<DealMain> list = null;
		try {
			list = session.selectList("AdminDealMainMapper.list_seach_all", dealmain);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public int getSearchCount(DealMain dealmain){
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.selectOne("AdminDealMainMapper.list_seach_count", dealmain);
		} finally {
			session.close();
		}
		return result;
	}
	
}

