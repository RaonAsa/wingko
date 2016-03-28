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
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wingko.story.admin.dao.AdminNewsDao;
import com.wingko.story.domain.News;
import com.wingko.story.domain.SelectData;
import com.wingko.story.util.MultipartRequestWithSameFileTag;
import com.wingko.story.util.PagedList;
import com.wingko.story.util.TimestampFileRenamePolicy;

/**
 * Admin News Controller
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 28.
 */
@Controller
@RequestMapping(value="/admin/news")
public class AdminNewsController {
	private static Logger logger = LoggerFactory.getLogger(AdminNewsController.class);
	
	@Autowired
	private AdminNewsDao dao;
	
//	int size = 10*1024*1024;
//	String uploadTempPath = "/home/wingko/www/root/upload";	// 실섭 경로
//	String urlPath = "http://www.wingkostory.com/upload/"; // 실섭 경로
	// path를 config로 처리
	@Value("#{config['uploadTempPath']}") String uploadTempPath;
	@Value("#{config['urlPath']}") String urlPath;
	@Value("#{config['fileSize']}") Integer size;

	@RequestMapping(value="/list.do")
	public String list(Model model, News news, @RequestParam(value="chk_use", defaultValue="false")String chk_use) throws Exception {

		List<SelectData> select = dao.getNewsCategory();

		int totalCount = dao.getListCount(news);
		PagedList<News> list = null;
		list = new PagedList<News>(dao.getList(news), news.getPage(), news.getPageSize(), totalCount);

		model.addAttribute("chk_use", chk_use);
		model.addAttribute("news", news);
		model.addAttribute("select", select);
		model.addAttribute("list", list);
		model.addAttribute("leftMenu", "13");

		return "/admin/news/list";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String write(Model model, News news) throws Exception {
		if (news.getNews_no() > 0) {
			int page = news.getPage();
			model.addAttribute("org_news_category_no", news.getNews_category_no());
			news = dao.getNews(news);
			news.setPage(page);
		}
		
		List<SelectData> select = dao.getNewsCategory();
		List<SelectData> selectStore = dao.getStore();

		model.addAttribute("news", news);
		model.addAttribute("select", select);
		model.addAttribute("select_store", selectStore);
		model.addAttribute("leftMenu", "13");

		return "/admin/news/write";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String writeSubmit(HttpServletRequest req, Model model, News news) throws Exception {
		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(req, uploadTempPath+"/news", size, "UTF-8", new TimestampFileRenamePolicy());

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

			if ( req.getParameter("news_no") != null && req.getParameter("news_no").length() > 0) {
				dao.setUpdate(params);
			} else {
				dao.setInsert(params);
			}
			
			String org_news_category_no = multi.getParameter("org_news_category_no");
			if (org_news_category_no == null || "".equals(org_news_category_no)) {
				org_news_category_no = "0";
			}
			model.addAttribute("news_category_no", org_news_category_no);
			model.addAttribute("page", multi.getParameter("page"));
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return "redirect:/admin/news/list.do";
	}


	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public String delete(Model model, News news) throws Exception {

		dao.setDelete(news);
		model.addAttribute("news_category_no", news.getNews_category_no());
		model.addAttribute("page", news.getPage());
		
		return "redirect:/admin/news/list.do";
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
}

