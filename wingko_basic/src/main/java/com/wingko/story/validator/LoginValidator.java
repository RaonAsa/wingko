/*
 * @(#)LoginValidator.java  2013. 7. 30.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.wingko.story.domain.Login;
import com.wingko.story.domain.User;
import com.wingko.story.service.UserService;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 30.
 */
@Component
public class LoginValidator implements Validator {
	
	@Autowired
	private UserService userService;

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Login.class.isAssignableFrom(clazz);
	}

	public int validateLogin(Object target, Errors errors) {
		// TODO Auto-generated method stub
		Login login = (Login) target;
		
		User user = userService.login(login);
		if (user == null || !user.getUser_password().equals(login.getUser_password())) {
			errors.reject("invalidLogin", "Invalid Login");
			
			return 0;
		} else {
			/*
			 * 로그인 횟수, 마지막 로그인 업데이트
			 */
			userService.loginUpdate(user.getUser_no());
		}

		return user.getUser_no();
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		
	}

}

