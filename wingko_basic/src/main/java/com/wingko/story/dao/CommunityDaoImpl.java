/*
 * @(#)CommunityDaoImpl.java  2013. 9. 15.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.Community;
import com.wingko.story.domain.Job;
import com.wingko.story.domain.Market;
import com.wingko.story.domain.Notice;
import com.wingko.story.domain.Qna;
import com.wingko.story.domain.Ripple;
import com.wingko.story.session.SqlSessionManager;
import com.wingko.story.util.CommonUtil;

/**
 * Community Controller
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 15.
 */
@Repository
public class CommunityDaoImpl implements CommunityDao {

	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();
	
	

	@Override
	public List<Notice> getNoticeTopFour() {
		SqlSession session = sessionFactory.openSession();
		List<Notice> list = null;
		try {
			list = session.selectList("CommunityMapper.noticeTopFour");
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public List<Notice> getNoticeList(Notice notice) {
		SqlSession session = sessionFactory.openSession();
		List<Notice> list = null;
		try {
			list = session.selectList("CommunityMapper.noticeList", notice);
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setContent(CommonUtil.removeHtml(list.get(i).getContent()));
			}	
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getNoticeListCount(Notice notice) {
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("CommunityMapper.noticeListCount", notice);
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public Notice getNotice(int no) {

		SqlSession session = sessionFactory.openSession();
		Notice notice = new Notice();
		try {
			notice = session.selectOne("CommunityMapper.notice", no);
		} finally {
			session.close();
		}
		return notice;
	}


	@Override
	public Notice getNoticeNext(Notice notice) {

		SqlSession session = sessionFactory.openSession();
		try {
			notice = session.selectOne("CommunityMapper.noticeNext", notice);
		} finally {
			session.close();
		}
		return notice;
	}

	@Override
	public Notice getNoticePrev(Notice notice) {

		SqlSession session = sessionFactory.openSession();
		try {
			notice = session.selectOne("CommunityMapper.noticePrev", notice);
		} finally {
			session.close();
		}
		return notice;
	}
	
	@Override
	public int setNoticeHit(int no) {

		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.update("CommunityMapper.noticeHit", no);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public List<Community> getCommunityList(Community community) {

		SqlSession session = sessionFactory.openSession();
		List<Community> list = null;
		try {
			list = session.selectList("CommunityMapper.communityList", community);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getCommunityListCount(Community community) {

		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("CommunityMapper.communityListCount", community);
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public Community getCommunity(int no) {

		SqlSession session = sessionFactory.openSession();
		Community community = new Community();
		try {
			community = session.selectOne("CommunityMapper.community", no);
		} finally {
			session.close();
		}
		return community;
	}

	@Override
	public Community getCommunityNext(Community community) {

		SqlSession session = sessionFactory.openSession();
		try {
			community = session.selectOne("CommunityMapper.communityNext", community);
		} finally {
			session.close();
		}
		return community;
	}

	@Override
	public Community getCommunityPrev(Community community) {

		SqlSession session = sessionFactory.openSession();
		try {
			community = session.selectOne("CommunityMapper.communityPrev", community);
		} finally {
			session.close();
		}
		return community;
	}

	@Override
	public int setCommunityHit(int no) {

		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.update("CommunityMapper.communityHit", no);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public List<Ripple> getCommunityRippleList(Ripple ripple) {

		SqlSession session = sessionFactory.openSession();
		List<Ripple> list;
		try {
			list = session.selectList("CommunityMapper.getCommunityRippleList", ripple);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getCommunityRippleListCount(Ripple ripple) {

		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.selectOne("CommunityMapper.getCommunityRippleListCount", ripple);
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setCommunityRippleInsert(Ripple ripple) {

		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("CommunityMapper.setCommunityRippleInsert", ripple);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setCommunityRippleUpdate(Ripple ripple) {

		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.update("CommunityMapper.setCommunityRippleUpdate", ripple);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setCommunityRippleDelete(Ripple ripple) {

		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.delete("CommunityMapper.setCommunityRippleDelete", ripple);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public List<Market> getMarketList(Market market) {

		SqlSession session = sessionFactory.openSession();
		List<Market> list = null;
		try {
			list = session.selectList("CommunityMapper.marketList", market);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getMarketListCount(Market market) {

		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("CommunityMapper.marketListCount", market);
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public Market getMarket(int no) {

		SqlSession session = sessionFactory.openSession();
		Market market = new Market();
		try {
			market = session.selectOne("CommunityMapper.marketSelect", no);
		} finally {
			session.close();
		}
		return market;
	}

	@Override
	public Market getMarketNext(Market market) {

		SqlSession session = sessionFactory.openSession();
		try {
			market = session.selectOne("CommunityMapper.marketSelectNext", market);
		} finally {
			session.close();
		}
		return market;
	}

	@Override
	public Market getMarketPrev(Market market) {

		SqlSession session = sessionFactory.openSession();
		try {
			market = session.selectOne("CommunityMapper.marketSelectPrev", market);
		} finally {
			session.close();
		}
		return market;
	}

	@Override
	public int setMarketHit(int no) {

		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.update("CommunityMapper.marketHit", no);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setMarketInsert(Market market) {

		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.insert("CommunityMapper.marketInsert", market);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setMarketUpdate(Market market) {

		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.update("CommunityMapper.marketUpdate", market);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setMarketDelete(int no) {

		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.delete("CommunityMapper.marketDelete", no);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setMarketSellUpdate(int no) {

		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.update("CommunityMapper.marketSellUpdate", no);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public List<Job> getJobList(Job job) {

		SqlSession session = sessionFactory.openSession();
		List<Job> list = null;
		try {
			list = session.selectList("CommunityMapper.jobList", job);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getJobListCount(Job job) {

		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("CommunityMapper.jobListCount", job);
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public Job getJob(int job_no) {

		SqlSession session = sessionFactory.openSession();
		Job job = new Job();
		try {
			job = session.selectOne("CommunityMapper.jobSelect", job_no);
		} finally {
			session.close();
		}
		return job;
	}

	@Override
	public Job getJobNext(Job job) {

		SqlSession session = sessionFactory.openSession();
		try {
			job = session.selectOne("CommunityMapper.jobSelectNext", job);
		} finally {
			session.close();
		}
		return job;
	}

	@Override
	public Job getJobPrev(Job job) {

		SqlSession session = sessionFactory.openSession();
		try {
			job = session.selectOne("CommunityMapper.jobSelectPrev", job);
		} finally {
			session.close();
		}
		return job;
	}

	@Override
	public int setJobHit(int job_no) {

		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.update("CommunityMapper.jobHit", job_no);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setJobInsert(HashMap map) {

		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.insert("CommunityMapper.jobInsert", map);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setJobUpdate(HashMap map) {

		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.update("CommunityMapper.jobUpdate", map);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setJobDelete(int job_no) {

		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.delete("CommunityMapper.jobDelete", job_no);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public List<Qna> getQnaList(Qna qna) {

		SqlSession session = sessionFactory.openSession();
		List<Qna> list = null;
		try {
			list = session.selectList("CommunityMapper.qnaList", qna);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getQnaListCount(Qna qna) {

		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("CommunityMapper.qnaListCount", qna);
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public Qna getQna(int no) {

		SqlSession session = sessionFactory.openSession();
		Qna qna = new Qna();
		try {
			qna= session.selectOne("CommunityMapper.qnaSelect", no);
		} finally {
			session.close();
		}
		return qna;
	}

	@Override
	public Qna getQnaNext(Qna qna) {

		SqlSession session = sessionFactory.openSession();
		try {
			qna = session.selectOne("CommunityMapper.qnaSelectNext", qna);
		} finally {
			session.close();
		}
		return qna;
	}

	@Override
	public Qna getQnaPrev(Qna qna) {

		SqlSession session = sessionFactory.openSession();
		try {
			qna = session.selectOne("CommunityMapper.qnaSelectPrev", qna);
		} finally {
			session.close();
		}
		return qna;
	}

	@Override
	public int setQnaHit(int no) {

		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.update("CommunityMapper.qnaHit", no);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setQnaInsert(Qna qna) {

		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.insert("CommunityMapper.qnaInsert", qna);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setQnaUpdate(Qna qna) {

		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.update("CommunityMapper.qnaUpdate", qna);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setQnaDelete(int no) {

		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.delete("CommunityMapper.qnaDelete", no);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public String getStoreNewReplyOrder(Ripple ripple) {
		SqlSession session = sessionFactory.openSession();
		String sNewReplyOrder = "";
		try {
			sNewReplyOrder = session.selectOne("CommunityMapper.getNewReplyOrder", ripple);
		} finally {
			session.close();
		}
		return sNewReplyOrder;
	}
}

