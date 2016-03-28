/*
 * @(#)StoreController.java 2013. 8. 6.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.controller;

import java.util.LinkedHashMap;

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
import com.wingko.story.dao.MyCartDao;
import com.wingko.story.dao.StoreDao;
import com.wingko.story.domain.Ripple;
import com.wingko.story.domain.Store;
import com.wingko.story.util.DateUtil;
import com.wingko.story.util.JSONUtil;
import com.wingko.story.util.PagedList;
 
/**
 * TODO
 *
 * @author  yshsy
 * @version 1.0,  2013. 8. 6.
 */
@Controller
public class StoreController {
	Logger logger = LoggerFactory.getLogger(StoreController.class);
	@Autowired
	private StoreDao dao;
	
	@Autowired
	private AdDao adDao;
	
	@Autowired
	private MyCartDao myCartDao; 

	@RequestMapping(value="/store/main.do", method=RequestMethod.GET)
	public String store(Model model, Store store, HttpSession session, HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value="m", required=false)String m,
			@RequestParam(value="pl", required=false)String pl,
			@RequestParam(value="t", required=false)String t) {

		if (store.getStore_no() == null || store.getStore_no().equals("")) {
			store.setStore_no("3");
		}
		
		store = dao.getStore(store);

		Ripple ripple = new Ripple(Integer.parseInt(store.getStore_no()), "store");
		model.addAttribute("rippleList", dao.getStoreRippleList(ripple));
		model.addAttribute("rippleCount", dao.getStoreRippleListCount(ripple));
		
		model.addAttribute("user_no", session.getAttribute("user_no"));
		model.addAttribute("store", store);
		model.addAttribute("storeCoupon", dao.getStoreCoupon(store));
		model.addAttribute("storeMenu", dao.getStoreMenu(store));
		
		model.addAttribute("newsList", dao.getNewsRand(store.getCategory_no()));	// 관련기사
		model.addAttribute("storeList", dao.getStoreRand(store.getLocation_no()));	// 지역 상점
		
		
		model.addAttribute("m", m);		// sub menu
		model.addAttribute("pl", pl); 	// parent_location_no
		model.addAttribute("t", t);		// sub에 탭


		
		/*
		 * 최근 본거 5개..
		 */
		Cookie[] cookies = request.getCookies();

		String pids = "store."+store.getStore_no();
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


		return "/store/main";
	}

	@RequestMapping(value="/store/review_insert.do", method=RequestMethod.POST)
	public String reviewSubmit(Ripple ripple) {
		
		if (ripple.getReply_order() == null) ripple.setReply_order("");
		String sNewReplyOrder = dao.getStoreNewReplyOrder(ripple);
		logger.debug("new reply_order : {}", sNewReplyOrder);
		ripple.setReply_order(sNewReplyOrder);
		dao.setStoreRippleInsert(ripple);
		return "redirect:/store/main.do?store_no="+ripple.getParent_no()+"#store_review";
	}
	
	@RequestMapping(value="/store/review_delete.do", method=RequestMethod.GET)
	public String reviewDelete(Ripple ripple, HttpSession session) {
		ripple.setUser_no((Integer) session.getAttribute("user_no"));
		dao.setStoreRippleDelete(ripple);
		return "redirect:/store/main.do?store_no="+ripple.getParent_no()+"#store_review";
	}
	
	@RequestMapping(value="/sub/shopping.do", method=RequestMethod.GET)
	public String shopping(Store store, Model model, @RequestParam(value="t", required=false)String t) {
		
		if ( store.getLocation_no() == null || store.getLocation_no().equals("") ) {
			store.setLocation_no("12");
		}
		if ( store.getCategory_no() == null || store.getCategory_no().equals("") ) {
			store.setCategory_no("15");
		}
		if ( store.getSub_category_no() == null || store.getSub_category_no().equals("") ) {
			store.setSub_category_no("35");
		}

//		int totalCount = dao.getStoreListCount(store);
//		PagedList<Store> list = new PagedList<Store>(dao.getStoreList(store), store.getPage(), store.getPageSize(), totalCount);
//
//		model.addAttribute("list", list);
		model.addAttribute("t", t);
		model.addAttribute("store", store);
		model.addAttribute("categoryLocation", dao.getCategoryLocationInfo("8", store.getLocation_no()));
		model.addAttribute("ad", adDao.getAd(52));

		return "/sub/shopping";
	}
	
	@RequestMapping(value="/sub/lodging.do", method=RequestMethod.GET)
	public String lodging(Store store, Model model, @RequestParam(value="t", required=false)String t) {
		
		if ( store.getLocation_no() == null || store.getLocation_no().equals("") ) {
			store.setLocation_no("12");
		}
		
		model.addAttribute("t", t);
		model.addAttribute("store", store);
		model.addAttribute("categoryLocation", dao.getCategoryLocationInfo("9", store.getLocation_no()));
		model.addAttribute("ad", adDao.getAd(63));

		return "/sub/lodging";
	}
	
	@RequestMapping(value="/sub/gourmet.do", method=RequestMethod.GET)
	public String gourmet(Store store, Model model, @RequestParam(value="t", required=false)String t) {
		
		if ( store.getLocation_no() == null || store.getLocation_no().equals("") ) {
			store.setLocation_no("12");
		}
		
		model.addAttribute("t", t);
		model.addAttribute("store", store);
		model.addAttribute("categoryLocation", dao.getCategoryLocationInfo("10", store.getLocation_no()));
		model.addAttribute("ad", adDao.getAd(64));

		return "/sub/gourmet";
	}

	@RequestMapping(value="/sub/beauty.do", method=RequestMethod.GET)
	public String beauty(Store store, Model model, @RequestParam(value="t", required=false)String t) {
		
		if ( store.getLocation_no() == null || store.getLocation_no().equals("") ) {
			store.setLocation_no("12");
		}
		
		model.addAttribute("t", t);
		model.addAttribute("store", store);
		model.addAttribute("categoryLocation", dao.getCategoryLocationInfo("11", store.getLocation_no()));
		model.addAttribute("ad", adDao.getAd(65));

		return "/sub/beauty";
	}
	
	@RequestMapping(value="/sub/medical.do", method=RequestMethod.GET)
	public String medical(Store store, Model model, @RequestParam(value="t", required=false)String t) {
		
		if ( store.getLocation_no() == null || store.getLocation_no().equals("") ) {
			store.setLocation_no("12");
		}
		
		model.addAttribute("t", t);
		model.addAttribute("store", store);
		model.addAttribute("categoryLocation", dao.getCategoryLocationInfo("12", store.getLocation_no()));
		model.addAttribute("ad", adDao.getAd(66));

		return "/sub/medical";
	}
	@RequestMapping(value="/sub/culture.do", method=RequestMethod.GET)
	public String culture(Store store, Model model, @RequestParam(value="t", required=false)String t) {
		
		if ( store.getLocation_no() == null || store.getLocation_no().equals("") ) {
			store.setLocation_no("12");
		}

		model.addAttribute("t", t);
		model.addAttribute("store", store);
		model.addAttribute("categoryLocation", dao.getCategoryLocationInfo("13", store.getLocation_no()));
		model.addAttribute("ad", adDao.getAd(67));

		return "/sub/culture";
	}
	
	@RequestMapping(value="/sub/get_sub.do", method=RequestMethod.GET)
	public void jsonSubList(HttpServletResponse res, Store store) {

		int totalCount = dao.getStoreListCount(store);
		PagedList<Store> list = new PagedList<Store>(dao.getStoreList(store), store.getPage(), store.getPageSize(), totalCount);

		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("page", list.getPage());
		map.put("pageSize", list.getPageSize());
		map.put("currentBlock", list.getCurrentBlock());
		map.put("totalPage", list.getTotalPage());
		map.put("totalBlock", list.getTotalBlock());
		map.put("startPageNum", list.getStartPageNum());
		map.put("endPageNum", list.getEndPageNum());
		map.put("list", list);

		try {
			res.setCharacterEncoding("UTF-8");
			res.getWriter().write(JSONUtil.ObjectToJSON(map));
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping(value="/store/addcart.do")
	@ResponseBody
	public void location(HttpServletResponse res, HttpSession session, @RequestParam(value="menu_no", required=true) int menu_no) throws Exception {
		int user_no = (Integer) session.getAttribute("user_no");
		int result = -1;
		result = myCartDao.setAddMyCart(user_no, menu_no, 1);

		res.setCharacterEncoding("utf-8");
		res.getWriter().write(result);
	}
}
