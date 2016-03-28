/*
 * @(#)StoreDaoImpl.java 2013. 8. 6.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.CategoryLocation;
import com.wingko.story.domain.News;
import com.wingko.story.domain.Ripple;
import com.wingko.story.domain.SelectData;
import com.wingko.story.domain.Store;
import com.wingko.story.domain.StoreCoupon;
import com.wingko.story.domain.StoreMenu;
import com.wingko.story.session.SqlSessionManager;
import com.wingko.story.util.CommonUtil;
 
/**
 * Store Dao Implements
 *
 * @author  yshsy
 * @version 1.0,  2013. 8. 6.
 */
@Repository
public class StoreDaoImpl implements StoreDao {
	
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public Store getStore(Store store) {

		SqlSession session = sessionFactory.openSession();
		try {
			store = session.selectOne("StoreMapper.getStore", store);
		} finally {
			session.close();
		}
		return store;
	}
	

	@Override
	public List<Store> getStoreList(Store store) {

		SqlSession session = sessionFactory.openSession();
		List<Store> list;
		try {
			list = session.selectList("StoreMapper.getStoreList", store);
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setContent(CommonUtil.removeHtml(list.get(i).getContent()));
			}
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getStoreListCount(Store store) {

		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("StoreMapper.getStoreListCount", store);
		} finally {
			session.close();
		}
		return count;
	}
	

	@Override
	public List<Ripple> getStoreRippleList(Ripple ripple) {

		SqlSession session = sessionFactory.openSession();
		List<Ripple> list;
		try {
			list = session.selectList("StoreMapper.getStoreRippleList", ripple);
		} finally {
			session.close();
		}
		return list;
	}
	

	@Override
	public int getStoreRippleListCount(Ripple ripple) {

		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.selectOne("StoreMapper.getStoreRippleListCount", ripple);
		} finally {
			session.close();
		}
		return result;
	}
	

	@Override
	public int setStoreRippleInsert(Ripple ripple) {

		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("StoreMapper.setStoreRippleInsert", ripple);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setStoreRippleUpdate(Ripple ripple) {

		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.update("StoreMapper.setStoreRippleUpdate", ripple);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setStoreRippleDelete(Ripple ripple) {

		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.delete("StoreMapper.setStoreRippleDelete", ripple);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public List<StoreMenu> getStoreMenu(Store store) {

		SqlSession session = sessionFactory.openSession();
		List<StoreMenu> list;
		try {
			list = session.selectList("StoreMapper.getStoreMenuList", store);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<StoreCoupon> getStoreCoupon(Store store) {

		SqlSession session = sessionFactory.openSession();
		List<StoreCoupon> list;
		try {
			list = session.selectList("StoreMapper.getStoreCouponList", store);
		} finally {
			session.close();
		}
		return list;
	}


	@Override
	public CategoryLocation getCategoryLocationInfo(String category_no,
			String location_no) {

		SqlSession session = sessionFactory.openSession();
		CategoryLocation categoryLocation = new CategoryLocation();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("category_no", category_no);
		map.put("location_no", location_no);
		try {
			categoryLocation = session.selectOne("StoreMapper.getCategoryLocationInfo", map);
		} finally {
			session.close();
		}
		return categoryLocation;
	}


	@Override
	public List<News> getNewsRand(String category_no) {

		SqlSession session = sessionFactory.openSession();
		List<News> list;
		try {
			list = session.selectList("StoreMapper.getNewsRand", category_no);
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setContent(CommonUtil.removeHtml(list.get(i).getContent()));
			}
		} finally {
			session.close();
		}
		return list;
	}


	@Override
	public List<Store> getStoreRand(String location_no) {

		SqlSession session = sessionFactory.openSession();
		List<Store> list;
		try {
			list = session.selectList("StoreMapper.getStoreRand", location_no);
		} finally {
			session.close();
		}
		return list;
	}


	@Override
	public List<SelectData> getLocationForSelect(HashMap map) {

		SqlSession session = sessionFactory.openSession();
		List<SelectData> list = new ArrayList<SelectData>();
		try {
			list = session.selectList("StoreMapper.getLocationForSelect", map);
		} finally {
			session.close();
		}
		return list;
	}


	@Override
	public List<SelectData> getCategoryForSelect(HashMap map) {
		SqlSession session = sessionFactory.openSession();
		List<SelectData> list = new ArrayList<SelectData>();
		try {
			list = session.selectList("StoreMapper.getCategoryForSelect", map);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public String getStoreNewReplyOrder(Ripple ripple) {
		SqlSession session = sessionFactory.openSession();
		String sNewReplyOrder = "";
		try {
			sNewReplyOrder = session.selectOne("StoreMapper.getNewReplyOrder", ripple);
		} finally {
			session.close();
		}
		return sNewReplyOrder;
	}


}
