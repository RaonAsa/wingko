/*
 * @(#)AdminAdDaoImpl.java  2013. 8. 28.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.AdData;
import com.wingko.story.domain.SelectData;
import com.wingko.story.domain.TopWord;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 28.
 */
@Repository
public class AdminAdDaoImpl implements AdminAdDao {
	
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public List<AdData> getList(AdData adData) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<AdData> list;
		try {
			list = session.selectList("AdminAdMapper.list", adData);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getListCount(AdData adData) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("AdminAdMapper.listCount", adData);
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public AdData getAdData(AdData adData) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			adData = session.selectOne("AdminAdMapper.select", adData);
		} finally {
			session.close();
		}
		return adData;
	}

	@Override
	public int setInsert(HashMap map) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("AdminAdMapper.insert", map);
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
			result = session.update("AdminAdMapper.update", map);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setDelete(AdData adData) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.delete("AdminAdMapper.delete", adData);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public List<SelectData> getAdManage() {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<SelectData> list;
		try {
			list = session.selectList("AdminAdMapper.adManageList");
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<TopWord> getWordList() {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<TopWord> list;
		try {
			list = session.selectList("AdminAdMapper.wordList");
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int setWordUpdate(TopWord topWord) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.update("AdminAdMapper.wordUpdate", topWord);
		} finally {
			session.close();
		}
		return result;
	}

}

