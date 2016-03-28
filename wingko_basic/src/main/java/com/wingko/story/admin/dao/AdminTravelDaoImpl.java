/*
 * @(#)AdminTravelDaoImpl.java 2013. 8. 11.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.SelectData;
import com.wingko.story.domain.Travel;
import com.wingko.story.domain.TravelInfo;
import com.wingko.story.session.SqlSessionManager;
 
/**
 * TODO
 *
 * @author  yshsy
 * @version 1.0,  2013. 8. 11.
 */
@Repository
public class AdminTravelDaoImpl implements AdminTravelDao {

	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public List<Travel> getList(Travel travel) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Travel> list;
		try {
			list = session.selectList("AdminTravelMapper.list", travel);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public int getListCount(Travel travel) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.selectOne("AdminTravelMapper.listCount", travel);
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public Travel getTravel(Travel travel) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			travel = session.selectOne("AdminTravelMapper.travel", travel);
		} finally {
			session.close();
		}
		return travel;
	}

	@Override
	public int setInsert(HashMap map) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("AdminTravelMapper.insert", map);
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
			result = session.update("AdminTravelMapper.update", map);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setDelete(Travel travel) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.delete("AdminTravelMapper.delete", travel);
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
		List<SelectData> list;
		try {
			list = session.selectList("AdminTravelMapper.getLocationForSelect");
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<SelectData> getTravelCategoryForSelect() {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<SelectData> list;
		try {
			list = session.selectList("AdminTravelMapper.getTravelCategoryForSelect");
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<TravelInfo> travelInfoList(TravelInfo travelInfo) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<TravelInfo> list;
		try {
			list = session.selectList("AdminTravelMapper.travelInfoList", travelInfo);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public TravelInfo travelInfo(TravelInfo travelInfo) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			travelInfo = session.selectOne("AdminTravelMapper.travelInfo", travelInfo);
		} finally {
			session.close();
		}
		return travelInfo;
	}

	@Override
	public int insertTravelInfo(TravelInfo travelInfo) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("AdminTravelMapper.travelInfoInsert", travelInfo);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int updateTravelInfo(TravelInfo travelInfo) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.update("AdminTravelMapper.travelInfoUpdate", travelInfo);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int deleteTravelInfo(TravelInfo travelInfo) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.delete("AdminTravelMapper.travelInfoDelete", travelInfo);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}
}
