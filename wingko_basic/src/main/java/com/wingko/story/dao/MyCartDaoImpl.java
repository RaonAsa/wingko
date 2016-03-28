/*
 * @(#)ShopInvenDaoImpl.java  2013. 8. 25.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.MyCart;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 25.
 */
@Repository
public class MyCartDaoImpl implements MyCartDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();
	
	@Override
	public int setInsert(MyCart mycart) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("MyCartMapper.insert", mycart);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setUpdate(MyCart mycart) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("MyCartMapper.update", mycart);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setDelete(MyCart mycart) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("MyCartMapper.delete", mycart);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public MyCart getData(int cart_id) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		MyCart mycart;
		try {
			mycart = session.selectOne("MyCartMapper.select", cart_id);
		} finally {
			session.close();
		}
		return mycart;
	}

	@Override
	public List<MyCart> getListUser(MyCart mycart) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<MyCart> list;
		try {
			list = session.selectList("MyCartMapper.list_user", mycart);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public int setAddMyCart(int user_no, int menu_no, int menu_cnt){
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			MyCart mycart = new MyCart();
			mycart.setUser_no(user_no);
			mycart.setMenu_no(menu_no);
			mycart.setMenu_cnt(menu_cnt);
			
			result = session.insert("MyCartMapper.insert", mycart);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

}

