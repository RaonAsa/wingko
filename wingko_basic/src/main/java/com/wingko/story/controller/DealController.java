/*
 * @(#)CommunityController.java  2013. 9. 2.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.AbstractView;

import com.wingko.story.admin.dao.DealEmsDao;
import com.wingko.story.admin.dao.DealItemDao;
import com.wingko.story.admin.dao.PayAreaDao;
import com.wingko.story.admin.dao.PayCardDao;
import com.wingko.story.admin.dao.PayItemDao;
import com.wingko.story.admin.dao.PayMainDao;
import com.wingko.story.dao.DealShopDao;
import com.wingko.story.domain.DealEms;
import com.wingko.story.domain.DealItem;
import com.wingko.story.domain.DealMain;
import com.wingko.story.domain.PayArea;
import com.wingko.story.domain.PayCard;
import com.wingko.story.domain.PayItem;
import com.wingko.story.domain.PayMain;
import com.wingko.story.domain.Ripple;
import com.wingko.story.domain.User;
import com.wingko.story.inipay.InipayWingko;
import com.wingko.story.service.UserService;
import com.wingko.story.util.DateUtil;
import com.wingko.story.util.JSONUtil;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 2.
 */
@Controller
@RequestMapping(value="/deal")
public class DealController {
	
	Logger logger = LoggerFactory.getLogger(DealController.class);
	public static String RIPPLE_CODE = "dealshop";
	
	@Autowired
	private DealShopDao dao_dealshop;
	@Autowired
	private DealItemDao dao_dealitem;
	@Autowired
	private PayMainDao dao_paymain;
	@Autowired
	private PayItemDao dao_payitem;
	@Autowired
	private PayCardDao dao_paycard;
	@Autowired
	private PayAreaDao dao_payarea;
	
