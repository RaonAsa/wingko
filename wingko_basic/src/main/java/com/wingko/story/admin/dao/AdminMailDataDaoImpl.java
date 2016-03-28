/*
 * @(#)AdminMailDataDaoImpl.java  2013. 10. 6.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.MailData;
import com.wingko.story.domain.Member;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 10. 6.
 */
@Repository
public class AdminMailDataDaoImpl implements AdminMailDataDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();
	
	@Override
	public int setInsert(MailData maildata) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminMailDataMapper.insert", maildata);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setUpdate(MailData maildata) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminMailDataMapper.update", maildata);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public int setDelete(MailData maildata) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminMailDataMapper.delete", maildata);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public MailData getData(int mail_no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		MailData maildata = null;
		try {
			maildata = session.selectOne("AdminMailDataMapper.select", mail_no);
		} finally {
			session.close();
		}
		return maildata;
	}

	@Override
	public List<MailData> getListAll(MailData maildata) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<MailData> list = null;
		try {
			list = session.selectList("AdminMailDataMapper.list_all", maildata);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public int getListAllCount(MailData maildata) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.selectOne("AdminMailDataMapper.list_all_count", maildata);
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public List<Member> getListMemberAll() {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Member> list = null;
		try {
			list = session.selectList("AdminMailDataMapper.list_member_all");
		} finally {
			session.close();
		}
		return list;
	}


}

