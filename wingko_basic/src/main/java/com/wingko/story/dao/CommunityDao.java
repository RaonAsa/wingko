/*
 * @(#)CommunityDao.java  2013. 9. 15.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.HashMap;
import java.util.List;

import com.wingko.story.domain.Community;
import com.wingko.story.domain.Job;
import com.wingko.story.domain.Market;
import com.wingko.story.domain.News;
import com.wingko.story.domain.Notice;
import com.wingko.story.domain.Qna;
import com.wingko.story.domain.Ripple;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 15.
 */
public interface CommunityDao {
	public List<Notice> getNoticeTopFour();
	public List<Notice> getNoticeList(Notice notice);
	public int getNoticeListCount(Notice notice);
	public Notice getNotice(int no);
	public Notice getNoticeNext(Notice notice);
	public Notice getNoticePrev(Notice notice);
	public int setNoticeHit(int no);
	
	public List<Community> getCommunityList(Community community);
	public int getCommunityListCount(Community community);
	public Community getCommunity(int no);
	public Community getCommunityNext(Community community);
	public Community getCommunityPrev(Community community);
	public int setCommunityHit(int no);
	
	public List<Ripple> getCommunityRippleList(Ripple ripple);
	public int getCommunityRippleListCount(Ripple ripple);
	public int setCommunityRippleInsert(Ripple ripple);
	public int setCommunityRippleUpdate(Ripple ripple);
	public int setCommunityRippleDelete(Ripple ripple);	
	
	
	public List<Market> getMarketList(Market market);
	public int getMarketListCount(Market market);
	public Market getMarket(int no);
	public Market getMarketNext(Market market);
	public Market getMarketPrev(Market market);
	public int setMarketHit(int no);
	public int setMarketInsert(Market market);
	public int setMarketUpdate(Market market);
	public int setMarketDelete(int no);
	public int setMarketSellUpdate(int no);
	
	
	public List<Job> getJobList(Job job);
	public int getJobListCount(Job job);
	public Job getJob(int job_no);
	public Job getJobNext(Job job);
	public Job getJobPrev(Job job);
	public int setJobHit(int job_no);
	public int setJobInsert(HashMap map);
	public int setJobUpdate(HashMap map);
	public int setJobDelete(int job_no);
	
	
	public List<Qna> getQnaList(Qna qna);
	public int getQnaListCount(Qna qna);
	public Qna getQna(int no);
	public Qna getQnaNext(Qna qna);
	public Qna getQnaPrev(Qna qna);
	public int setQnaHit(int no);
	public int setQnaInsert(Qna qna);
	public int setQnaUpdate(Qna qna);
	public int setQnaDelete(int no);
	public String getStoreNewReplyOrder(Ripple ripple);
	
}

