/*
 * @(#)CompanyDaoImpl.java  2013. 10. 2.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.CompanyNews;
import com.wingko.story.domain.CompanyQuestion;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 10. 2.
 */
@Repository
public class AdminCompanyDaoImpl implements AdminCompanyDao {

	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();
	
	@Override
	public List<CompanyNews> getCompanyNewsList(CompanyNews companyNews) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<CompanyNews> list = null;
		try {
			list = session.selectList("AdminCompanyMapper.companyNewsList", companyNews);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public CompanyNews getCompanyNews(CompanyNews companyNews) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			companyNews = session.selectOne("AdminCompanyMapper.companyNews", companyNews);
		} finally {
			session.close();
		}
		return companyNews;
	}

	@Override
	public int getCompanyNewsListCount(CompanyNews companyNews) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = -1;
		try {
			count = session.selectOne("AdminCompanyMapper.companyNewsListCount", companyNews);
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public int setCompanyNewsInsert(CompanyNews companyNews) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.insert("AdminCompanyMapper.companyNewsInsert", companyNews);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setCompanyNewsUpdate(CompanyNews companyNews) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.update("AdminCompanyMapper.companyNewsUpdate", companyNews);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setCompanyNewsDelete(CompanyNews companyNews) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.delete("AdminCompanyMapper.companyNewsDelete", companyNews);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public List<CompanyQuestion> getCompanyQuestionList(
			CompanyQuestion companyQuestion) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<CompanyQuestion> list = null;
		try {
			list = session.selectList("AdminCompanyMapper.CompanyQuestionList", companyQuestion);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getCompanyQuestionListCount(CompanyQuestion companyQuestion) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("AdminCompanyMapper.CompanyQuestionListCount", companyQuestion);
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public CompanyQuestion getCompanyQuestion(int no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		CompanyQuestion companyQuestion = new CompanyQuestion();
		try {
			companyQuestion = session.selectOne("AdminCompanyMapper.CompanyQuestion", no);
		} finally {
			session.close();
		}
		return companyQuestion;
	}
	

}

