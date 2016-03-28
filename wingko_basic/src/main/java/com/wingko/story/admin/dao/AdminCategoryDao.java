/*
 * @(#)AdminCategoryDao.java  2013. 7. 24.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.List;

import com.wingko.story.domain.Category;
import com.wingko.story.domain.CategoryLocation;
import com.wingko.story.domain.SelectData;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 24.
 */
public interface AdminCategoryDao {

	public List<Category> getList(Category category);
	public Category getCategory(String category_no);
	public int setInsert(Category category);
	public int setUpdate(Category category);
	public int setDelete(String category_no);
	
	public String getDepthForInsert(String category_no);
	public List<SelectData> getCategoryForSelect();
	
	
	public List<CategoryLocation> getCategoryLocationList(CategoryLocation categoryLocation);
	public CategoryLocation getCategoryLocation(int no);
	public int setCategoryLocationInsert(CategoryLocation categoryLocation);
	public int setCategoryLocationUpdate(CategoryLocation categoryLocation);
}

