/*
 * @(#)AdminCompanyController.java  2013. 10. 2.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wingko.story.admin.dao.AdminCompanyDao;
import com.wingko.story.domain.CompanyNews;
import com.wingko.story.domain.CompanyQuestion;
import com.wingko.story.util.PagedList;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 10. 2.
 */
@Controller
@RequestMapping("/admin/company")
public class AdminCompanyController {
	private static Logger logger = LoggerFactory.getLogger(AdminCompanyController.class);
	
	@Autowired
	private AdminCompanyDao dao;
	
	@RequestMapping(value="/news.do")
	public String news(Model model, CompanyNews companyNews) throws Exception {
		
		int totalCount = dao.getCompanyNewsListCount(companyNews);
		PagedList<CompanyNews> list = null;
		list = new PagedList<CompanyNews>(dao.getCompanyNewsList(companyNews), companyNews.getPage(), companyNews.getPageSize(), totalCount);

		model.addAttribute("list", list);
		model.addAttribute("leftMenu", "16");

		return "/admin/company/news";
	}

	@RequestMapping(value="/news_write.do", method=RequestMethod.GET)
	public String newsWrite(HttpSession session, Model model, CompanyNews companyNews) throws Exception {
		if (companyNews.getNo() > 0) {
			int page = companyNews.getPage();
			companyNews = dao.getCompanyNews(companyNews);
			companyNews.setPage(page);
		}

		companyNews.setUser_no(Integer.parseInt((String) session.getAttribute("admin_no")) );

		model.addAttribute("companyNews", companyNews);
		model.addAttribute("leftMenu", "16");

		return "/admin/company/news_write";
	}
	
	@RequestMapping(value="/news_write.do", method=RequestMethod.POST)
	public String newsWriteSubmit(Model model, CompanyNews companyNews) throws Exception {
		
		if (companyNews.getNo() > 0) {
			dao.setCompanyNewsUpdate(companyNews);
		} else {
			dao.setCompanyNewsInsert(companyNews);
		}
		model.addAttribute("page", companyNews.getPage());

		return "redirect:/admin/company/news.do";
	}
	
	@RequestMapping(value="/news_delete.do", method=RequestMethod.GET)
	public String newsDelete(Model model, CompanyNews companyNews) throws Exception {
		dao.setCompanyNewsDelete(companyNews);
		model.addAttribute("page", companyNews.getPage());

		return "redirect:/admin/company/news.do";
	}
	
	
	
	
	@RequestMapping(value="/question.do")
	public String question(Model model, CompanyQuestion companyQuestion) throws Exception {
		
		int totalCount = dao.getCompanyQuestionListCount(companyQuestion);
		PagedList<CompanyQuestion> list = null;
		list = new PagedList<CompanyQuestion>(dao.getCompanyQuestionList(companyQuestion), companyQuestion.getPage(), companyQuestion.getPageSize(), totalCount);

		model.addAttribute("list", list);
		model.addAttribute("leftMenu", "17");

		return "/admin/company/question";
	}
	
	@RequestMapping(value="/question_view.do")
	public String questionView(Model model, CompanyQuestion companyQuestion) throws Exception {
		
		int page = companyQuestion.getPage();

		companyQuestion = dao.getCompanyQuestion(companyQuestion.getNo());
		companyQuestion.setPage(page);

		model.addAttribute("companyQuestion", companyQuestion);
		model.addAttribute("leftMenu", "17");

		return "/admin/company/question_view";
	}
	
	
	
	
	
	

}

