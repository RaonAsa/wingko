/*
 * @(#)JoinController.java  2013. 7. 31.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

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

import com.wingko.story.domain.Join;
import com.wingko.story.domain.Market;
import com.wingko.story.domain.Qna;
import com.wingko.story.domain.Ripple;
import com.wingko.story.domain.Search;
import com.wingko.story.domain.SelectData;
import com.wingko.story.domain.User;
import com.wingko.story.service.UserService;
import com.wingko.story.util.CommonUtil;
import com.wingko.story.util.JSONUtil;
import com.wingko.story.util.MailUtil;
import com.wingko.story.util.PagedList;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 31.
 */
@Controller
public class UserController {
	
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private UserService userService;


	/**
	 * 회원 가입 1단계
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/join/join_s1.do", method=RequestMethod.GET)
	public String join1(Model model){
		model.addAttribute("c", "1001");	// 회원 가입 경로 디폴트(윙코)
		return "join/join_s1";
	}

	/**
	 * 외부 마케팅 회원 가입 1단계
	 * @param model
	 * @param join_code
	 * @return
	 */
	@RequestMapping(value="/join/join.do", method=RequestMethod.GET)
	public String marketingJoin(Model model, @RequestParam("c")String join_code){
		model.addAttribute("c", join_code);
		return "join/join_s1";
	}


	/**
	 * 회원가입 2단계 입력 폼
	 * 
	 * @param model
	 * @param join
	 * @return
	 */
	@RequestMapping(value="/join/join_s2.do", method=RequestMethod.POST)
	public String join2(Model model, Join join){
		join.setSex("M");
		model.addAttribute(join);
		model.addAttribute("provinceList", userService.provinceId());

		return "join/join_s2";
	}


