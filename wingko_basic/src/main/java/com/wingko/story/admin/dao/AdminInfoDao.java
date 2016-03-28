/*
 * @(#)InfoDao.java  2013. 9. 26.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.List;

import com.wingko.story.domain.Info;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 26.
 */
public interface AdminInfoDao {
	
	public List<Info> infoList(Info info);
	public Info info(Info info);
	public int insertInfo(Info info);
	public int updateInfo(Info info);
	public int deleteInfo(Info info);

}

