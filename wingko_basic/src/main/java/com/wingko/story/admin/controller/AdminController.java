/*
 * @(#)AdminController.java  2013. 7. 24.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wingko.story.admin.dao.MemberDao;
import com.wingko.story.domain.Member;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 24.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

	private Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String index(HttpSession session) {
		if (!"wingko".equals(session.getAttribute("user_id"))) {
			return "redirect:/admin/login.do";
		}

		return "/admin/index";
	}

	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login(Model model, @RequestParam(value="result", defaultValue="")String result) {

		model.addAttribute("result", result);

		return "/admin/login";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String loginSubmit(Model model, HttpSession session, @RequestParam("user_id")String user_id, @RequestParam("user_password")String user_password) {
		
		Member member = new Member();
		member.setUser_id(user_id);
		member.setUser_password(user_password);
		member = memberDao.login(member);

		/*if ("wingkoadmin".equals(user_id) && "wingkoadmin".equals(user_password)) {*/
		if (member != null && member.getLevel() == 1) {
			logger.error(member.toString());
			
			session.setAttribute("admin_id", user_id);
			session.setAttribute("admin_no", member.getUser_no()+"");
			session.setMaxInactiveInterval(60 * 30);
		} else {
			model.addAttribute("result", "false");
			return "redirect:/admin/login.do";
		}

		return "redirect:/admin/travel/list.do";
	}

	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("admin_id");

		return "redirect:/admin/login.do";
	}
}

