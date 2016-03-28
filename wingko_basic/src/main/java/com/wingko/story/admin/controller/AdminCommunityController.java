/*
 * @(#)AdminCommunityController.java  2013. 9. 10.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wingko.story.admin.dao.AdminCommunityDao;
import com.wingko.story.admin.dao.AdminStoreDao;
import com.wingko.story.domain.Community;
import com.wingko.story.domain.Notice;
import com.wingko.story.domain.PropertyBean;
import com.wingko.story.domain.Qna;
import com.wingko.story.domain.Ripple;
import com.wingko.story.util.MultipartRequestWithSameFileTag;
import com.wingko.story.util.PagedList;
import com.wingko.story.util.TimestampFileRenamePolicy;

/**
 * Admin Community Controller
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 10.
 */
@Controller
@RequestMapping("/admin/community")
public class AdminCommunityController {
	private static Logger logger = LoggerFactory.getLogger(AdminCommunityController.class);
	
	@Autowired
	private AdminCommunityDao dao;
	
	@Autowired
	private AdminStoreDao storeDao;
	
	
//	int size = 10*1024*1024;
//	String uploadTempPath = "/home/wingko/www/root/upload";	// 실섭 경로
//	String urlPath = "http://www.wingkostory.com/upload/"; // 실섭 경로
//	String uploadTempPath = "/Users/baesunghan/Documents/workspace-sts/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/wingko_basic/upload";	// 회사 테스트경로
//	String urlPath = "http://localhost:8080/upload/"; // 회사 경로
	// path를 config로 처리
	@Value("#{config['uploadTempPath']}") String uploadTempPath;
	@Value("#{config['urlPath']}") String urlPath;
	@Value("#{config['fileSize']}") Integer size;
	
	@RequestMapping(value="/notice.do")
	public String notice(Model model, Notice notice) throws Exception {
		
		int totalCount = dao.getNoticeListCount(notice);
		PagedList<Notice> list = null;
		list = new PagedList<Notice>(dao.getNoticeList(notice), notice.getPage(), notice.getPageSize(), totalCount);

		model.addAttribute("notice", notice);
		model.addAttribute("list", list);
		model.addAttribute("leftMenu", "31");

		return "/admin/community/notice";
	}
	
	@RequestMapping(value="/notice_write.do", method=RequestMethod.GET)
	public String noticeWrite(HttpSession session, Model model, Notice notice) throws Exception {
		if (notice.getNo() > 0) {
			notice = dao.getNotice(notice.getNo());
		}

		notice.setUser_no(Integer.parseInt((String) session.getAttribute("admin_no")) );
		notice.setUser_name((String) session.getAttribute("admin_id"));

		model.addAttribute("notice", notice);
		model.addAttribute("leftMenu", "31");

		return "/admin/community/notice_write";
	}
	
	@RequestMapping(value="/notice_write.do", method=RequestMethod.POST)
	public String noticeWriteSubmit(Model model, Notice notice) throws Exception {
		
		if (notice.getNo() > 0) {
			dao.setNoticeUpdate(notice);
		} else {
			dao.setNoticeInsert(notice);
		}
		model.addAttribute("page", notice.getPage());

		return "redirect:/admin/community/notice.do";
	}
	
	@RequestMapping(value="/notice_delete.do", method=RequestMethod.GET)
	public String noticeDelete(Model model, Notice notice) throws Exception {
		dao.setNoticeDelete(notice.getNo());
		
		model.addAttribute("page", notice.getPage());

		return "redirect:/admin/community/notice.do";
	}
	
