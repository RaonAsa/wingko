/*
 * @(#)TestController.java 2013. 7. 21.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
 
/**
 * TODO
 *
 * @author  yshsy
 * @version 1.0,  2013. 7. 21.
 */
@Controller
@RequestMapping("/test")
public class TestController {
	
	
	@RequestMapping(value="/map.do")
	public String map(HttpServletRequest request, Model model) {

		return "/test/map";
	}

	@RequestMapping(value="/map2.do")
	public String map2(HttpServletRequest request, Model model) {
		
		
		return "/test/map2";
	}

	@RequestMapping(value="/weather.do")
	public String weather(HttpServletRequest request, Model model) {
		// 서울 1132599
		// 제주 2345963
		// 경기 2345969
		// 부산 2345968
		// 강원 2345966
		// http://weather.yahooapis.com/forecastrss?w=1132599&u=c

		return "/test/weather";
	}
	
	
	// http://www.google.com/ig/calculator?hl=KR&q=1CNY=?KRW
	// http://www.webservicex.net/CurrencyConvertor.asmx/ConversionRate?FromCurrency=CNY&ToCurrency=KRW
	
	
	
	
}
