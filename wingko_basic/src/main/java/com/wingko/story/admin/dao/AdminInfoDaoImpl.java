/*
 * @(#)InfoDaoImpl.java  2013. 9. 26.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.List;

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
public class AdminInfoDaoImpl implements AdminInfoDao {
	
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public List<Info> infoList(Info info) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Info> list;
		try {
			list = session.selectList("AdminInfoMapper.infoList", info);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public Info info(Info info) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			info = session.selectOne("AdminInfoMapper.info", info);
		} finally {
			session.close();
		}
		return info;
	}

	@Override
	public int insertInfo(Info info) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("AdminInfoMapper.infoInsert", info);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int updateInfo(Info info) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.update("AdminInfoMapper.infoUpdate", info);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int deleteInfo(Info info) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.delete("AdminInfoMapper.infoDelete", info);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

}

