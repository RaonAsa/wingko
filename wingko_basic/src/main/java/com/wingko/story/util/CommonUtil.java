/*
 * @(#)CommonUtil.java 2013. 7. 21.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
/**
 * TODO
 *
 * @author  yshsy
 * @version 1.0,  2013. 7. 21.
 */
public class CommonUtil {

	public static String toUTF8(String str) {
		try {
			return new String(str.getBytes("ISO-8859-1"), "UTF-8");
		} catch (Exception e) {
			return "";
		}
	}
	
	/**
	 * 모든 문자열 치환
	 * @param str
	 * @param target
	 * @param replace
	 * @return
	 */
	public static final String replaceAll(String str, String target, String replace) {
		String sTarget = str;
		String sOldStr = target;
		String sNewStr = replace;
	
		int nPos, nOffset = 0;
		if (sOldStr == null || sOldStr.length() == 0)
			return sTarget;
		if (sNewStr == null)
			sNewStr = "";
	
		while ((nPos = (sTarget.substring(nOffset, sTarget.length()))
				.indexOf(sOldStr)) > -1) {
			sTarget = sTarget.substring(0, nOffset + nPos)
					+ sNewStr
					+ sTarget.substring(nOffset + nPos + sOldStr.length(),
							sTarget.length());
			nOffset = nOffset + nPos + sNewStr.length();
		}

		return sTarget;
	}
	
	
	/**
	 * 이메일 주소 유효성 체크
	 * 
	 * @param email
	 * @return boolean
	 */
	public static boolean isCheckEmail(String email) {
		if (email == null || email.length() == 0) {
			return false;
		}
		
		String regex = "^\\w.+@.+\\.[a-z]+";
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(email);

		if (m.matches()) {
			return true;
		}

		return false;
	}
	
	
	public static boolean isCheckId(String id) {
		if (id == null || id.length() == 0) {
			return false;
		}
		
		String regex = "^[A-Za-z0-9]+$";
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(id);

		if (m.matches()) {
			return true;
		}

		return false;
	}
	
	
	public static String removeHtml(String string) {
		string.replaceAll("<br \\/>", "\r\n");
		return string.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	}
	
	
	/**
	 * 야후 rss 날씨코드 변환
	 * 
	 * @param orgCode
	 * @return
	 */
	public static String convertWeatherCode(String orgCode) {
		int org = Integer.parseInt(orgCode);
		if ( (org >= 0 && org <= 4) || (org >= 37 && org <= 39) ) {
			orgCode = "0";	// 천둥
		} else if ( (org >= 5 && org <= 13) || org == 17 || org == 35 ) {
			orgCode = "1";	// 비
		} else if ( org == 14 || org == 40 || (org >= 45 && org <= 47) ) {
			orgCode = "2";	// 소나기
		} else if ( (org >= 15 && org <= 16) || (org >= 41 && org <= 43) ) {
			orgCode = "3";	// 눈
		} else if ( org == 18 ) {
			orgCode = "4";	// 진눈깨비
		} else if ( (org >= 19 && org <= 22) ) {
			orgCode = "5";	// 안개
		} else if ( org == 23 || org == 24 ) {
			orgCode = "6";	// 바람
		} else if ( org == 25 ) {
			orgCode = "7";	// 추움
		} else if ( org == 26 || org == 27 || org == 28 ) {
			orgCode = "8";	// 흐림
		} else if ( org == 29 || org == 31 || org == 33 ) {
			orgCode = "9";	// 밤 맑음
		} else if ( org == 32 || org == 34 || org == 44 ) {
			orgCode = "10";	// 낮 맑음
		} else if ( org == 30 ) {
			orgCode = "11";	// 구름 조금
		} else if ( org == 36 ) {
			orgCode = "12"; // 더움
		}

		return orgCode;
	}
	
	
	/**
	 * 야후 rss 날씨코드 이미지
	 * 
	 * @param orgCode
	 * @return
	 */
	public static String getWeatherImage(String orgCode) {
		int org = Integer.parseInt(orgCode);
		if ( (org >= 0 && org <= 4) || (org >= 37 && org <= 39) ) {
			orgCode = "lightning_rain-.png";	// 천둥
		} else if ( (org >= 5 && org <= 13) || org == 17 || org == 35 ) {
			orgCode = "rain.png";	// 비
		} else if ( org == 14 || org == 40 || (org >= 45 && org <= 47) ) {
			orgCode = "shower.png";	// 소나기
		} else if ( (org >= 15 && org <= 16) || (org >= 41 && org <= 43) ) {
			orgCode = "sonw.png";	// 눈
		} else if ( org == 18 ) {
			orgCode = "sonw.png";	// 진눈깨비
		} else if ( (org >= 19 && org <= 22) ) {
			orgCode = "mist.png";	// 안개
		} else if ( org == 23 || org == 24 ) {
			orgCode = "wind.png";	// 바람
		} else if ( org == 25 ) {
			orgCode = "cold.png";	// 추움
		} else if ( org == 26 || org == 27 || org == 28 ) {
			orgCode = "cloud.png";	// 흐림
		} else if ( org == 29 || org == 31 || org == 33 ) {
			orgCode = "night_clear.png";	// 밤 맑음
		} else if ( org == 32 || org == 34 || org == 44 ) {
			orgCode = "sun.png";	// 낮 맑음
		} else if (org == 30 ) {
			orgCode = "cloud.png";	// 구름 조금
		} else if ( org == 36 ) {
			orgCode = "hot.png"; // 더움
		}

		return orgCode;
	}
	
	
	
	public static void setCookiesProduct(HttpServletResponse res , HttpServletRequest req, String user_no) {
/*		Cookie quick = new Cookie("cart", user_no);
		
		quick.get
		
		quick.set*/
		
	}
}
