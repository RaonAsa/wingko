/*
 * @(#)LocationController.java  2013. 8. 14.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wingko.story.dao.AdDao;
import com.wingko.story.dao.LocationDao;
import com.wingko.story.domain.Community;
import com.wingko.story.domain.Location;
import com.wingko.story.domain.News;
import com.wingko.story.domain.Store;
import com.wingko.story.domain.Travel;
import com.wingko.story.util.PagedList;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 14.
 */
@Controller
public class LocationController {

	Logger logger = LoggerFactory.getLogger(LocationController.class);
	
	@Autowired
	private LocationDao dao;
	@Autowired
	private AdDao adDao;
	
	@RequestMapping("/location/main.do")
	public String location( Model model, Location location, @RequestParam(value="location_no", defaultValue="12")String location_no ) {

		model.addAttribute("headerInfo", dao.headerInfo(location_no));
		model.addAttribute("subList", dao.subList(location_no));
		model.addAttribute("hotPlace", dao.hotPlace(location_no));
		model.addAttribute("location_no", location_no);
		
		model.addAttribute("ad", adDao.getAd(50));	// 지역 광고

		return "/location/main";
	}

	@RequestMapping("/location/detail.do")
	public String detail( Model model, Location location, 
			@RequestParam(value="location_no", required=true)String location_no, @RequestParam(value="parent_category_no", defaultValue="8")String parent_category_no,
			@RequestParam(value="page", defaultValue="1")int page, @RequestParam(value="sub_menu", defaultValue="1")String sub_menu,
			@RequestParam(value="sub_page", defaultValue="1")int sub_page, @RequestParam(value="flag", defaultValue="")String sFlag) {

		int totalCount = dao.storeListCount(location_no, parent_category_no);
		int pageSize = 10;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("location_no", location_no);
		map.put("parent_category_no", parent_category_no);
		map.put("start_no", (page-1) * pageSize);
		map.put("pageSize", pageSize);
		PagedList<Store> list = new PagedList<Store>(dao.storeList(map), page, pageSize, totalCount);
		
		
		if ("1".equals(sub_menu)) {
			// 뉴스리스트
			News news = new News();
			news.setPage(sub_page);
			news.setPageSize(15);
			news.setLocation_no(location_no);
			int subCount = dao.newsListCount(news);
			PagedList<News> subList = new PagedList<News>(dao.newsList(news), news.getPage(), news.getPageSize(), subCount, 5);

			model.addAttribute("subList", subList);
			
		} else if ("2".equals(sub_menu)) {
			Travel travel = new Travel();
			travel.setPage(sub_page);
			travel.setPageSize(15);
			travel.setLocation_no(location_no);
			int subCount = dao.travelListCount(travel);
			PagedList<Travel> subList = new PagedList<Travel>(dao.travelList(travel), travel.getPage(), travel.getPageSize(), subCount, 5);
			
			model.addAttribute("subList", subList);	
			
		} else if ("3".equals(sub_menu)) {
			Community blog = new Community();
			blog.setPage(sub_page);
			blog.setPageSize(15);
			blog.setLocation_no(Integer.parseInt(location_no));
			int subCount = dao.blogListCount(blog);
			PagedList<Community> subList = new PagedList<Community>(dao.blogList(blog), blog.getPage(), blog.getPageSize(), subCount, 5);

			model.addAttribute("subList", subList);			
		} else if ("4".equals(sub_menu)) {
			News news = new News();
			news.setPage(sub_page);
			news.setPageSize(15);
			news.setLocation_no(location_no);
			int subCount = dao.newsPickupListCount(news);
			PagedList<News> subList = new PagedList<News>(dao.newsPickupList(news), news.getPage(), news.getPageSize(), subCount, 5);

			model.addAttribute("subList", subList);
		}

		model.addAttribute("headerInfo", dao.headerInfo(location_no));
		model.addAttribute("location", location);
		model.addAttribute("location_no", location_no);
		model.addAttribute("parent_category_no", parent_category_no);
		model.addAttribute("list", list);
		
		model.addAttribute("sub_menu", sub_menu);
		model.addAttribute("sub_page", sub_page);
		
		

		model.addAttribute("ad", adDao.getAd(51));	// 지역 상세 광고
		
		// wechat test를 위해서 추가함.
		if ("wechat".equals(sFlag)) 
			return "/location/detail_wechat";
		else
			return "/location/detail";
			
	}
}

