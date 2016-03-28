/*
 * @(#)AdminStoreController.java  2013. 7. 25.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wingko.story.admin.dao.AdminStoreDao;
import com.wingko.story.domain.SelectData;
import com.wingko.story.domain.Store;
import com.wingko.story.domain.StoreCoupon;
import com.wingko.story.domain.StoreMenu;
import com.wingko.story.util.CommonUtil;
import com.wingko.story.util.MultipartRequestWithSameFileTag;
import com.wingko.story.util.PagedList;
import com.wingko.story.util.TimestampFileRenamePolicy;

/**
 * Admin Store Controller
 *
 * @author  ysh
 * @version 1.0,  2013. 7. 25.
 */
@Controller
@RequestMapping(value="/admin/store")
public class AdminStoreController {

	private static Logger logger = LoggerFactory.getLogger(AdminStoreController.class);

	@Autowired
	private AdminStoreDao dao;

//	int size = 10*1024*1024;
//	String uploadTempPath = "/home/wingko/www/root/upload/store";	// 실섭 경로
//	String urlPath = "http://www.wingkostory.com/upload/store/"; // 실섭 경로
//	String uploadTempPath = "/Users/baesunghan/Documents/workspace-sts/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/wingko_basic/upload/store";	// 회사 테스트경로
//	String urlPath = "http://localhost:8080/upload/store"; // 회사 경로
	// path를 config로 처리
	@Value("#{config['uploadTempPath']}") String uploadTempPath;
	@Value("#{config['urlPath']}") String urlPath;
	@Value("#{config['fileSize']}") Integer size;

	@RequestMapping("/list.do")
	public String list(Model model, Store store) {

		int totalCount = dao.getListCount(store);
		PagedList<Store> list = null;
		list = new PagedList<Store>(dao.getList(store), store.getPage(), store.getPageSize(), totalCount);

		List<SelectData> select = dao.getLocationForSelect();
		List<SelectData> selectCategory = dao.getCategoryForSelect();

		model.addAttribute("store", store);
		model.addAttribute("select", select);
		model.addAttribute("select_category", selectCategory);
		model.addAttribute("list", list);
		model.addAttribute("leftMenu", "10");

		return "/admin/store/list";
	}

