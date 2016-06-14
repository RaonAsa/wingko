package com.wingko.story;

import static org.junit.Assert.*;

import org.junit.Test;

import com.wingko.story.util.HttpUtil;

public class testHomeController {

	@Test
	public void test() {
		
		/*
		 * 환율 정보 가져오기
		 */
		String data = HttpUtil.getString("http://community.fxkeb.com/fxportal/jsp/RS/DEPLOY_EXRATE/fxrate_all.html", "EUC-KR");
		System.out.println("data 1 : " + data);
		String ex_date = data;
		
		data = data.substring(data.indexOf("CNY"),  data.indexOf("</tr>", data.indexOf("CNY")));
		System.out.println("data  2 : " + data);
		
		data = data.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		data = data.replaceAll("\t", "");
		data = data.replaceAll(" ", "");
		data = data.replaceAll("\n", "|");
		String[] array;
		array= data.split("\\|");
		
		System.out.println("start : " + ex_date.indexOf("<div class='date'>\n<p>"));
		
		ex_date = ex_date.substring( ex_date.indexOf("<div class='date'>\n<p>")+22, ex_date.indexOf("<div class='date'>\n<p>")+22+16 );
		System.out.println("ex_date : " + ex_date);
		System.out.println("buy : " + array[1]);
		System.out.println("sell : " + array[2]);
		System.out.println("now : " + array[0]);
//		model.addAttribute("ex_date", ex_date);
//		model.addAttribute("ex_buy", array[2]);
//		model.addAttribute("ex_sell", array[3]);
//		model.addAttribute("ex_now", array[7]);
//
//    	int rnd = (int) (Math.floor(Math.random() * 10) + 1);
//    	model.addAttribute("rnd", rnd%3);
    	
		assertEquals("", "");
	}

}
