/*
 * @(#)CompanyDao.java  2013. 9. 6.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.HashMap;
import java.util.List;

import com.wingko.story.domain.Company;
import com.wingko.story.domain.CompanyNews;
import com.wingko.story.domain.Ripple;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 6.
 */
public interface CompanyDao {
	
	public List<Company> getCompanyList();
	public int getCompanyListCount();
	public int insertCompanyQuestion(HashMap map);

	
	public List<CompanyNews> getCompanyNewsList(CompanyNews companyNews);
	public int getCompanyNewsListCount(CompanyNews companyNews);
	public CompanyNews getCompanyNews(int no);
	public CompanyNews getCompanyNewsNext(CompanyNews companyNews);
	public CompanyNews getCompanyNewsPrev(CompanyNews companyNews);
	public int setCompanyNewsHit(int no);
}

