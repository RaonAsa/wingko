/*
 * @(#)AdDao.java  2013. 8. 29.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.HashMap;
import java.util.List;

import com.wingko.story.domain.AdData;
import com.wingko.story.domain.TopWord;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 29.
 */
public interface AdDao {
	public List<AdData> getMainTopAd();
	public List<AdData> getMainTopRightAd();
	public List<AdData> getMainTopBottomAd();
	public List<AdData> getAdList(int parentAdNo);
	public AdData getAd(int adNo);
	
	public void hitLog(HashMap map);
	
	public List<TopWord> getRank();
}

