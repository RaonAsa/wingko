/*
 * @(#)AdminADController.java  2013. 8. 28.
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

import com.wingko.story.admin.dao.AdminAdDao;
import com.wingko.story.domain.AdData;
import com.wingko.story.domain.SelectData;
import com.wingko.story.domain.TopWord;
import com.wingko.story.util.MultipartRequestWithSameFileTag;
import com.wingko.story.util.PagedList;
import com.wingko.story.util.TimestampFileRenamePolicy;

/**
 * (관리자) 광고 관리 Controller
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 28.
 */
@Controller
@RequestMapping(value="/admin/ad")
public class AdminAdController {
	private static Logger logger = LoggerFactory.getLogger(AdminAdController.class);
	
	@Autowired
	private AdminAdDao dao;
	
//	int size = 10*1024*1024;
//	String uploadTempPath = "/home/wingko/www/root/upload";	// 실섭 경로
//	String urlPath = "http://www.wingkostory.com/upload/"; // 실섭 경로
//	String uploadTempPath = "D:/eclipse64/springsource/sts-3.2.0.RELEASE/workspace/wingko_basic/src/main/webapp/upload";	// 회사 테스트경로
//	String urlPath = "http://218.232.117.137:8080/upload/"; // 회사 경로	
	// path를 config로 처리
	@Value("#{config['uploadTempPath']}") String uploadTempPath;
	@Value("#{config['urlPath']}") String urlPath;
	@Value("#{config['fileSize']}") Integer size;

	@RequestMapping(value="/list.do")
	public String list(Model model, AdData adData, @RequestParam(value="chk_use", defaultValue="false")String chk_use) throws Exception {
		
		if (adData.getAd_no() == 0) {
			adData.setAd_no(1);
		}
		if ("true".equals(chk_use)) {
			adData.setUse_flag("Y");
		}
		
		List<SelectData> select = dao.getAdManage();

		int totalCount = dao.getListCount(adData);
		PagedList<AdData> list = null;
		list = new PagedList<AdData>(dao.getList(adData), adData.getPage(), adData.getPageSize(), totalCount);

		model.addAttribute("chk_use", chk_use);
		model.addAttribute("adData", adData);
		model.addAttribute("select", select);
		model.addAttribute("list", list);
		model.addAttribute("leftMenu", "12");

		return "/admin/ad/list";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String write(Model model, AdData adData) throws Exception {
		if (adData.getNo() > 0) {
			int page = adData.getPage();
			adData = dao.getAdData(adData);
			adData.setPage(page);
		}
		
		List<SelectData> select = dao.getAdManage();

		model.addAttribute("adData", adData);
		model.addAttribute("select", select);
		model.addAttribute("leftMenu", "12");

		return "/admin/ad/write";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String writeSubmit(HttpServletRequest req, Model model, AdData adData) throws Exception {
		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(req, uploadTempPath+"/ad", size, "UTF-8", new TimestampFileRenamePolicy());

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

			if ( req.getParameter("no") != null && req.getParameter("no").length() > 0) {
				dao.setUpdate(params);
			} else {
				dao.setInsert(params);
			}
			
			model.addAttribute("ad_no", params.get("ad_no"));
			model.addAttribute("page", params.get("page"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/ad/list.do";
	}
	
	
	@RequestMapping("/word_list.do")
	public String wordList(Model model) {
		
		model.addAttribute("list", dao.getWordList());
		model.addAttribute("leftMenu", "14");
		
		return "/admin/ad/word_list";
	}
	
	@RequestMapping("/word_update.do")
	public String wordUpdate(Model model, TopWord topWord) {
		
		dao.setWordUpdate(topWord);
		
		return "redirect:/admin/ad/word_list.do";
	}

}

