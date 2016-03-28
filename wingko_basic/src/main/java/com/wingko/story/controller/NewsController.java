/*
 * @(#)CommunityController.java  2013. 9. 2.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wingko.story.dao.AdDao;
import com.wingko.story.dao.NewsDao;
import com.wingko.story.dao.StoreDao;
import com.wingko.story.domain.AdData;
import com.wingko.story.domain.News;
import com.wingko.story.domain.Ripple;
import com.wingko.story.domain.Store;
import com.wingko.story.util.DateUtil;
import com.wingko.story.util.JSONUtil;
import com.wingko.story.util.PagedList;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 2.
 */
@Controller
public class NewsController {
	
	Logger logger = LoggerFactory.getLogger(NewsController.class);
	
	@Autowired
	private NewsDao dao;
	@Autowired
	private AdDao adDao;
	@Autowired
	private StoreDao storeDao;
	
	@RequestMapping(value="/news/list.do", method=RequestMethod.GET)
	public String list(Model model, News news) {
		if (news.getNews_category_no() < 1) {
			news.setNews_category_no(1);
		}
		news.setPageSize(15);

		int totalCount = dao.getListCount(news);
		PagedList<News> list = new PagedList<News>(dao.getList(news), news.getPage(), news.getPageSize(), totalCount);
		
		List<News> topList = dao.getTopList(news);

		model.addAttribute("news", news);
		model.addAttribute("list", list);
		model.addAttribute("topList", topList);
		model.addAttribute("ad", adDao.getAd(53));

		return "/news/list";
	}
	
	
	@RequestMapping(value="/news/view.do", method=RequestMethod.GET)
	public String view(Model model, News news, HttpServletResponse response, HttpServletRequest request) {
		dao.newsHitUpdate(news.getNews_no());
		news = dao.getNews(news);

		Ripple ripple = new Ripple(news.getNews_no(), "news");
		model.addAttribute("rippleList", storeDao.getStoreRippleList(ripple));
		model.addAttribute("rippleCount", storeDao.getStoreRippleListCount(ripple));
		
		model.addAttribute("news", news);
		model.addAttribute("ad", adDao.getAd(53));
		
		
		/*
		 * 최근 본거 5개..
		 */
		Cookie[] cookies = request.getCookies();

		String pids = "news."+news.getNews_no();
		String org = "";
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if ("quick".equals(cookies[i].getName())) {
					org = cookies[i].getValue();
					pids += "|"+org;
				}
			}	
		} else {
			pids += "|";
		}

		Cookie cookie = new Cookie("quick", pids);
	    cookie.setMaxAge(DateUtil.getSecondForCookie());
	    cookie.setPath("/");
	    response.addCookie(cookie);

		return "/news/view";
	}
	
	@RequestMapping(value="/news/view2.do", method=RequestMethod.GET)
	public String view2(Model model, News news, HttpServletResponse response, HttpServletRequest request) {
		dao.newsHitUpdate(news.getNews_no());
		news = dao.getNews(news);

		Ripple ripple = new Ripple(news.getNews_no(), "news");
		model.addAttribute("rippleList", storeDao.getStoreRippleList(ripple));
		model.addAttribute("rippleCount", storeDao.getStoreRippleListCount(ripple));
		
		model.addAttribute("news", news);
		model.addAttribute("ad", adDao.getAd(53));
		
		
		/*
		 * 최근 본거 5개..
		 */
		Cookie[] cookies = request.getCookies();

		String pids = "news."+news.getNews_no();
		String org = "";
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if ("quick".equals(cookies[i].getName())) {
					org = cookies[i].getValue();
					pids += "|"+org;
				}
			}	
		} else {
			pids += "|";
		}

		Cookie cookie = new Cookie("quick", pids);
	    cookie.setMaxAge(DateUtil.getSecondForCookie());
	    cookie.setPath("/");
	    response.addCookie(cookie);

		return "/news/view2";
	}
	
	
	@RequestMapping(value="/news/review_insert.do", method=RequestMethod.POST)
	public String reviewSubmit(Ripple ripple, @RequestParam("news_category_no")String news_category_no, @RequestParam("page")String page ) {
		if (ripple.getReply_order() == null) ripple.setReply_order("");
		String sNewReplyOrder = storeDao.getStoreNewReplyOrder(ripple);
		logger.debug("new reply_order : {}", sNewReplyOrder);
		ripple.setReply_order(sNewReplyOrder);
		dao.newsRippleCount(ripple.getParent_no(), 1);
		storeDao.setStoreRippleInsert(ripple);
		return "redirect:/news/view.do?news_category_no="+news_category_no+"&news_no="+ripple.getParent_no()+"&page="+page;
	}

	@RequestMapping(value="/news/review_delete.do", method=RequestMethod.GET)
	public String reviewDelete(Ripple ripple, HttpSession session, @RequestParam("news_category_no")String news_category_no, @RequestParam("page")String page ) {
		dao.newsRippleCount(ripple.getParent_no(), -1);
		ripple.setUser_no((Integer) session.getAttribute("user_no"));
		storeDao.setStoreRippleDelete(ripple);
		return "redirect:/news/view.do?news_category_no="+news_category_no+"&news_no="+ripple.getParent_no()+"&page="+page;
	}


	@RequestMapping(value="/news/json_main.do")
	@ResponseBody
	public void jsonMain(HttpServletResponse res, News news) throws Exception {
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		map1.put("news_category_no", news.getNews_category_no());
		map1.put("top", 3);
		List<News> list = dao.getTopThree(map1);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("count", list.size());
		map.put("list", list);

		String jsonData = JSONUtil.ObjectToJSON(map);
		res.setCharacterEncoding("utf-8");
		res.getWriter().write(jsonData);
	}
}

