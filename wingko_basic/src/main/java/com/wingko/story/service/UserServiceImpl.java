/*
 * @(#)UserServiceImpl.java  2013. 7. 23.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wingko.story.dao.UserDao;
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
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao dao;


	@Override
	public int joinInsert(Join join) {
		// TODO Auto-generated method stub
//		user.setUser_id(CommonUtil.toUTF8(user.getUser_id()));
//		user.setUser_name(CommonUtil.toUTF8(user.getUser_name()));
//		user.setUser_nickname(CommonUtil.toUTF8(user.getUser_nickname()));

		return dao.joinInsert(join);
	}
	
	@Override
	public String emailCheck(String email) {
		// TODO Auto-generated method stub
		int result = dao.emailCheck(email);
		if (result == 0) {
			return "Y";
		} else {
			return "N";	
		}
	}

	@Override
	public String idCheck(String id) {
		// TODO Auto-generated method stub
		int result = dao.idCheck(id);
		if (result == 0) {
			return "Y";
		} else {
			return "N";	
		}
	}

	@Override
	public String nicknameCheck(String nickname) {
		// TODO Auto-generated method stub
		int result = dao.nicknameCheck(nickname);
		if (result == 0) {
			return "Y";
		} else {
			return "N";	
		}
	}

	@Override
	public User idSearch(User user) {
		// TODO Auto-generated method stub
		return dao.idSearch(user);
	}

	@Override
	public User passwordSearch(User user) {
		// TODO Auto-generated method stub
		return dao.passwordSearch(user);
	}

	@Override
	public User login(Login login) {
		// TODO Auto-generated method stub
		return dao.login(login);
	}
	

	@Override
	public int loginUpdate(int user_no) {
		// TODO Auto-generated method stub
		return dao.loginUpdate(user_no);
	}

	@Override
	public User getUser(String user_id) {
		// TODO Auto-generated method stub
		return dao.getUser(user_id);
	}

	@Override
	public int setUpdateUser(Map userMap) {
		// TODO Auto-generated method stub
		return dao.setUpdateUser(userMap);
	}
	
	@Override
	public int setUpdatePassword(Map userMap) {
		// TODO Auto-generated method stub
		return dao.setUpdatePassword(userMap);
	}

	@Override
	public List<SelectData> provinceId() {
		// TODO Auto-generated method stub
		return dao.provinceId();
	}

	@Override
	public List<SelectData> cityId(String parent_code) {
		// TODO Auto-generated method stub
		return dao.cityId(parent_code);
	}

	@Override
	public List<SelectData> areaId(String parent_code) {
		// TODO Auto-generated method stub
		return dao.areaId(parent_code);
	}

	@Override
	public List<Search> getScrapList(Search search) {
		// TODO Auto-generated method stub
		return dao.getScrapList(search);
	}

	@Override
	public int getScrapListCount(Search search) {
		// TODO Auto-generated method stub
		return dao.getScrapListCount(search);
	}

	@Override
	public List<Market> getWriteList(Market market) {
		// TODO Auto-generated method stub
		return dao.getWriteList(market);
	}

	@Override
	public int getWriteListCount(Market market) {
		// TODO Auto-generated method stub
		return dao.getWriteListCount(market);
	}

	@Override
	public List<Qna> getWriteQnaList(Qna qna) {
		// TODO Auto-generated method stub
		return dao.getWriteQnaList(qna);
	}

	@Override
	public int getWriteQnaListCount(Qna qna) {
		// TODO Auto-generated method stub
		return dao.getWriteQnaListCount(qna);
	}

	@Override
	public List<Ripple> getWriteRippleList(Ripple ripple) {
		// TODO Auto-generated method stub
		return dao.getWriteRippleList(ripple);
	}

	@Override
	public int getWriteRippleListCount(Ripple ripple) {
		// TODO Auto-generated method stub
		return dao.getWriteRippleListCount(ripple);
	}



}

