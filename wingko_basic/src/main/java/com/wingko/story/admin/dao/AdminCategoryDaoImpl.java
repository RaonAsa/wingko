/*
 * @(#)AdminCategoryDaoImpl.java  2013. 7. 24.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.Category;
import com.wingko.story.domain.CategoryLocation;
import com.wingko.story.domain.SelectData;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 24.
 */
@Repository
public class AdminCategoryDaoImpl implements AdminCategoryDao {

	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();

	@Override
	public List<Category> getList(Category category) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Category> list = new ArrayList<Category>();
		try {
			list = session.selectList("AdminCategoryMapper.list", category);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public Category getCategory(String category_no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		Category category;
		try {
			category = session.selectOne("AdminCategoryMapper.select", category_no);
		} finally {
			session.close();
		}
		return category;
	}

	@Override
	public int setInsert(Category category) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminCategoryMapper.insert", category);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setUpdate(Category category) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.update("AdminCategoryMapper.update", category);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setDelete(String category_no) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.delete("AdminCategoryMapper.delete", category_no);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public String getDepthForInsert(String category_no) {
		// TODO Auto-generated method stub
		String result = "";
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.selectOne("AdminCategoryMapper.getDepthForInsert", category_no);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public List<SelectData> getCategoryForSelect() {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<SelectData> list = new ArrayList<SelectData>();
		try {
			list = session.selectList("AdminCategoryMapper.getCategoryForSelect");
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public List<CategoryLocation> getCategoryLocationList(
			CategoryLocation categoryLocation) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<CategoryLocation> list = null;
		try {
			list = session.selectList("AdminCategoryMapper.categoryLocationList", categoryLocation);
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public CategoryLocation getCategoryLocation(int no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		CategoryLocation categoryLocation = new CategoryLocation();
		try {
			categoryLocation = session.selectOne("AdminCategoryMapper.categoryLocationSelect", no);
		} finally {
			session.close();
		}
		return categoryLocation;
	}

	@Override
	public int setCategoryLocationInsert(CategoryLocation categoryLocation) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.insert("AdminCategoryMapper.categoryLocationInsert", categoryLocation);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setCategoryLocationUpdate(CategoryLocation categoryLocation) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = -1;
		try {
			result = session.update("AdminCategoryMapper.categoryLocationUpdate", categoryLocation);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}
}

