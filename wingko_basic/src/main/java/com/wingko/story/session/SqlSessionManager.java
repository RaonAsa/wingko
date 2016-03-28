/*
 * @(#)SqlSessionManager.java  2013. 7. 9.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.session;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 9.
 * 
 */
public class SqlSessionManager {

	public static SqlSessionFactory sqlSession;

	static {
		String resource = "mybatis.xml";

		Reader reader;

		try {
			reader = Resources.getResourceAsReader(resource);
			sqlSession = new SqlSessionFactoryBuilder().build(reader, "wingko");

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getSqlSession() {
		return sqlSession;
	}
}