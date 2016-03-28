/*
 * @(#)AdminCouponController.java  2013. 8. 12.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.controller;


import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wingko.story.admin.dao.DealEmsDao;
import com.wingko.story.admin.dao.DealItemDao;
import com.wingko.story.admin.dao.DealMainDao;
import com.wingko.story.domain.DealEms;
import com.wingko.story.domain.DealItem;
import com.wingko.story.domain.DealMain;
import com.wingko.story.util.MultipartRequestWithSameFileTag;
import com.wingko.story.util.PagedList;
import com.wingko.story.util.TimestampFileRenamePolicy;

/**
 * Deal Controller
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 12.
 */
@Controller
@RequestMapping(value="/admin/deal")
public class AdminDealController {
	private static Logger logger = LoggerFactory.getLogger(AdminDealController.class);
	
//	public static int POST_MAX_SIZE = 10*1024*1024;
//	String uploadTempPath = "/home/wingko/www/root/upload/deal";	// 실섭 경로
	//String uploadTempPath = "D:/work_sts/wingko_basic/src/main/webapp/upload/deal";	// Test
	// path를 config로 처리
	@Value("#{config['uploadTempPath']}") String uploadTempPath;
	@Value("#{config['urlPath']}") String urlPath;
	@Value("#{config['fileSize']}") Integer size;
	
	
	
	@Autowired
	private DealMainDao dao_dealmain;
	@Autowired
	private DealItemDao dao_dealitem;
	@Autowired
	private DealEmsDao dao_dealems;
	

	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String main(Model model, DealMain search_dealmain) throws Exception {
		
		int totalCount = dao_dealmain.getSearchCount(search_dealmain);
		PagedList<DealMain> list = new PagedList<DealMain>(dao_dealmain.getSearchAll(search_dealmain), search_dealmain.getPage(), search_dealmain.getPageSize(), totalCount);
		
		model.addAttribute("leftMenu", "19");
		
		model.addAttribute("search_dealmain", search_dealmain);
		model.addAttribute("list", list);
		
		return "/admin/deal/deal_main";
	}
	
	
	@RequestMapping(value="/deal_reg.do", method=RequestMethod.GET)
	public String deal_reg(Model model, DealMain search_deal) throws Exception {
		
		
		List<DealItem> list_item = null;
		
		DealMain dealmain = dao_dealmain.getData(search_deal.getDeal_id());
		if(dealmain != null){
			list_item = dao_dealitem.getDealList(dealmain.getDeal_id());
			dealmain.setPage(search_deal.getPage());
		}else{
			dealmain = null;
		}
		
		model.addAttribute("leftMenu", "19");
		model.addAttribute("dealmain", dealmain);
		model.addAttribute("list_item", list_item);
		
		return "/admin/deal/deal_reg";
	}
	
	
	@RequestMapping(value="/dealmain_reg.do", method=RequestMethod.POST)
	public String dealmain_reg(HttpServletRequest request) throws Exception {
		String str_page = null;
		
		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(request, uploadTempPath + "/deal", size, "UTF-8", new TimestampFileRenamePolicy());

			HashMap<String, String> params = new HashMap<String, String>();
			
			Enumeration enumeration = multi.getParameterNames();
			while (enumeration.hasMoreElements()) {
				String string = (String) enumeration.nextElement();
				params.put(string, multi.getParameter(string));
			}
			
			Set<String> set = multi.getFileNames();
			for (String string : set) {
				params.put(string, multi.getFilesystemName(string));
			}
			
			
			int deal_id = 0;
			String str_deal_id = multi.getParameter("deal_id");
			str_page = multi.getParameter("page");
			
			if(str_deal_id == null || str_deal_id.equals("")){
				
				dao_dealmain.setInsert(params);
				DealMain dealmain = dao_dealmain.getTopData();
				deal_id = dealmain.getDeal_id();
				
			}else{
				
				dao_dealmain.setUpdate(params);
				deal_id = Integer.parseInt( str_deal_id );
				
			}
			
			
			String[] arr_item_id = multi.getParameterValues("item_id");
			String[] arr_item_name = multi.getParameterValues("item_name");
			String[] arr_price_ko = multi.getParameterValues("price_ko");
			String[] arr_price_cn = multi.getParameterValues("price_cn");
			
			if(arr_item_id != null){
				for(int i=0; i<arr_item_id.length; ++i){
					
					int item_id = Integer.parseInt( arr_item_id[i] );
					
					DealItem dealitem = new DealItem();
					dealitem.setDeal_id( deal_id );
					dealitem.setItem_id( item_id );
					dealitem.setItem_name(arr_item_name[i]);
					dealitem.setPrice_ko( Integer.parseInt( arr_price_ko[i] ) );
					dealitem.setPrice_cn( Integer.parseInt( arr_price_cn[i] ) );
					
					if(item_id > 0){
						dao_dealitem.setUpdate(dealitem);
					}else{
						dao_dealitem.setInsert(dealitem);
					}
				}
			}
			
			
			// remove deal_item
			String[] del_item_id = multi.getParameterValues("del_item_id");
			if(del_item_id != null){
				for(int i=0; i<del_item_id.length; ++i){
					int item_id = Integer.parseInt(del_item_id[i]);
					dao_dealitem.setDelete(item_id);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(str_page == null){
			return "redirect:/admin/deal/main.do";
		}else{
			return "redirect:/admin/deal/main.do?page=" + str_page;
		}

	}
	
	@RequestMapping(value="/dealmain_del.do", method=RequestMethod.POST)
	public String dealmain_del(HttpServletRequest request) throws Exception {
		
		String deal_id = request.getParameter("deal_id");
		
		if(deal_id != null){
			DealMain dealmain = new DealMain();
			dealmain.setDeal_id( Integer.parseInt(deal_id));
			dao_dealmain.setDelete(dealmain);
		}
		
		return "redirect:/admin/deal/main.do";
	}
	
	@RequestMapping(value="/ems_view.do", method=RequestMethod.GET)
	public String ems_view(Model model) throws Exception {
		
		
		List<DealEms> list = dao_dealems.getListAll();
		
		model.addAttribute("leftMenu", "19");
		model.addAttribute("list", list);
		
		
		return "/admin/deal/ems_view";
	}
	
	@RequestMapping(value="/ems_reg.do", method=RequestMethod.POST)
	public String ems_reg(DealEms dealems) throws Exception {
		
		if(dealems.getEms_id() > 0){
			dao_dealems.setUpdate(dealems);
		}else{
			dao_dealems.setInsert(dealems);
		}
		

		return "redirect:/admin/deal/ems_view.do";
	}
	
	
}

