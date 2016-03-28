/*
 * @(#)CommunityController.java  2013. 9. 2.
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
import com.wingko.story.dao.SearchDao;
import com.wingko.story.dao.SearchDaoImpl;
import com.wingko.story.domain.Search;
import com.wingko.story.domain.Store;
import com.wingko.story.util.PagedList;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 2.
 */
@Controller
public class SearchController {
	
	Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Autowired
	private AdDao adDao;	
	
	@Autowired
	private SearchDao dao;
	
	@RequestMapping(value="/search/result.do")
	public String result(Model model, Search search) {
		
		search.setPageSize(10);

		int nowMenu = search.getMenu();
		
		model.addAttribute("ad", adDao.getAd(53));
		
		if ("".equals(search.getSearchString())) {
			search.setMenu(nowMenu);
		} else {
			int count[] = new int[9];

			for (int i = 1; i < 9; i++) {
				search.setMenu(i);
				count[i] = dao.getSearchListCount(search);
			}
			count[0] = count[1] + count[2];

			search.setMenu(nowMenu);
			PagedList<Search> list = new PagedList<Search>(dao.getSearchList(search), search.getPage(), search.getPageSize(), count[nowMenu], 5);

			model.addAttribute("list", list);
			model.addAttribute("count", count);
		}
		
		model.addAttribute("search", search);

		return "/search/result";
	}
	
	
	
	@RequestMapping(value="/search/store_result.do")
	public String store(Model model, Store store
			, @RequestParam(value="select_category", required=false)String select_category
			, @RequestParam(value="select_location", required=false)String select_location) {

		int totalCount = dao.getStoreSearchListCount(store);
		PagedList<Store> list = new PagedList<Store>(dao.getStoreSearchList(store), store.getPage(), store.getPageSize(), totalCount);

		model.addAttribute("ad", adDao.getAd(53));
		model.addAttribute("list", list);
		model.addAttribute("select_category", select_category);
		model.addAttribute("select_location", select_location);
		

		return "/search/store_result";
	}
	
	
	public static void main(String[] args) {
		SearchDao dao = new SearchDaoImpl();
		Search search = new Search();
		search.setMenu(1);
		search.setSearchType("title");
		search.setSearchString("大关");

		int count = dao.getSearchListCount(search);

		System.out.println("count :::: " + count);

	}
}

