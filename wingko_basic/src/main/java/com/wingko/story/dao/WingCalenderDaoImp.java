/*
 * @(#)WingCalenderDaoImp.java  2013. 8. 23.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.WingCalender;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 23.
 */
@Repository
public class WingCalenderDaoImp implements WingCalenderDao{
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public int setInsert(WingCalender calender) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("WingCalenderMapper.insert", calender);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setUpdate(WingCalender calender) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("WingCalenderMapper.update", calender);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setDelete(WingCalender calender) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.delete("WingCalenderMapper.delete", calender);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public WingCalender getData(int calender_id) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		WingCalender calender;
		try {
			calender = session.selectOne("WingCalenderMapper.select", calender_id);
		} finally {
			session.close();
		}
		return calender;
	}
	
	@Override
	public List<WingCalender> getSearchList(WingCalender calender) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<WingCalender> list;
		try {
			list = session.selectList("WingCalenderMapper.search_list", calender);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public int getSearchCount(WingCalender calender){
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.selectOne("WingCalenderMapper.search_count", calender);
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public List<WingCalender> getListDate(WingCalender calender) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<WingCalender> list;
		try {
			list = session.selectList("WingCalenderMapper.list_date", calender);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public List<WingCalender> getListMonth(WingCalender calender) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<WingCalender> list;
		try {
			list = session.selectList("WingCalenderMapper.list_month", calender);
		} finally {
			session.close();
		}
		return list;
	}

}

