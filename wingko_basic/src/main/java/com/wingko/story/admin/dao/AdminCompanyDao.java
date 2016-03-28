/*
 * @(#)CompanyDao.java  2013. 10. 2.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.List;

import com.wingko.story.domain.CompanyNews;
import com.wingko.story.domain.CompanyQuestion;
import com.wingko.story.domain.Qna;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 10. 2.
 */
public interface AdminCompanyDao {

	public List<CompanyNews> getCompanyNewsList(CompanyNews companyNews);
	public CompanyNews getCompanyNews(CompanyNews companyNews);
	public int getCompanyNewsListCount(CompanyNews companyNews);
	public int setCompanyNewsInsert(CompanyNews companyNews);
	public int setCompanyNewsUpdate(CompanyNews companyNews);
	public int setCompanyNewsDelete(CompanyNews companyNews);
	
	
	public List<CompanyQuestion> getCompanyQuestionList(CompanyQuestion companyQuestion);
	public int getCompanyQuestionListCount(CompanyQuestion companyQuestion);
	public CompanyQuestion getCompanyQuestion(int no);
}