	@RequestMapping(value="/join/join_s3.do", method=RequestMethod.POST)
	public String join3(Join join){
		logger.info(join.toString());

		try {
			userService.joinInsert(join);
			MailUtil.SendMail(join.getEmail(), join.getId(), "join");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:/join/join_s3.do";
	}

	@RequestMapping(value="/join/join_s3.do", method=RequestMethod.GET)
	public String joinFinish(){
		
		return "join/join_s3";
	}
	
	
	/**
	 * 주소 선택 데이터
	 * 
	 * @param res
	 * @param parent_type
	 * @param parent_code
	 */
	@RequestMapping(value="/join/getAreaCode.do", method=RequestMethod.GET)
	public void getAreaCode(HttpServletResponse res, @RequestParam(value="t")String parent_type, @RequestParam(value="c")String parent_code) {
		String result = "";
		List<SelectData> list;
		if ("province".equals(parent_type)) {
			list = userService.cityId(parent_code);
		} else {
			list = userService.areaId(parent_code);
		}
		try {
			result = JSONUtil.ObjectToJSON(list);

			res.setCharacterEncoding("utf-8");
			res.getWriter().write(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	/**
	 * ajax로 id/email/nickname 체크
	 * 
	 * @param res
	 * @param type
	 * @param string
	 */
	@RequestMapping(value="/join/ajaxCheck.do", method=RequestMethod.POST)
	public void emailCheck(HttpServletResponse res, @RequestParam(value="c")String type, @RequestParam(value="s")String string) {
		String result = "N";

		if ("id".equals(type)) {
			if ( CommonUtil.isCheckId(string) ) {
				result = userService.idCheck(string);
			}
		} else if ("email".equals(type)) {
			if ( CommonUtil.isCheckEmail(string) ) {
				result = userService.emailCheck(string);				
			}
		} else if ("nickname".equals(type)) {
			result = userService.nicknameCheck(string);
		}

		try {
			res.setCharacterEncoding("utf-8");
			res.getWriter().write(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	


	
	
	/**
	 * id/pw 찾기
	 * 
	 * @return
	 */
	@RequestMapping(value="/join/idpw.do", method=RequestMethod.GET)
	public String idpw() {

		return "join/idpw";
	}

	/**
	 * id 찾기 결과
	 * 
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/join/idpw_id.do", method=RequestMethod.POST)
	public String idpwIdSearch(User user, Model model) {
		
		logger.info(user.toString());

		user = userService.idSearch(user);

		if (user == null) {
			model.addAttribute("result", "join");			
		} else {
			model.addAttribute("result", "login");
			model.addAttribute(user);
		}

		return "join/idpw_result";
	}
	
	/**
	 * pw 찾기 결과
	 * 
	 * @param user
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/join/idpw_pw.do", method=RequestMethod.POST)
	public String idpwPassWordSearch(User user, Model model) throws Exception {

		logger.info(user.toString());

		user = userService.passwordSearch(user);

		if (user == null) {
			model.addAttribute("result", "join");			
		} else {
			/*
			 * 비밀번호 랜덤 생성 후 비밀번호 변경!!!
			 * 변경 된 비밀번호 이메일 발송!!!
			 */
			
			int newPassword = (int) (Math.random() * 1000000000 -1);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("user_no", user.getUser_no());
			map.put("user_id", user.getUser_id());
			map.put("password", newPassword);
			
			int result = userService.setUpdatePassword(map);
			logger.info("" + result);
			
			MailUtil.SendMail(user.getEmail(), user.getUser_id(), "password", newPassword+"");
		
			model.addAttribute("result", "email");
			model.addAttribute(user);
		}


		return "join/idpw_result";
	}


	/**
	 * MY INFO
	 * 
	 * @param session
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/my/my_info.do", method=RequestMethod.GET)
	public String myInfo(HttpSession session, User user, Model model) {
		if ( session == null ) {
			logger.info("session is null");
		}
		String user_id = (String) session.getAttribute("user_id");

		user = userService.getUser(user_id);
		
		logger.info("user_id ::: " + user_id);

		model.addAttribute(user);
		model.addAttribute("provinceList", userService.provinceId());
		model.addAttribute("cityList", userService.cityId(user.getProvince_id()));
		model.addAttribute("areaList", userService.areaId(user.getCity_id()));

		return "/join/my_info";
	}

	/**
	 * MY INFO 수정
	 * 
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/my/my_info.do", method=RequestMethod.POST)
	public String myInfoSubmit(HttpServletRequest req) {

		HashMap<String, String> paramMap = new HashMap<String, String>();
		
//		logger.info("" + req.getParameter("email_check"));
//		logger.info("" + req.getParameter("new_email"));
//		logger.info("" + req.getParameter("nickname_check"));
//		logger.info("" + req.getParameter("new_nickname"));

		if (req.getParameter("email_check").equals("Y")) {
			paramMap.put("email", req.getParameter("new_email"));
		}
		if (req.getParameter("nickname_check").equals("Y")) {
			paramMap.put("nickname", req.getParameter("new_nickname"));
		}
		if (req.getParameter("new_password").length() > 0) {
			HttpSession session = req.getSession();
			String user_id = (String) session.getAttribute("user_id");
			User user = userService.getUser(user_id);

			if (user.getUser_password().equals(req.getParameter("password"))) {
				paramMap.put("password", req.getParameter("new_password"));
			}
		}
		paramMap.put("phone", req.getParameter("phone"));
		paramMap.put("user_no", req.getParameter("user_no"));
		paramMap.put("province_id", req.getParameter("province_id"));
		paramMap.put("city_id", req.getParameter("city_id"));
		paramMap.put("area_id", req.getParameter("area_id"));
		paramMap.put("address", req.getParameter("address"));

		int result = userService.setUpdateUser(paramMap);

		return "redirect:/my/my_info.do";
	}
	
	
	
	
	@RequestMapping(value="/my/my_scrap.do", method=RequestMethod.GET)
	public String myScrap(HttpSession session, Search search, Model model) {
		int user_no = (Integer) session.getAttribute("user_no");
		
		search.setUser_no(user_no);
		
		int totalCount = userService.getScrapListCount(search);
		PagedList<Search> list = new PagedList<Search>(userService.getScrapList(search), search.getPage(), search.getPageSize(), totalCount);

		model.addAttribute("list", list);

		return "/join/my_scrap";
	}
	
	@RequestMapping(value="/my/my_write.do", method=RequestMethod.GET)
	public String myWrite(HttpSession session, Model model, @RequestParam(value="page", defaultValue="1")int page,
			@RequestParam(value="menu", defaultValue="0")int menu) {
		int user_no = (Integer) session.getAttribute("user_no");
		int pageSize = 10;

		if (menu == 0) {
			Market market = new Market();
			market.setUser_no(user_no);
			int totalCount = userService.getWriteListCount(market);
			PagedList<Market> list = new PagedList<Market>(userService.getWriteList(market), page, pageSize, totalCount);
			model.addAttribute("list", list);
		} else if (menu == 1) {
			Qna qna = new Qna();
			qna.setUser_no(user_no);
			int totalCount = userService.getWriteQnaListCount(qna);
			PagedList<Qna> list = new PagedList<Qna>(userService.getWriteQnaList(qna), page, pageSize, totalCount);
			model.addAttribute("list", list);
		} else {
			Ripple ripple = new Ripple();
			ripple.setUser_no(user_no);
			int totalCount = userService.getWriteRippleListCount(ripple);
			PagedList<Ripple> list = new PagedList<Ripple>(userService.getWriteRippleList(ripple), page, pageSize, totalCount);
			model.addAttribute("list", list);
		}
		
		model.addAttribute("menu", menu);

		return "/join/my_write";
	}
}

