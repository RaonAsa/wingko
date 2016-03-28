/*
 * @(#)WingshowController.java  2013. 8. 21.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wingko.story.admin.dao.DealMainDao;
import com.wingko.story.admin.dao.PayCardDao;
import com.wingko.story.admin.dao.PayItemDao;
import com.wingko.story.admin.dao.PayMainDao;
import com.wingko.story.admin.dao.PayRefundDao;
import com.wingko.story.dao.InfoDao;
import com.wingko.story.dao.MyCartDao;
import com.wingko.story.dao.UserDao;
import com.wingko.story.dao.WingCalenderDao;
import com.wingko.story.dao.WingShowDao;
import com.wingko.story.dao.WingkoInfoDao;
import com.wingko.story.domain.PayCard;
import com.wingko.story.domain.PayItem;
import com.wingko.story.domain.PayMain;
import com.wingko.story.domain.PayRefund;
import com.wingko.story.domain.User;
import com.wingko.story.domain.WingCalender;
import com.wingko.story.domain.WingMyItem;
import com.wingko.story.domain.WingShow;
import com.wingko.story.domain.WingkoInfo;
import com.wingko.story.inipay.InipayWingko;
import com.wingko.story.util.DateUtil;
import com.wingko.story.util.JSONUtil;
import com.wingko.story.util.MailUtil;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 21.
 */
@Controller
@RequestMapping(value="/wingshow")
public class WingshowController {
	private Logger logger = LoggerFactory.getLogger(WingshowController.class);
	
	@Autowired
	private WingkoInfoDao wingkoinfo_dao;
	
	@Autowired
	private InfoDao infoDao;
	
	@Autowired
	private WingCalenderDao calendaer_dao;
	@Autowired
	private WingShowDao wingshow_dao;
	@Autowired
	private MyCartDao mycart_dao;
	
	
	@Autowired
	private PayMainDao paymain_dao;
	@Autowired
	private PayCardDao paycard_dao;
	@Autowired
	private PayItemDao payitem_dao;
	@Autowired
	private PayRefundDao payrefund_dao;
	
	@Autowired
	private UserDao user_dao;
	@Autowired
	private DealMainDao dealmain;
	
