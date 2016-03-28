package com.wingko.story.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DateUtil {

	private static Logger logger = LoggerFactory.getLogger(DateUtil.class);


	/**
	 * 현재 시간을 타입별로 변환해서 리턴 <br/>
	 *  - A(yyyy-MM-dd) <br/>
	 *  - B(yyyyMMdd) <br/>
	 *  - C(yyyy-MM-dd HH:mm:ss) <br/>
	 *  - D(yyyyMMddHHmmss) <br/>
	 *  - E(yyMMdd) <br/>
	 *  - else(yyyyMMddHHmmss) <br/>
	 *  
	 * @param formatType
	 * @return
	 */
	public static String getCurrentTimeByFormat(String formatType) {

		try {
			SimpleDateFormat date;
			long time = System.currentTimeMillis();


			if ("A".equals(formatType)) {
				date = new SimpleDateFormat("yyyy-MM-dd");
			} else if ("B".equals(formatType)) {
				date = new SimpleDateFormat("yyyyMMdd");
			} else if ("C".equals(formatType)) {
				date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			} else if ("D".equals(formatType)) {
				date = new SimpleDateFormat("yyyyMMddHHmmss");
			} else if ("E".equals(formatType)) {
				date = new SimpleDateFormat("yyMMdd");
			} else {
				date = new SimpleDateFormat("yyyyMMddHHmmss");
			}

			String current = date.format(new Date(time));

			return current;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "";
		}
	}
	
	
	/**
	 * 입력 시간을 타입별로 변환해서 리턴 <br/>
	 *  - A(yyyy-MM-dd) <br/>
	 *  - B(yyyyMMdd) <br/>
	 *  - C(yyyyMMddHHmmss) <br/>
	 *  - D(yyyyMMddHHmmss) <br/>
	 *  - E(yyMMdd) <br/>
	 *  - else(yyyyMMddHHmmss) <br/>
	 *  
	 * @param time
	 * @param formatType
	 * @return
	 */
	public static String getInputTimeByFormat(Date time, String formatType) {

		try {
			SimpleDateFormat date;

			if ("A".equals(formatType)) {
				date = new SimpleDateFormat("yyyy-MM-dd");
			} else if ("B".equals(formatType)) {
				date = new SimpleDateFormat("yyyyMMdd");
			} else if ("C".equals(formatType)) {
				date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			} else if ("D".equals(formatType)) {
				date = new SimpleDateFormat("yyyyMMddHHmmss");
			} else if ("E".equals(formatType)) {
				date = new SimpleDateFormat("yyMMdd");
			} else {
				date = new SimpleDateFormat("yyyyMMddHHmmss");
			}

			String current = date.format(time);

			return current;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "";
		}
	}


	/**
	 * 현재 시간에 날짜를 더한다.
	 * 
	 * @param addDay
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static Date dateAdd(int addDay) {
		Date date;

		date = new Date();
		date.setDate(date.getDate() + addDay);

		return date;

	}
	
	@SuppressWarnings("deprecation")
	public static Date dateAdd(Date date, int addDay) {
		date.setDate(date.getDate() + addDay);

		return date;
	}
	
	
	
	/**
	 * 24시까지 남은 초 반환
	 * 
	 * @return
	 */
	public static int getSecondForCookie() {
		Calendar cr = Calendar.getInstance();
		int year = cr.get(Calendar.YEAR);
		int month = cr.get(Calendar.MONTH);
		int date = cr.get(Calendar.DATE);
	
		long curTime = cr.getTimeInMillis();
		cr.set(year, month, date +1, 0, 0, 0);
		 
		long subTime = cr.getTimeInMillis() - curTime;
		
		return (int) subTime/1000;
	}
}
