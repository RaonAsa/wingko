/*
 * @(#)AdminCouponController.java  2013. 8. 12.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.wingko.story.admin.dao.PayCardDao;
import com.wingko.story.admin.dao.PayItemDao;
import com.wingko.story.admin.dao.PayMainDao;
import com.wingko.story.admin.dao.PayRefundDao;
import com.wingko.story.domain.GenericExcelView;
import com.wingko.story.domain.PayAcount;
import com.wingko.story.domain.PayCard;
import com.wingko.story.domain.PayItem;
import com.wingko.story.domain.PayMain;
import com.wingko.story.domain.PayMainSearch;
import com.wingko.story.domain.PayRefund;
import com.wingko.story.domain.SelectData;
import com.wingko.story.inipay.InipayWingko;
import com.wingko.story.util.DateUtil;
import com.wingko.story.util.JSONUtil;
import com.wingko.story.util.PagedList;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 12.
 */
@Controller
@RequestMapping(value="/admin/paymgr")
public class AdminPayMgrController {
	private static Logger logger = LoggerFactory.getLogger(AdminPayMgrController.class);
	
	@Autowired
	private PayMainDao dao_main;
	@Autowired
	private PayItemDao dao_item;
	@Autowired
	private PayCardDao dao_card;
	@Autowired
	private PayRefundDao dao_refund;
	
	
	
	/*//
	// test insert data
	@RequestMapping(value="/sample_insert.do", method=RequestMethod.GET)
	public String list(HttpServletRequest request) throws Exception {
		
		for(int i=0; i< 5; ++i)
		{
			
			PayMain pmain = new PayMain();
			pmain.setPid( PayMain.createPID() );
			pmain.setUser_no(9999);
			pmain.setUser_id("user_id");
			pmain.setUser_name("윙코");
			pmain.setUser_email("test@wingkostory.com");
			pmain.setUser_phone("010-1234-5678");
			pmain.setPay_state("10");
			pmain.setPay_type("20");
			pmain.setPay_title("물품 구매 테스트 - " + String.format("%03d", i));
			pmain.setPay_price_ko(12500);
			pmain.setPay_price_cn(98);
			pmain.setCancel_price(0);
			pmain.setSale_price(0);
			
			dao_main.setInsert(pmain);
		}
		return "redirect:banklist.do";
	}
	//*/

	@RequestMapping(value="/banklist.do", method=RequestMethod.GET)
	public String list(Model model, PayMainSearch search) throws Exception {
		
		if(search == null){
			search = new PayMainSearch();
		}
		search.setPay_method(PayMain.PAYMETHOD_BANK);
		if(search.getPay_type() == null || search.getPay_type().equals("") ){
			search.setPay_type(PayMain.PAYTYPE_STORE);
		}
		
		
		int totalCount = dao_main.getSearchCount(search);
		PagedList<PayMain> list = new PagedList<PayMain>(dao_main.getSearchList(search), search.getPage(), search.getPageSize(), totalCount);
		
		model.addAttribute("leftMenu", "21");
		model.addAttribute("select_type", dao_main.getTypeSelect());
		model.addAttribute("select_state", dao_main.getStateSelect());
		
		model.addAttribute("paymain", search);
		model.addAttribute("list", list);
		
		return "/admin/paymgr/banklist";
	}
	
	@RequestMapping(value="/paybank.do", method=RequestMethod.GET)
	public String paybank(Model model, PayMainSearch search) throws Exception {
		
		if(search == null){
			search = new PayMainSearch();
		}
		search.setPay_method(PayMain.PAYMETHOD_BANK);
		search.setPay_type(PayMain.PAYTYPE_STORE);
		if(search.getPay_state() == null || search.getPay_state().length() == 0){
			search.setPay_state(PayMain.PAYSTATE_PAY_ALLSEARCH);
		}

		
		int totalCount = dao_main.getSearchStatusCount(search);
		PagedList<PayMain> list = new PagedList<PayMain>(dao_main.getSearchListStatus(search), search.getPage(), search.getPageSize(), totalCount);

		
		model.addAttribute("leftMenu", "21");
		model.addAttribute("select_method", dao_main.getMethodSelect());
		model.addAttribute("select_type", dao_main.getTypeSelect());
		model.addAttribute("select_state_all", PayMain.PAYSTATE_PAY_ALLSEARCH);
		model.addAttribute("select_state", dao_main.getStateSelectPay());
		
		model.addAttribute("paymain", search);
		model.addAttribute("list", list);
		
		return "/admin/paymgr/paybank";
	}
	
