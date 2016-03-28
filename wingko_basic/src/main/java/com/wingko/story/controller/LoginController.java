/*
 * @(#)LoginController.java  2013. 7. 30.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.logging.LogException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.wingko.story.domain.Login;
import com.wingko.story.service.UserService;
import com.wingko.story.validator.LoginValidator;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 30.
 */
@Controller
@SessionAttributes("login") 
public class LoginController {
	
	private Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Autowired
	private LoginValidator loginValidator;
	@Autowired
	private UserService userservice;


	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login(HttpServletRequest req, Model model) {
		model.addAttribute(new Login());
		model.addAttribute("url", req.getHeader("referer"));

		return "login/login";
	}

	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String loginSubmit(@ModelAttribute @Valid Login login, BindingResult result,
			SessionStatus status, HttpSession session, Model model) {

		if (result.hasErrors()) {
			logger.info("-result.hasErrors- 111");
			model.addAttribute("errors", "用户名或密码输入有误");
			return "login/login";
		}
		
		login.setUser_no(this.loginValidator.validateLogin(login, result));
		if (result.hasErrors()) {
			logger.info("-result.hasErrors- 222");
			model.addAttribute("errors", "用户名或密码输入有误");
			return "login/login";
		} else {
			session.setAttribute("user_id", login.getUser_id());
			session.setAttribute("user_no", login.getUser_no());
			status.setComplete();
			
			
			
//			logger.info("login.getUrl() >>>>>>> " + login.getUrl());
			
			if (login.getUrl() != null && login.getUrl() != "") {
				return "redirect:"+login.getUrl();
			} else {
				return "redirect:/index.do";				
			}
		}
	}

	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("user_id");
		session.removeAttribute("user_no");
		
		return "redirect:/login.do";
	}

}

