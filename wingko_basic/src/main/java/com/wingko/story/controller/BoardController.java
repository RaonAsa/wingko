/*
 * @(#)BoardController.java 2013. 8. 3.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.controller;

import java.util.Enumeration;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wingko.story.domain.Board;
import com.wingko.story.service.BoardService;
import com.wingko.story.util.MultipartRequestWithSameFileTag;
import com.wingko.story.util.PagedList;
 
/**
 * Board Controller
 *
 * @author  yshsy
 * @version 1.0,  2013. 8. 3.
 */
@Controller
public class BoardController {
	private Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	
	private String[] boards = {"blog", "marketplace", "jobinfo", "question"};

	// path를 config로 처리
	@Value("#{config['uploadTempPath']}") String uploadTempPath;
	@Value("#{config['urlPath']}") String urlPath;
	@Value("#{config['fileSize']}") Integer size;

	@RequestMapping(value="/{board_name}/list.do")
	public String board(Model model, Board board, @PathVariable String board_name) {
		if ( board_name == null || "".equals(board_name) ) {
			return "";
		} else {
			board.setBoard_category_no(board_name);
		}

		int totalCount = service.getListCount(board);
		PagedList<Board> list = null;
		list = new PagedList<Board>(service.getList(board), board.getPage(), board.getPageSize(), totalCount);

		model.addAttribute("board", board);
		model.addAttribute("list",  list);

		return "/board/list";
	}
	
	
	@RequestMapping(value="/{board_name}/write.do", method=RequestMethod.GET)
	public String write(Model model, Board board, @PathVariable String board_name) {
		if ( board_name == null || "".equals(board_name) ) {
			return "";
		} else {
			board.setBoard_category_no(board_name);
		}
		
		String type = "write";
		if (board.getNo() > 0) {
			board = service.getBoard(board);
			type = "update";
		}

		board.setUser_no(6);
		model.addAttribute("type", type);
		model.addAttribute("board", board);
		model.addAttribute("board_name", board_name);

		return "/board/write";
	}

	@RequestMapping(value="/{board_name}/write.do", method=RequestMethod.POST)
	public String writeSubmit(Model model, Board board, @PathVariable String board_name) {
		if ( board_name == null || "".equals(board_name) ) {
			return "";
		} else {
			board.setBoard_category_no(board_name);
		}

		service.setInsert(board);

		return "redirect:/"+board_name+"/list.do";
	}
	
	@RequestMapping(value="/{board_name}/update.do", method=RequestMethod.GET)
	public String update(Model model, Board board, @PathVariable String board_name) {
		if ( board_name == null || "".equals(board_name) ) {
			return "";
		} else {
			board.setBoard_category_no(board_name);
		}

		board = service.getBoard(board);

		board.setUser_no(6);
		model.addAttribute("board", board);

		return "/board/update";
	}

	@RequestMapping(value="/{board_name}/update.do", method=RequestMethod.POST)
	public String updateSubmit(Model model, Board board, @PathVariable String board_name) {
		if ( board_name == null || "".equals(board_name) ) {
			return "";
		} else {
			board.setBoard_category_no(board_name);
		}

		service.setUpdate(board);

		return "redirect:/"+board_name+"/list.do";
	}
	
	@RequestMapping(value="/{board_name}/view.do", method=RequestMethod.GET)
	public String view(Model model, Board board, @PathVariable String board_name) {
		if ( board_name == null || "".equals(board_name) ) {
			return "";
		} else {
			board.setBoard_category_no(board_name);
		}
		
		service.setUpdateHitCount(board);

		board = service.getBoard(board);

		model.addAttribute("board", board);

		return "/board/view";
	}
	
	@RequestMapping(value="/{board_name}/delete.do", method=RequestMethod.GET)
	public String delete(Model model, Board board, @PathVariable String board_name) {
		if ( board_name == null || "".equals(board_name) ) {
			return "";
		} else {
			board.setBoard_category_no(board_name);
		}

		board.setUser_no(6);
		service.setDelete(board);

		model.addAttribute("board", board);

		return "redirect:/"+board_name+"/list.do";
	}
	
	
	@RequestMapping(value="/{board_name}/imageupload.do", method=RequestMethod.POST)
	public void imageUpload(HttpServletRequest req, HttpServletResponse res) {
//		int size = 10*1024*1024;
//		String uploadTempPath = "C:/dev/springsource/sts-3.3.0.RELEASE/workspace/wingko_basic/src/main/webapp/upload";	// 집 테스트경로
//		String uploadTempPath = "D:/eclipse64/springsource/sts-3.2.0.RELEASE/workspace/wingko_basic/src/main/webapp/upload";	// 회사 테스트경로
//		String uploadTempPath = "/home/hosting_users/yshu0307/www/upload";	// 테섭 경로

//		String urlPath = "\"http://yshsy.com/upload/"; // 테섭 경로
		String urlPath = "http://218.232.117.137:8080/upload/"; // 회사 경로	

		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(req, uploadTempPath, size, "UTF-8", null);

			//File imgFile = multi.getFile("coupon_image");

			String fileName = "";

			Set<String> set = multi.getFileNames();
			//Iterator<String> iterator = set.iterator();
			for (String string : set) {
				fileName = multi.getFilesystemName(string);

				logger.info("fileName :::: " + fileName);
			}

			Enumeration<Object> e = multi.getParameterNames();
			while (e.hasMoreElements()) {
				Object object = (Object) e.nextElement();
				logger.info(object.toString());
			}
//			INFO : com.wingko.story.controller.BoardController - fileName :::: 1374475233_blue06.png
//			INFO : com.wingko.story.controller.BoardController - CKEditor
//			INFO : com.wingko.story.controller.BoardController - CKEditorFuncNum
//			INFO : com.wingko.story.controller.BoardController - langCode

			String CKEditorFuncNum = multi.getParameter("CKEditorFuncNum");
			String langCode = multi.getParameter("langCode");
			String CKEditor = multi.getParameter("CKEditor");
			
			logger.info("CKEditorFuncNum" + CKEditorFuncNum);
			logger.info("langCode" + langCode);
			logger.info("CKEditor" + CKEditor);

			res.setCharacterEncoding("utf-8");
			res.getWriter().write("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction('"+CKEditorFuncNum+"', '" + urlPath +fileName + "', '업로드 완료');</script>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