	/**
	 * 상점 입력 폼
	 * 
	 * @param model
	 * @param store_no
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String write(Model model, @RequestParam(value="store_no", required=false) String store_no
			, @RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value="org_location_no", defaultValue="") String org_location_no
			, @RequestParam(value="org_category_no", defaultValue="") String org_category_no) throws Exception {
		if ( store_no != null && store_no.length() > 0) {
			Store store = dao.getStore(store_no);
			String language_service_etc = store.getLanguage_service();
			language_service_etc = CommonUtil.replaceAll(language_service_etc, "중국어", "");
			language_service_etc = CommonUtil.replaceAll(language_service_etc, "일어", "");
			language_service_etc = CommonUtil.replaceAll(language_service_etc, "영어", "");
			language_service_etc = CommonUtil.replaceAll(language_service_etc, ",", "");
			language_service_etc = language_service_etc.trim();
			String payment_etc = store.getPayment();
			payment_etc = CommonUtil.replaceAll(payment_etc, "위안화", "");
			payment_etc = CommonUtil.replaceAll(payment_etc, "달러", "");
			payment_etc = CommonUtil.replaceAll(payment_etc, ",", "");
			payment_etc = payment_etc.trim();			

			model.addAttribute("language_service_etc", language_service_etc);
			model.addAttribute("payment_etc", payment_etc);
			model.addAttribute("store", store);
			model.addAttribute("org_location_no", org_location_no);
			model.addAttribute("org_category_no", org_category_no);
		} else {
			model.addAttribute("store", new Store());
		}

		model.addAttribute("locationData", dao.getLocationForSelect());
		model.addAttribute("categoryData", dao.getCategoryForSelect());
		model.addAttribute("leftMenu", "10");
		model.addAttribute("page", page);

		return "/admin/store/write";
	}


	/**
	 * 상점 등록
	 * 
	 * @param req
	 * @param store
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String insert(HttpServletRequest req) throws Exception {
		HashMap<String, String> params = new HashMap<String, String>();
		
		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(req, uploadTempPath + "/store", size, "UTF-8", new TimestampFileRenamePolicy());

			Enumeration enumeration = multi.getParameterNames();
			while (enumeration.hasMoreElements()) {
				String string = (String) enumeration.nextElement();
				params.put(string, multi.getParameter(string));					
			}
			
			String[] languages = multi.getParameterValues("language_service");
			if (languages != null) {
				StringBuffer language = new StringBuffer();
				for (String v : languages) {
					language.append(v).append(", ");
				}
				language.append(multi.getParameter("language_service_etc"));
				params.put("language_service", language.toString());
			} else {
				params.put("language_service", multi.getParameter("language_service_etc"));
			}

			String[] payments = multi.getParameterValues("payment");
			if (payments != null) {
				StringBuffer payment = new StringBuffer();
				for (String v : payments) {
					payment.append(v).append(", ");
				}
				payment.append(multi.getParameter("payment_etc"));
				params.put("payment", payment.toString());				
			} else {
				params.put("payment", multi.getParameter("payment_etc"));
			}


			Set<String> set = multi.getFileNames();
			for (String string : set) {
				params.put(string, multi.getFilesystemName(string));
			}

			logger.debug("write - params : {}", params.toString());
			
			dao.setInsert(params);
			
		} catch (Exception e) {
			e.printStackTrace();
		}


		return "redirect:/admin/store/list.do?page="+params.get("page");
	}

	/**
	 * 상점 수정
	 * 
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public String update(HttpServletRequest req) throws Exception {
		HashMap<String, String> params = new HashMap<String, String>();
		
		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(req, uploadTempPath + "/store", size, "UTF-8", new TimestampFileRenamePolicy());

			Enumeration enumeration = multi.getParameterNames();
			while (enumeration.hasMoreElements()) {
				String string = (String) enumeration.nextElement();
				params.put(string, multi.getParameter(string));					
			}
			
			String[] languages = multi.getParameterValues("language_service");
			if (languages != null) {
				StringBuffer language = new StringBuffer();
				for (String v : languages) {
					language.append(v).append(", ");
				}
				language.append(multi.getParameter("language_service_etc"));
				params.put("language_service", language.toString());
			} else {
				params.put("language_service", multi.getParameter("language_service_etc"));
			}

			String[] payments = multi.getParameterValues("payment");
			if (payments != null) {
				StringBuffer payment = new StringBuffer();
				for (String v : payments) {
					payment.append(v).append(", ");
				}
				payment.append(multi.getParameter("payment_etc"));
				params.put("payment", payment.toString());				
			} else {
				params.put("payment", multi.getParameter("payment_etc"));
			}
			
			Set<String> set = multi.getFileNames();
			for (String string : set) {
				params.put(string, multi.getFilesystemName(string));
			}

			logger.debug("update - params : {}", params.toString());

			dao.setUpdate(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		return "redirect:/admin/store/list.do?location_no="+params.get("org_location_no")+"&category_no="+params.get("org_category_no")+"&page="+params.get("page");
	}
	
	
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public String delete(@RequestParam(value="store_no", required=false) String store_no) throws Exception {

		dao.setDelete(store_no);

		return "redirect:/admin/store/list.do";
	}	
	
	@RequestMapping(value="/view.do", method=RequestMethod.GET)
	public String view(Model model, @RequestParam(value="store_no", required=false) String store_no) throws Exception {
		Store store = dao.getStore(store_no);
		model.addAttribute("store", store);
		model.addAttribute("leftMenu", "10");

		return "/admin/store/view";
	}

	
	/**
	 * 상점 등록 에디터에서 전송하는 이미지
	 * 
	 * @param req
	 * @param res
	 */
	@RequestMapping(value="/imageupload_editor.do", method=RequestMethod.POST)
	public void imageupload_editor(HttpServletRequest req, HttpServletResponse res) {

		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(req, uploadTempPath + "/store", size, "UTF-8", new TimestampFileRenamePolicy());

			String fileName = multi.getFilesystemName("upload");
			String CKEditorFuncNum = multi.getParameter("CKEditorFuncNum");
			String langCode = multi.getParameter("langCode");
			String CKEditor = multi.getParameter("CKEditor");

			res.setCharacterEncoding("utf-8");
			res.setContentType("text/html");
			res.getWriter().write("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction('"+CKEditorFuncNum+"', '" + urlPath + "store" +fileName + "', '업로드 완료');</script>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	@RequestMapping("/menu_list.do")
	public String menu(Model model, StoreMenu storeMenu, @RequestParam(value="page", defaultValue="1") int page) {
		
		List<StoreMenu> list = dao.getStoreMenuList(storeMenu);

		model.addAttribute("storeMenu", storeMenu);
		model.addAttribute("list", list);
		model.addAttribute("leftMenu", "10");
		model.addAttribute("page", page);

		return "/admin/store/menu_list";
	}
	
	@RequestMapping(value="/menu_write.do", method=RequestMethod.GET)
	public String menuWrite(Model model, StoreMenu storeMenu, @RequestParam(value="page", defaultValue="1") int page) {
		if ( storeMenu.getMenu_no() > 0) {
			storeMenu = dao.getStoreMenu(storeMenu);
		}
		model.addAttribute("storeMenu", storeMenu);
		model.addAttribute("leftMenu", "10");
		model.addAttribute("page", page);

		return "/admin/store/menu_write";
	}

	/**
	 * 메뉴 등록
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/menu_write.do", method=RequestMethod.POST)
	public String menuWriteSubmit(HttpServletRequest req, Model model) {
		HashMap<String, String> params = new HashMap<String, String>();
		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(req, uploadTempPath+"/store/menu", size, "UTF-8", new TimestampFileRenamePolicy());

			Enumeration enumeration = multi.getParameterNames();
			while (enumeration.hasMoreElements()) {
				String string = (String) enumeration.nextElement();
				params.put(string, multi.getParameter(string));					
			}
			Set<String> set = multi.getFileNames();
			for (String string : set) {
				params.put(string, multi.getFilesystemName(string));
			}
			dao.setStoreMenuInsert(params);
			model.addAttribute("store_no", params.get("store_no"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/admin/store/menu_list.do?page="+params.get("page");
	}
	
	
	/**
	 * 메뉴 수정
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/menu_update.do", method=RequestMethod.POST)
	public String menuUpdateSubmit(HttpServletRequest req, Model model) {
		HashMap<String, String> params = new HashMap<String, String>();
		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(req, uploadTempPath+"/store/menu", size, "UTF-8", new TimestampFileRenamePolicy());

			Enumeration enumeration = multi.getParameterNames();
			while (enumeration.hasMoreElements()) {
				String string = (String) enumeration.nextElement();
				params.put(string, multi.getParameter(string));					
			}
			Set<String> set = multi.getFileNames();
			for (String string : set) {
				params.put(string, multi.getFilesystemName(string));
			}
			dao.setStoreMenuUpdate(params);
			model.addAttribute("store_no", params.get("store_no"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		return "redirect:/admin/store/menu_list.do?page="+params.get("page");
	}
	
	
	
	@RequestMapping("/coupon_list.do")
	public String coupon(Model model, StoreCoupon storeCoupon, @RequestParam(value="page", defaultValue="1") int page) {
		
		List<StoreCoupon> list = dao.getStoreCouponList(storeCoupon);

		model.addAttribute("storeCoupon", storeCoupon);
		model.addAttribute("list", list);
		model.addAttribute("leftMenu", "10");
		model.addAttribute("page", page);

		return "/admin/store/coupon_list";
	}
	
	@RequestMapping(value="/coupon_write.do", method=RequestMethod.GET)
	public String couponWrite(Model model, StoreCoupon storeCoupon, @RequestParam(value="page", defaultValue="1") int page) {
		if ( storeCoupon.getCoupon_no() > 0) {
			storeCoupon = dao.getStoreCoupon(storeCoupon);
		}
		model.addAttribute("storeCoupon", storeCoupon);
		model.addAttribute("leftMenu", "10");
		model.addAttribute("page", page);

		return "/admin/store/coupon_write";
	}

	/**
	 * 쿠폰 등록
	 * 
	 * @param req
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/coupon_write.do", method=RequestMethod.POST)
	public String couponWriteSubmit(HttpServletRequest req, Model model) {
		HashMap<String, String> params = new HashMap<String, String>();
		
		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(req, uploadTempPath+"/store/coupon", size, "UTF-8", new TimestampFileRenamePolicy());

			Enumeration enumeration = multi.getParameterNames();
			while (enumeration.hasMoreElements()) {
				String string = (String) enumeration.nextElement();
				params.put(string, multi.getParameter(string));					
			}
			Set<String> set = multi.getFileNames();
			for (String string : set) {
				params.put(string, multi.getFilesystemName(string));
			}
			dao.setStoreCouponInsert(params);
			model.addAttribute("store_no", params.get("store_no"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/admin/store/coupon_list.do?page="+params.get("page");
	}
	
	
	/**
	 * 메뉴 수정
	 * 
	 * @param req
	 * @param model
	 * @param store_no
	 * @return
	 */
	@RequestMapping(value="/coupon_update.do", method=RequestMethod.POST)
	public String couponUpdateSubmit(HttpServletRequest req, Model model) {
		HashMap<String, String> params = new HashMap<String, String>();
		try {
			MultipartRequestWithSameFileTag multi = null;
			multi = new MultipartRequestWithSameFileTag(req, uploadTempPath+"/store/coupon", size, "UTF-8", new TimestampFileRenamePolicy());

			Enumeration enumeration = multi.getParameterNames();
			while (enumeration.hasMoreElements()) {
				String string = (String) enumeration.nextElement();
				params.put(string, multi.getParameter(string));					
			}
			Set<String> set = multi.getFileNames();
			for (String string : set) {
				params.put(string, multi.getFilesystemName(string));
			}
			dao.setStoreCouponUpdate(params);
			model.addAttribute("store_no", params.get("store_no"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		return "redirect:/admin/store/coupon_list.do?page="+params.get("page");
	}
	
}

