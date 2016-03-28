/*
 * @(#)TravelDaoImpl.java  2013. 8. 16.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.Travel;
import com.wingko.story.domain.TravelInfo;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 16.
 */
@Repository
public class TravelDaoImpl implements TravelDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public TravelInfo travelInfo(TravelInfo travelInfo) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			travelInfo = session.selectOne("TravelMapper.travelInfo", travelInfo);
		} finally {
			session.close();
		}
		return travelInfo;
	}

	@Override
	public List<Travel> travelList(Travel travel) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Travel> list;
		try {
			list = session.selectList("TravelMapper.travelList", travel);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int travelListCount(Travel travel) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("TravelMapper.travelListCount", travel);
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public Travel travel(Travel travel) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			travel = session.selectOne("TravelMapper.travel", travel);
		} finally {
			session.close();
		}
		return travel;
	}

	@Override
	public void tarvelRippleCountPlus(int travel_no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			session.update("TravelMapper.travelRippleCountPlus", travel_no);
			session.commit();
		} finally {
			session.close();
		}
	}
	
	@Override
	public void tarvelRippleCountMinus(int travel_no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			session.update("TravelMapper.tarvelRippleCountMinus", travel_no);
			session.commit();
		} finally {
			session.close();
		}
	}

	@Override
	public Travel travelRailOne() {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		Travel travel = new Travel();
		try {
			travel = session.selectOne("TravelMapper.travelRailOne");
		} finally {
			session.close();
		}
		return travel;
	}
	
	

}

