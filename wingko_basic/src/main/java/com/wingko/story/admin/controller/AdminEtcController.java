/*
 * @(#)AdminCouponController.java  2013. 8. 12.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.controller;


import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wingko.story.dao.WingCalenderDao;
import com.wingko.story.dao.WingkoInfoDao;
import com.wingko.story.domain.WingCalender;
import com.wingko.story.domain.WingkoInfo;
import com.wingko.story.util.PagedList;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 12.
 */
@Controller
@RequestMapping(value="/admin/etc")
public class AdminEtcController {
	private static Logger logger = LoggerFactory.getLogger(AdminEtcController.class);
	
	
	@Autowired
	private WingCalenderDao dao_calendar;
	
	@Autowired
	private WingkoInfoDao dao_winginfo;
	
	

	@RequestMapping(value="/wing_calendar.do", method=RequestMethod.GET)
	public ModelAndView wing_calendar(WingCalender calender) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		if(calender == null){
			calender = new WingCalender();
		}
	
		int totalCount = dao_calendar.getSearchCount(calender);
		PagedList<WingCalender> list = new PagedList<WingCalender>(dao_calendar.getSearchList(calender), calender.getPage(), calender.getPageSize(), totalCount);
		
		
		mav.addObject("leftMenu", "91");
		mav.addObject("list", list);
		
		mav.setViewName("/admin/etc/wing_calendar");
		return mav;
	}
	
	@RequestMapping(value="/wing_calendar_reg.do", method=RequestMethod.GET)
	public ModelAndView wing_calendar_reg(WingCalender calender) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		if(calender != null){
			calender = dao_calendar.getData(calender.getCalender_id());
		}
		
		
		mav.addObject("leftMenu", "91");
		mav.addObject("calender", calender);
		
		mav.setViewName("/admin/etc/wing_calendar_reg");
		return mav;
	}
	
	
	@RequestMapping(value="/wing_calendar_proc.do", method=RequestMethod.POST)
	public ModelAndView wing_calendar_proc(WingCalender calender) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		calender.setWing_type("0");
		if(calender == null || calender.getCalender_id() == 0){
			dao_calendar.setInsert(calender);
		}else{
			dao_calendar.setUpdate(calender);
		}
		
		mav.setViewName("redirect:/admin/etc/wing_calendar.do");
		return mav;
	}
	
	@RequestMapping(value="/wing_calendar_del.do", method=RequestMethod.POST)
	public ModelAndView wing_calendar_del(WingCalender calender) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		if(calender != null){
			dao_calendar.setDelete(calender);
		}
		
		mav.setViewName("redirect:/admin/etc/wing_calendar.do");
		return mav;
	}
	
	
	@RequestMapping(value="/wingko_info.do", method=RequestMethod.GET)
	public ModelAndView wing_info() throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		WingkoInfo wingkoinfo = dao_winginfo.getData();
		
		
		mav.addObject("leftMenu", "92");
		mav.addObject("wingkoinfo", wingkoinfo);
		
		mav.setViewName("/admin/etc/wingko_info");
		return mav;
	}
	
	@RequestMapping(value="/wingko_info_reg.do", method=RequestMethod.GET)
	public ModelAndView wingko_info_reg(HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		WingkoInfo wingkoinfo = dao_winginfo.getData();
		
	
		mav.addObject("leftMenu", "92");
		mav.addObject("mode", request.getParameter("mode"));
		mav.addObject("wingkoinfo", wingkoinfo);
		
		mav.setViewName("/admin/etc/wingko_info_reg");
		return mav;
	}
	
	@RequestMapping(value="/wingko_info_reg.do", method=RequestMethod.POST)
	public ModelAndView wingko_info_reg(WingkoInfo wingkoinfo) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		dao_winginfo.setUpdate(wingkoinfo);
		
		mav.setViewName("redirect:/admin/etc/wingko_info.do");
		return mav;
	}
	
}

