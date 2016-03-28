/*
 * @(#)BoardDaoImpl.java 2013. 8. 3.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.Board;
import com.wingko.story.session.SqlSessionManager;
 
/**
 * TODO
 *
 * @author  yshsy
 * @version 1.0,  2013. 8. 3.
 */
@Repository
public class BoardDaoImpl implements BoardDao {

	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public List<Board> getList(Board board) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Board> list;
		try {
			list = session.selectList("BoardMapper.list", board);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public int getListCount(Board board) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("BoardMapper.listcount", board);
		} catch (Exception e) {
			// TODO: handle exception
			session.close();
		}
		return count;
	}

	@Override
	public Board getBoard(Board board) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			board = session.selectOne("BoardMapper.select", board);
		} finally {
			session.close();
		}
		return board;
	}

	@Override
	public int setInsert(Board board) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result;
		try {
			result = session.insert("BoardMapper.insert", board);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setUpdate(Board board) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result;
		try {
			result = session.update("BoardMapper.update", board);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setDelete(Board board) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result;
		try {
			result = session.delete("BoardMapper.delete", board);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public void setUpdateHitCount(Board board) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			session.update("BoardMapper.updateHitCount", board);
			session.commit();
		} finally {
			session.close();
		}
	}



}
