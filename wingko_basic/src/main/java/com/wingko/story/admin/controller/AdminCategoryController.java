/*
 * @(#)AdmincategoryController.java 2013. 7. 20.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wingko.story.admin.dao.AdminCategoryDao;
import com.wingko.story.domain.Category;
import com.wingko.story.domain.CategoryLocation;
import com.wingko.story.domain.SelectData;
 
/**
 * TODO
 *
 * @author  yshsy
 * @version 1.0,  2013. 7. 20.
 */
@Controller
@RequestMapping(value="/admin/category")
public class AdminCategoryController {

	private static Logger logger = LoggerFactory.getLogger(AdminCategoryController.class);

	@Autowired
	private AdminCategoryDao dao;

	@RequestMapping(value="/list.do")
	public String list(Model model, Category category) throws Exception {

		List<Category> list = dao.getList(category);
		List<SelectData> select = dao.getCategoryForSelect();
		
		model.addAttribute("select", select);
		model.addAttribute("list", list);
		model.addAttribute("category", category);
		model.addAttribute("leftMenu", "9");

		return "/admin/category/list";
	}
	
	
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String write(Model model, @RequestParam(value="category_no", required=false) String category_no, @RequestParam(value="org_category_no", defaultValue="") String org_category_no) throws Exception {
		if ( category_no != null && category_no.length() > 0 ) {
			Category category = dao.getCategory(category_no);
			model.addAttribute("category", category);
			model.addAttribute("org_category_no", org_category_no);
		} else {
			model.addAttribute("category", new Category());
		}

		List<SelectData> list = dao.getCategoryForSelect();
		model.addAttribute("selectData", list);
		model.addAttribute("leftMenu", "9");

		return "/admin/category/write";
	}


	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String insert(Model model, Category category, @RequestParam(value="org_category_no", defaultValue="") String org_category_no) throws Exception {

		String depth = dao.getDepthForInsert(category.getParent_category_no());
		if (depth == null) depth = "1";
		category.setDepth(depth);
		
		dao.setInsert(category);
		
		model.addAttribute("category_no", org_category_no);

		return "redirect:/admin/category/list.do";
	}

	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public String update(Model model, Category category, @RequestParam(value="org_category_no", defaultValue="") String org_category_no) throws Exception {
		
		String depth = dao.getDepthForInsert(category.getParent_category_no());
		if (depth == null) depth = "1";
		category.setDepth(depth);

		dao.setUpdate(category);
		
		model.addAttribute("category_no", org_category_no);

		return "redirect:/admin/category/list.do";
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public String delete(Model model, @RequestParam("category_no") String category_no, @RequestParam(value="org_category_no", defaultValue="") String org_category_no) throws Exception {

		dao.setDelete(category_no);
		
		model.addAttribute("category_no", org_category_no);

		return "redirect:/admin/category/list.do";
	}	

	
	@RequestMapping(value="/category_location.do")
	public String categoryLocation(Model model, CategoryLocation categoryLocation) throws Exception {

		List<CategoryLocation> list = dao.getCategoryLocationList(categoryLocation);

		model.addAttribute("list", list);
		model.addAttribute("categoryLocation", categoryLocation);
		model.addAttribute("leftMenu", "7");

		return "/admin/category/category_location";
	}
	
	@RequestMapping(value="/category_location_write.do", method=RequestMethod.GET)
	public String categoryLocationWrite(Model model, CategoryLocation categoryLocation) throws Exception {

		categoryLocation = dao.getCategoryLocation(categoryLocation.getNo());

		model.addAttribute("categoryLocation", categoryLocation);
		model.addAttribute("leftMenu", "7");

		return "/admin/category/category_location_write";
	}
	
	@RequestMapping(value="/category_location_write.do", method=RequestMethod.POST)
	public String categoryLocationWriteSubmit(Model model, CategoryLocation categoryLocation) throws Exception {

		dao.setCategoryLocationUpdate(categoryLocation);
		
		model.addAttribute("category_no", categoryLocation.getCategory_no());

		return "redirect:/admin/category/category_location.do";
	}
}
