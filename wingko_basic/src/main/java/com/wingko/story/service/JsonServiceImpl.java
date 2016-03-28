/*
 * @(#)JsonServiceImpl.java  2013. 8. 6.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wingko.story.dao.JsonDao;
import com.wingko.story.domain.Store;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 6.
 */
@Service
public class JsonServiceImpl implements JsonService {
	@Autowired
	JsonDao dao;

	@Override
	public List<Store> getMapListByProduct(Map map) {
		// TODO Auto-generated method stub
		return dao.getMapListByProduct(map);
	}
}

