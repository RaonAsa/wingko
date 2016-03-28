/*
 * @(#)WingCalender.java  2013. 8. 23.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.List;

import com.wingko.story.domain.Board;
import com.wingko.story.domain.WingCalender;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 23.
 */
public interface WingCalenderDao {
	public int setInsert(WingCalender calender);
	public int setUpdate(WingCalender calender);
	public int setDelete(WingCalender calender);
	
	public WingCalender getData(int calender_id);
	public List<WingCalender> getSearchList(WingCalender calender);
	public int getSearchCount(WingCalender calender);
	
	public List<WingCalender> getListDate(WingCalender calender);
	public List<WingCalender> getListMonth(WingCalender calender);
	
}

