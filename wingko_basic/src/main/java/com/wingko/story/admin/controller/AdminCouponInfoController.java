/*
 * @(#)AdminCouponController.java  2013. 8. 12.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wingko.story.admin.dao.AdminCouponDao;
import com.wingko.story.admin.dao.AdminCouponInfoDao;
import com.wingko.story.domain.Coupon;
import com.wingko.story.domain.CouponInfo;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 12.
 */
@Controller
@RequestMapping(value="/admin/couponinfo")
public class AdminCouponInfoController {
	private static Logger logger = LoggerFactory.getLogger(AdminCouponInfoController.class);
	
	@Autowired
	private AdminCouponInfoDao dao;
	
	@Autowired
	private AdminCouponDao daoCoupon;

	@RequestMapping(value="/list.do")
	public String list(Model model, CouponInfo couponinfo) throws Exception {

		List<CouponInfo> list = dao.getList(couponinfo);
		
		model.addAttribute("list", list);
		model.addAttribute("typeData", dao.getTypeSelect());
		model.addAttribute("leftMenu", "11");

		return "/admin/couponinfo/list";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String write(Model model, @RequestParam(value="idx", required=false) String idx) throws Exception {
		if ( idx != null && idx.length() > 0 ) {
			CouponInfo couponinfo = dao.getCouponInfo( Integer.parseInt(idx) );
			model.addAttribute("couponinfo", couponinfo);
		} else {
			model.addAttribute("couponinfo", new CouponInfo());
		}
		
		model.addAttribute("selectData", dao.getTypeSelect());
		model.addAttribute("leftMenu", "11");

		return "/admin/couponinfo/write";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String insert(CouponInfo couponinfo) throws Exception {
		dao.setInsert(couponinfo);
		
		return "redirect:/admin/couponinfo/list.do";
	}
	
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public String update(CouponInfo couponinfo) throws Exception {
		dao.setUpdate(couponinfo);
		
		return "redirect:/admin/couponinfo/list.do";
	}
	
	@RequestMapping(value="/couponlist.do", method=RequestMethod.GET)
	public String couponlist(Model model, @RequestParam(value="idx", required=false) String idx) throws Exception {
		
		CouponInfo couponinfo = dao.getCouponInfo( Integer.parseInt(idx) );
		List<Coupon> list = daoCoupon.getList(couponinfo);
		
		model.addAttribute("couponinfo", couponinfo);
		model.addAttribute("list", list);
		model.addAttribute("typeData", dao.getTypeSelect());
		model.addAttribute("leftMenu", "11");
		
		return "/admin/couponinfo/couponlist";
	}
}

