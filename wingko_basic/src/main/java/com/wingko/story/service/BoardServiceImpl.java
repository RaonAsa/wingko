/*
 * @(#)BoardServiceImpl.java 2013. 8. 3.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wingko.story.dao.BoardDao;
import com.wingko.story.domain.Board;
 
/**
 * TODO
 *
 * @author  yshsy
 * @version 1.0,  2013. 8. 3.
 */
@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao dao;

	@Override
	public List<Board> getList(Board board) {
		// TODO Auto-generated method stub
		return dao.getList(board);
	}
	

	@Override
	public int getListCount(Board board) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public Board getBoard(Board board) {
		// TODO Auto-generated method stub
		return dao.getBoard(board);
	}

	@Override
	public int setInsert(Board board) {
		// TODO Auto-generated method stub
		return dao.setInsert(board);
	}

	@Override
	public int setUpdate(Board board) {
		// TODO Auto-generated method stub
		return dao.setUpdate(board);
	}

	@Override
	public int setDelete(Board board) {
		// TODO Auto-generated method stub
		return dao.setDelete(board);
	}


	@Override
	public void setUpdateHitCount(Board board) {
		// TODO Auto-generated method stub
		dao.setUpdateHitCount(board);
	}

}
