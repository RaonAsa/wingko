/*
 * @(#)IniPayManager.java  2013. 8. 12.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.inipay;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.inicis.inipay.INIpay50;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 12.
 */
public class InipayWingko {
	private String m_site_url = "http://www.wingkostory.com";
	
	
	private INIpay50 inipay = null;
	
	private String ini_encfield = "";
	private String ini_certid = "";
	private String rn_resultMsg = "";
	private String rn_resultCode = "";
	
	public String getResultCode(){
		return this.rn_resultCode;
	}
	public String getResultMsg(){
		return this.rn_resultMsg;
	}
	
	public String getValue(String key){
		return inipay.GetResult(key);
	}
	
	private void init(){
		if(inipay == null){
			/***************************************
			 * 2. INIpay 인스턴스 생성             *
			 ***************************************/
			//INIpay50 inipay = new INIpay50();
			inipay = new INIpay50();
		}
	}
	
	public void free(){
		inipay = null;
	}
	
	public InipayWingko()
	{
		init();

		/***************************************
		 * 3. 암호화 대상/값 설정              *
		 ***************************************/
		
		inipay.SetField("inipayhome", "/var/www/html/root");      // 이니페이 홈디렉터리(상점수정 필요)
		//inipay.SetField("inipayhome", "D:\\work_sts\\wingko_basic\\src\\main\\webapp"); // hotdog
		

		
		inipay.SetField("admin", "1111"); 		               // 키패스워드(상점아이디에 따라 변경)
		inipay.SetField("mid", "wingkocomm");               // 상점아이디
		//inipay.SetField("mid", "INIpayTest");               // 상점아이디(Test)
	}
	
	
	
	public void setResponseParam(String oid, int price){
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
//				          SESSION이나 DB를 이용해 다음페이지(INIsecureresult.jsp)로 전달/셋팅되어야 합니다.
		//inipay.SetField("mid", m_mid);                           //상점아이디
		inipay.SetField("oid", oid);				// oid 주문번호
		inipay.SetField("price", Integer.toString(price) );                               // 가격
		inipay.SetField("nointerest", "no");                            //무이자여부
		inipay.SetField("quotabase", "선택:일시불:2개월:3개월:6개월");  //할부기간
		
		String[] parameters = {"oid", "price","nointerest", "quotabase"};
		inipay.SetField("parameters",parameters);
	}
	
	public boolean startActionResponse(HttpSession session){
		if(inipay == null) {
			rn_resultMsg = "inipay is null.";
			return false;
		}
		
		inipay.startAction();

		/*********************
		 * 5. 암호화 결과    *
		 *********************/
		rn_resultMsg = "";
		rn_resultCode = inipay.GetResult("ResultCode");
		if( !rn_resultCode.equals( "00" ) )
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
		ini_encfield = inipay.GetResult("encfield");
		ini_certid   = inipay.GetResult("certid");

		/*********************
		 * 6. 인스턴스 해제  *
		 *********************/
		//inipay = null;
		
		if(rn_resultMsg.length() == 0) return true;
		return false;
	}
	
	public String getFormStart(String frm_action){
		return "<form name='ini' method='post' action='" +frm_action+ "' onSubmit='return pay(this)'>";
	}
	
	public String getFormEnd(){
		return "</form>";
	}
	
