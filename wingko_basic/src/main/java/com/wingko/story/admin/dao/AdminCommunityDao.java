/*
 * @(#)AdminCommunityDao.java  2013. 9. 10.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import com.wingko.story.domain.Community;
import com.wingko.story.domain.Notice;
import com.wingko.story.domain.Qna;
import com.wingko.story.domain.Ripple;

/**
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 10.
 */
public interface AdminCommunityDao {
	public List<Notice> getNoticeList(Notice notice);
	public int getNoticeListCount(Notice notice);
	public Notice getNotice(int no);
	public int setNoticeInsert(Notice notice);
	public int setNoticeUpdate(Notice notice);
	public int setNoticeDelete(int no);
	
	public List<Community> getCommunityList(Community community);
	public int getCommunityListCount(Community community);
	public Community getCommunity(int no);
	public int setCommunityInsert(HashMap map);
	public int setCommunityUpdate(HashMap map);
	public int setCommunityDelete(int no);
	
	
	public List<Qna> getQnaList(Qna qna);
	public int getQnaListCount(Qna qna);
	public Qna getQna(int no);
	public int setQnaInsert(Qna qna);
	public int setQnaUpdate(Qna qna);
	public int setQnaDelete(int no);
	public int setQnaDeleteRef(int ref);
	
	public int getUserReplyListCount(Ripple reply);
	public Collection<Ripple> getUserReplyList(Ripple reply);
	public int setReplyCheck(int no);
	

}

