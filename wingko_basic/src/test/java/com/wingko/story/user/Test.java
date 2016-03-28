/*
 * @(#)Test.java  2013. 8. 16.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.user;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wingko.story.util.CommonUtil;



/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 16.
 */
public class Test {
	
	private static Logger logger = LoggerFactory.getLogger(Test.class);
	
	public static boolean checkEmail(String email) {
		if (email == null || email.length() == 0) {
			return false;
		}
		
		String regex = "^\\w.+@.+\\.[a-z]+";
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(email);

		if (m.matches()) {
			return true;
		}

		return false;
	}

	public static void main(String[] args) {
		
		String email = "asdasd@qq.com";
		
		logger.info(checkEmail(email) + "");
		
		
		//String id = "123asdoijzdlfi123";
		
		//logger.info(id + " " + CommonUtil.isCheckId(id));
		
//		MailUtil mailutil = new MailUtil();
//		
//		Map<String,Boolean> SendResult = new HashMap<String, Boolean>();
//
//		String title = "test 제목";
//		String userId = "yshu0307";
//		String newPassWord = "15031503";
//
//		try {
//			String content = mailutil.SetMailBody(userId, newPassWord);
//			mailutil.SendMail("", "yshu0307@naver.com", title, content, SendResult);			
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}

		
		
		
//		Test test = new Test();
//		test.sendMail("test2@wingkostory.com", "yshu0307@naver.com", "테스트 제목", "테스트 내용");
	}
}