	public String getFormData(String pay_title, String user_name, String user_email, String user_phone){
		StringBuilder builder = new StringBuilder();
		
		builder.append("\r\n<br/><select name='gopaymethod' >");
		builder.append("<option value='Card'>신용카드 결제</option>");
		builder.append("<option value='VCard'>인터넷안전 결제</option>");
		builder.append("</select>");
		
		builder.append("\r\n<br/><input type='text' title='item_title' name='goodname' size='20' value='" +pay_title+ "' />");
		builder.append("\r\n<br/><input type='text' title='user_name' name='buyername' size='20' value='" +user_name+ "' />");
		builder.append("\r\n<br/><input type='text' title='user_email' name='buyeremail' size='20' value='" +user_email+ "' />");
		builder.append("\r\n<br/><input type='text' title='user_tel' name='buyertel' size='20' value='" +user_phone+ "' />");
		
		
		/*<!-- 기타설정 -->
		<!--
		SKIN : 플러그인 스킨 칼라 변경 기능 - 5가지 칼라(ORIGINAL, GREEN, YELLOW, RED,PURPLE)
		HPP : 컨텐츠 또는 실물 결제 여부에 따라 HPP(1)과 HPP(2)중 선택 적용(HPP(1):컨텐츠, HPP(2):실물).
		Card(0): 신용카드 지불시에 이니시스 대표 가맹점인 경우에 필수적으로 세팅 필요 ( 자체 가맹점인 경우에는 카드사의 계약에 따라 설정) - 자세한 내용은 메뉴얼  참조.
		OCB : OK CASH BAG 가맹점으로 신용카드 결제시에 OK CASH BAG 적립을 적용하시기 원하시면 "OCB" 세팅 필요 그 외에 경우에는 삭제해야 정상적인 결제 이루어짐.
		no_receipt : 은행계좌이체시 현금영수증 발행여부 체크박스 비활성화 (현금영수증 발급 계약이 되어 있어야 사용가능)
		-->*/
		//builder.append("\r\n<input type='hidden' name='acceptmethod' value='SKIN(ORIGINAL):HPP(1)' />");
		builder.append("\r\n<input type='hidden' name='acceptmethod' value='LANG(ENGLISH)' />");
		builder.append("\r\n<input type='hidden' name='currency' value='WON' />");
		
		
		
		/*<!--
		상점 주문번호 : 무통장입금 예약(가상계좌 이체),전화결재 관련 필수필드로 반드시 상점의 주문번호를 페이지에 추가해야 합니다.
		결제수단 중에 은행 계좌이체 이용 시에는 주문 번호가 결제결과를 조회하는 기준 필드가 됩니다.
		상점 주문번호는 최대 40 BYTE 길이입니다.
		## 주의:절대 한글값을 입력하시면 안됩니다. ##
		-->*/
		//builder.append("<input type=hidden name=oid size=40 value='orderid_of_merchant' />"); // setParam
		

		/*<!--
		플러그인 좌측 상단 상점 로고 이미지 사용
		이미지의 크기 : 90 X 34 pixels
		플러그인 좌측 상단에 상점 로고 이미지를 사용하실 수 있으며,
		주석을 풀고 이미지가 있는 URL을 입력하시면 플러그인 상단 부분에 상점 이미지를 삽입할수 있습니다.
		-->
		<!--input type=hidden name=ini_logoimage_url  value="http://[사용할 이미지주소]"-->
		*/

		/*<!--
		좌측 결제메뉴 위치에 이미지 추가
		이미지의 크기 : 단일 결제 수단 - 91 X 148 pixels, 신용카드/ISP/계좌이체/가상계좌 - 91 X 96 pixels
		좌측 결제메뉴 위치에 미미지를 추가하시 위해서는 담당 영업대표에게 사용여부 계약을 하신 후
		주석을 풀고 이미지가 있는 URL을 입력하시면 플러그인 좌측 결제메뉴 부분에 이미지를 삽입할수 있습니다.
		-->
		<!--input type=hidden name=ini_menuarea_url value="http://[사용할 이미지주소]"-->
		*/
		
		/*
		<!--
		플러그인에 의해서 값이 채워지거나, 플러그인이 참조하는 필드들
		삭제/수정 불가
		uid 필드에 절대로 임의의 값을 넣지 않도록 하시기 바랍니다.
		-->*/
		builder.append("\r\n<input type='hidden' name='ini_encfield' value='" + ini_encfield + "' /> ");
		builder.append("\r\n<input type='hidden' name='ini_certid' value='" + ini_certid + "' /> ");
		builder.append("\r\n<input type='hidden' name='quotainterest' value='' /> ");
		builder.append("\r\n<input type='hidden' name='paymethod' value='' /> ");
		builder.append("\r\n<input type='hidden' name='cardcode' value='' /> ");
		builder.append("\r\n<input type='hidden' name='cardquota' value='' /> ");
		builder.append("\r\n<input type='hidden' name='rbankcode' value='' /> ");
		builder.append("\r\n<input type='hidden' name='reqsign' value='DONE' /> ");
		builder.append("\r\n<input type='hidden' name='encrypted' value='' /> ");
		builder.append("\r\n<input type='hidden' name='sessionkey' value='' /> ");
		builder.append("\r\n<input type='hidden' name='uid' value='' />  ");
		builder.append("\r\n<input type='hidden' name='sid' value='' /> ");
		builder.append("\r\n<input type='hidden' name='version' value='5000'> ");
		builder.append("\r\n<input type='hidden' name='clickcontrol' value='' /> ");
		
		
		return builder.toString();
	}
	
	
	
	
	public void setResultData(HttpSession session, HttpServletRequest request){
		
		init();
		
		inipay.SetField("type", "securepay");  // 고정 (절대 수정 불가)
		inipay.SetField("admin", session.getAttribute("admin"));  // 키패스워드(상점아이디에 따라 변경)
		//***********************************************************************************************************
		//* admin 은 키패스워드 변수명입니다. 수정하시면 안됩니다. 1111의 부분만 수정해서 사용하시기 바랍니다.      *
		//* 키패스워드는 상점관리자 페이지(https://iniweb.inicis.com)의 비밀번호가 아닙니다. 주의해 주시기 바랍니다.*
		//* 키패스워드는 숫자 4자리로만 구성됩니다. 이 값은 키파일 발급시 결정됩니다.                               *
		//* 키패스워드 값을 확인하시려면 상점측에 발급된 키파일 안의 readme.txt 파일을 참조해 주십시오.             *
		//***********************************************************************************************************
		inipay.SetField("debug", "true");  // 로그모드("true"로 설정하면 상세로그가 생성됨.)
			
		inipay.SetField("uid", request.getParameter("uid") );  // INIpay User ID (절대 수정 불가)
		inipay.SetField("oid", request.getParameter("oid") );  // 상품명 
		inipay.SetField("goodname", request.getParameter("goodname") );  // 상품명 
		inipay.SetField("currency", request.getParameter("currency") );  // 화폐단위
		
		inipay.SetField("mid", session.getAttribute("INI_MID") );  // 상점아이디
		inipay.SetField("enctype", session.getAttribute("INI_ENCTYPE") );  //웹페이지 위변조용 암호화 정보
		inipay.SetField("rn", session.getAttribute("INI_RN") );  //웹페이지 위변조용 RN값
		inipay.SetField("price", session.getAttribute("INI_PRICE") );  //가격
		
		
		/**---------------------------------------------------------------------------------------
		   * price 등의 중요데이터는
		   * 브라우저상의 위변조여부를 반드시 확인하셔야 합니다.
		   *
		   * 결제 요청페이지에서 요청된 금액과
		   * 실제 결제가 이루어질 금액을 반드시 비교하여 처리하십시오.
		   *
		   * 설치 메뉴얼 2장의 결제 처리페이지 작성부분의 보안경고 부분을 확인하시기 바랍니다.
		   * 적용참조문서: 이니시스홈페이지->가맹점기술지원자료실->기타자료실 의
		   *              '결제 처리 페이지 상에 결제 금액 변조 유무에 대한 체크' 문서를 참조하시기 바랍니다.
		   * 예제)
		   * 원 상품 가격 변수를 OriginalPrice 하고  원 가격 정보를 리턴하는 함수를 Return_OrgPrice()라 가정하면
		   * 다음 같이 적용하여 원가격과 웹브라우저에서 Post되어 넘어온 가격을 비교 한다.
		   *
				String originalPrice = merchant.getOriginalPrice();
				String postPrice = inipay.GetResult("price"); 
				if ( originalPrice != postPrice )
				{
					//결제 진행을 중단하고  금액 변경 가능성에 대한 메시지 출력 처리
					//처리 종료 
				}
		  ---------------------------------------------------------------------------------------**/

		  inipay.SetField("paymethod", request.getParameter("paymethod") );			          // 지불방법 (절대 수정 불가)
		  inipay.SetField("encrypted", request.getParameter("encrypted") );			          // 암호문
		  inipay.SetField("sessionkey",request.getParameter("sessionkey") );			        // 암호문
		  inipay.SetField("buyername", request.getParameter("buyername") );			          // 구매자 명
		  inipay.SetField("buyertel", request.getParameter("buyertel") );			            // 구매자 연락처(휴대폰 번호 또는 유선전화번호)
		  inipay.SetField("buyeremail",request.getParameter("buyeremail") );			        // 구매자 이메일 주소
		  inipay.SetField("url", m_site_url ); 	                      // 실제 서비스되는 상점 SITE URL로 변경할것
		  inipay.SetField("cardcode", request.getParameter("cardcode") ); 	          		// 카드코드 리턴
		  inipay.SetField("parentemail", request.getParameter("parentemail") ); 			    // 보호자 이메일 주소(핸드폰 , 전화결제시에 14세 미만의 고객이 결제하면  부모 이메일로 결제 내용통보 의무, 다른결제 수단 사용시에 삭제 가능)
			
		  /*-----------------------------------------------------------------*
		   * 수취인 정보 *                                                   *
		   *-----------------------------------------------------------------*
		   * 실물배송을 하는 상점의 경우에 사용되는 필드들이며               *
		   * 아래의 값들은 INIsecurestart.jsp 페이지에서 포스트 되도록        *
		   * 필드를 만들어 주도록 하십시요.                                  *
		   * 컨텐츠 제공업체의 경우 삭제하셔도 무방합니다.                   *
		   *-----------------------------------------------------------------*/
		  inipay.SetField("recvname",request.getParameter("recvname") );	// 수취인 명
		  inipay.SetField("recvtel",request.getParameter("recvtel") );		// 수취인 연락처
		  inipay.SetField("recvaddr",request.getParameter("recvaddr") );	// 수취인 주소
		  inipay.SetField("recvpostnum",request.getParameter("recvpostnum") );  // 수취인 우편번호
		  inipay.SetField("recvmsg",request.getParameter("recvmsg") );		// 전달 메세지
			
		  inipay.SetField("joincard",request.getParameter("joincard") );        // 제휴카드코드
		  inipay.SetField("joinexpire",request.getParameter("joinexpire") );    // 제휴카드유효기간
		  inipay.SetField("id_customer",request.getParameter("id_customer") );  // 일반적인 경우 사용하지 않음, user_id
	}
	
