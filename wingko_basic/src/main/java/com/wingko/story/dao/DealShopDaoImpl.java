/*
 * @(#)DealShopDaoImpl.java  2013. 9. 25.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.DealItem;
import com.wingko.story.domain.DealMain;
import com.wingko.story.domain.Ripple;
import com.wingko.story.domain.User;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 9. 25.
 */
@Repository
public class DealShopDaoImpl implements DealShopDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();
	
	@Override
	public DealMain getDealShop() {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		DealMain dealmain = null;
		try {
			dealmain = session.selectOne("DealShopMapper.deal_shop");
		} finally {
			session.close();
		}
		return dealmain;
	}
	
	@Override
	public DealMain getDealMain(int deal_id) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		DealMain dealmain = null;
		try {
			dealmain = session.selectOne("DealShopMapper.get_dealmain", deal_id);
		} finally {
			session.close();
		}
		return dealmain;
	}

	@Override
	public List<DealItem> getDealItemList(int deal_id) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<DealItem> list = null;
		try {
			list = session.selectList("DealShopMapper.list_dealitem", deal_id);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Ripple> getRippleList(Ripple ripple) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Ripple> list = null;
		try {
			list = session.selectList("DealShopMapper.getRippleList", ripple);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getRippleListCount(Ripple ripple) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.selectOne("DealShopMapper.getRippleListCount", ripple);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public int addRipple(Ripple ripple){
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("DealShopMapper.addRipple", ripple);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public int delRipple(Ripple ripple){
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.delete("DealShopMapper.delRipple", ripple);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public User getUserInfo(int user_no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		User user = null;
		try {
			user = session.selectOne("DealShopMapper.get_userinfo", user_no);
		} finally {
			session.close();
		}
		return user;
	}
	
	@Override
	public Map getUserInfoAddress(int user_no){
		SqlSession session = sessionFactory.openSession();
		Map map = null;
		try {
			map = session.selectOne("DealShopMapper.get_userinfo_addr", user_no);
		} finally {
			session.close();
		}
		return map;
	}
	
	
	@Override
	public int setDealItemSaleCount(int deal_id){
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("DealShopMapper.dealitem_salecount", deal_id);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}
	
	/**
	 * 판매된 딜 상품 개수 
	 */
	@Override
	public int getDealItemSaleCount(int deal_id){
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.selectOne("DealShopMapper.get_dealitem_salecount", deal_id);
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public int getOrderDealID(String pid){
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.selectOne("DealShopMapper.get_order_dealid", pid);
		} finally {
			session.close();
		}
		return result;
	}

}

