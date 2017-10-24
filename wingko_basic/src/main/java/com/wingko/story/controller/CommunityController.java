/*
 * @(#)CommunityController.java  2013. 9. 2.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
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
import com.wingko.story.dao.AdDao;
import com.wingko.story.dao.CommunityDao;
import com.wingko.story.dao.StoreDao;
import com.wingko.story.domain.Community;
import com.wingko.story.domain.Job;
import com.wingko.story.domain.Market;
import com.wingko.story.domain.Notice;
import com.wingko.story.domain.Qna;
import com.wingko.story.domain.Ripple;
import com.wingko.story.util.CommonUtil;
import com.wingko.story.util.JSONUtil;
import com.wingko.story.util.MultipartRequestWithSameFileTag;
import com.wingko.story.util.PagedList;
import com.wingko.story.util.TimestampFileRenamePolicy;

/**
 * Community Controller
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 2.
 */
@Controller
public class CommunityController {
	
	Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	@Autowired
	private AdDao adDao;
	
	@Autowired
	private CommunityDao dao;

	@Autowired
	private StoreDao storeDao;

	@Autowired
	private AdminStoreDao admStoreDao;
	
	@Autowired
	private AdminCommunityDao admCommDao;

	int size = 10*1024*1024;
//	String uploadTempPath = "/home/wingko/www/root/upload";	// 실섭 경로
//	String urlPath = "http://www.wingkostory.com/upload/"; // 실섭 경로
//	String uploadTempPath = "/Users/baesunghan/Documents/workspace-sts/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/wingko_basic/upload";	// 회사 테스트경로
//	String urlPath = "http://localhost:8080/upload/"; // 회사 경로
	// path를 config로 처리
	@Value("#{config['uploadTempPath']}") String uploadTempPath;
	@Value("#{config['urlPath']}") String urlPath;

	
	@RequestMapping(value="/community/notice.do", method=RequestMethod.GET)
	public String notice(Model model, Notice notice) {
		
		int totalCount = dao.getNoticeListCount(notice);
		PagedList<Notice> list = new PagedList<Notice>(dao.getNoticeList(notice), notice.getPage(), notice.getPageSize(), totalCount);
		
		model.addAttribute("ad", adDao.getAd(53));
		model.addAttribute("list", list);
		model.addAttribute("notice", notice);
		
		if (notice.getPage() == 1) {
			notice.setPageSize(5);
			notice.setTop("Y");
			List<Notice> topList = dao.getNoticeList(notice);
			model.addAttribute("topList", topList);	
		}

		return "/community/notice";
	}
	

	@RequestMapping(value="/community/notice_view.do", method=RequestMethod.GET)
	public String noticeView(Model model, Notice notice) {
		int page = notice.getPage();
		String search_type = notice.getSearch_type();
		String search_string = notice.getSearch_string();

		dao.setNoticeHit(notice.getNo());
		notice = dao.getNotice(notice.getNo());
		notice.setPage(page);
		notice.setSearch_type(search_type);
		notice.setSearch_string(search_string);

		model.addAttribute("ad", adDao.getAd(53));
		model.addAttribute("notice", notice);
		model.addAttribute("next", dao.getNoticeNext(notice));
		model.addAttribute("prev", dao.getNoticePrev(notice));
		
		return "/community/notice_view";
	}
	
	
	
	@RequestMapping(value="/community/webtoon.do", method=RequestMethod.GET)
	public String webtoon(Model model, HttpSession session, Community community) {
		String sort = community.getSort();
		community.setCategory("webtoon");
		
		community.setPageSize(3);
		community.setSort("ripple");
		model.addAttribute("rippleCountList", dao.getCommunityList(community));
		community.setSort("recommend");
		model.addAttribute("recommendList", dao.getCommunityList(community));
		
		community.setPageSize(20);
		community.setSort(sort);
		int totalCount = dao.getCommunityListCount(community);
		PagedList<Community> list = new PagedList<Community>(dao.getCommunityList(community), community.getPage(), community.getPageSize(), totalCount);

		model.addAttribute("ad", adDao.getAd(53));
		model.addAttribute("list", list);
		model.addAttribute("community", community);

		model.addAttribute("ad", adDao.getAd(53));

		return "/community/webtoon";
	}
	
