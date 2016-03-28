/*
 * @(#)MemberDao.java  2013. 8. 12.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.List;

import com.wingko.story.domain.JoinCode;
import com.wingko.story.domain.Login;
import com.wingko.story.domain.Member;
import com.wingko.story.domain.SelectData;
import com.wingko.story.domain.User;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 12.
 */
public interface MemberDao {
	
	public Member login(Member member);

	public List<Member> getList(Member member);
	public int getListCount(Member member);
	public Member getMember(Member member);
	public int getMemberUpdate(Member member);
	
	public List<JoinCode> getJoinList(JoinCode joinCode);
	public int getJoinListCount(JoinCode joinCode);
	public JoinCode getJoin(JoinCode joinCode);
	public int getJoinInsert(JoinCode joinCode);
	public int getJoinUpdate(JoinCode joinCode);
	public int getJoinDelete(JoinCode joinCode);
	
	
	public List<SelectData> getJoinCode();
}

