/*
 * @(#)AdminStoreDaoImpl.java  2013. 7. 25.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.jws.soap.SOAPBinding;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.Store;
import com.wingko.story.domain.SelectData;
import com.wingko.story.domain.StoreCoupon;
import com.wingko.story.domain.StoreMenu;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 25.
 */
@Repository
public class AdminStoreDaoImpl implements AdminStoreDao {

	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public List<Store> getList(Store store) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Store> list = new ArrayList<Store>();
		try {
			list = session.selectList("AdminStoreMapper.list", store);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public int getListCount(Store store) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("AdminStoreMapper.listCount", store);
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public Store getStore(String store_no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		Store store;
		try {
			store = session.selectOne("AdminStoreMapper.select", store_no);
		} finally {
			session.close();
		}
		return store;
	}

	@Override
	public int setInsert(HashMap map) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminStoreMapper.insert", map);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setUpdate(HashMap map) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.update("AdminStoreMapper.update", map);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setDelete(String store_no) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.update("AdminStoreMapper.delete", store_no);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public List<SelectData> getLocationForSelect() {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<SelectData> list = new ArrayList<SelectData>();
		try {
			list = session.selectList("AdminStoreMapper.getLocationForSelect");
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<SelectData> getCategoryForSelect() {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<SelectData> list = new ArrayList<SelectData>();
		try {
			list = session.selectList("AdminStoreMapper.getCategoryForSelect");
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<StoreMenu> getStoreMenuList(StoreMenu storeMenu) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<StoreMenu> list = new ArrayList<StoreMenu>();
		try {
			list = session.selectList("AdminStoreMapper.storeMenuList", storeMenu);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public StoreMenu getStoreMenu(StoreMenu storeMenu) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			storeMenu = session.selectOne("AdminStoreMapper.storeMenu", storeMenu);
		} finally {
			session.close();
		}
		return storeMenu;
	}

	@Override
	public int setStoreMenuInsert(HashMap map) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("AdminStoreMapper.storeMenuInsert", map);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setStoreMenuUpdate(HashMap map) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.update("AdminStoreMapper.storeMenuUpdate", map);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setStoreMenuDelete(StoreMenu storeMenu) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.update("AdminStoreMapper.storeMenuDelete", storeMenu);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public List<StoreCoupon> getStoreCouponList(StoreCoupon storeCoupon) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<StoreCoupon> list;
		try {
			list = session.selectList("AdminStoreMapper.storeCouponList", storeCoupon);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public StoreCoupon getStoreCoupon(StoreCoupon storeCoupon) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			storeCoupon = session.selectOne("AdminStoreMapper.storeCoupon", storeCoupon);
		} finally {
			session.close();
		}
		return storeCoupon;
	}

	@Override
	public int setStoreCouponInsert(HashMap map) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("AdminStoreMapper.storeCouponInsert", map);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setStoreCouponUpdate(HashMap map) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.update("AdminStoreMapper.storeCouponUpdate", map);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setStoreCouponDelete(StoreCoupon storeCoupon) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.update("AdminStoreMapper.storeCouponDelete", storeCoupon);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

}

