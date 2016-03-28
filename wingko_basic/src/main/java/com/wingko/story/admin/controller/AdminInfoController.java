/*
 * @(#)AdminInfoController.java  2013. 9. 26.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.controller;

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

import com.wingko.story.admin.dao.AdminInfoDao;
import com.wingko.story.domain.Info;
import com.wingko.story.util.MultipartRequestWithSameFileTag;
import com.wingko.story.util.TimestampFileRenamePolicy;

/**
 * Admin Info Controller
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 26.
 */
@Controller
@RequestMapping(value="/admin/info")
public class AdminInfoController {
	
	Logger logger = LoggerFactory.getLogger(AdminInfoController.class);
	
	@Autowired
	private AdminInfoDao dao;
	
//	int size = 10*1024*1024;
//	String uploadTempPath = "/home/wingko/www/root/upload";	// 실섭 경로
//	String urlPath = "http://www.wingkostory.com/upload/"; // 실섭 경로
	// path를 config로 처리
	@Value("#{config['uploadTempPath']}") String uploadTempPath;
	@Value("#{config['urlPath']}") String urlPath;
	@Value("#{config['fileSize']}") Integer size;

	
	
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
			e.printStackTrace();
		}
	}



	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public String infoList(Model model, Info info) throws Exception {
		model.addAttribute("list", dao.infoList(info));
		model.addAttribute("leftMenu", "15");
		
		return "admin/info/list";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String infoWrite(Model model, Info info) throws Exception {
		if ( info.getNo() > 0 ) {
			model.addAttribute("info", dao.info(info));
		} else {
			model.addAttribute("info", info);	
		}

		model.addAttribute("leftMenu", "15");
		
		return "admin/info/write";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String infoWriteSubmit(Model model, Info info) throws Exception {
		if ( info.getNo() > 0 ) {
			dao.updateInfo(info);
		} else {
			dao.insertInfo(info);
		}
		
		return "redirect:/admin/info/list.do";
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public String infoDelete(Model model, Info info) throws Exception {
		dao.deleteInfo(info);
		
		return "redirect:/admin/info/list.do";
	}
}

