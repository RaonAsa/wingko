/*
 * @(#)AdminLocationController.java 2013. 7. 20.
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
import org.springframework.web.bind.annotation.RequestParam;

import com.wingko.story.admin.dao.AdminLocationDao;
import com.wingko.story.domain.HotPlace;
import com.wingko.story.domain.Location;
import com.wingko.story.domain.SelectData;
import com.wingko.story.util.MultipartRequestWithSameFileTag;
import com.wingko.story.util.TimestampFileRenamePolicy;
 
/**
 * Admin Location Controller
 *
 * @author  yshsy
 * @version 1.0,  2013. 7. 20.
 */
@Controller
@RequestMapping(value="/admin/location")
public class AdminLocationController {
	
	private static Logger logger = LoggerFactory.getLogger(AdminLocationController.class);
	
	@Autowired
	private AdminLocationDao dao;
	
//	int size = 10*1024*1024;
//	String uploadTempPath = "/home/wingko/www/root/upload";	// 실섭 경로
//	String urlPath = "http://www.wingkostory.com/upload/"; // 실섭 경로
//	String uploadTempPath = "/Users/baesunghan/Documents/workspace-sts/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/wingko_basic/upload";	// 회사 테스트경로
//	String urlPath = "http://localhost:8080/upload/"; // 회사 경로
	// path를 config로 처리
	@Value("#{config['uploadTempPath']}") String uploadTempPath;
	@Value("#{config['urlPath']}") String urlPath;
	@Value("#{config['fileSize']}") Integer size;
	
	@RequestMapping(value="/list.do")
	public String list(Model model, Location location) throws Exception {

		List<SelectData> select = dao.getLocationForSelect();
		List<Location> list = dao.getList(location);

		model.addAttribute("location", location);
		model.addAttribute("select", select);
		model.addAttribute("list", list);
		model.addAttribute("leftMenu", "8");

		return "/admin/location/list";
	}
	
	
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String write(Model model, @RequestParam(value="location_no", required=false) String location_no, @RequestParam(value="org_location_no", defaultValue="") String org_location_no) throws Exception {
		if ( location_no != null && location_no.length() > 0) {
			Location location = dao.getLocation(location_no);
			
			model.addAttribute("location", location);
			logger.info("location ::: " + location.toString());
		} else {
			model.addAttribute("location", new Location());
		}

		List<SelectData> list = dao.getLocationForSelect();
		
		model.addAttribute("org_location_no", org_location_no);
		model.addAttribute("selectData", list);
		model.addAttribute("leftMenu", "8");


		return "/admin/location/write";
	}


	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String insert(Model model, HttpServletRequest req, Location location) throws Exception {
		
		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(req, uploadTempPath + "/location", size, "UTF-8", new TimestampFileRenamePolicy());

			HashMap<String, String> params = new HashMap<String, String>();
			Enumeration<?> enumeration = multi.getParameterNames();
			while (enumeration.hasMoreElements()) {
				String string = (String) enumeration.nextElement();
				params.put(string, multi.getParameter(string));
			}
			Set<String> set = multi.getFileNames();
			for (String string : set) {
				params.put(string, multi.getFilesystemName(string));
			}
			
			String depth = dao.getDepthForInsert(params.get("parent_location_no"));
			if (depth == null) depth = "1";
			params.put("depth", depth);

			dao.setInsert(params);
			
			model.addAttribute("location_no", params.get("org_location_no"));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return "redirect:/admin/location/list.do";
	}


	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public String update(Model model, HttpServletRequest req, Location location) throws Exception {
		
		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(req, uploadTempPath + "/location", size, "UTF-8", new TimestampFileRenamePolicy());

			HashMap<String, String> params = new HashMap<String, String>();
			Enumeration<?> enumeration = multi.getParameterNames();
			while (enumeration.hasMoreElements()) {
				String string = (String) enumeration.nextElement();
				params.put(string, multi.getParameter(string));
			}
			Set<String> set = multi.getFileNames();
			for (String string : set) {
				params.put(string, multi.getFilesystemName(string));
			}
			
			String depth = dao.getDepthForInsert(params.get("parent_location_no"));
			if (depth == null) depth = "1";
			params.put("depth", depth);

			dao.setUpdate(params);
			
			model.addAttribute("location_no", params.get("org_location_no"));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return "redirect:/admin/location/list.do";
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public String delete(Model model, @RequestParam("location_no") String location_no, @RequestParam(value="org_location_no", defaultValue="") String org_location_no) throws Exception {

		dao.setDelete(location_no);
		
		model.addAttribute("location_no", org_location_no);

		return "redirect:/admin/location/list.do";
	}
	
	
	@RequestMapping(value="/hotplace.do", method=RequestMethod.GET)
	public String hotplace(Model model, HotPlace hotPlace) throws Exception {
		
		model.addAttribute("list", dao.getHotPlaceList(hotPlace));
		model.addAttribute("hotPlace", hotPlace);
		model.addAttribute("leftMenu", "6");
		
		logger.info(hotPlace.toString());

		return "/admin/location/hotplace";
	}
	
	@RequestMapping(value="/hotplace_write.do", method=RequestMethod.GET)
	public String hotplaceWrite(Model model, HotPlace hotPlace) throws Exception {
		
		logger.info(hotPlace.toString());

		model.addAttribute("hotPlace", hotPlace);
		model.addAttribute("leftMenu", "6");
		model.addAttribute("selectData", dao.getLocationForHotPlaceInsert(hotPlace.getParent_location_no()));

		return "/admin/location/hotplace_write";
	}
	
	@RequestMapping(value="/hotplace_write.do", method=RequestMethod.POST)
	public String hotplaceWriteSubmit(Model model, HotPlace hotPlace) throws Exception {
		
		dao.setHotPlaceInsert(hotPlace);

		model.addAttribute("parent_location_no", hotPlace.getParent_location_no());

		return "redirect:/admin/location/hotplace.do";
	}
	
	@RequestMapping(value="/hotplace_update.do", method=RequestMethod.POST)
	public String hotplaceUpdateSubmit(Model model, HotPlace hotPlace) throws Exception {
		
		int result = -1;
		
		if (hotPlace.getOrg_sort() < hotPlace.getSort()) {
			// 순서가 커졌을 경우 ex)1 -> 2
			result = dao.setHotPlaceUpdateMinus(hotPlace);
			
		} else if (hotPlace.getOrg_sort() > hotPlace.getSort()) {
			// 순서가 작아졌을 경우 ex)2 -> 1
			result = dao.setHotPlaceUpdatePlus(hotPlace);
		}
		
		if (result > 0) {
			dao.setHotPlaceUpdate(hotPlace);
		}

		model.addAttribute("parent_location_no", hotPlace.getParent_location_no());

		return "redirect:/admin/location/hotplace.do";
	}
	
	@RequestMapping(value="/hotplace_delete.do", method=RequestMethod.GET)
	public String hotplaceDelete(Model model, HotPlace hotPlace) throws Exception {
		
		int result = -1;
		hotPlace.setSort(99999999);
		result = dao.setHotPlaceUpdateMinus(hotPlace);
		
		if (result > 0) {
			dao.setHotPlaceDelete(hotPlace);
		}

		model.addAttribute("parent_location_no", hotPlace.getParent_location_no());

		return "redirect:/admin/location/hotplace.do";
	}

}