	@RequestMapping(value="/community/game.do", method=RequestMethod.GET)
	public String game(Model model, HttpSession session, Community community) {

		community.setCategory("game");
		
		int totalCount = dao.getCommunityListCount(community);
		PagedList<Community> list = new PagedList<Community>(dao.getCommunityList(community), community.getPage(), community.getPageSize(), totalCount);

		model.addAttribute("ad", adDao.getAd(53));
		model.addAttribute("list", list);
		model.addAttribute("community", community);
		model.addAttribute("ad", adDao.getAd(53));

		return "/community/game";
	}
	
	@RequestMapping(value="/community/blog.do", method=RequestMethod.GET)
	public String blog(Model model, HttpSession session, Community community) {

		String sort = community.getSort();
		community.setCategory("blog");
		
		community.setPageSize(3);
		community.setSort("ripple");
		model.addAttribute("rippleCountList", dao.getCommunityList(community));
		community.setSort("recommend");
		model.addAttribute("recommendList", dao.getCommunityList(community));
		
		community.setPageSize(20);
		community.setSort(sort);
		int totalCount = dao.getCommunityListCount(community);
		PagedList<Community> list = new PagedList<Community>(dao.getCommunityList(community), community.getPage(), community.getPageSize(), totalCount);

		model.addAttribute("ad", adDao.getAd(53));
		model.addAttribute("list", list);
		model.addAttribute("community", community);
		
		model.addAttribute("ad", adDao.getAd(53));


		return "/community/blog";
	}
	
	@RequestMapping(value="/community/blog_view.do", method=RequestMethod.GET)
	public String blogView(HttpSession session, Model model, Community community) throws Exception {
		
		logger.debug("blog_view - no : {}", community.getNo());
		if (community.getNo() > 0) {
			int page = community.getPage();
			String org_category = community.getCategory();
			model.addAttribute("org_category",org_category);
			community = dao.getCommunity(community.getNo());
			community.setPage(page);
		} else {
			community.setNotice_flag("N");
		}
		
		community.setUser_no((Integer) session.getAttribute("user_no") );
		community.setUser_name((String) session.getAttribute("user_id"));
		
		
		model.addAttribute("locationData", admStoreDao.getLocationForSelect());
		model.addAttribute("community", community);
		
		return "/community/blog_view";
	}	
	
	@RequestMapping(value="/community/blog_write.do", method=RequestMethod.POST)
	public String blogWrite(HttpServletRequest req, Model model, Community community) throws Exception {
		
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
				admCommDao.setCommunityUpdate(params);
			} else {
				params.put("use_flag", "Y");
				admCommDao.setCommunityInsert(params);
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

		return "redirect:/community/blog.do";
	}

	@RequestMapping(value="/community/blog_delete.do", method=RequestMethod.GET)
	public String communityDelete(Model model, Community community) throws Exception {
		admCommDao.setCommunityDelete(community.getNo());

		model.addAttribute("category", community.getCategory());
		model.addAttribute("page", community.getPage());

		return "redirect:/community/blog.do";
	}

	
	@RequestMapping(value="/community/community_view.do", method=RequestMethod.GET)
	public String communityView(Model model, Community community) {

		int page = community.getPage();
		String sort = community.getSort();
		String search_type = community.getSearch_type();
		String search_string = community.getSearch_string();

		dao.setCommunityHit(community.getNo());
		community = dao.getCommunity(community.getNo());

		community.setPage(page);
		community.setSort(sort);
		community.setSearch_type(search_type);
		community.setSearch_string(search_string);

		Ripple ripple = new Ripple(community.getNo(), "community");
		model.addAttribute("rippleList", dao.getCommunityRippleList(ripple));
		model.addAttribute("rippleCount", dao.getCommunityRippleListCount(ripple));
		
		model.addAttribute("ad", adDao.getAd(53));
		model.addAttribute("community", community);
		model.addAttribute("next", dao.getCommunityNext(community));
		model.addAttribute("prev", dao.getCommunityPrev(community));
		
		return "/community/community_view";
	}
	
	@RequestMapping(value="/community/ripple_insert.do", method=RequestMethod.POST)
	public String reviewSubmit(Ripple ripple, @RequestParam(value="category")String category, @RequestParam(value="page")String page, 
			@RequestParam(value="sort")String sort) {

		if (ripple.getReply_order() == null) ripple.setReply_order("");
		String sNewReplyOrder = storeDao.getStoreNewReplyOrder(ripple);
		logger.debug("new reply_order : {}", sNewReplyOrder);
		ripple.setReply_order(sNewReplyOrder);
		storeDao.setStoreRippleInsert(ripple);
		
		return "redirect:/community/community_view.do?category="+category+"&page="+page+"&sort="+sort+"&no="+ripple.getParent_no();
	}
	
