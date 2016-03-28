/*
 * @(#)LoginInterceptor.java  2013. 7. 30.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * TODO
 * 로그인 체크 인터셉터
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 30.
 */
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	
	Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub

		logger.info("--- preHandle ::: LoginCheckInterceptor ---");
		
		HttpSession session = request.getSession(false);
		
		if (session == null) {
			response.sendRedirect("/login.do");
			return false;
		}
		
		String user_id = (String) session.getAttribute("user_id");
		
		if (user_id == null) {
			response.sendRedirect("/login.do");
			return false;
		}

		return true;
	}
}

