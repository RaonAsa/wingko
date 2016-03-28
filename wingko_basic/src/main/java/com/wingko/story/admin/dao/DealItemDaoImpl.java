/*
 * @(#)DealItemDaoImpl.java  2013. 9. 23.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.DealItem;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 9. 23.
 */
@Repository
public class DealItemDaoImpl implements DealItemDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();
	
	@Override
	public int setInsert(DealItem dealitem) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminDealItemMapper.insert", dealitem);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setUpdate(DealItem dealitem) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminDealItemMapper.update", dealitem);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public int setDelete(int item_id){
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminDealItemMapper.delete", item_id);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public DealItem getData(int item_id) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		DealItem dealitem = null;
		try {
			dealitem = session.selectOne("AdminDealItemMapper.select", item_id);
		} finally {
			session.close();
		}
		return dealitem;
	}
	
	@Override
	public List<DealItem> getDealList(int deal_id){
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<DealItem> list = null;
		try {
			list = session.selectList("AdminDealItemMapper.list_deal", deal_id);
		} finally {
			session.close();
		}
		return list;
	}

}

