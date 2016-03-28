/*
 * @(#)JsonService.java  2013. 8. 6.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.service;

import java.util.List;
import java.util.Map;

import com.wingko.story.domain.Store;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 6.
 */
public interface JsonService {

	
	public List<Store> getMapListByProduct(Map map);
}

