/*
 * @(#)AdDaoImpl.java  2013. 8. 29.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.AdData;
import com.wingko.story.domain.TopWord;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 29.
 */
@Repository
public class AdDaoImpl implements AdDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public List<AdData> getMainTopAd() {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<AdData> list;
		try {
			list = session.selectList("AdMapper.getMainTopAd");
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setLink( convertLink( list.get(i).getLink(), list.get(i).getNo() ) );
			}
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public List<AdData> getMainTopRightAd() {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<AdData> list;
		try {
			list = session.selectList("AdMapper.getMainTopRightAd");
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setLink( convertLink( list.get(i).getLink(), list.get(i).getNo() ) );
			}
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<AdData> getMainTopBottomAd() {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<AdData> list;
		try {
			list = session.selectList("AdMapper.getMainTopBottomAd");
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setLink( convertLink( list.get(i).getLink(), list.get(i).getNo() ) );
			}
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<AdData> getAdList(int parentAdNo) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<AdData> list;
		try {
			list = session.selectList("AdMapper.getAdList", parentAdNo);
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setLink( convertLink( list.get(i).getLink(), list.get(i).getNo() ) );
			}
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public AdData getAd(int adNo) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		AdData adData;
		try {
			adData = session.selectOne("AdMapper.getAd", adNo);
			adData.setLink( convertLink( adData.getLink(), adData.getNo() ) );
		} finally {
			session.close();
		}
		return adData;
	}

	@Override
	public void hitLog(HashMap map) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			session.insert("AdMapper.hitLog", map);
			session.commit();
		} finally {
			session.close();
		}
	}
	
	
	private String convertLink(String link, int no) {
		return "http://www.wingkostory.com/ad/log.do?no="+no+"&link="+URLEncoder.encode(link);
//		return "http://localhost:8080/ad/log.do?no="+no+"&link="+URLEncoder.encode(link);
	}

	@Override
	public List<TopWord> getRank() {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<TopWord> list;
		try {
			list = session.selectList("AdMapper.getRank");
		} finally {
			session.close();
		}
		return list;
	}

}