	@RequestMapping(value="/paycard.do", method=RequestMethod.GET)
	public String paycard(Model model, PayMainSearch search) throws Exception {
		
		if(search == null){
			search = new PayMainSearch();
		}
		search.setPay_method(PayMain.PAYMETHOD_CARD);
		search.setPay_type(PayMain.PAYTYPE_STORE);
		if(search.getPay_state() == null || search.getPay_state().length() == 0){
			search.setPay_state(PayMain.PAYSTATE_PAY_ALLSEARCH);
		}
		
		
		int totalCount = dao_main.getSearchStatusCount(search);
		PagedList<PayMain> list = new PagedList<PayMain>(dao_main.getSearchListStatus(search), search.getPage(), search.getPageSize(), totalCount);

		
		model.addAttribute("leftMenu", "22");
		model.addAttribute("select_method", dao_main.getMethodSelect());
		model.addAttribute("select_type", dao_main.getTypeSelect());
		model.addAttribute("select_state", dao_main.getStateSelectPay());
		
		model.addAttribute("paymain", search);
		model.addAttribute("list", list);
		
		return "/admin/paymgr/paycard";
	}
	
	@RequestMapping(value="/payreserve.do", method=RequestMethod.GET)
	public String payreserve(Model model, PayMainSearch search) throws Exception {
		
		if(search == null){
			search = new PayMainSearch();
		}
		search.setPay_type(PayMain.PAYTYPE_RESERVATION);
		if(search.getPay_state() == null || search.getPay_state().length() == 0){
			search.setPay_state(PayMain.PAYSTATE_PAY_ALLSEARCH);
		}

		
		int totalCount = dao_main.getSearchStatusCount(search);
		PagedList<PayMain> list = new PagedList<PayMain>(dao_main.getSearchListStatus(search), search.getPage(), search.getPageSize(), totalCount);

		
		model.addAttribute("leftMenu", "23");
		model.addAttribute("select_method", dao_main.getMethodSelect());
		model.addAttribute("select_type", dao_main.getTypeSelect());
		model.addAttribute("select_state_all", PayMain.PAYSTATE_PAY_ALLSEARCH);
		model.addAttribute("select_state", dao_main.getStateSelectPay());
		
		model.addAttribute("paymain", search);
		model.addAttribute("list", list);
		
		return "/admin/paymgr/payreserve";
	}
	
	@RequestMapping(value="/paydeal.do", method=RequestMethod.GET)
	public String paydeal(Model model, PayMainSearch search) throws Exception {
		
		if(search == null){
			search = new PayMainSearch();
		}
		search.setPay_method("");
		search.setPay_type(PayMain.PAYTYPE_DEAL);
		if(search.getPay_state() == null || search.getPay_state().length() == 0){
			search.setPay_state(PayMain.PAYSTATE_PAY_ALLSEARCH);
		}

		
		int totalCount = dao_main.getSearchStatusCount(search);
		PagedList<PayMain> list = new PagedList<PayMain>(dao_main.getSearchListStatus(search), search.getPage(), search.getPageSize(), totalCount);

		
		model.addAttribute("leftMenu", "24");
		model.addAttribute("select_method", dao_main.getMethodSelect());
		model.addAttribute("select_type", dao_main.getTypeSelect());
		model.addAttribute("select_state_all", PayMain.PAYSTATE_PAY_ALLSEARCH);
		model.addAttribute("select_state", dao_main.getStateSelectPay());
		
		model.addAttribute("paymain", search);
		model.addAttribute("list", list);
		
		return "/admin/paymgr/paydeal";
	}
	
	@RequestMapping(value="/paycancel.do", method=RequestMethod.GET)
	public String paycancel(Model model, PayMainSearch search) throws Exception {
		
		if(search == null){
			search = new PayMainSearch();
		}
		
		if(search.getPay_state() == null || search.getPay_state().length() == 0){
			search.setPay_state(PayMain.PAYSTATE_REFUND_ALLSEARCH);
		}

		
		int totalCount = dao_main.getSearchStatusCount(search);
		PagedList<PayMain> list = new PagedList<PayMain>(dao_main.getSearchListStatus(search), search.getPage(), search.getPageSize(), totalCount);

		
		model.addAttribute("leftMenu", "25");
		model.addAttribute("select_method", dao_main.getMethodSelect());
		model.addAttribute("select_type", dao_main.getTypeSelect());
		model.addAttribute("select_state_all", PayMain.PAYSTATE_REFUND_ALLSEARCH);
		model.addAttribute("select_state", dao_main.getStateSelectCancel());
		
		model.addAttribute("paymain", search);
		model.addAttribute("list", list);
		
		return "/admin/paymgr/paycancel";
	}
	
