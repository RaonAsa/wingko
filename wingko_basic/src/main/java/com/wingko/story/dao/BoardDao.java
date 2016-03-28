/*
 * @(#)BoardDao.java 2013. 8. 3.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.List;

import com.wingko.story.domain.Board;
 
/**
 * TODO
 *
 * @author  yshsy
 * @version 1.0,  2013. 8. 3.
 */
public interface BoardDao {

	
	public List<Board> getList(Board board);
	public int getListCount(Board board);
	public Board getBoard(Board board);
	public int setInsert(Board board);
	public int setUpdate(Board board);
	public int setDelete(Board board);
	public void setUpdateHitCount(Board board);
}
