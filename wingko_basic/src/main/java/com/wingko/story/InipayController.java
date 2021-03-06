/*
 * @(#)InipayController.java  2013. 8. 10.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.inicis.inipay.INIpay50;



/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 10.
 */

@Controller
@RequestMapping("/inipay")
public class InipayController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String index() {
		return "/inipay/index";
	}
	
	@RequestMapping(value="/start.do", method=RequestMethod.GET)
	public String start(Model model, HttpSession session) {
		
		/***************************************
		 * 2. INIpay 인스턴스 생성             *
		 ***************************************/
		INIpay50 inipay = new INIpay50();

		/***************************************
		 * 3. 암호화 대상/값 설정              *
		 ***************************************/
		//inipay.SetField("inipayhome", "/home/hongjun82/resin/webapps/INIpay50");      // 이니페이 홈디렉터리(상점수정 필요)
		inipay.SetField("inipayhome", "D:\\work_sts\\wingko_basic\\src\\main\\webapp");
		
		inipay.SetField("admin", "1111"); 		               // 키패스워드(상점아이디에 따라 변경)
		//***********************************************************************************************************
		//* admin 은 키패스워드 변수명입니다. 수정하시면 안됩니다. 1111의 부분만 수정해서 사용하시기 바랍니다.      *
		//* 키패스워드는 상점관리자 페이지(https://iniweb.inicis.com)의 비밀번호가 아닙니다. 주의해 주시기 바랍니다.*
		//* 키패스워드는 숫자 4자리로만 구성됩니다. 이 값은 키파일 발급시 결정됩니다.                               *
		//* 키패스워드 값을 확인하시려면 상점측에 발급된 키파일 안의 readme.txt 파일을 참조해 주십시오.             *
		//***********************************************************************************************************
		inipay.SetField("type", "chkfake");                        // 고정 (절대 수정 불가)

		inipay.SetField("enctype","asym"); 			                    // 고정 (절대 수정 불가) asym:비대칭, symm:대칭
		inipay.SetField("checkopt", "false"); 		                  // 고정 (절대 수정 불가) base64함:false, base64안함:true
		inipay.SetField("debug","true");                            // 로그모드("true"로 설정하면 상세로그가 생성됨.)

		//필수항목 : mid, price, nointerest, quotabase
		//추가가능 : INIregno, oid
		//*주의* : 	추가가능한 항목중 암호화 대상항목에 추가한 필드는 반드시 hidden 필드에선 제거하고 
//		          SESSION이나 DB를 이용해 다음페이지(INIsecureresult.jsp)로 전달/셋팅되어야 합니다.
		inipay.SetField("mid", "INIpayTest");                           //상점아이디
		inipay.SetField("price", "1000");                               // 가격
		inipay.SetField("nointerest", "no");                            //무이자여부
		inipay.SetField("quotabase", "선택:일시불:2개월:3개월:6개월");  //할부기간
		String[] parameters = {"price","nointerest", "quotabase"};
		inipay.SetField("parameters",parameters);

		/********************************
		 * 4. 암호화 대상/값을 암호화함 *
		 ********************************/


		inipay.startAction();

		/*********************
		 * 5. 암호화 결과    *
		 *********************/
		String rn_resultMsg = "";
				if( inipay.GetResult("ResultCode") != "00" ) 
			{
			    rn_resultMsg = inipay.GetResult("ResultMsg");
			}

		/*********************
		 * 6. 세션정보 저장  *
		 *********************/
		session.setAttribute("INI_MID"    , inipay.GetResult("mid"));
		session.setAttribute("INI_RN"     , inipay.GetResult("rn"));
		session.setAttribute("INI_ENCTYPE", inipay.GetResult("enctype"));
		session.setAttribute("INI_PRICE"  , inipay.GetResult("price") );
		session.setAttribute("admin"      , inipay.GetResult("admin"));

		/*******************************************
		 * 7. 플러그인 전달 정보, hidden field 설정*
		 *******************************************/
		String ini_encfield = inipay.GetResult("encfield");
		String ini_certid   = inipay.GetResult("certid");

		/*********************
		 * 6. 인스턴스 해제  *
		 *********************/
		inipay = null;
		
		
		//return "/inipay/start";
		return "/inipay/INIsecurestart";
	}
	
	@RequestMapping(value="/cancel.do", method=RequestMethod.GET)
	public String cancel() {
		return "/inipay/INIcancel";
	}
	
	@RequestMapping(value="/receipt.do", method=RequestMethod.GET)
	public String receipt() {
		return "/inipay/receipt";
	}
	
}

