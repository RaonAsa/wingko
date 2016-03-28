/*
 * @(#)CommunityController.java  2013. 9. 2.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.controller;

import java.util.HashMap;
import java.util.List;

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
import com.wingko.story.dao.CouponDao;
import com.wingko.story.domain.StoreCoupon;
import com.wingko.story.util.JSONUtil;
import com.wingko.story.util.PagedList;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 2.
 * 
 * /coupon/list.do
 * 쿠폰 리스트
 */
@Controller
public class CouponController {
	
	Logger logger = LoggerFactory.getLogger(CouponController.class);
	
	@Autowired
	private AdDao adDao;
	
	@Autowired
	private CouponDao couponDao;
	
	@RequestMapping(value="/coupon/list.do", method=RequestMethod.GET)
	public String coupon(Model model, HttpSession session, @RequestParam(value="category_no", defaultValue="")String category_no,
			@RequestParam(value="location_no", defaultValue="")String location_no,
			@RequestParam(value="best", defaultValue="0")String best,
			@RequestParam(value="page", defaultValue="1")String page) {
		
		int pageSize = 10;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category_no", category_no);
		map.put("location_no", location_no);
		map.put("best", best);
		map.put("page", page);
		map.put("pageSize", pageSize);
		map.put("start_no", (Integer.parseInt(page)-1) * pageSize);
		
		int totalCount = couponDao.getStoreCouponListCount(map);
		PagedList<StoreCoupon> list = new PagedList<StoreCoupon>(couponDao.getStoreCouponList(map), Integer.parseInt(page), pageSize, totalCount);

		model.addAttribute("list", list);
		model.addAttribute("map", map);
		model.addAttribute("ad", adDao.getAd(53));

		return "/coupon/list";
	}
	
	
	
	@RequestMapping(value="/json_couponbest.do", method=RequestMethod.GET)
	@ResponseBody
	public void jsonCoupon(HttpServletResponse res) throws Exception {
		
		int pageSize = 10;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category_no", "");
		map.put("location_no", "");
		map.put("best", "1");
		map.put("page", 1);
		map.put("pageSize", pageSize);
		map.put("start_no", 0);

		List<StoreCoupon> list = couponDao.getStoreCouponList(map);

		String jsonData = JSONUtil.ObjectToJSON(list);
		res.setCharacterEncoding("utf-8");
		res.getWriter().write(jsonData);
	}
}

