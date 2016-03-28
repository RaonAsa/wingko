/*
 * @(#)AdminTravelController.java 2013. 8. 11.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wingko.story.admin.dao.AdminTravelDao;
import com.wingko.story.domain.Travel;
import com.wingko.story.domain.TravelInfo;
import com.wingko.story.util.MultipartRequestWithSameFileTag;
import com.wingko.story.util.PagedList;
import com.wingko.story.util.TimestampFileRenamePolicy;
 
/**
 * Admin Travel Controller
 *
 * @author  yshsy
 * @version 1.0,  2013. 8. 11.
 */
@Controller
@RequestMapping(value="/admin/travel")
public class AdminTravelController {

	Logger logger = LoggerFactory.getLogger(AdminTravelController.class);
	
	@Autowired
	private AdminTravelDao dao;
	

//	int size = 10*1024*1024;
//	String uploadTempPath = "C:/dev/springsource/sts-3.3.0.RELEASE/workspace/wingko_basic/src/main/webapp/upload";	// 집 테스트경로
//	String uploadTempPath = "D:/eclipse64/springsource/sts-3.2.0.RELEASE/workspace/wingko_basic/src/main/webapp/upload";	// 회사 테스트경로
//	String uploadTempPath = "/home/wingko/www/root/upload";	// 실섭 경로

//	String urlPath = "http://localhost:8080/upload/"; // 집 경로	
//	String urlPath = "http://218.232.117.137:8080/upload/"; // 회사 경로
//	String urlPath = "http://www.wingkostory.com/upload/"; // 실섭 경로
	// path를 config로 처리
	@Value("#{config['uploadTempPath']}") String uploadTempPath;
	@Value("#{config['urlPath']}") String urlPath;
	@Value("#{config['fileSize']}") Integer size;


	@RequestMapping("/list.do")
	public String list(Model model, Travel travel) {
		
		logger.info(travel.toString());

		int totalCount = dao.getListCount(travel);
		PagedList<Travel> list = null;
		list = new PagedList<Travel>(dao.getList(travel), travel.getPage(), travel.getPageSize(), totalCount);

		model.addAttribute("travel", travel);
		model.addAttribute("selectLocation", dao.getLocationForSelect());
		model.addAttribute("selectTravelCategory", dao.getTravelCategoryForSelect());
		model.addAttribute("list", list);
		model.addAttribute("leftMenu", "5");

		return "/admin/travel/list";
	}

	/**
	 * 여행정보 입력 폼
	 * 
	 * @param model
	 * @param store_no
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String write(Model model, Travel travel) throws Exception {
		if ( travel.getTravel_no() != null && travel.getTravel_no().length() > 0) {
			int page = travel.getPage();
			model.addAttribute("org_travel_category_no", travel.getTravel_category_no());
			model.addAttribute("org_location_no", travel.getLocation_no());
			travel = dao.getTravel(travel);
			travel.setPage(page);
		}

		model.addAttribute("travel", travel);
		model.addAttribute("selectLocation", dao.getLocationForSelect());
		model.addAttribute("selectTravelCategory", dao.getTravelCategoryForSelect());
		
		model.addAttribute("leftMenu", "5");

		return "/admin/travel/write";
	}


	/**
	 * 여행정보 등록
	 * 
	 * @param req
	 * @param store
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String insert(HttpServletRequest req, Model model) throws Exception {
		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(req, uploadTempPath+"/travel", size, "UTF-8", new TimestampFileRenamePolicy());

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

			dao.setInsert(params);
			
			model.addAttribute("travel_category_no", params.get("org_travel_category_no"));
			model.addAttribute("location_no", params.get("org_location_no"));
			model.addAttribute("page", params.get("page"));
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return "redirect:/admin/travel/list.do";
	}

	/**
	 * 여행정보 수정
	 * 
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public String update(HttpServletRequest req, Model model) throws Exception {
		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(req, uploadTempPath+"/travel", size, "UTF-8", new TimestampFileRenamePolicy());

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
			dao.setUpdate(params);
			
			model.addAttribute("travel_category_no", params.get("org_travel_category_no"));
			model.addAttribute("location_no", params.get("org_location_no"));
			model.addAttribute("page", params.get("page"));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		

		return "redirect:/admin/travel/list.do";
	}
	
	
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public String delete(Model model, Travel travel) throws Exception {

		dao.setDelete(travel);
		
		model.addAttribute("travel_category_no", travel.getTravel_category_no());
		model.addAttribute("page", travel.getPage());

		return "redirect:/admin/travel/list.do";
	}
	
	
	
	/**
	 * 에디터에서 전송하는 이미지
	 * 
	 * @param req
	 * @param res
	 */
	@RequestMapping(value="/imageupload_editor.do", method=RequestMethod.POST)
	public void imageupload_editor(HttpServletRequest req, HttpServletResponse res) {

		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(req, uploadTempPath+"/content", size, "UTF-8", new TimestampFileRenamePolicy());

			String fileName = multi.getFilesystemName("upload");
			String CKEditorFuncNum = multi.getParameter("CKEditorFuncNum");
			String langCode = multi.getParameter("langCode");
			String CKEditor = multi.getParameter("CKEditor");

			res.setCharacterEncoding("utf-8");
			res.setContentType("text/html");
			res.getWriter().write("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction('"+CKEditorFuncNum+"', '" + urlPath + "content/" +fileName + "');</script>");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}



	@RequestMapping(value="/info_list.do", method=RequestMethod.GET)
	public String travelInfoList(Model model, TravelInfo travelInfo) throws Exception {
		model.addAttribute("list", dao.travelInfoList(travelInfo));
		model.addAttribute("leftMenu", "11");
		
		return "admin/travel/info_list";
	}
	
	@RequestMapping(value="/info_write.do", method=RequestMethod.GET)
	public String travelInfoWrite(Model model, TravelInfo travelInfo) throws Exception {
		if ( travelInfo.getNo() > 0 ) {
			model.addAttribute("travelInfo", dao.travelInfo(travelInfo));
		} else {
			model.addAttribute("travelInfo", travelInfo);	
		}

		model.addAttribute("leftMenu", "11");
		
		return "admin/travel/info_write";
	}
	
	@RequestMapping(value="/info_write.do", method=RequestMethod.POST)
	public String travelInfoWriteSubmit(Model model, TravelInfo travelInfo) throws Exception {
		if ( travelInfo.getNo() > 0 ) {
			dao.updateTravelInfo(travelInfo);
		} else {
			dao.insertTravelInfo(travelInfo);
		}
		
		return "redirect:/admin/travel/info_list.do";
	}
	
	@RequestMapping(value="/info_delete.do", method=RequestMethod.GET)
	public String travelInfoDelete(Model model, TravelInfo travelInfo) throws Exception {
		dao.deleteTravelInfo(travelInfo);
		
		return "redirect:/admin/travel/info_list.do";
	}

}