	@RequestMapping(value="/excel_list.do", method=RequestMethod.GET)
	public View excel_list(Map<String, Object> modelMap, PayMainSearch search) throws Exception {
		
		
		List<PayMain> list = dao_main.getSearchListStatus(search);
		
		
		List<String> colName = new ArrayList<String>();
		
		colName.add("주문번호");
		colName.add("결제타입");
		colName.add("이름");
		colName.add("ID");
		colName.add("전화번호");
		colName.add("주문금액CN");
		colName.add("주문금액KO");
		colName.add("결제금액CN");
		colName.add("결제금액KO");
		colName.add("결제방법");
		colName.add("상태");
		colName.add("주문일");
		
		List<Object> rowData = new ArrayList<Object>();
		
		for (PayMain payMain : list) {
			
			List<String> data = new ArrayList<String>();
			data.add(payMain.getPid());
			
			String selValue = "";
			List<SelectData> typeList = dao_main.getTypeSelect();
			for (SelectData selectData : typeList) {
				if(selectData.getValue().equals( payMain.getPay_type() )){
					selValue = selectData.getTitle();
					break;
				}
			}
			data.add(selValue);

			
			data.add(payMain.getUser_name());
			data.add(payMain.getUser_id());
			data.add(payMain.getUser_phone());
			data.add( Integer.toString(payMain.getPay_price_cn() ));
			data.add( Integer.toString(payMain.getPay_price_ko() ));
			data.add( Integer.toString(payMain.getSale_price_cn() ));
			data.add( Integer.toString(payMain.getSale_price_ko() ));
			
			
			List<SelectData> mehtodList = dao_main.getMethodSelect();
			for (SelectData selectData : mehtodList) {
				if(selectData.getValue().equals( payMain.getPay_method() )){
					selValue = selectData.getTitle();
					break;
				}
			}
			data.add(selValue);

			
			List<SelectData> stateList = dao_main.getStateSelect();
			for (SelectData selectData : stateList) {
				if(selectData.getValue().equals( payMain.getPay_state() )){
					selValue = selectData.getTitle();
					break;
				}
			}
			data.add(selValue);
			data.add(payMain.getReg_date());
			
			rowData.add(data);
			
		}
		
		
		String excel_name= "pay_" + DateUtil.getCurrentTimeByFormat("D");
		
		modelMap.put("excelName", excel_name);
		modelMap.put("colName", colName);
		modelMap.put("colValue", rowData);
		
		return new GenericExcelView();
	}
	