	@RequestMapping(value="/community/ripple_delete.do", method=RequestMethod.GET)
	public String reviewDelete(Ripple ripple, HttpSession session, @RequestParam(value="category")String category, @RequestParam(value="page")String page, 
			@RequestParam(value="sort")String sort) {
		ripple.setUser_no((Integer) session.getAttribute("user_no"));
		dao.setCommunityRippleDelete(ripple);
		return "redirect:/community/community_view.do?category="+category+"&page="+page+"&sort="+sort+"&no="+ripple.getParent_no();
	}
	
	
	
	@RequestMapping(value="/community/market.do", method=RequestMethod.GET)
	public String market(HttpSession session, Model model, Market market) {

		int totalCount = dao.getMarketListCount(market);
		PagedList<Market> list = new PagedList<Market>(dao.getMarketList(market), market.getPage(), market.getPageSize(), totalCount);

		model.addAttribute("list", list);
		model.addAttribute("market", market);
		model.addAttribute("ad", adDao.getAd(53));
		model.addAttribute("user_no", session.getAttribute("user_no"));

		return "/community/market";
	}
	
	@RequestMapping(value="/community/market_view.do", method=RequestMethod.GET)
	public String marketView(HttpSession session, Model model, Market market) {
		
		dao.setMarketHit(market.getNo());
		
		int page = market.getPage();
		String search_type = market.getSearch_type();
		String search_string = market.getSearch_string();
		
		market = dao.getMarket(market.getNo());
		market.setPage(page);
		market.setSearch_type(search_type);
		market.setSearch_string(search_string);

		model.addAttribute("market", market);
		model.addAttribute("next", dao.getMarketNext(market));
		model.addAttribute("prev", dao.getMarketPrev(market));
		model.addAttribute("ad", adDao.getAd(53));
		model.addAttribute("user_no", session.getAttribute("user_no"));

		return "/community/market_view";
	}

	@RequestMapping(value="/community/market_write.do", method=RequestMethod.GET)
	public String marketWrite(Model model, Market market, HttpSession session) {
		if (market.getNo() > 0) {
			int page = market.getPage();
			market = dao.getMarket(market.getNo());
			market.setPage(page);
		}
		
		if (session.getAttribute("user_no") != null) {
			int user_no = (Integer) session.getAttribute("user_no");
			market.setUser_no(user_no);
		}

		model.addAttribute("market", market);
		model.addAttribute("ad", adDao.getAd(53));

		return "/community/market_write";
	}
	
	@RequestMapping(value="/community/market_write.do", method=RequestMethod.POST)
	public String marketWriteSubmit(Model model, Market market, HttpSession session) {
		
		if (session.getAttribute("user_id") == null) {
			// 로그인 창으로
		} else {
			if (market.getNo() > 0) {
				dao.setMarketUpdate(market);
			} else {
				dao.setMarketInsert(market);
			}
		}

		model.addAttribute("page", market.getPage());

		return "redirect:/community/market.do";
	}
	
