/*
 * @(#)AdminLocationDaoImpl.java  2013. 7. 23.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.HotPlace;
import com.wingko.story.domain.Location;
import com.wingko.story.domain.SelectData;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 23.
 */
@Repository
public class AdminLocationDaoImpl implements AdminLocationDao {

	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public List<Location> getList(Location location) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Location> list = new ArrayList<Location>();
		try {
			list = session.selectList("AdminLocationMapper.list", location);
		} finally {
			session.close();
		}
		return list;
	}
	
	
	@Override
	public Location getLocation(String location_no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		Location location;
		try {
			location = session.selectOne("AdminLocationMapper.select", location_no);
		} finally {
			session.close();
		}
		return location;
	}

	@Override
	public int setInsert(HashMap map) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminLocationMapper.insert", map);
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
			result = session.update("AdminLocationMapper.update", map);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setDelete(String location_no) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.delete("AdminLocationMapper.delete", location_no);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}


	@Override
	public String getDepthForInsert(String location_no) {
		// TODO Auto-generated method stub
		String result = "";
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.selectOne("AdminLocationMapper.getDepthForInsert", location_no);
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
			list = session.selectList("AdminLocationMapper.getLocationForSelect");
		} finally {
			session.close();
		}
		return list;
	}


	@Override
	public List<HotPlace> getHotPlaceList(HotPlace hotPlace) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<HotPlace> list = null;
		try {
			list = session.selectList("AdminLocationMapper.getHotPlaceList", hotPlace);
		} finally {
			session.close();
		}
		return list;
	}


	@Override
	public HotPlace getHotPlaceSelect(int no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		HotPlace hotPlace =  new HotPlace();
		try {
			hotPlace = session.selectOne("AdminLocationMapper.getHotPlaceSelect", no);
		} finally {
			session.close();
		}
		return hotPlace;
	}


	@Override
	public int setHotPlaceInsert(HotPlace hotPlace) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.insert("AdminLocationMapper.setHotPlaceInsert", hotPlace);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}


	@Override
	public int setHotPlaceUpdate(HotPlace hotPlace) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.update("AdminLocationMapper.setHotPlaceUpdate", hotPlace);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}


	@Override
	public int setHotPlaceDelete(HotPlace hotPlace) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.delete("AdminLocationMapper.setHotPlaceDelete", hotPlace);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}


	@Override
	public int setHotPlaceUpdatePlus(HotPlace hotPlace) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.update("AdminLocationMapper.setHotPlaceUpdatePlus", hotPlace);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}


	@Override
	public int setHotPlaceUpdateMinus(HotPlace hotPlace) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.update("AdminLocationMapper.setHotPlaceUpdateMinus", hotPlace);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}


	@Override
	public List<SelectData> getLocationForHotPlaceInsert(int parent_location_no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		 List<SelectData> list = null;
		try {
			list = session.selectList("AdminLocationMapper.getLocationForHotPlaceInsert", parent_location_no);
		} finally {
			session.close();
		}
		return list;
	}
}

