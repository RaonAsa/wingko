/*
 * @(#)DealEmsDaoImpl.java  2013. 9. 24.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.DealEms;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 9. 24.
 */
@Repository
public class DealEmsDaoImpl implements DealEmsDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();
	
	@Override
	public int setInsert(DealEms dealems) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminDealEmsMapper.insert", dealems);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setUpdate(DealEms dealems) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminDealEmsMapper.update", dealems);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public DealEms getData(int ems_id) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		DealEms dealems = null;
		try {
			dealems = session.selectOne("AdminDealEmsMapper.select", ems_id);
		} finally {
			session.close();
		}
		return dealems;
	}

	@Override
	public List<DealEms> getListAll() {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<DealEms> list = null;
		try {
			list = session.selectList("AdminDealEmsMapper.list_all");
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public DealEms getItemCnt(int item_cnt){
		SqlSession session = sessionFactory.openSession();
		DealEms dealems = null;
		try {
			dealems = session.selectOne("AdminDealEmsMapper.get_item_cnt", item_cnt);
		} finally {
			session.close();
		}
		return dealems;
	}

}

