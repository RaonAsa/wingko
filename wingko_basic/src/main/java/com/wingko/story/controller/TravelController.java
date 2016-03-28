/*
 * @(#)TravelController.java  2013. 8. 15.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.controller;

import java.util.LinkedHashMap;

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

import com.wingko.story.dao.LocationDao;
import com.wingko.story.dao.StoreDao;
import com.wingko.story.dao.TravelDao;
import com.wingko.story.domain.Ripple;
import com.wingko.story.domain.Travel;
import com.wingko.story.domain.TravelInfo;
import com.wingko.story.util.JSONUtil;
import com.wingko.story.util.PagedList;

/**
 * 여행 Controller
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 15.
 */
@Controller
@RequestMapping("/travel")
public class TravelController {
	private Logger logger = LoggerFactory.getLogger(TravelController.class);
	@Autowired
	private TravelDao dao;
	@Autowired
	private StoreDao storeDao;
	@Autowired
	private LocationDao locationDao;
	
	
	@RequestMapping("/info.do")
	public String travelInfo(Model model, 
			@RequestParam(value="menu", defaultValue="info")String menu, @RequestParam(value="no", defaultValue="1")int no) {
		TravelInfo travelInfo = new TravelInfo();
		travelInfo.setNo(no);
		travelInfo.setMenu(menu);

		model.addAttribute("travelInfo", dao.travelInfo(travelInfo));
		model.addAttribute("menu", menu);
		model.addAttribute("no", no);
		
		return "/travel/info";
	}


	@RequestMapping("/list_location.do")
	public String travelListLocation(Model model,
			@RequestParam(value="travel_category_no", defaultValue="6")String travel_category_no,
			@RequestParam(value="travel_category_no2", defaultValue="7")String travel_category_no2,
			@RequestParam(value="page", defaultValue="1")int page,
			@RequestParam(value="page2", defaultValue="1")int page2,
			@RequestParam(value="location_no", defaultValue="12")String location_no,
			@RequestParam(value="no", defaultValue="16")int no) {
		if (no == 0) {
			no = 16;
		}

		TravelInfo travelInfo = new TravelInfo();
		travelInfo.setNo(no);
		travelInfo.setMenu("location");
		
		if ("17".equals(location_no)) {
			TravelInfo temp = new TravelInfo();
			temp.setNo(23);
			temp.setMenu("travel");
			model.addAttribute("mapInfo", dao.travelInfo(temp));
		}
		
		// 상단 게시물 // travel_category_no: 6, 5
		Travel travel1 = new Travel();
		travel1.setSort("travel_no");
		travel1.setPage(page);
		travel1.setPageSize(15);
		travel1.setTravel_category_no(travel_category_no);
		travel1.setLocation_no(location_no);

		int totalCount = dao.travelListCount(travel1);
		PagedList<Travel> list = new PagedList<Travel>(dao.travelList(travel1), travel1.getPage(), travel1.getPageSize(), totalCount, 5);

		model.addAttribute("travel_category_no", travel1.getTravel_category_no());
		model.addAttribute("list", list);
		
		// 하단 게시물 // travel_category_no: 7, 8
		Travel travel2 = new Travel();
		travel2.setSort("travel_no");
		travel2.setPage(page2);
		travel2.setPageSize(15);
		travel2.setTravel_category_no(travel_category_no2);
		travel2.setLocation_no(location_no);

		totalCount = dao.travelListCount(travel2);
		PagedList<Travel> subList = new PagedList<Travel>(dao.travelList(travel2), travel2.getPage(), travel2.getPageSize(), totalCount, 5);

		model.addAttribute("travel_category_no2", travel2.getTravel_category_no());
		model.addAttribute("subList", subList);
		

		model.addAttribute("travelInfo", dao.travelInfo(travelInfo));
		model.addAttribute("location_no", location_no);
		model.addAttribute("no", no);
		model.addAttribute("headerInfo", locationDao.headerInfo(location_no));

		return "/travel/list_location";
	}


	@RequestMapping("/list.do")
	public String travelList(Model model, Travel travel,
			@RequestParam(value="travel_category_no", defaultValue="9")String travel_category_no,
			@RequestParam(value="sort", defaultValue="ripple_count")String sort) {
		travel.setTravel_category_no(travel_category_no);
		travel.setSort(sort);
		travel.setPageSize(15);

		int totalCount = dao.travelListCount(travel);
		PagedList<Travel> list = null;
		list = new PagedList<Travel>(dao.travelList(travel), travel.getPage(), travel.getPageSize(), totalCount, 5);

		model.addAttribute("list",  list);
		model.addAttribute("travel",  travel);
		model.addAttribute("travel_category_no", travel_category_no);
		model.addAttribute("sort", sort);
		
		return "/travel/list";
	}
	