	public boolean startActionResult(){
		  
		  /****************
		   * 4. 지불 요청 *
		   ****************/ 
		  inipay.startAction();
			
		  //Get PG Added Entity Sample
		  rn_resultCode = inipay.GetResult("ResultCode");
		  rn_resultMsg = inipay.GetResult("ResultMsg");
		  if(rn_resultCode.equals("00") )
		  {
			  return true;
		  }
		  return false;
		  
		  /*****************
		   * 5. 결제  결과 *
		   *****************/
		  /*****************************************************************************************************************
		   *  1 모든 결제 수단에 공통되는 결제 결과 데이터
		   * 	거래번호 : inipay.GetResult("tid")
		   * 	결과코드 : inipay.GetResult("ResultCode") ("00"이면 지불 성공)
		   * 	결과내용 : inipay.GetResult("ResultMsg") (지불결과에 대한 설명)
		   * 	지불방법 : inipay.GetResult("PayMethod") (매뉴얼 참조)
		   * 	상점주문번호 : inipay.GetResult("MOID")
		   *	결제완료금액 : inipay.GetResult("TotPrice")
		   * 	이니시스 승인날짜 : inipay.GetResult("ApplDate") (YYYYMMDD)
		   * 	이니시스 승인시각 : inipay.GetResult("ApplTime") (HHMMSS)  
		   *
		   *
		   * 결제 되는 금액 =>원상품가격과  결제결과금액과 비교하여 금액이 동일하지 않다면
		   * 결제 금액의 위변조가 의심됨으로 정상적인 처리가 되지않도록 처리 바랍니다. (해당 거래 취소 처리)
		   *
		   *  2. 일부 결제 수단에만 존재하지 않은 정보,
		   *     OCB Point/VBank 를 제외한 지불수단에 모두 존재.
		   * 	승인번호 : inipay.GetResult("ApplNum") 
		   *
		   *
		   *  3. 신용카드 결제 결과 데이터 (Card, VCard 공통)
		   * 	할부기간 : inipay.GetResult("CARD_Quota")
		   * 	무이자할부 여부 : inipay.GetResult("CARD_Interest") ("1"이면 무이자할부), 
		   *                    또는 inipay.GetResult("EventCode") (무이자/할인 행사적용 여부, 값에 대한 설명은 메뉴얼 참조)
		   * 	신용카드사 코드 : inipay.GetResult("CARD_Code") (매뉴얼 참조)
		   * 	카드발급사 코드 : inipay.GetResult("CARD_BankCode") (매뉴얼 참조)
		   * 	본인인증 수행여부 : inipay.GetResult("CARD_AuthType") ("00"이면 수행)
		   *  각종 이벤트 적용 여부 : inipay.GetResult("EventCode")
		   *
		   *
		   *      ** 달러결제 시 통화코드와  환률 정보 **
		   *	해당 통화코드 : inipay.GetResult("OrgCurrency")
		   *	환율 : inipay.GetResult("ExchangeRate")
		   *
		   *      아래는 "신용카드 및 OK CASH BAG 복합결제" 또는"신용카드 지불시에 OK CASH BAG적립"시에 추가되는 데이터
		   * 	OK Cashbag 적립 승인번호 : inipay.GetResult("OCB_SaveApplNum")
		   * 	OK Cashbag 사용 승인번호 : inipay.GetResult("OCB_PayApplNum")
		   * 	OK Cashbag 승인일시 : inipay.GetResult("OCB_ApplDate") (YYYYMMDDHHMMSS)
		   * 	OCB 카드번호 : inipay.GetResult("OCB_Num")
		   * 	OK Cashbag 복합결재시 신용카드 지불금액 : inipay.GetResult("CARD_ApplPrice")
		   * 	OK Cashbag 복합결재시 포인트 지불금액 : inipay.GetResult("OCB_PayPrice")
		   *
		   * 4. 실시간 계좌이체 결제 결과 데이터
		   *
		   * 	은행코드 : inipay.GetResult("ACCT_BankCode")
		   *	현금영수증 발행결과코드 : inipay.GetResult("CSHR_ResultCode")
		   *	현금영수증 발행구분코드 : inipay.GetResult("CSHR_Type")
		   *
		   * 5. OK CASH BAG 결제수단을 이용시에만  결제 결과 데이터
		   * 	OK Cashbag 적립 승인번호 : inipay.GetResult("OCB_SaveApplNum")
		   * 	OK Cashbag 사용 승인번호 : inipay.GetResult("OCB_PayApplNum")
		   * 	OK Cashbag 승인일시 : inipay.GetResult("OCB_ApplDate") (YYYYMMDDHHMMSS)
		   * 	OCB 카드번호 : inipay.GetResult("OCB_Num")
		   *
		   * 6. 무통장 입금 결제 결과 데이터
		   * 	가상계좌 채번에 사용된 주민번호 : inipay.GetResult("VACT_RegNum")
		   * 	가상계좌 번호 : inipay.GetResult("VACT_Num")
		   * 	입금할 은행 코드 : inipay.GetResult("VACT_BankCode")
		   * 	입금예정일 : inipay.GetResult("VACT_Date") (YYYYMMDD)
		   * 	송금자 명 : inipay.GetResult("VACT_InputName")
		   * 	예금주 명 : inipay.GetResult("VACT_Name")
		   *
		   * 7. 핸드폰, 전화 결제 결과 데이터( "실패 내역 자세히 보기"에서 필요 , 상점에서는 필요없는 정보임)
		   * 	전화결제 사업자 코드 : inipay.GetResult("HPP_GWCode")
		   *
		   * 8. 핸드폰 결제 결과 데이터
		   * 	휴대폰 번호 : inipay.GetResult("HPP_Num") (핸드폰 결제에 사용된 휴대폰번호)
		   *
		   * 9. 전화 결제 결과 데이터
		   * 	전화번호 : inipay.GetResult("ARSB_Num") (전화결제에  사용된 전화번호)
		   *
		   * 10. 문화 상품권 결제 결과 데이터
		   * 	컬쳐 랜드 ID : inipay.GetResult("CULT_UserID")
		   *
		   * 11. 현금영수증 발급 결과코드 (은행계좌이체시에만 리턴)
		   *    inipay.GetResult("CSHR_ResultCode")
		   *
		   * 12.틴캐시 잔액 데이터
		   *    inipay.GetResult("TEEN_Remains")
		   *  틴캐시 ID : inipay.GetResult("TEEN_UserID")
		   *
		   * 13.스마트문상 상품권
		   *	사용 카드 갯수 : inipay.GetResult("GAMG_Cnt")
		   *
		   * 14.도서문화 상품권
		   *	사용자 ID : inipay.GetResult("BCSH_UserID")
		   *
		   ****************************************************************************************************************/


		  /*******************************************************************
		   * 7. DB연동 실패 시 강제취소                                      *
		   *                                                                 *
		   * 지불 결과를 DB 등에 저장하거나 기타 작업을 수행하다가 실패하는  *
		   * 경우, 아래의 코드를 참조하여 이미 지불된 거래를 취소하는 코드를 *
		   * 작성합니다.                                                     *
		   *******************************************************************/
		  /*
		  boolean cancelFlag = false;
		  // cancelFlag를 "ture"로 변경하는 condition 판단은 개별적으로
		  // 수행하여 주십시오.

		  if(cancelFlag)
		  {
		    String tmp_TID = inipay.GetResult("tid");
		    inipay.SetField("type", "cancel");         // 고정
		    inipay.SetField("tid", tmp_TID);              // 고정
		    inipay.SetField("cancelmsg", "DB FAIL");   // 취소사유
		    inipay.startAction();
		  }
		  */
		  
	}
	
	public boolean cancelOrder(String tid, String cancel_msg){
		
		init();
		
		inipay.SetField("type", "cancel");         // 고정
	    inipay.SetField("tid", tid);              // 고정
	    inipay.SetField("debug","true");
	    inipay.SetField("cancelmsg", cancel_msg);   // 취소사유
	    inipay.startAction();
	    
	    rn_resultCode = inipay.GetResult("ResultCode");
		rn_resultMsg = inipay.GetResult("ResultMsg");
		if(rn_resultCode.equals("00") )
		{
			return true;
		}
		return false;
	}
}