	@RequestMapping(value="/list.do")
	public String communityList(Model model, Community community) throws Exception {
		
		int totalCount = dao.getCommunityListCount(community);
		PagedList<Community> list = null;
		list = new PagedList<Community>(dao.getCommunityList(community), community.getPage(), community.getPageSize(), totalCount);

		model.addAttribute("community", community);
		model.addAttribute("list", list);
		model.addAttribute("leftMenu", "32");

		return "/admin/community/list";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String communityWrite(HttpSession session, Model model, Community community) throws Exception {
		if (community.getNo() > 0) {
			int page = community.getPage();
			String org_category = community.getCategory();
			model.addAttribute("org_category",org_category);
			community = dao.getCommunity(community.getNo());
			community.setPage(page);
		} else {
			community.setNotice_flag("N");
		}

		community.setUser_no(Integer.parseInt((String) session.getAttribute("admin_no")) );
		community.setUser_name((String) session.getAttribute("admin_id"));

		
		model.addAttribute("locationData", storeDao.getLocationForSelect());
		model.addAttribute("community", community);
		model.addAttribute("leftMenu", "32");

		return "/admin/community/write";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String communityWriteSubmit(HttpServletRequest req, Model model, Community community) throws Exception {
		logger.debug("uploadTempPath : {}, urlPath : {}", uploadTempPath, urlPath);
		logger.debug("fileSize : {}", size);
		
		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(req, uploadTempPath+"/community", size, "UTF-8", new TimestampFileRenamePolicy());

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
			
			logger.info(params.toString());

			if ( multi.getParameter("no") != null && multi.getParameter("no").length() > 0) {
				dao.setCommunityUpdate(params);
			} else {
				params.put("use_flag", "N");
				dao.setCommunityInsert(params);
			}
			
			model.addAttribute("category", multi.getParameter("org_category"));
			model.addAttribute("page", multi.getParameter("page"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/*
		if (community.getNo() > 0) {
			dao.setCommunityUpdate(community);
		} else {
			dao.setCommunityInsert(community);
		}*/

		return "redirect:/admin/community/list.do";
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public String communityDelete(Model model, Community community) throws Exception {
		dao.setCommunityDelete(community.getNo());

		model.addAttribute("category", community.getCategory());
		model.addAttribute("page", community.getPage());

		return "redirect:/admin/community/list.do";
	}
	
	/**
	 * 에디터에서 전송하는 이미지
	 * 
	 * @param req
	 * @param res
	 */
	@RequestMapping(value="/imageupload_editor.do", method=RequestMethod.POST)
	public void imageupload_editor(HttpServletRequest req, HttpServletResponse res) {
		logger.debug("uploadTempPath : {}, urlPath : {}", uploadTempPath, urlPath);
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
	
	@RequestMapping(value="/qna.do")
	public String qnaList(Model model, Qna qna) throws Exception {
		
		int totalCount = dao.getQnaListCount(qna);
		PagedList<Qna> list = null;
		list = new PagedList<Qna>(dao.getQnaList(qna), qna.getPage(), qna.getPageSize(), totalCount);

		model.addAttribute("qna", qna);
		model.addAttribute("list", list);
		model.addAttribute("leftMenu", "33");

		return "/admin/community/qna";
	}
	
	@RequestMapping(value="/qna_view.do")
	public String qnaView(Model model, Qna qna) throws Exception {
		
		int page = qna.getPage();
		qna = dao.getQna(qna.getNo());
		qna.setPage(page);

		model.addAttribute("qna", qna);
		model.addAttribute("leftMenu", "33");

		return "/admin/community/qna_view";
	}
	
	@RequestMapping(value="/qna_reply.do", method=RequestMethod.GET)
	public String qnaReply(HttpSession session, Model model, Qna qna, @RequestParam(value="t", required=true)String t) throws Exception {
		
		if ("reply".equals(t)) {
			// 답변
			qna = dao.getQna(qna.getNo());
			qna.setTitle("re : " + qna.getTitle());
			qna.setContent("\r\n\r\n-------------------------------------------\r\n\r\n\r\n\r\n" + qna.getContent());
		} else {
			// 답변 수정
			qna = dao.getQna(qna.getNo());
		}
		
		qna.setUser_no(Integer.parseInt((String) session.getAttribute("admin_no")) );
		
		
		model.addAttribute("qna", qna);
		model.addAttribute("leftMenu", "33");

		return "/admin/community/qna_reply";
	}
	
	@RequestMapping(value="/qna_reply.do", method=RequestMethod.POST)
	public String qnaReplySubmit(Model model, Qna qna) throws Exception {
		int page = qna.getPage();
		
		if (qna.getRef_level() == 0) {
			// 답변
			qna.setRef_level(1);
			qna.setSort(1);
			
			dao.setQnaInsert(qna);
		} else {
			// 수정
			dao.setQnaUpdate(qna);
		}

		model.addAttribute("qna", qna);
		model.addAttribute("page", page);
		
		return "redirect:/admin/community/qna.do";
	}
	
	@RequestMapping(value="/qna_delete.do", method=RequestMethod.GET)
	public String qnaDelete(Model model, Qna qna) throws Exception {

		int page = qna.getPage();
		qna = dao.getQna(qna.getNo());

		if (qna.getRef_level() == 0) {
			dao.setQnaDeleteRef(qna.getRef());
		} else {
			dao.setQnaDelete(qna.getNo());
		}

		model.addAttribute("page", page);
		
		return "redirect:/admin/community/qna.do";
	}

	
	@RequestMapping(value="/userreply.do")
	public String replyList(Model model, Ripple reply) throws Exception {
		int totalCount = dao.getUserReplyListCount(reply);
		PagedList<Ripple> list = null;
		list = new PagedList<Ripple>(dao.getUserReplyList(reply), reply.getPage(), reply.getPageSize(), totalCount);

		model.addAttribute("reply", reply);
		model.addAttribute("list", list);
		model.addAttribute("leftMenu", "34");

		return "/admin/community/userreplylist";
	}

	@RequestMapping(value="/userreplycheck.do", method=RequestMethod.GET)
	public String replyCheck(Model model, Ripple reply) throws Exception {

		int page = reply.getPage();

		dao.setReplyCheck(reply.getNo());

		model.addAttribute("page", page);
		
		return "redirect:/admin/community/userreply.do";
	}
}