	@RequestMapping(value="/community/market_sell_update.do", method=RequestMethod.GET)
	public String marketSellUpdate(Model model, Market market, HttpSession session) {
		
		Market temp = dao.getMarket(market.getNo());
		
		try {
			int user_no = (Integer) session.getAttribute("user_no");
			if (temp.getUser_no() == user_no) {
				dao.setMarketSellUpdate(market.getNo());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
		model.addAttribute("page", market.getPage());
		
		return "redirect:/community/market.do";
	}
	
	@RequestMapping(value="/community/market_delete.do", method=RequestMethod.GET)
	public String marketDelete(Model model, Market market, HttpSession session) {
		
		Market temp = dao.getMarket(market.getNo());
		
		try {
			int user_no = (Integer) session.getAttribute("user_no");
			if (temp.getUser_no() == user_no) {
				dao.setMarketDelete(market.getNo());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("page", market.getPage());
		
		return "redirect:/community/market.do";
	}

	@RequestMapping(value="/community/job.do", method=RequestMethod.GET)
	public String job(Model model, HttpSession session, Job job) {
		
		if (job.getJob_type() == null || job.getJob_type().equals("")) {
			job.setJob_type("company");
		}
		
		int totalCount = dao.getJobListCount(job);
		PagedList<Job> list = new PagedList<Job>(dao.getJobList(job), job.getPage(), job.getPageSize(), totalCount);

		model.addAttribute("job", job);
		model.addAttribute("list", list);
		model.addAttribute("ad", adDao.getAd(53));

		return "/community/job";
	}
	
	@RequestMapping(value="/community/job_view.do", method=RequestMethod.GET)
	public String jobView(Model model, HttpSession session, Job job) {

		dao.setJobHit(job.getJob_no());
		int page = job.getPage();
		String search_type = job.getSearch_type();
		String search_string = job.getSearch_string();
		job = dao.getJob(job.getJob_no());
		job.setPage(page);
		job.setSearch_type(search_type);
		job.setSearch_string(search_string);
		
		if (job.getHunter_about() != null) {
			job.setHunter_about(CommonUtil.replaceAll(job.getHunter_about(), "\r\n", "<br />"));			
		}
		if (job.getCompany_desc() != null) {
			job.setCompany_desc(CommonUtil.replaceAll(job.getCompany_desc(), "\r\n", "<br />"));	
		}
		if (job.getCompany_etc() != null) {
			job.setCompany_etc(CommonUtil.replaceAll(job.getCompany_etc(), "\r\n", "<br />"));	
		}

		model.addAttribute("job", job);
		model.addAttribute("ad", adDao.getAd(53));
		model.addAttribute("next", dao.getJobNext(job));
		model.addAttribute("prev", dao.getJobPrev(job));
		
		if (job.getJob_type().equals("company")) {
			return "/community/job_view_company";
		} else {
			return "/community/job_view_hunting";
		}
	}

	@RequestMapping(value="/community/job_write.do", method=RequestMethod.GET)
	public String jobWrite(HttpServletResponse res, Model model, HttpSession session, Job job) throws Exception {
 
		if (job.getJob_no() > 0) {
			int page = job.getPage();
			String input_pwd = job.getPwd();
			String job_type = job.getJob_type();
			job = dao.getJob(job.getJob_no());
			if (!input_pwd.equals(job.getPwd())) {
				model.addAttribute("pass", true);
				job = new Job();
			}
			job.setPage(page);
			job.setJob_type(job_type);
		}

		model.addAttribute("job", job);
		model.addAttribute("ad", adDao.getAd(53));
		
		if (job.getJob_type().equals("company")) {
			return "/community/job_write_company";	
		} else {
			return "/community/job_write_hunting";
		}
	}

	@RequestMapping(value="/community/job_write.do", method=RequestMethod.POST)
	public String jobWriteSubmit(HttpServletRequest req, Model model, HttpSession session) {
		logger.info("job_write.do");
		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(req, uploadTempPath+"/job", size, "UTF-8", new TimestampFileRenamePolicy());

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

			// add, check captcha logic for block bot insert
			String captcha = null;
			try { 
				captcha = (String)session.getAttribute("CAPTCHA");
			} catch (Exception e) {
				;
			}
			String param_captcha = params.get("captcha");
			logger.info("session - captcha : {}, param captcha : {}", captcha, param_captcha);
			if(captcha == null || (captcha != null && !captcha.equals(param_captcha))) {
				Job job = new Job();
				job.setCompany_title(params.get("company_title"));
				job.setTitle(params.get("title"));
				job.setCompany_desc(params.get("company_desc"));
//				job.setPage(Integer.parseInt(params.get("page")));
				job.setJob_type(params.get("job_type"));
				
				model.addAttribute("job", job);
	            model.addAttribute("message", "Captcha does not match");
	            return "/community/job_write_company";
	        }

			if ( multi.getParameter("job_no") != null && Integer.parseInt( multi.getParameter("job_no")) > 0) {
				dao.setJobUpdate(params);
			} else {
				dao.setJobInsert(params);
			}
			
			model.addAttribute("page", params.get("page"));
			model.addAttribute("job_type", params.get("job_type"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/community/job.do";
	}
	
	
	@RequestMapping(value="/community/job_delete.do", method=RequestMethod.GET)
	public void jobDelete(HttpServletResponse res, Model model, HttpSession session, Job job) throws Exception {

		if (job.getJob_no() > 0) {
			int page = job.getPage();
			String input_pwd = job.getPwd();
			job = dao.getJob(job.getJob_no());
			if (!input_pwd.equals(job.getPwd())) {
				res.setCharacterEncoding("utf-8");
				res.setContentType("text/html");
				res.getWriter().write("<script type='text/javascript'>alert('密码不一致'); history.back(-1);</script>");
				logger.info("비밀번호 오류");
			} else {
				dao.setJobDelete(job.getJob_no());
				res.setCharacterEncoding("utf-8");
				res.setContentType("text/html");
				res.getWriter().write("<script type='text/javascript'>location.href='/community/job.do?page="+job.getPage()+"&job_type="+job.getJob_type()+"';</script>");
			}
		}
	}
	
	
	
	/**
	 * 구직자 사진
	 * 
	 * @param req
	 * @param res
	 */
	@RequestMapping(value="/community/imageupload.do", method=RequestMethod.POST)
	public void imageUpload(HttpServletRequest req, HttpServletResponse res) {

		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(req, uploadTempPath+"/community", size, "UTF-8", new TimestampFileRenamePolicy());

			String fileName = "";
			Set<String> set = multi.getFileNames();
			for (String string : set) {
				fileName = multi.getFilesystemName(string);
			}

			String jsonData = "[ {  \"file\": "+ urlPath+"community/"+fileName+"\", \"fileName\" : \""+fileName+"\" } ]";
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("file", urlPath+"community/"+fileName);
			map.put("fileName", fileName);

			res.setCharacterEncoding("utf-8");
			res.getWriter().write(JSONUtil.ObjectToJSON(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 에디터 이미지
	 * 
	 * @param req
	 * @param res
	 */
	@RequestMapping(value="/community/imageupload_editor.do", method=RequestMethod.POST)
	public void imageupload_editor(HttpServletRequest req, HttpServletResponse res) {

		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(req, uploadTempPath+"/community", size, "UTF-8", new TimestampFileRenamePolicy());

			String fileName = multi.getFilesystemName("upload");
			String CKEditorFuncNum = multi.getParameter("CKEditorFuncNum");
			String langCode = multi.getParameter("langCode");
			String CKEditor = multi.getParameter("CKEditor");

			res.setCharacterEncoding("utf-8");
			res.setContentType("text/html");
			res.getWriter().write("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction('"+CKEditorFuncNum+"', '" + urlPath + "community/" +fileName + "');</script>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(value="/community/qna.do", method=RequestMethod.GET)
	public String qna(HttpSession session, Model model, Qna qna) {
		
		int totalCount = dao.getQnaListCount(qna);
		PagedList<Qna> list = new PagedList<Qna>(dao.getQnaList(qna), qna.getPage(), qna.getPageSize(), totalCount);

		model.addAttribute("list", list);
		model.addAttribute("qna", qna);
		model.addAttribute("ad", adDao.getAd(53));
		model.addAttribute("user_no", session.getAttribute("user_no"));

		return "/community/qna";
	}
	
	@RequestMapping(value="/community/qna_view.do", method=RequestMethod.GET)
	public String qnaView(Model model, Qna qna, HttpSession session) {
		dao.setQnaHit(qna.getNo());
		int page = qna.getPage();
		String search_type = qna.getSearch_type();
		String search_string = qna.getSearch_string();
		qna = dao.getQna(qna.getNo());
		qna.setPage(page);
		qna.setSearch_type(search_type);
		qna.setSearch_string(search_string);

		model.addAttribute("qna", qna);
		model.addAttribute("ad", adDao.getAd(53));
		model.addAttribute("user_no", session.getAttribute("user_no"));

		return "/community/qna_view";
	}
	
	@RequestMapping(value="/community/qna_write.do", method=RequestMethod.GET)
	public String qnaWrite(HttpSession session, Model model, Qna qna) {
		
		if (qna.getNo() > 0) {
			int page = qna.getPage();
			qna = dao.getQna(qna.getNo());
			qna.setPage(page);
		}
		
		if (session.getAttribute("user_no") != null) {
			int user_no = (Integer) session.getAttribute("user_no");
			qna.setUser_no(user_no);
		}
		
		model.addAttribute("qna", qna);
		model.addAttribute("ad", adDao.getAd(53));

		return "/community/qna_write";
	}
	
	@RequestMapping(value="/community/qna_write.do", method=RequestMethod.POST)
	public String qnaWriteSubmit(Model model, Qna qna) {

		if (qna.getNo() > 0) {
			dao.setQnaUpdate(qna);
		} else {
			dao.setQnaInsert(qna);
		}

		return "redirect:/community/qna.do";
	}
	
	@RequestMapping(value="/community/qna_delete.do", method=RequestMethod.GET)
	public String qnaDelete(HttpSession session, Model model, Qna qna) {
		Qna temp = dao.getQna(qna.getNo());
		
		try {
			int user_no = (Integer) session.getAttribute("user_no");
			if (temp.getUser_no() == user_no) {
				dao.setQnaDelete(qna.getNo());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("page", qna.getPage());
		
		return "redirect:/community/qna.do";
	}
	
	
}

