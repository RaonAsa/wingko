/*
 * @(#)UserDao.java  2013. 7. 23.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.List;
import java.util.Map;

import com.wingko.story.domain.Join;
import com.wingko.story.domain.Login;
import com.wingko.story.domain.Market;
import com.wingko.story.domain.Qna;
import com.wingko.story.domain.Ripple;
import com.wingko.story.domain.Search;
import com.wingko.story.domain.SelectData;
import com.wingko.story.domain.User;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 23.
 */
public interface UserDao {
	public int joinInsert(Join join);
	
	public User login(Login login);
	public int loginUpdate(int user_no);

	public int idCheck(String id);
	public int emailCheck(String email);
	public int nicknameCheck(String nickname);
	
	public User idSearch(User user);
	public User passwordSearch(User user);
	
	
	public User getUser(String user_id);
	public int setUpdateUser(Map userMap);
	public int setUpdatePassword(Map userMap);
	
	public List<SelectData> provinceId();
	public List<SelectData> cityId(String parent_code);
	public List<SelectData> areaId(String parent_code);
	
	public List<Search> getScrapList(Search search);
	public int getScrapListCount(Search search);
	
	public List<Market> getWriteList(Market market);
	public int getWriteListCount(Market market);
	public List<Qna> getWriteQnaList(Qna qna);
	public int getWriteQnaListCount(Qna qna);
	public List<Ripple> getWriteRippleList(Ripple ripple);
	public int getWriteRippleListCount(Ripple ripple);
}