	/**
	 * Make Wingshow
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String list(Model model, HttpSession session) throws Exception {
		
		Integer user_no = (Integer) session.getAttribute("user_no");
		if(user_no == null){
			return "redirect:/login.do";
		}
		
		// 지난 데이터 지우기
		wingshow_dao.removeCartLast(user_no);
		

		List<WingShow> data_list = wingshow_dao.getListUser(user_no);
		
		model.addAttribute("data_list", data_list);
		model.addAttribute("now_date", DateUtil.getCurrentTimeByFormat("A") );
		
		return "/wingshow/main";
	}
	
	/**
	 * 	Make Wingshow 장바구니 체크 삭제
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/main.do", method=RequestMethod.POST)
	public String list_remove(HttpSession session, HttpServletRequest request) throws Exception {
		
		Integer user_no = (Integer) session.getAttribute("user_no");
		if(user_no == null){
			return "redirect:/login.do";
		}
		
		
		String arrChkId[] = request.getParameterValues("chk_id");
		if(arrChkId.length > 0){
			int result = wingshow_dao.removeCart(user_no, arrChkId);
			//logger.info("removeInven result : " + result);
		}
		return "redirect:/wingshow/main.do";
	}
	
	
	/**
	 *  Wingshow 달력 기념일 json 데이터
	 * @param calender
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/json_event.do", method={RequestMethod.POST, RequestMethod.GET})
	public void json_event(WingCalender calender, HttpServletResponse response) throws Exception {
		try {
			response.setCharacterEncoding("UTF-8");
			Map<String, Object> map = new HashMap<String, Object>();
			
			List<WingCalender> list = calendaer_dao.getListMonth(calender);
			map.put("list", list);

			response.getWriter().write(JSONUtil.ObjectToJSON(map));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/json_calendar.do", method={RequestMethod.POST, RequestMethod.GET})
	public void json_calendar(HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		response.setCharacterEncoding("UTF-8");
		Map<String, Object> map = new HashMap<String, Object>();
		
		do {
			Integer user_no = (Integer) session.getAttribute("user_no");
			if(user_no == null) break;
			String used_date = request.getParameter("used_date");
			if(used_date == null) break;
			
			List<WingMyItem> list = wingshow_dao.getMyCalendarItem(user_no, used_date);
			map.put("list", list);
			
			
		} while (false);
		
		response.getWriter().write(JSONUtil.ObjectToJSON(map));
		
	}
	
	/**
	 * 장바구니 선택 예약 주문
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/reservation.do", method=RequestMethod.POST)
	public String reservation_register(HttpSession session, HttpServletRequest request) throws Exception {
		
		String rtn_url = "redirect:/wingshow/main.do";
		
		String arrChkId[] = request.getParameterValues("chk_id");
		String arrItem_Count[] = request.getParameterValues("item_count");
		String arrItem_Coupon[] = request.getParameterValues("item_coupon");
		String arrDatePicker[] = request.getParameterValues("datepicker");
		
		if(arrChkId.length == 0){
			return rtn_url;
		}
		
		if(arrChkId.length != arrItem_Count.length ){
			return rtn_url;
		}
		
		Integer user_no = (Integer) session.getAttribute("user_no");
		if(user_no == null){
			return rtn_url;
		}
		
		
		
		// 유저 정보  
		User user = wingshow_dao.getUserInfo(user_no);
		
		// 주문번호 생성
		PayMain paymain = new PayMain();
		paymain.setPid(PayMain.createPID());
		paymain.setPay_used(PayMain.PAYUSED_YES);
		paymain.setUser_no(user.getUser_no());
		paymain.setUser_id(user.getUser_id());
		paymain.setUser_name(user.getUser_name());
		paymain.setUser_email(user.getEmail());
		paymain.setUser_phone(user.getPhone());
		paymain.setPay_method(PayMain.PAYMETHOD_BANK);
		paymain.setPay_state(PayMain.PAYSTATE_PAY_WAIT);
		paymain.setPay_type(PayMain.PAYTYPE_RESERVATION);
		
		
		String pay_title = null;
		int total_price = 0;
		int total_price_cny = 0;
		
		for(int i=0; i<arrChkId.length; ++i){
			int cart_id = Integer.parseInt( arrChkId[i] );
			int item_cnt = Integer.parseInt( arrItem_Count[i] );
			int item_coupon = Integer.parseInt( arrItem_Coupon[i] );
			String item_date = arrDatePicker[i];
			
			WingShow wingshow = wingshow_dao.getWingShow(user_no, cart_id);
			if(wingshow != null){
				wingshow.setPid( paymain.getPid() );
				wingshow.setMenu_cnt(item_cnt);
				wingshow.setCoupon_apply(item_coupon);
				wingshow.setUsed_date(item_date);
				
				wingshow.setSum_price_ko(wingshow.getCouponPrice());
				wingshow.setSum_price_cn(wingshow.getCouponPriceCny());
				
				
				////////////////////////////////////
				// 결제 상품 리스트 추가 및 장바구니 항목 삭제
				
				PayItem payitem = new PayItem();
				payitem.setPid(paymain.getPid());
				payitem.setMenu_no(wingshow.getMenu_no());
				payitem.setMenu_cnt(wingshow.getMenu_cnt());
				payitem.setItem_type(PayItem.ITEMTYPE_RESERVATION);
				
				payitem.setItem_location(wingshow.getLocation_name());
				payitem.setItem_store(wingshow.getStore_title());
				payitem.setItem_name(wingshow.getMenu_name());
				
				payitem.setUsed_date(wingshow.getUsed_date());
				payitem.setCoupon_value(wingshow.getCoupon_apply());
				payitem.setPay_price_ko(wingshow.getSum_price_ko());
				payitem.setPay_price_cn(wingshow.getSum_price_cn());
				
				payitem_dao.setInsert(payitem); // pay item insert
				mycart_dao.setDelete(wingshow); // cart remove
				
				/////////////////////////////////////
				
				
				total_price += wingshow.getSum_price_ko();
				total_price_cny += wingshow.getSum_price_cn();
				
				if(pay_title == null){
					pay_title = "[" + wingshow.getLocation_name() + "]" + wingshow.getStore_title() + " "+ wingshow.getMenu_name();
					if(arrChkId.length > 1){
						pay_title = pay_title + "(+" + (arrChkId.length -1) + ")" ;
					}
				}
			}
		}
		
		paymain.setPay_title(pay_title);
		paymain.setPay_price_ko(total_price);
		paymain.setPay_price_cn(total_price_cny);
		
		paymain_dao.setInsert(paymain);
		
		return "redirect:/wingshow/reservation_view.do?pid=" + paymain.getPid(); 
	}
	
	
	/**
	 * 
	 * @param model
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/reservation_view.do", method=RequestMethod.GET)
	public String reservation_view(Model model, HttpSession session, HttpServletRequest request) throws Exception {
		
		Integer user_no = (Integer) session.getAttribute("user_no");
		if(user_no == null){
			user_no = 0;
		}
		
		String pid = request.getParameter("pid");
		if(pid == null) pid = "";
		
		//PayMain paymain = paymain_dao.getData(pid, user_no);
		PayMain paymain = paymain_dao.getData(pid); // test code
		
		if(paymain == null){
			return "redirect:/wingshow/main.do";
		}
		
		if(paymain.getPay_used() != PayMain.PAYUSED_YES){
			return "redirect:/wingshow/main.do";
		}
		
		if(paymain.getPay_type().endsWith(PayMain.PAYTYPE_RESERVATION) == false){
			return "redirect:/wingshow/main.do";
		}
		
		WingkoInfo wingkoinfo = wingkoinfo_dao.getData();
		
		List<PayItem> data_list = payitem_dao.getItemList(pid);
		
		
		model.addAttribute("wingkoinfo", wingkoinfo);
		model.addAttribute("paymain", paymain);
		model.addAttribute("data_list", data_list);
		
		return "/wingshow/reservation_view";
	}
	
	/**
	 * Make Wingshow 장바구니 선택 주문번호 생성(POST 체크박스)
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/acount.do", method=RequestMethod.POST)
	public String acount_register(HttpSession session, HttpServletRequest request) throws Exception {
		
		String rtn_url = "redirect:/wingshow/main.do";
		
		String arrChkId[] = request.getParameterValues("chk_id");
		String arrItem_Count[] = request.getParameterValues("item_count");
		String arrItem_Coupon[] = request.getParameterValues("item_coupon");
		String arrDatePicker[] = request.getParameterValues("datepicker");
		
		
		if(arrChkId.length == 0){
			return rtn_url;
		}
		
		if(arrChkId.length != arrItem_Count.length ){
			return rtn_url;
		}
		
		Integer user_no = (Integer) session.getAttribute("user_no");
		if(user_no == null){
			return rtn_url;
		}
		
		
		// 유저 정보  
		User user = wingshow_dao.getUserInfo(user_no);
		
		// 주문번호 생성
		PayMain paymain = new PayMain();
		paymain.setPid(PayMain.createPID());
		paymain.setPay_used(PayMain.PAYUSED_NO);
		paymain.setUser_no(user.getUser_no());
		paymain.setUser_id(user.getUser_id());
		paymain.setUser_name(user.getUser_name());
		paymain.setUser_email(user.getEmail());
		paymain.setUser_phone(user.getPhone());
		//paymain.setPay_method(PayMain.PAYMETHOD_BANK);
		paymain.setPay_state(PayMain.PAYSTATE_PAY_WAIT);
		paymain.setPay_type(PayMain.PAYTYPE_STORE);
		
		
		String pay_title = null;
		int total_price = 0;
		int total_price_cny = 0;
		
		for(int i=0; i<arrChkId.length; ++i){
			int cart_id = Integer.parseInt( arrChkId[i] );
			int item_cnt = Integer.parseInt( arrItem_Count[i] );
			int item_coupon = Integer.parseInt( arrItem_Coupon[i] );
			String item_date = arrDatePicker[i];
			
			WingShow wingshow = wingshow_dao.getWingShow(user_no, cart_id);
			if(wingshow != null){
				wingshow.setPid( paymain.getPid() );
				wingshow.setMenu_cnt(item_cnt);
				wingshow.setCoupon_apply(item_coupon);
				wingshow.setUsed_date(item_date);
				
				wingshow.setSum_price_ko(wingshow.getCouponPrice());
				wingshow.setSum_price_cn(wingshow.getCouponPriceCny());
				
				
				mycart_dao.setUpdate(wingshow);
				
				total_price += wingshow.getSum_price_ko();
				total_price_cny += wingshow.getSum_price_cn();
				
				if(pay_title == null){
					pay_title = "[" + wingshow.getLocation_name() + "]" + wingshow.getStore_title() + " " + wingshow.getMenu_name();
					if(arrChkId.length > 1){
						pay_title = pay_title + "(+" + (arrChkId.length -1) + ")" ;
					}
				}
			}
		}
		
		paymain.setPay_title(pay_title);
		paymain.setPay_price_ko(total_price);
		paymain.setPay_price_cn(total_price_cny);
		
		paymain_dao.setInsert(paymain);
		
		
		return "redirect:/wingshow/acount.do?pid=" + paymain.getPid();
	}
	
	/**
	 * Make Wingshow 장바구니 선택, 결제 대기 리스트
	 * @param model
	 * @param session
	 * @param pid
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/acount.do", method=RequestMethod.GET)
	public String acount(Model model, HttpSession session, @RequestParam(value="pid", required=false) String pid) throws Exception {
		
		Integer user_no = (Integer) session.getAttribute("user_no");
		if(user_no == null){
			user_no = 0;
		}
		
		PayMain paymain = paymain_dao.getData(pid, user_no);
		//PayMain paymain = paymain_dao.getData(pid); // test code
		
		if(paymain == null){
			return "redirect:/wingshow/main.do";
		}
		
		if(paymain.getPay_used() == PayMain.PAYUSED_YES){
			return "redirect:/wingshow/main.do";
		}
		
		
		List<WingShow> data_list = wingshow_dao.getPidList(pid);
		
		model.addAttribute("paymain", paymain);
		model.addAttribute("data_list", data_list);
		
		
		
		// 결제모듈 생성
		InipayWingko inipay = new InipayWingko();
		
		// 주문번호, 주문 가격 입력
		inipay.setResponseParam(paymain.getPid(), paymain.getPay_price_ko());
		//inipay.setResponseParam(paymain.getPid(), 1050 ); // test code
		
		
		if(inipay.startActionResponse(session) == false){
			logger.info("inipay error : " + inipay.getResultMsg());
		}
		
		// 결제 모듈 암호화 및 스트립트 생성
		StringBuilder builder = new StringBuilder();
		builder.append( inipay.getFormStart("./acount_proc.do") );
		builder.append( inipay.getFormData(paymain.getPay_title(), paymain.getUser_name(), paymain.getUser_email(), paymain.getUser_phone() ) );
		builder.append( inipay.getFormEnd() );
		
		model.addAttribute("inipay_formdata", builder.toString() );
		
		return "/wingshow/acount";
	}
	
	/**
	 * 결제 주문 완료 처리
	 * @param model
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/acount_proc.do", method=RequestMethod.POST)
	public String acount_proc(Model model, HttpSession session, HttpServletRequest request) throws Exception {
		
		Integer user_no = (Integer) session.getAttribute("user_no");
		if(user_no == null){
			return "redirect:/login.do";
		}
		
		// 
		PayMain paymain = null;
		boolean isPay_Complete = false;
		
		String pay_pid = request.getParameter("pid");

		
		// 현금 결제
		if(pay_pid != null && pay_pid.length() > 0){
			// 주문 정보
			paymain = paymain_dao.getData(pay_pid, user_no);
			
			// 데이터 변조 및 오류 처리		
			if(paymain == null ){
				return "redirect:/wingshow/main.do";
			}
			
			if(paymain.getPay_used() != PayMain.PAYUSED_NO){
				return "redirect:/wingshow/main.do";
			}
			
			isPay_Complete = true;
					
			// 주문정보 상태 업데이트
			paymain.setPay_used(PayMain.PAYUSED_YES);
			//paymain.setPay_state(PayMain.PAYSTATE_PAY_WAIT); // 입금 대기
			//paymain.setSale_price(0); // 미결제
			paymain.setPay_method(PayMain.PAYMETHOD_BANK);
			paymain.setReg_date(DateUtil.getCurrentTimeByFormat("C"));
			paymain_dao.setUpdate(paymain);
			
		}
		else // 카드 결제
		{
		
			// 결제 모듈 생성
			InipayWingko inipay = new InipayWingko();
			
			// 모듈 생성 실패
			inipay.setResultData(session, request);
			if(inipay.startActionResult() ==  false){
				return "redirect:/wingshow/main.do";
			}
			
			
			String tid = inipay.getValue("tid");
			String PayMethod = inipay.getValue("PayMethod");
			String MOID = inipay.getValue("MOID");
			String ApplDate = inipay.getValue("ApplDate");
			String ApplTime = inipay.getValue("ApplTime");
			String ApplNum = inipay.getValue("ApplNum");
			String TotPrice = inipay.getValue("TotPrice");
			
			// card info
			String CARD_Num = inipay.getValue("CARD_Num");
			String CARD_Interest = inipay.getValue("CARD_Interest");
			String CARD_Quota = inipay.getValue("CARD_Quota");
			String CARD_Code = inipay.getValue("CARD_Code");
			String CARD_BankCode = inipay.getValue("CARD_BankCode");
			String OrgCurrency = inipay.getValue("OrgCurrency");
			String ExchangeRate = inipay.getValue("ExchangeRate");
			
			int total_price = Integer.parseInt(TotPrice);
			
			
			// 주문 정보
			paymain = paymain_dao.getData(MOID, user_no);

			
			// 데이터 변조 및 오류 처리		
			if(paymain == null ){
				inipay.cancelOrder(tid, "No Data");
				return "redirect:/wingshow/main.do";
			}
			
			if(paymain.getPay_used() != PayMain.PAYUSED_YES){
				inipay.cancelOrder(tid, "Data is not match");
				return "redirect:/wingshow/main.do";
			}
			
			if( paymain.getPay_price_ko() != total_price ){
				inipay.cancelOrder(tid, "Price is not match");
				return "redirect:/wingshow/main.do";
			}
			
			
			
			
			// 결제 승인 정보 입력 
			PayCard paycard = new PayCard();
			paycard.setPid(paymain.getPid());
			paycard.setTid(tid);
			paycard.setResult_code(inipay.getResultCode());
			paycard.setResult_msg(inipay.getResultMsg());
			paycard.setApp_date(ApplDate);
			paycard.setApp_time(ApplTime);
			paycard.setApp_num(ApplNum);
			
			// 결제 카드 정보
			paycard.setCard_num(CARD_Num);
			paycard.setCard_interest(CARD_Interest);
			paycard.setCard_quota(CARD_Quota);
			paycard.setCard_code(CARD_Code);
			paycard.setCard_bankcode(CARD_BankCode);
			paycard.setOrg_currency(OrgCurrency);
			paycard.setExchange_rate(ExchangeRate);
			
			
			if(paycard_dao.getData(paymain.getPid()) == null){
				paycard_dao.setInsert(paycard);
			}else{
				paycard_dao.setUpdate(paycard);
			}
			
			// 결제 성공
			if( inipay.getResultCode().equals("00") == true){ 
				isPay_Complete = true;
			}
			
			
			// 주문정보 상태 업데이트
			if( isPay_Complete == true){ // 결제 성공
				paymain.setPay_used(PayMain.PAYUSED_YES);
				paymain.setPay_state(PayMain.PAYSTATE_PAY_COMPLETE);
				paymain.setPay_date(DateUtil.getCurrentTimeByFormat("C"));
				paymain.setSale_price_ko(total_price);
			}else{ // 결제 실패
				paymain.setPay_used(PayMain.PAYUSED_FAIL);
				paymain.setCancel_date(DateUtil.getCurrentTimeByFormat("C"));
				paymain.setCancel_msg(inipay.getResultMsg());
				//paymain.setCancel_price_ko(0);
			}
			
			paymain.setPay_method(PayMain.PAYMETHOD_CARD);
			paymain.setReg_date(DateUtil.getCurrentTimeByFormat("C"));
			paymain_dao.setUpdate(paymain);
		}
		
		
		
		
		
		// 결제 상품 리스트 추가 및 장바구니 항목 삭제
		if(isPay_Complete == true){

			List<WingShow> data_list = wingshow_dao.getPidList(paymain.getPid());
			for (WingShow wingShow : data_list) {
				PayItem payitem = new PayItem();
				payitem.setPid(paymain.getPid());
				payitem.setMenu_no(wingShow.getMenu_no());
				payitem.setMenu_cnt(wingShow.getMenu_cnt());
				payitem.setItem_type(PayItem.ITEMTYPE_MENU);
				
				payitem.setItem_location(wingShow.getLocation_name());
				payitem.setItem_store(wingShow.getStore_title());
				payitem.setItem_name(wingShow.getMenu_name());
				
				payitem.setUsed_date(wingShow.getUsed_date());
				payitem.setCoupon_value(wingShow.getCoupon_apply());
				payitem.setPay_price_ko(wingShow.getSum_price_ko());
				payitem.setPay_price_cn(wingShow.getSum_price_cn());
				
				payitem_dao.setInsert(payitem); // pay item insert
				mycart_dao.setDelete(wingShow); // cart remove
			}
		}
		
		
		return "redirect:/wingshow/acount_result.do?pid=" + paymain.getPid();
	}
	
	/**
	 * 결제 완료 페이지
	 * @param model
	 * @param session
	 * @param pid
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/acount_result.do", method=RequestMethod.GET)
	public String acount_result(Model model, HttpSession session, @RequestParam(value="pid", required=false) String pid) throws Exception {
		
		Integer user_no = (Integer) session.getAttribute("user_no");
		if(user_no == null){
			return "redirect:/login.do";
		}
		
		if(pid == null){
			return "redirect:/login.do";
		}
		
		PayMain paymain = paymain_dao.getData(pid, user_no);
		if(paymain == null){
			return "redirect:/wingshow/main.do";
		}
		
		// 주문일 3일 후 날짜
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
        Date after_date = format.parse(paymain.getReg_date());
        after_date.setDate(after_date.getDate() + 3);
		
		
		model.addAttribute("paymain", paymain);
		model.addAttribute("after_month", after_date.getMonth() +1);
		model.addAttribute("after_day", after_date.getDate());
		
		// 결제 타입
		model.addAttribute("paymethod_card", PayMain.PAYMETHOD_CARD);
		model.addAttribute("paymethod_bank", PayMain.PAYMETHOD_BANK);
		// 사용 타입
		model.addAttribute("payused_yes", PayMain.PAYUSED_YES);
		model.addAttribute("payused_fail", PayMain.PAYUSED_FAIL);
		
		
		return "/wingshow/acount_result";
	}
	
	@RequestMapping(value="/childwin.html", method=RequestMethod.GET)
	public String acount_result(HttpServletRequest request) throws Exception {
		
		
		return "/wingshow/childwin";
	}
	
	
	/**
	 * my wingshow 달력 리스트 json
	 * @param session
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/json_my_paylist.do", method={RequestMethod.POST, RequestMethod.GET})
	public void json_my_paylist(HttpSession session, HttpServletResponse response) throws Exception {
		try {
			Integer user_no = (Integer) session.getAttribute("user_no");
			if(user_no == null){
				return ;
			}
			
			response.setCharacterEncoding("UTF-8");			
			Map<String, Object> map = new HashMap<String, Object>();
			
//			List<WingCalender> list = calendaer_dao.getListMonth(calender);
//			map.put("list", list);

			response.getWriter().write(JSONUtil.ObjectToJSON(map));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	/**
	 * my wingshow 상품 리스트
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/my_wingshow.do", method=RequestMethod.GET)
	public String my_wingshow(Model model, HttpSession session, HttpServletRequest request) throws Exception {
		
		Integer user_no = (Integer) session.getAttribute("user_no");
		if(user_no == null){
			//user_no = 0;
			return "redirect:/wingshow/main.do";
		}
		
		
		PayMain paymain_search = new PayMain();
		paymain_search.setUser_no(user_no);
		paymain_search.setPay_type(PayMain.PAYTYPE_RESERVATION);
		paymain_search.setPay_state(PayMain.PAYSTATE_PAY_WAIT);
		
		List<PayMain> list_main = wingshow_dao.getMyReservationOrder(paymain_search);
		
		List<Object> list_array = new ArrayList<Object>();
		for (PayMain payMain : list_main) {
			List<WingMyItem> list_myitem = wingshow_dao.getMyPaymentItem(payMain.getPid());
			if(list_myitem != null){
				list_array.add(list_myitem);
			}
		}
		
		
		
		WingkoInfo wingkoinfo = wingkoinfo_dao.getData();
		model.addAttribute("wingkoinfo", wingkoinfo );
		
		String url = request.getRequestURL().toString();
		int pos = url.indexOf('/', 8);
		String host = url.substring(0, pos);
		model.addAttribute("host", host);
		
		
		model.addAttribute("now_date", DateUtil.getCurrentTimeByFormat("A") );
		model.addAttribute("list_array", list_array);
		
		return "/wingshow/my_wingshow";
	}
	
	
	/**
	 * my wingshow 예약상품 취소
	 * @param model
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/reservation_cancel.do", method=RequestMethod.POST)
	public String reservation_cancel(Model model, HttpSession session, HttpServletRequest request) throws Exception {
		
		Integer user_no = (Integer) session.getAttribute("user_no");
		if(user_no == null){
			return "redirect:/wingshow/my_wingshow.do";
		}
		
		String item_id = request.getParameter("item_id");
		
		if(item_id == null){
			return "redirect:/wingshow/my_wingshow.do";
		}
		
		PayItem payitem = payitem_dao.getData(item_id);
		if(payitem == null){
			return "redirect:/wingshow/my_wingshow.do";
		}
		
		PayMain paymain = paymain_dao.getData(payitem.getPid(), user_no);
		if(paymain == null){
			return "redirect:/wingshow/my_wingshow.do";
		}
		
		payitem.setCancel_yn('Y');
		payitem_dao.setUpdate(payitem);
		
		
		List<PayItem> item_list = payitem_dao.getItemList(payitem.getPid());
		if(item_list == null || item_list.size() == 0){
			paymain.setPay_used(PayMain.PAYUSED_NO);
		}else{
			String pay_title = null;
			int pay_price_ko = 0;
			int pay_price_cn = 0;
			for (PayItem Item : item_list) {
				pay_price_ko += Item.getPay_price_ko();
				pay_price_cn += Item.getPay_price_cn();
				
				
				if(pay_title == null){
					pay_title = "[" + Item.getItem_location() + "]" + Item.getItem_store() + " "+ Item.getItem_name();
					if(item_list.size() > 1){
						pay_title = pay_title + "(+" + (item_list.size() -1) + ")" ;
					}
				}
			}
			
			paymain.setPay_title(pay_title);
			paymain.setPay_price_ko(pay_price_ko);
			paymain.setPay_price_cn(pay_price_cn);
		}
		paymain_dao.setUpdate(paymain);
				
		
		return "redirect:/wingshow/my_wingshow.do";
	}
	
	/**
	 * json 상품 사용날짜 변경
	 * @param session
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping(value="/json_date_change.do", method=RequestMethod.POST)
	public void item_date_change(HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		response.setCharacterEncoding("UTF-8");
		Map<String, Object> map = new HashMap<String, Object>();
		
		do {
			Integer user_no = (Integer) session.getAttribute("user_no");
			String item_id = request.getParameter("item_id");
			String used_date = request.getParameter("used_date");
			
			if(user_no == null){
				map.put("success", false);
				break;
			}
			
			if(item_id == null || used_date == null){
				map.put("success", false);
				break;
			}
			
			PayItem payitem = payitem_dao.getData(item_id);
			if(payitem == null){
				map.put("success", false);
				break;
			}
			
			PayMain paymain = paymain_dao.getData(payitem.getPid(), user_no);
			if(paymain == null){
				map.put("success", false);
				break;
			}
			
			payitem.setUsed_date(used_date);
			payitem_dao.setUpdate(payitem);
			
			map.put("success", true);
			
		} while (false);
		
		response.getWriter().write(JSONUtil.ObjectToJSON(map));
		
	}
	
	/**
	 * my wingshow 결제상품 리스트
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/my_payment.do", method=RequestMethod.GET)
	public String my_payment(Model model, HttpSession session, HttpServletRequest request) throws Exception {
		
		Integer user_no = (Integer) session.getAttribute("user_no");
		if(user_no == null){
			return "redirect:/wingshow/main.do";
		}
		
		PayMain pay_search = new PayMain();
		pay_search.setUser_no(user_no);
		
		List<PayMain> list_main = wingshow_dao.getMyPaymentOrder(pay_search);
		
		List<Object> list_array = new ArrayList<Object>();
		for (PayMain payMain : list_main) {
			List<WingMyItem> list_myitem = wingshow_dao.getMyPaymentItem(payMain.getPid());
			if(list_myitem != null){
				list_array.add(list_myitem);
			}
		}
		
		
		List<PayMain> list_refund = wingshow_dao.getMyRefundOrder(pay_search);
		List<Object> arr_refund = new ArrayList<Object>();
		for (PayMain payMain : list_refund) {
			List<WingMyItem> list_myitem = wingshow_dao.getMyPaymentItem(payMain.getPid());
			if(list_myitem != null){
				arr_refund.add(list_myitem);
			}
		}
		
		
		WingkoInfo wingkoinfo = wingkoinfo_dao.getData();
		model.addAttribute("wingkoinfo", wingkoinfo );
		
		String url = request.getRequestURL().toString();
		int pos = url.indexOf('/', 8);
		String host = url.substring(0, pos);
		model.addAttribute("host", host);
		
		model.addAttribute("now_date", DateUtil.getCurrentTimeByFormat("A") );
		model.addAttribute("list_array", list_array);
		model.addAttribute("arr_refund", arr_refund);
		
		return "/wingshow/my_payment";
	}
	
	
	/**
	 * my wingshow 이달의딜 결제상품 리스트
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/my_paydeal.do", method=RequestMethod.GET)
	public String my_paydeal(Model model, HttpSession session, HttpServletRequest request) throws Exception {
		
		Integer user_no = (Integer) session.getAttribute("user_no");
		if(user_no == null){
			return "redirect:/wingshow/main.do";
		}
		
		PayMain pay_search = new PayMain();
		pay_search.setUser_no(user_no);
		
		List<Map> list_main = wingshow_dao.getMyPayDealOrder(pay_search);
		
		for (Map map : list_main) {
			List<PayItem> list_item = payitem_dao.getItemList( (String)map.get("pid"));
			if(list_item != null){
				map.put("list_item", list_item);
			}
		}
		
		
		List<Map> list_refund = wingshow_dao.getMyRefundDealOrder(pay_search);
		
		for (Map map : list_refund) {
			List<PayItem> list_item = payitem_dao.getItemList( (String)map.get("pid"));
			if(list_item != null){
				map.put("list_item", list_item);
			}
		}
		
		
		String url = request.getRequestURL().toString();
		int pos = url.indexOf('/', 8);
		String host = url.substring(0, pos);
		model.addAttribute("host", host); // site url
		
		WingkoInfo wingkoinfo = wingkoinfo_dao.getData();
		model.addAttribute("wingkoinfo", wingkoinfo );
		
		
		model.addAttribute("now_date", DateUtil.getCurrentTimeByFormat("A") );
		model.addAttribute("list_main", list_main);
		model.addAttribute("list_refund", list_refund);

		
		return "/wingshow/my_paydeal";
	}
	
	
	/**
	 * my wingshow 결제상품 취소 요청
	 * @param model
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/my_payment_cancel.do", method=RequestMethod.POST)
	public String my_payment_cancel(Model model, HttpSession session, HttpServletRequest request) throws Exception {
		
		Integer user_no = (Integer) session.getAttribute("user_no");
		String cancel_mode = request.getParameter("cancel_mode");
		String pid = request.getParameter("cancel_pid");
		
		do {
			
			if(user_no == null) break;
			
			PayMain paymain = paymain_dao.getData(pid, user_no);
			if(paymain == null) break;
			
			
			String pay_state = paymain.getPay_state();
			if(pay_state.equals( PayMain.PAYSTATE_PAY_WAIT) == true){
				paymain.setPay_state(PayMain.PAYSTATE_CANCEL_COMPLETE);
				paymain.setCancel_date(DateUtil.getCurrentTimeByFormat("C") );
				paymain.setCancel_msg("User Cancel");
				paymain.setCancel_price_ko(paymain.getPay_price_ko());
				paymain.setCancel_price_cn(paymain.getPay_price_cn());
				paymain.setSale_price_ko(0);
				paymain.setSale_price_cn(0);
				paymain.setPay_used(PayMain.PAYUSED_NO);
				
				paymain_dao.setUpdate(paymain);
				
			}else if(pay_state.equals( PayMain.PAYSTATE_PAY_COMPLETE) == true){
				
				String bank_name = request.getParameter("bank_name");
				String bank_num = request.getParameter("bank_num");
				String bank_owner = request.getParameter("bank_owner");
				
				if(bank_name == null || bank_num == null || bank_owner == null){
					break;
				}
				
				paymain.setPay_state(PayMain.PAYSTATE_REFUND_REQUEST);
				paymain.setCancel_date(DateUtil.getCurrentTimeByFormat("C") );
				paymain.setCancel_msg("User Cancel Request");
				//paymain.setCancel_price_ko(paymain.getPay_price_ko());
				//paymain.setCancel_price_cn(paymain.getPay_price_cn());
				//paymain.setSale_price_ko(0);
				//paymain.setSale_price_cn(0);
				
				paymain_dao.setUpdate(paymain);
				
				
				PayRefund payrefund = new PayRefund();
				payrefund.setPid(pid);
				payrefund.setBank_name(bank_name);
				payrefund.setBank_number(bank_num);
				payrefund.setBank_owner(bank_owner);
				
				payrefund_dao.setInsert(payrefund);
				
			}
			
		} while (false);
		
		if(cancel_mode != null && cancel_mode.equals("paydeal")){
			return "redirect:/wingshow/my_paydeal.do";
		}
		
		return "redirect:/wingshow/my_payment.do";
	}
	
	@RequestMapping(value="/json_sendmail.do", method=RequestMethod.POST)
	public void json_sendmail(HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		response.setCharacterEncoding("UTF-8");
		Map<String, Object> map = new HashMap<String, Object>();
		
		do {
			String user_id = (String) session.getAttribute("user_id");
			String mail_title = request.getParameter("mail_title");
			String mail_body = request.getParameter("mail_body");
			
			if(user_id == null){
				map.put("success", false);
				break;
			}
			
			if(mail_title == null || mail_body == null){
				map.put("success", false);
				break;
			}
			
			User user = user_dao.getUser(user_id);
			if(user == null){
				map.put("success", false);
				break;
			}
	
			if(MailUtil.SendMailBody(user.getEmail(), mail_title, mail_body) == false){
				map.put("success", false);
				break;
			}
			
			map.put("success", true);
			
		} while (false);
		
		response.getWriter().write(JSONUtil.ObjectToJSON(map));
		
	}
	
	
	@RequestMapping(value="/print_view.do", method=RequestMethod.GET)
	public String pop_payment_cancel(Model model, HttpServletRequest request) throws Exception {
		
		return "/wingshow/print_view";
	}
	
	
	@RequestMapping(value="/info.do", method=RequestMethod.GET)
	public String wingshowInfo(Model model) throws Exception {
		model.addAttribute("info", infoDao.info(12));
		return "/wingshow/info";
	}
	
	
	

}

