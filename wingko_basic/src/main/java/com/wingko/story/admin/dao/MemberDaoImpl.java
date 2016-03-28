/*
 * @(#)MemberDaoImpl.java  2013. 8. 12.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.JoinCode;
import com.wingko.story.domain.Login;
import com.wingko.story.domain.Member;
import com.wingko.story.domain.SelectData;
import com.wingko.story.domain.User;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 12.
 */
@Repository
public class MemberDaoImpl implements MemberDao {
	
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	
	@Override
	public Member login(Member member) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			member = session.selectOne("AdminMemberMapper.login", member);
		} finally {
			session.close();
		}
		return member;
	}

	
	@Override
	public List<Member> getList(Member member) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Member> list;
		try {
			list = session.selectList("AdminMemberMapper.list", member);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getListCount(Member member) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("AdminMemberMapper.listCount", member);
		} finally {
			session.close();
		}
		return count;
	}
	
	@Override
	public Member getMember(Member member) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			member = session.selectOne("AdminMemberMapper.member", member);
		} finally {
			session.close();
		}
		return member;
	}

	@Override
	public int getMemberUpdate(Member member) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.update("AdminMemberMapper.update", member);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public List<JoinCode> getJoinList(JoinCode joinCode) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<JoinCode> list;
		try {
			list = session.selectList("AdminMemberMapper.joinList", joinCode);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getJoinListCount(JoinCode joinCode) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int count = 0;
		try {
			count = session.selectOne("AdminMemberMapper.joinListCount", joinCode);
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public JoinCode getJoin(JoinCode joinCode) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		try {
			joinCode = session.selectOne("AdminMemberMapper.join", joinCode);
		} finally {
			session.close();
		}
		return joinCode;
	}

	@Override
	public int getJoinInsert(JoinCode joinCode) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.insert("AdminMemberMapper.joinInsert", joinCode);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int getJoinUpdate(JoinCode joinCode) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.update("AdminMemberMapper.joinUpdate", joinCode);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int getJoinDelete(JoinCode joinCode) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.delete("AdminMemberMapper.joinDelete", joinCode);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public List<SelectData> getJoinCode() {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<SelectData> list = new ArrayList<SelectData>();
		try {
			list = session.selectList("AdminMemberMapper.selectDataJoinList");
		} finally {
			session.close();
		}
		return list;
	}


}