	@Autowired
	private DealEmsDao dao_dealems;
	@Autowired
	private UserService userService;
	
	
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String main(Model model, HttpSession session) {
		
		long diff_time = 0;
		DealMain dealmain = dao_dealshop.getDealShop();
		
		List<DealItem> list_item = null;
		if(dealmain != null){
			list_item = dao_dealshop.getDealItemList(dealmain.getDeal_id());
			
			try {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date cur_date = new Date();
				Date end_date = format.parse(dealmain.getEnd_date());
				//Date end_date = format.parse("2013-11-10 23:59:59");
				
				logger.info("end_date.getTime() ======== " + end_date.getTime());
				logger.info("cur_date.getTime() ======== " + cur_date.getTime());
				
				diff_time = end_date.getTime() - cur_date.getTime();
				diff_time = (long) Math.floor(diff_time / 1000);
				
				
				logger.info("diff_time ======== " + diff_time );
				
//				int day = (int) Math.floor(diff_time / 60 / 60 / 24);
//				int hour = (int) Math.floor((diff_time / 60 / 60) % 24);
//				int minute = (int) Math.floor((diff_time / 60) % 60);
//				int second = (int) Math.floor(diff_time % 60);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			Ripple ripple = new Ripple(dealmain.getDeal_id(), RIPPLE_CODE);
			model.addAttribute("ripple_list", dao_dealshop.getRippleList(ripple));
			model.addAttribute("ripple_count", dao_dealshop.getRippleListCount(ripple));
		}
		
		model.addAttribute("user_no", session.getAttribute("user_no"));
		model.addAttribute("diff_time", diff_time);
		
		model.addAttribute("dealmain", dealmain);
		model.addAttribute("list_item", list_item);

		return "/deal/main";
	}
	
	@RequestMapping(value="/review_insert.do", method=RequestMethod.POST)
	public String review_insert(HttpSession session, Ripple ripple) {
		Integer user_no = (Integer) session.getAttribute("user_no");
		
		if(user_no != null){
			ripple.setUser_no(user_no);
			ripple.setParent_code(RIPPLE_CODE);
			dao_dealshop.addRipple(ripple);
		}
		return "redirect:/deal/main.do" + "#tab_02";
	}
	
	@RequestMapping(value="/review_remove.do", method=RequestMethod.GET)
	public String review_remove(HttpSession session, Ripple ripple) {
		Integer user_no = (Integer) session.getAttribute("user_no");
		
		if(user_no != null){
			ripple.setUser_no(user_no);
			ripple.setParent_code(RIPPLE_CODE);
			dao_dealshop.delRipple(ripple);
		}
		return "redirect:/deal/main.do" + "#tab_02";
	}
	
	
	@RequestMapping(value="/acount.do", method=RequestMethod.POST)
	public ModelAndView acount_reg(HttpSession session, HttpServletRequest request) {
		
		String rtn_url = "redirect:/deal/main.do";
		
		ModelAndView mav = new ModelAndView();
		
		Integer user_no = (Integer) session.getAttribute("user_no");
		if(user_no == null){
			mav.setViewName(rtn_url);
			return mav;
		}
		
		String[] arrItemId = request.getParameterValues("deal_item_id");
		int item_count = arrItemId.length;
		if(item_count == 0){
			mav.setViewName(rtn_url);
			return mav;
		}
		
		String str_deal_id = request.getParameter("deal_id");
		if(str_deal_id == null){
			mav.setViewName(rtn_url);
			return mav;
		}
		
		DealMain dealmain = dao_dealshop.getDealMain( Integer.parseInt(str_deal_id) );
		if(dealmain == null){
			mav.setViewName(rtn_url);
			return mav;
		}
		
		DealEms dealems = dao_dealems.getItemCnt(item_count);
		if(dealems == null){
			mav.setViewName(rtn_url);
			return mav;
		}
		
		// 상품 수량 체크
		if( dealmain.getLimit_count() < dealmain.getSale_count() + item_count ){
			AbstractView view = new AbstractView() {
				@Override
				protected void renderMergedOutputModel(Map<String, Object> arg0,
						HttpServletRequest request, HttpServletResponse response) throws Exception {
					// TODO Auto-generated method stub
					response.setContentType("text/html; charset=UTF-8");
					response.setCharacterEncoding("UTF-8");

					StringBuilder builder = new StringBuilder();
					builder.append("<script type='text/javascript'>");
					builder.append("alert('产品缺乏');"); // 상품 부족
					builder.append("history.back();");
					builder.append("</script>");
					
					response.getWriter().write(builder.toString());
				}
			};
			mav.setView(view);
			return mav;
		}
		
		
		// 유저 정보  
		User user = dao_dealshop.getUserInfo(user_no);
		
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
		paymain.setPay_type(PayMain.PAYTYPE_DEAL);
		
		
		String pay_title = null;
		int total_price_ko = 0;
		int total_price_cn = 0;
		
		for(int i=0; i<arrItemId.length; ++i){
			int item_id = Integer.parseInt( arrItemId[i] );
			DealItem dealitem = dao_dealitem.getData(item_id);
			if(dealitem != null){
				
				
				//////////////////////////////////
				// 결제 상품 리스트 추가
				
				PayItem payitem = new PayItem();
				payitem.setPid(paymain.getPid());
				payitem.setMenu_no(dealitem.getItem_id());
				payitem.setMenu_cnt(1);
				payitem.setItem_type(PayItem.ITEMTYPE_DEAL);
				
				payitem.setItem_location("");
				payitem.setItem_store("");
				payitem.setItem_name(dealitem.getItem_name());
				
				//payitem.setUsed_date("");
				//payitem.setCoupon_value(0);
				payitem.setPay_price_ko(dealitem.getPrice_ko());
				payitem.setPay_price_cn(dealitem.getPrice_cn());

				
				dao_payitem.setInsert(payitem); // pay item insert
				
				/////////////////////////////////////
				
				total_price_ko += payitem.getPay_price_ko();
				total_price_cn += payitem.getPay_price_cn();
				
				if(pay_title == null){
					pay_title = dealmain.getTitle();
					if(arrItemId.length > 1){
						pay_title = pay_title + "(+" + (arrItemId.length -1) + ")" ;
					}
				}
			}
		}
		
		
		// 배송비 EMS 추가
		if(dealems != null){
			//////////////////////////////////
			// 결제 상품 리스트 추가
			
			PayItem payitem = new PayItem();
			payitem.setPid(paymain.getPid());
			payitem.setMenu_no(dealems.getEms_id());
			payitem.setMenu_cnt(1);
			payitem.setItem_type(PayItem.ITEMTYPE_DEAL_COST);

			payitem.setItem_location("");
			payitem.setItem_store("");
			payitem.setItem_name("EMS 运输成本(운송비용)");
			
			//payitem.setUsed_date("");
			//payitem.setCoupon_value(0);
			payitem.setPay_price_ko(dealems.getPrice_ko());
			payitem.setPay_price_cn(dealems.getPrice_cn());
			
			
			dao_payitem.setInsert(payitem); // pay item insert
			
			/////////////////////////////////////
			
			total_price_ko += payitem.getPay_price_ko();
			total_price_cn += payitem.getPay_price_cn();
		}
		
		
		
		paymain.setPay_title(pay_title);
		paymain.setPay_price_ko(total_price_ko);
		paymain.setPay_price_cn(total_price_cn);
		
		dao_paymain.setInsert(paymain);
		
		mav.setViewName("redirect:/deal/acount.do?pid=" + paymain.getPid());
		return mav;
	}
	
	@RequestMapping(value="/acount.do", method=RequestMethod.GET)
	public String acount_view(Model model, HttpSession session, HttpServletRequest request) {
		String rtn_url = "redirect:/deal/main.do";
		
		Integer user_no = (Integer) session.getAttribute("user_no");
		if(user_no == null){
			return "redirect:/login.do";
		}
		
		String pid = request.getParameter("pid");
		PayMain paymain = dao_paymain.getData(pid);
		if(paymain == null){
			return rtn_url;
		}
		
		List<PayItem> payitem_list = dao_payitem.getItemList(paymain.getPid());
		
		
		Map user_map = dao_dealshop.getUserInfoAddress(user_no);
		
		model.addAttribute("provinceList", userService.provinceId());
		model.addAttribute("userinfo", user_map);
		model.addAttribute("paymain", paymain);
		model.addAttribute("payitem_list", payitem_list);
		
		
		// 결제모듈 생성
		InipayWingko inipay = new InipayWingko();
		
		// 주문번호, 주문 가격 입력
		//inipay.setResponseParam(paymain.getPid(), 1050 ); // test code
		inipay.setResponseParam(paymain.getPid(), paymain.getPay_price_ko());
		
		if(inipay.startActionResponse(session) == false){
			logger.info("inipay error : " + inipay.getResultMsg());
		}
		
 
		// 결제 모듈 암호화 및 스트립트 생성
		StringBuilder builder = new StringBuilder();
		model.addAttribute("inipay_form_start",  inipay.getFormStart("./acount_proc.do") );
		model.addAttribute("inipay_data", inipay.getFormData(paymain.getPay_title(), paymain.getUser_name(), paymain.getUser_email(), paymain.getUser_phone() ) );
		model.addAttribute("inipay_form_end", inipay.getFormEnd() );
		
		
		return "/deal/acount";
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
	public ModelAndView acount_proc(Model model, HttpSession session, HttpServletRequest request) throws Exception {
		String rtn_url = "redirect:/deal/main.do";
		
		ModelAndView mav = new ModelAndView();
		
		Integer user_no = (Integer) session.getAttribute("user_no");
		if(user_no == null){
			mav.setViewName("redirect:/login.do");
			return mav;
		}
		
		String pay_mode = request.getParameter("pay_mode");
		String pay_pid = request.getParameter("pid");
		
		if(pay_mode == null || pay_pid == null){
			mav.setViewName(rtn_url);
			return mav;
		}
		
		if(pay_mode.equals("inipay") == false && pay_mode.equals("bank") == false){
			mav.setViewName(rtn_url);
			return mav;
		}
		
		
		
		// 주문 정보
		boolean isPay_Complete = false;
		PayMain paymain = dao_paymain.getData(pay_pid, user_no);
		if(paymain == null){
			mav.setViewName(rtn_url);
			return mav;
		}
		
		
		// 배송정보
		String new_area = request.getParameter("new_area");
		String m_name = null;
		String m_phone = null;
		String m_province_id = null;
		String m_city_id = null;
		String m_area_id = null;
		String m_address = null;
		
		PayArea payarea = new PayArea();
		if(new_area != null && new_area.equals("new_area") == true){
			m_name = request.getParameter("m_name");
			m_phone = request.getParameter("m_phone");
			m_province_id = request.getParameter("province_id");
			m_city_id = request.getParameter("city_id");
			m_area_id = request.getParameter("area_id");
			m_address = request.getParameter("m_address");
			
		}else{
			Map<String, String> user_map = dao_dealshop.getUserInfoAddress(user_no);
			m_name = user_map.get("user_name");
			m_phone = user_map.get("phone");
			m_province_id = user_map.get("province");
			m_city_id = user_map.get("cicy");
			m_area_id = user_map.get("area");
			m_address = user_map.get("address");
		}
		
		if(m_city_id == null) m_city_id = "";
		if(m_area_id == null) m_area_id = "";
		
		payarea.setPid(paymain.getPid());
		payarea.setName( m_name ) ;
		payarea.setPhone(m_phone);
		payarea.setArea(m_province_id + " "+ m_city_id + " "+ m_area_id);
		payarea.setAddress(m_address);

		
		
		// 현금 결제
		if(pay_mode.equals("bank") == true){
			
			if(paymain.getPay_used() != PayMain.PAYUSED_NO){
				mav.setViewName(rtn_url);
				return mav;
			}
			
			isPay_Complete = true;
			

			// 주문정보 상태 업데이트
			paymain.setPay_used(PayMain.PAYUSED_YES);
			//paymain.setPay_state(PayMain.PAYSTATE_PAY_WAIT); // 입금 대기
			//paymain.setSale_price(0); // 미결제
			paymain.setPay_method(PayMain.PAYMETHOD_BANK);
			paymain.setReg_date(DateUtil.getCurrentTimeByFormat("C"));
			dao_paymain.setUpdate(paymain);
			
		}
		else // 카드 결제
		{
		
			// 결제 모듈 생성
			InipayWingko inipay = new InipayWingko();
			
			// 모듈 생성 실패
			inipay.setResultData(session, request);
			if(inipay.startActionResult() ==  false){
				mav.setViewName(rtn_url);
				return mav;
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
			// 데이터 변조 및 오류 처리
			if(MOID.equals(paymain.getPid() ) == false){
				mav.setViewName(rtn_url);
				return mav;
			}

			if(paymain.getPay_used() != PayMain.PAYUSED_NO){
				inipay.cancelOrder(tid, "Data is not match");
				mav.setViewName(rtn_url);
				return mav;
			}
			
			if( paymain.getPay_price_ko() != total_price ){
				inipay.cancelOrder(tid, "Price is not match");
				mav.setViewName(rtn_url);
				return mav;
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
			
			
			if(dao_paycard.getData(paymain.getPid()) == null){
				dao_paycard.setInsert(paycard);
			}else{
				dao_paycard.setUpdate(paycard);
			}
			
			// 결제 성공
			if( inipay.getResultCode().equals("00") == true){ 
				isPay_Complete = true;
				
				// + Deal 판매수량
				int deal_id = dao_dealshop.getOrderDealID(paymain.getPid());
				dao_dealshop.setDealItemSaleCount(deal_id);
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
				//paymain.setCancel_price_ko(total_price);
			}
			
			paymain.setPay_method(PayMain.PAYMETHOD_CARD);
			paymain.setReg_date(DateUtil.getCurrentTimeByFormat("C"));
			dao_paymain.setUpdate(paymain);
			
		}
		
		
		if(isPay_Complete == true){
			// 배송정보 등록
			dao_payarea.setInsert(payarea);
		}
		
		rtn_url = "redirect:/wingshow/acount_result.do?pid=" + paymain.getPid();
		mav.setViewName(rtn_url);
		
		return mav;
	}

}