	@RequestMapping("/view.do")
	public String travelView(Model model, Travel travel,
			@RequestParam(value="travel_category_no", defaultValue="5")String travel_category_no,
			@RequestParam(value="sort", defaultValue="ripple_count")String sort,
			@RequestParam(value="travel_no", required=true)String travel_no,
			@RequestParam(value="page", defaultValue="1")String page,
			@RequestParam(value="location_no", required=false)String location_no,
			@RequestParam(value="no", required=false)String no) {
		travel.setTravel_category_no(travel_category_no);
		travel.setSort(sort);
		travel.setTravel_no(travel_no);
		travel.setLocation_no(location_no);
		
		
		travel = dao.travel(travel);
		
		Ripple ripple = new Ripple(Integer.parseInt(travel.getTravel_no()), "travel");
		model.addAttribute("rippleList", storeDao.getStoreRippleList(ripple));
		model.addAttribute("rippleCount", storeDao.getStoreRippleListCount(ripple));

		model.addAttribute("travel",  travel);
		model.addAttribute("travel_category_no", travel.getTravel_category_no());
		model.addAttribute("sort", travel.getSort());
		model.addAttribute("page", travel.getPage());
		model.addAttribute("location_no", travel.getLocation_no());
		model.addAttribute("no", no);
		
		return "/travel/view";
	}

	@RequestMapping(value="/review_insert.do", method=RequestMethod.POST)
	public String reviewSubmit(Ripple ripple, @RequestParam("travel_category_no")String travel_category_no, 
			@RequestParam("sort")String sort ) {

		if (ripple.getReply_order() == null) ripple.setReply_order("");
		String sNewReplyOrder = storeDao.getStoreNewReplyOrder(ripple);
		logger.debug("new reply_order : {}", sNewReplyOrder);
		ripple.setReply_order(sNewReplyOrder);
		dao.tarvelRippleCountPlus(ripple.getParent_no());
		storeDao.setStoreRippleInsert(ripple);
		return "redirect:/travel/view.do?travel_category_no="+travel_category_no+"&sort="+sort+"&travel_no="+ripple.getParent_no();
	}
	
	@RequestMapping(value="/review_delete.do", method=RequestMethod.GET)
	public String reviewDelete(Ripple ripple, HttpSession session, @RequestParam("travel_category_no")String travel_category_no, 
			@RequestParam("sort")String sort ) {
		dao.tarvelRippleCountMinus(ripple.getParent_no());
		ripple.setUser_no((Integer) session.getAttribute("user_no"));
		storeDao.setStoreRippleDelete(ripple);
		return "redirect:/travel/view.do?travel_category_no="+travel_category_no+"&sort="+sort+"&travel_no="+ripple.getParent_no();
	}


	@RequestMapping(value="/travel_list.do", method=RequestMethod.GET)
	public void jsonTravelList(HttpServletResponse res, Travel travel) {
		int totalCount = 0;
		travel.setSort("travel_no");
		travel.setPageSize(15);
		totalCount = dao.travelListCount(travel);
		PagedList<Travel> list = new PagedList<Travel>(dao.travelList(travel), travel.getPage(), travel.getPageSize(), totalCount, 5);
		
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("page", list.getPage());
		map.put("pageSize", list.getPageSize());
		map.put("currentBlock", list.getCurrentBlock());
		map.put("totalPage", list.getTotalPage());
		map.put("totalBlock", list.getTotalBlock());
		map.put("startPageNum", list.getStartPageNum());
		map.put("endPageNum", list.getEndPageNum());
		map.put("travel_category_no", travel.getTravel_category_no());
		map.put("list", list);

		try {
			res.setCharacterEncoding("UTF-8");
			res.getWriter().write(JSONUtil.ObjectToJSON(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		/*model.addAttribute("list",  list);
		model.addAttribute("travel",  travel);
		model.addAttribute("travel_category_no", travel_category_no);
		model.addAttribute("sort", sort);*/
	}
	
	
	@RequestMapping(value="/list_location_iframe.do", method=RequestMethod.GET)
	public String iFrameTravelList(Model model, Travel travel) {
		travel.setSort("travel_no");
		travel.setPageSize(15);

		int totalCount = dao.travelListCount(travel);
		PagedList<Travel> list = new PagedList<Travel>(dao.travelList(travel), travel.getPage(), travel.getPageSize(), totalCount, 5);

		model.addAttribute("travel_category_no", travel.getTravel_category_no());
		model.addAttribute("location_no", travel.getLocation_no());
		model.addAttribute("list", list);

		return "/travel/list_location_iframe";
	}
}

