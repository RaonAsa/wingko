/*
 * @(#)LoginInterceptor.java  2013. 7. 30.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * TODO
 * 관리자 로그인 체크 인터셉터
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 30.
 */
public class AdminLoginCheckInterceptor extends HandlerInterceptorAdapter {
	
	Logger logger = LoggerFactory.getLogger(AdminLoginCheckInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession(false);
		
		if (session == null) {
			response.sendRedirect("/admin/login.do");
			return false;
		}
		
		String user_id = (String) session.getAttribute("admin_id");
		String user_no = (String) session.getAttribute("admin_no");
		
		if (user_id == null || user_no == null) {
			response.sendRedirect("/admin/login.do");
			return false;
		}

		return true;
	}
}