	@RequestMapping(value="/excel_select.do", method={RequestMethod.GET, RequestMethod.POST})
	public View excel_check(Map<String, Object> modelMap, HttpServletRequest request) throws Exception {
		
		String arrPid[] = request.getParameterValues("chk_pid");
		List<PayMain> list = dao_main.getCheckList(arrPid);

		
		List<String> colName = new ArrayList<String>();
		colName.add("주문번호");
		colName.add("결제타입");
		colName.add("이름");
		colName.add("ID");
		colName.add("전화번호");
		colName.add("주문금액CN");
		colName.add("주문금액KO");
		colName.add("결제금액CN");
		colName.add("결제금액KO");
		colName.add("결제방법");
		colName.add("상태");
		colName.add("주문일");

		List<Object> rowData = new ArrayList<Object>();
		
		for (PayMain payMain : list) {
			
			List<String> data = new ArrayList<String>();
			data.add(payMain.getPid());
			
			String selValue = "";
			List<SelectData> typeList = dao_main.getTypeSelect();
			for (SelectData selectData : typeList) {
				if(selectData.getValue().equals( payMain.getPay_type() )){
					selValue = selectData.getTitle();
					break;
				}
			}
			data.add(selValue);
			
			data.add(payMain.getUser_name());
			data.add(payMain.getUser_id());
			data.add(payMain.getUser_phone());
			data.add( Integer.toString(payMain.getPay_price_cn() ));
			data.add( Integer.toString(payMain.getPay_price_ko() ));
			data.add( Integer.toString(payMain.getSale_price_cn() ));
			data.add( Integer.toString(payMain.getSale_price_ko() ));
			
			
			List<SelectData> methodList = dao_main.getTypeSelect();
			for (SelectData selectData : methodList) {
				if(selectData.getValue().equals( payMain.getPay_type() )){
					selValue = selectData.getTitle();
					break;
				}
			}
			data.add(selValue);
			
			List<SelectData> stateList = dao_main.getStateSelect();
			for (SelectData selectData : stateList) {
				if(selectData.getValue().equals( payMain.getPay_state() )){
					selValue = selectData.getTitle();
					break;
				}
			}
			data.add(selValue);
			data.add(payMain.getReg_date().substring(0, 19));
			
			rowData.add(data);
			
		}
		

		String excel_name= "pay_" + DateUtil.getCurrentTimeByFormat("D");
		
		modelMap.put("excelName", excel_name);
		modelMap.put("colName", colName);
		modelMap.put("colValue", rowData);
		
		
		return new GenericExcelView();
	}
	
	
	@RequestMapping(value="/pay_proc.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView pay_proc(HttpServletRequest request) throws Exception {
		
		String mode = request.getParameter("mode");
		String rtn_url = request.getParameter("rtn_url");
		String[] chk_pid = request.getParameterValues("chk_pid");
		
		for(int i=0; i<chk_pid.length; ++i)
		{
			if(mode.equals("complete")){
				dao_main.setComplete(chk_pid[i]);
			}else if(mode.equals("cancel")){
				dao_main.setCancelComplete(chk_pid[i], "관리자 취소");
			}
		}
		
		ModelAndView mav = new ModelAndView();
		
		if(rtn_url == null || rtn_url.length() == 0){
			mav.setViewName("redirect:paybank.do");
		}else{
			mav.setViewName("redirect:" + rtn_url);
		}
		
		return mav;
	}
	
	
	@RequestMapping(value="/pay_info.do", method=RequestMethod.GET)
	public String pay_info(Model model, HttpServletRequest request) throws Exception {
		
		String pid = request.getParameter("pid");
		
		PayRefund payrefund = null;
		PayCard paycard = null;
		List<PayItem> payitem_list = null;
		
		PayMain paymain = dao_main.getData(pid);
		
		if(paymain != null){
			payrefund = dao_refund.getData(pid);
			//if(paymain.getPay_method().equals(PayMain.PAYMETHOD_CARD) == true){
				paycard = dao_card.getData(pid);
			//}
			payitem_list = dao_item.getItemListAll(pid);
		}
		
		
		model.addAttribute("paymain", paymain);
		model.addAttribute("paycard", paycard);
		model.addAttribute("payrefund", payrefund);
		model.addAttribute("payitem_list", payitem_list);
		
		
		model.addAttribute("select_method", dao_main.getMethodSelect());
		model.addAttribute("select_type", dao_main.getTypeSelect());
		model.addAttribute("select_state", dao_main.getStateSelect());
		
		model.addAttribute("flag_y", PayMain.PAYUSED_YES);
		model.addAttribute("refund_complete", PayMain.PAYSTATE_REFUND_COMPLETE);
		
		return "/admin/paymgr/pay_info";
	}
	
	@RequestMapping(value="/pay_info_proc.do", method=RequestMethod.POST)
	public void pay_info_proc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setCharacterEncoding("UTF-8");
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		String pid = request.getParameter("pid");
		String pay_state = request.getParameter("pay_state");
		
		PayMain paymain = dao_main.getData(pid);
		
