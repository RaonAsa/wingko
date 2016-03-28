/*
 * @(#)PayItemDaoImpl.java  2013. 8. 28.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.PayItem;
import com.wingko.story.domain.PayMain;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 28.
 */
@Repository
public class PayItemDaoImpl implements PayItemDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();
	
	@Override
	public int setInsert(PayItem payitem) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminPayItemMapper.insert", payitem);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setUpdate(PayItem payitem) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminPayItemMapper.update", payitem);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public int setCancelYN(String pid, boolean isCancel){
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		
		PayItem payitem = new PayItem();
		payitem.setPid(pid);
		if(isCancel == true){
			payitem.setCancel_yn('Y');
		}else{
			payitem.setCancel_yn('N');
		}
		
		try {
			result = session.insert("AdminPayItemMapper.set_cancel_yn", payitem);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public PayItem getData(String item_id) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		PayItem payitem = null;
		try {
			payitem = session.selectOne("AdminPayItemMapper.select", item_id);
		} finally {
			session.close();
		}
		return payitem;
	}

	@Override
	public List<PayItem> getItemList(String pid) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<PayItem> list = null;
		try {
			list = session.selectList("AdminPayItemMapper.list_item", pid);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public List<PayItem> getItemListAll(String pid){
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<PayItem> list = null;
		try {
			list = session.selectList("AdminPayItemMapper.list_item_all", pid);
		} finally {
			session.close();
		}
		return list;
	}

}

