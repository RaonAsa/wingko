/*
 * @(#)CompanyController.java  2013. 9. 6.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wingko.story.dao.CommunityDao;
import com.wingko.story.dao.CompanyDao;
import com.wingko.story.dao.InfoDao;
import com.wingko.story.domain.Company;
import com.wingko.story.domain.CompanyNews;
import com.wingko.story.domain.Ripple;
import com.wingko.story.util.MultipartRequestWithSameFileTag;
import com.wingko.story.util.PagedList;
import com.wingko.story.util.TimestampFileRenamePolicy;

/**
 * Company Controller
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 6.
 */
@Controller
@RequestMapping("/company")
public class CompanyController {
	Logger logger = LoggerFactory.getLogger(CompanyController.class);
	
	@Autowired
	private CompanyDao dao;
	
	@Autowired
	private CommunityDao communityDao;
	
	@Autowired
	private InfoDao infoDao;
	
//	int size = 10*1024*1024;
//	String uploadTempPath = "/home/wingko/www/root/upload/question";	// 실섭 경로
//	String uploadTempPath = "D:/eclipse64/springsource/sts-3.2.0.RELEASE/workspace/wingko_basic/src/main/webapp/upload/question";	// 실섭 경로
	// path를 config로 처리
	@Value("#{config['uploadTempPath']}") String uploadTempPath;
	@Value("#{config['urlPath']}") String urlPath;
	@Value("#{config['fileSize']}") Integer size;

	@RequestMapping("/main.do")
	public String main() {
	
		return "company/main";
	}
	
	@RequestMapping("/business.do")
	public String business(Model model) {
	
		model.addAttribute("info", infoDao.info(2));
		
		return "company/business";
	}
	@RequestMapping("/ci.do")
	public String ci(Model model) {
		model.addAttribute("info", infoDao.info(4));
		
		return "company/ci";
	}
	@RequestMapping("/history.do")
	public String history(Model model) {
		model.addAttribute("info", infoDao.info(3));
	
		return "company/history";
	}
	@RequestMapping("/presentation_content.do")
	public String presentation_content(Model model) {
		model.addAttribute("info", infoDao.info(5));
	
		return "company/presentation_content";
	}

	@RequestMapping("/summary.do")
	public String summary(Model model) {
		
		model.addAttribute("info", infoDao.info(1));
	
		return "company/summary";
	}
	
	
	@RequestMapping("/adinfo.do")
	public String adinfo(Model model, @RequestParam(value="no", defaultValue="7")int no) {
		/*
		 * 7 광고개요
		 * 8 윙코스토리광고
		 * 9 커뮤니티광고
		 * 10 광고혜택/매체자료
		 */
		
		model.addAttribute("info", infoDao.info(no));
	
		return "company/adinfo";
	}

	@RequestMapping("/event.do")
	public String event(Model model, @RequestParam(value="no", defaultValue="13") int no) {

		Ripple ripple = new Ripple(no, "event");
		model.addAttribute("rippleList", communityDao.getCommunityRippleList(ripple));
		model.addAttribute("rippleCount", communityDao.getCommunityRippleListCount(ripple));

		model.addAttribute("info", infoDao.info(no));

		return "company/event";
	}

	@RequestMapping(value="/ripple_insert.do", method=RequestMethod.POST)
	public String reviewSubmit(Ripple ripple) {
		communityDao.setCommunityRippleInsert(ripple);

		if (ripple.getReply_order() == null) ripple.setReply_order("");
		String sNewReplyOrder = communityDao.getStoreNewReplyOrder(ripple);
		logger.debug("new reply_order : {}", sNewReplyOrder);
		ripple.setReply_order(sNewReplyOrder);
		communityDao.setCommunityRippleInsert(ripple);
		
		return "redirect:/company/event.do?no="+ripple.getParent_no();
	}

	@RequestMapping(value="/ripple_delete.do", method=RequestMethod.GET)
	public String reviewDelete(Ripple ripple, HttpSession session) {
		ripple.setUser_no((Integer) session.getAttribute("user_no"));
		communityDao.setCommunityRippleDelete(ripple);
		return "redirect:/company/event.do?no="+ripple.getParent_no();
	}

	
	
	
	
	
	
	@RequestMapping("/news.do")
	public String news(Model model, CompanyNews companyNews) {
		
		int totalCount = dao.getCompanyNewsListCount(companyNews);
		PagedList<CompanyNews> list = new PagedList<CompanyNews>(dao.getCompanyNewsList(companyNews), companyNews.getPage(), companyNews.getPageSize(), totalCount);

		model.addAttribute("list", list);
	
		return "company/news";
	}
	
	@RequestMapping("/news_view.do")
	public String news_view(Model model, CompanyNews companyNews) {
		int page = companyNews.getPage();
		
		dao.setCompanyNewsHit(companyNews.getNo());
		companyNews = dao.getCompanyNews(companyNews.getNo());
		companyNews.setPage(page);

		model.addAttribute("companyNews", companyNews);
		model.addAttribute("next", dao.getCompanyNewsNext(companyNews));
		model.addAttribute("prev", dao.getCompanyNewsPrev(companyNews));		
	
		return "company/news_view";
	}

	
	
	@RequestMapping("/question.do")
	public String question(Model model) {
		
		model.addAttribute("info", infoDao.info(6));
	
		return "company/question";
	}
	
	@RequestMapping(value="/question_write.do", method=RequestMethod.GET)
	public String questionWrite(Model model, Company company) {
		
		model.addAttribute("company", company);
	
		return "company/question_write";
	}
	

	@RequestMapping(value="/question_write.do", method=RequestMethod.POST)
	public String questionWriteSubmit(HttpServletRequest req, Model model, Company company) {
		
		int result = -1;
		
		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(req, uploadTempPath + "/question", size, "UTF-8", new TimestampFileRenamePolicy());

			HashMap<String, String> params = new HashMap<String, String>();
			Enumeration<?> enumeration = multi.getParameterNames();
			while (enumeration.hasMoreElements()) {
				String string = (String) enumeration.nextElement();
				params.put(string, multi.getParameter(string));
			}
			Set<String> set = multi.getFileNames();
			for (String string : set) {
				params.put(string, multi.getFilesystemName(string));
			}

			result = dao.insertCompanyQuestion(params);
		} catch (Exception e) {
			result = -1;
			e.printStackTrace();
		}

		model.addAttribute("result", result);

		return "company/question_write";
	}

}