		if(paymain != null){
			paymain.setPay_state(pay_state);
			
			if(pay_state.equals(PayMain.PAYSTATE_PAY_WAIT)){
				
			}else if(pay_state.equals(PayMain.PAYSTATE_PAY_COMPLETE)){
				if(paymain.getPay_date() == null && paymain.getPay_date().equals("")){
					paymain.setPay_date( DateUtil.getCurrentTimeByFormat("C") );
				}
			}else if(pay_state.equals(PayMain.PAYSTATE_CANCEL_COMPLETE)){
				paymain.setCancel_date( DateUtil.getCurrentTimeByFormat("C") );
			}else if(pay_state.equals(PayMain.PAYSTATE_REFUND_REQUEST)){
				
			}else if(pay_state.equals(PayMain.PAYSTATE_REFUND_NOT_CANCEL)){
				if(paymain.getCancel_date() == null && paymain.getCancel_date().equals("")){
					paymain.setCancel_date( DateUtil.getCurrentTimeByFormat("C") );
				}
			}else if(pay_state.equals(PayMain.PAYSTATE_REFUND_COMPLETE)){
				if(paymain.getRefund_date() == null || paymain.getRefund_date().equals("")){
					
					if(paymain.getPay_method().equals(PayMain.PAYMETHOD_CARD) == true){
						PayCard paycard = dao_card.getData(pid);
						if(paycard == null){
							map.put("success", false);
							map.put("err", "No card data");
							response.getWriter().write(JSONUtil.ObjectToJSON(map));
							return;
						}
						// 결제 모듈 생성
						InipayWingko inipay = new InipayWingko();
						if( inipay.cancelOrder(paycard.getTid(), "Cancel admin") == false){
							map.put("success", false);
							map.put("err", "Fail card cancel");
							response.getWriter().write(JSONUtil.ObjectToJSON(map));
							return;
						}
						
						paymain.setCancel_price_ko(paymain.getPay_price_ko());
						paymain.setCancel_price_cn(0);
					}else{
						paymain.setCancel_price_ko(0);
						paymain.setCancel_price_cn(paymain.getPay_price_cn());
					}
					
					paymain.setSale_price_ko(0);
					paymain.setSale_price_cn(0);
						
					paymain.setRefund_date( DateUtil.getCurrentTimeByFormat("C") );
				}
			}
			
			dao_main.setUpdate(paymain);
			
		}
		
		map.put("success", true);
		
		response.getWriter().write(JSONUtil.ObjectToJSON(map));
	}
	
	@RequestMapping(value="/pay_acount.do", method=RequestMethod.GET)
	public String pay_acount(Model model, PayMainSearch search) throws Exception {
		
		int totalCount = dao_main.getAcountCount(search);
		PagedList<PayAcount> list = new PagedList<PayAcount>(dao_main.getAcountList(search), search.getPage(), search.getPageSize(), totalCount);
		
		model.addAttribute("leftMenu", "29");
		model.addAttribute("select_method", dao_main.getMethodSelect());
		model.addAttribute("select_type", dao_main.getTypeSelect());
		model.addAttribute("select_state", dao_main.getStateSelect());
		
		model.addAttribute("paymain", search);
		model.addAttribute("list", list);
		
		return "/admin/paymgr/pay_acount";
	}
	
	
	@RequestMapping(value="/excel_acount.do", method={RequestMethod.GET, RequestMethod.POST})
	public View excel_acount_check(Map<String, Object> modelMap, PayMainSearch search, HttpServletRequest request) throws Exception {
		
		String mode = request.getParameter("mode");
		
		List<PayAcount> list;
		
		if(mode == null){
			list = dao_main.getAcountList(search);
		}else{
			String arrChkId[] = request.getParameterValues("chk_id");
			list = dao_main.getAcountCheckList(arrChkId);
		}
		
		
		List<String> colName = new ArrayList<String>();
		colName.add("날짜");
		colName.add("주문건수");
		colName.add("환불건수");
		colName.add("주문금액CN");
		colName.add("주문금액KO");
		colName.add("미결제");
		colName.add("환불금액CN");
		colName.add("환불금액KO");
		colName.add("매출액CN");
		colName.add("매출액KO");

		List<Object> rowData = new ArrayList<Object>();
		
		
		for (PayAcount payAcount : list) {
			
			List<String> data = new ArrayList<String>();
			data.add(payAcount.getReg_date());
			data.add( Integer.toString( payAcount.getPay_cnt() ));
			data.add( Integer.toString( payAcount.getRefund_cnt() ));
			data.add( Integer.toString( payAcount.getPay_price_cn() ));
			data.add( Integer.toString( payAcount.getPay_price_ko() ));
			data.add( Integer.toString( payAcount.getWait_price_cn() ));
			data.add( Integer.toString( payAcount.getRefund_price_cn() ));
			data.add( Integer.toString( payAcount.getRefund_price_ko() ));
			data.add( Integer.toString( payAcount.getSale_price_cn() ));
			data.add( Integer.toString( payAcount.getSale_price_ko() ));
			
			rowData.add(data);
			
		}
		

		String excel_name= "acount_" + DateUtil.getCurrentTimeByFormat("D");
		
		modelMap.put("excelName", excel_name);
		modelMap.put("colName", colName);
		modelMap.put("colValue", rowData);
		
		return new GenericExcelView();
	}
	
	
}

