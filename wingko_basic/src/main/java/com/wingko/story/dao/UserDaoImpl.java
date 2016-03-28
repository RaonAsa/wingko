/*
 * @(#)UserDaoImpl.java  2013. 7. 23.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.Join;
import com.wingko.story.domain.Login;
import com.wingko.story.domain.Market;
import com.wingko.story.domain.Qna;
import com.wingko.story.domain.Ripple;
import com.wingko.story.domain.Search;
import com.wingko.story.domain.SelectData;
import com.wingko.story.domain.User;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 23.
 */
@Repository
public class UserDaoImpl implements UserDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public int joinInsert(Join join) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("UserMapper.insert", join);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int emailCheck(String email) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.selectOne("UserMapper.emailcheck", email);
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int idCheck(String id) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.selectOne("UserMapper.idcheck", id);
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int nicknameCheck(String nickname) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.selectOne("UserMapper.nicknamecheck", nickname);
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public User idSearch(User user) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			user = session.selectOne("UserMapper.idSearch", user);
		} finally {
			session.close();
		}
		return user;
	}

	@Override
	public User passwordSearch(User user) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			user = session.selectOne("UserMapper.passwordSearch", user);
		} finally {
			session.close();
		}
		return user;
	}

	@Override
	public User login(Login login) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		User user;
		try {
			user = session.selectOne("UserMapper.login", login);
		} finally {
			session.close();
		}
		return user;
	}
	

	@Override
	public int loginUpdate(int user_no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.update("UserMapper.loginUpdate", user_no);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public User getUser(String user_id) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		User user;
		try {
			user = session.selectOne("UserMapper.select", user_id);
		} finally {
			session.close();
		}
		return user;
	}

	@Override
	public int setUpdateUser(Map userMap) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.update("UserMapper.update", userMap);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setUpdatePassword(Map userMap) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.update("UserMapper.updatePassword", userMap);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public List<SelectData> provinceId() {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<SelectData> list;
		try {
			list = session.selectList("provinceId");
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<SelectData> cityId(String parent_code) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<SelectData> list;
		try {
			list = session.selectList("cityId", parent_code);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<SelectData> areaId(String parent_code) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<SelectData> list;
		try {
			list = session.selectList("areaId", parent_code);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<Search> getScrapList(Search search) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Search> list = new ArrayList<Search>();
		try {
			list = session.selectList("UserMapper.getScrapList", search);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getScrapListCount(Search search) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("UserMapper.getScrapListCount", search);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public List<Market> getWriteList(Market market) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Market> list = new ArrayList<Market>();
		try {
			list = session.selectList("UserMapper.getWriteList", market);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getWriteListCount(Market market) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("UserMapper.getWriteListCount", market);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public List<Qna> getWriteQnaList(Qna qna) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Qna> list = new ArrayList<Qna>();
		try {
			list = session.selectList("UserMapper.getWriteQnaList", qna);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getWriteQnaListCount(Qna qna) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("UserMapper.getWriteQnaListCount", qna);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public List<Ripple> getWriteRippleList(Ripple ripple) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Ripple> list = new ArrayList<Ripple>();
		try {
			list = session.selectList("UserMapper.getWriteRippleList", ripple);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getWriteRippleListCount(Ripple ripple) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("UserMapper.getWriteRippleListCount", ripple);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return count;
	}


}

