/*
 * @(#)AdController.java  2013. 8. 29.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wingko.story.dao.AdDao;
import com.wingko.story.domain.AdData;
import com.wingko.story.domain.TopWord;
import com.wingko.story.util.JSONUtil;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 29.
 */
@Controller
public class AdController {

	Logger logger = LoggerFactory.getLogger(AdController.class);
	
	@Autowired
	private AdDao dao;

	@RequestMapping("/ad")
	public void weather(HttpServletResponse res) {
	
	}


	@RequestMapping(value="/ad/ad_list.do")
	@ResponseBody
	public void adList(HttpServletResponse res, @RequestParam(value="a", required=true) int parentAdNo) throws Exception {
		List<AdData> list = dao.getAdList(parentAdNo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("count", list.size());
		map.put("adList", list);

		
		String jsonData = JSONUtil.ObjectToJSON(map);
		res.setCharacterEncoding("utf-8");
		res.getWriter().write(jsonData);
		
//		return map; 
	}
	
	@RequestMapping(value="/ad/ad.do")
	@ResponseBody
	public void ad(HttpServletResponse res, @RequestParam(value="a", required=true) int adNo) throws Exception {
		AdData adData = dao.getAd(adNo);
		
		String jsonData = JSONUtil.ObjectToJSON(adData);
		res.setCharacterEncoding("utf-8");
		res.getWriter().write(jsonData);
//		return adData; 
	}

	@RequestMapping(value="/ad/log.do")
	public String ad(HttpSession session,
			@RequestParam(value="no", required=true) int no, @RequestParam(value="link", required=true) String link) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("tb_ad_no", no);
		map.put("user_no", session.getAttribute("user_no"));
		dao.hitLog(map);
		
		return "redirect:"+link; 
	}
	
	
	
	
	@RequestMapping(value="/ad/rank.do")
	@ResponseBody
	public void rank(HttpServletResponse res) throws Exception {
		
		List<TopWord> list = new ArrayList<TopWord>();
		list = dao.getRank();
		logger.info(list.toString());
		
		String jsonData = JSONUtil.ObjectToJSON(list);
		res.setCharacterEncoding("utf-8");
		res.getWriter().write(jsonData);
		
//		return map; 
	}
}

