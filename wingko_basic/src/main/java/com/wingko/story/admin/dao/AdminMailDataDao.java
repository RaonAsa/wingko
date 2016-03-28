/*
 * @(#)AdminMailDataDao.java  2013. 10. 6.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.List;

import com.wingko.story.domain.MailData;
import com.wingko.story.domain.Member;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 10. 6.
 */
public interface AdminMailDataDao {
	public int setInsert(MailData maildata);
	public int setUpdate(MailData maildata);
	public int setDelete(MailData maildata);
	public MailData getData(int mail_no);
	public List<MailData> getListAll(MailData maildata);
	public int getListAllCount(MailData maildata);
	
	public List<Member> getListMemberAll();
	
	
}

