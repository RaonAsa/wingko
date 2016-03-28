/*
 * @(#)CompanyDaoImpl.java  2013. 9. 6.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.Company;
import com.wingko.story.domain.CompanyNews;
import com.wingko.story.session.SqlSessionManager;
import com.wingko.story.util.CommonUtil;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 6.
 */
@Repository
public class CompanyDaoImpl implements CompanyDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public List<Company> getCompanyList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getCompanyListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertCompanyQuestion(HashMap map) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.insert("CompanyMapper.insertCompanyQuestion", map);
		} finally {
			session.close();
		}

		return result;
	}

	
	@Override
	public List<CompanyNews> getCompanyNewsList(CompanyNews companyNews) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<CompanyNews> list = null;
		try {
			list = session.selectList("CompanyMapper.companyNewsList", companyNews);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getCompanyNewsListCount(CompanyNews companyNews) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("CompanyMapper.companyNewsListCount", companyNews);
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public CompanyNews getCompanyNews(int no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		CompanyNews companyNews = new CompanyNews(); 
		try {
			companyNews = session.selectOne("CompanyMapper.companyNews", no);
		} finally {
			session.close();
		}
		return companyNews;
	}

	@Override
	public CompanyNews getCompanyNewsNext(CompanyNews companyNews) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			companyNews = session.selectOne("CompanyMapper.companyNewsNext", companyNews);
		} finally {
			session.close();
		}
		return companyNews;
	}

	@Override
	public CompanyNews getCompanyNewsPrev(CompanyNews companyNews) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			companyNews = session.selectOne("CompanyMapper.companyNewsPrev", companyNews);
		} finally {
			session.close();
		}
		return companyNews;
	}

	@Override
	public int setCompanyNewsHit(int no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.update("CompanyMapper.companyNewsHit", no);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}
}

