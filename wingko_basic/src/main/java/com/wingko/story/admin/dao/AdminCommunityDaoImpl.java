/*
 * @(#)AdminCommunityDaoImpl.java  2013. 9. 10.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.Community;
import com.wingko.story.domain.Notice;
import com.wingko.story.domain.Qna;
import com.wingko.story.domain.Ripple;
import com.wingko.story.session.SqlSessionManager;

/**
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 10.
 */
@Repository
public class AdminCommunityDaoImpl implements AdminCommunityDao {

	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();
	
	@Override
	public List<Notice> getNoticeList(Notice notice) {
		SqlSession session = sessionFactory.openSession();
		List<Notice> list;
		try {
			list = session.selectList("AdminCommunityMapper.noticeList", notice);
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
			count = session.selectOne("AdminCommunityMapper.noticeListCount", notice);
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public Notice getNotice(int no) {
		SqlSession session = sessionFactory.openSession();
		Notice notce;
		try {
			notce = session.selectOne("AdminCommunityMapper.notice", no);
		} finally {
			session.close();
		}
		return notce;
	}

	@Override
	public int setNoticeInsert(Notice notice) {
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("AdminCommunityMapper.noticeInsert", notice);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setNoticeUpdate(Notice notice) {
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.update("AdminCommunityMapper.noticeUpdate", notice);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setNoticeDelete(int no) {
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.delete("AdminCommunityMapper.noticeDelete", no);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public List<Community> getCommunityList(Community community) {
		SqlSession session = sessionFactory.openSession();
		List<Community> list;
		try {
			list = session.selectList("AdminCommunityMapper.communityList", community);
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
			count = session.selectOne("AdminCommunityMapper.communityListCount", community);
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
			community = session.selectOne("AdminCommunityMapper.community", no);
		} finally {
			session.close();
		}
		return community;
	}

	@Override
	public int setCommunityInsert(HashMap map) {
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("AdminCommunityMapper.communityInsert", map);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setCommunityUpdate(HashMap map) {
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.update("AdminCommunityMapper.communityUpdate", map);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setCommunityDelete(int no) {
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.delete("AdminCommunityMapper.communityDelete", no);
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
			list = session.selectList("AdminCommunityMapper.qnaList", qna);
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
			count = session.selectOne("AdminCommunityMapper.qnaListCount", qna);
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
			qna = session.selectOne("AdminCommunityMapper.qna", no);
		} finally {
			session.close();
		}
		return qna;
	}

	@Override
	public int setQnaInsert(Qna qna) {
		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.insert("AdminCommunityMapper.qnaInsert", qna);
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
			result = session.update("AdminCommunityMapper.qnaUpdate", qna);
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
			result = session.delete("AdminCommunityMapper.qnaDelete", no);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setQnaDeleteRef(int ref) {
		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.delete("AdminCommunityMapper.qnaDeleteRef", ref);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int getUserReplyListCount(Ripple reply) {
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("AdminCommunityMapper.userreplyListCount", reply);
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public Collection<Ripple> getUserReplyList(Ripple reply) {
		SqlSession session = sessionFactory.openSession();
		List<Ripple> list = null;
		try {
			list = session.selectList("AdminCommunityMapper.userreplyList", reply);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int setReplyCheck(int no) {
		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.update("AdminCommunityMapper.userreplycheck", no);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

}

