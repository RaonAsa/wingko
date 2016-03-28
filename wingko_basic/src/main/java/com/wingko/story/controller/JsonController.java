/*
 * @(#)JsonController.java 2013. 7. 27.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.thoughtworks.xstream.XStream;
import com.wingko.story.domain.Store;
import com.wingko.story.service.JsonService;
import com.wingko.story.util.CommonUtil;
import com.wingko.story.util.HttpUtil;
import com.wingko.story.util.JSONUtil;
 
/**
 * TODO
 *
 * @author  yshsy
 * @version 1.0,  2013. 7. 27.
 */
@Controller
@RequestMapping("/json")
public class JsonController {
	
	Logger logger = LoggerFactory.getLogger(JsonController.class);
	
	@Autowired
	JsonService service;
	
	@RequestMapping("/weather")
	public void weather(HttpServletResponse res) {
		// 서울 1132599
		// 제주 2345963
		// 경기 2345969
		// 부산 2345968
		// 강원 2345966
		// http://weather.yahooapis.com/forecastrss?w=1132599&u=c
		
//		String[] location = {"Seoul", "Jeju", "Gyeonggi", "Busan", "Gangwon"};
//		String[] wCode = {"1132599", "2345963", "2345969", "2345968", "2345966"};
		String[] location = {"Seoul", "Jeju", "Busan"};
		String[] wCode = {"1132599", "2345963", "2345968"};
		
		List<Map<String, String>> weatherList = new ArrayList<Map<String,String>>();
		
		try {
			for (int i = 0; i < wCode.length; i++) {
				String urlString = "http://weather.yahooapis.com/forecastrss?w="+wCode[i]+"&u=c";

				DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = builderFactory.newDocumentBuilder();
				Document doc = builder.parse(urlString);

		        NodeList yweather = doc.getElementsByTagName("yweather:condition");
		        Node weather = yweather.item(0);
		        Element w = (Element) weather;

		        HashMap<String, String> map = new HashMap<String, String>();
		        map.put("location", location[i]);
		        map.put("code", CommonUtil.convertWeatherCode(w.getAttribute("code")));
		        map.put("temp", w.getAttribute("temp"));
		        map.put("text", w.getAttribute("text"));

		        weatherList.add(map);
			}

			String jsonData = JSONUtil.ObjectToJSON(weatherList);
			res.setCharacterEncoding("utf-8");
			res.getWriter().write(jsonData);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}
	
	
	@RequestMapping("/exchange")
	public void exchange(HttpServletResponse res) {
		String url = "http://www.google.com/ig/calculator?hl=KR&q=1USD=?KRW";
		String jsonData = HttpUtil.getString(url, "UTF-8");

		logger.info(jsonData);

		try {
			res.setCharacterEncoding("utf-8");
			res.getWriter().write(JSONUtil.ObjectToJSON(jsonData));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	@RequestMapping("/map/list.do")
	public void map(HttpServletResponse res) {

		
		List<Store> list = new ArrayList<Store>();
		
		Map map = new HashMap<String, String>();
		map.put("location_no", "8");
		list = service.getMapListByProduct(map);

		logger.info("list >>> " + list.toString());

		String jsonData;
		try {
			jsonData = JSONUtil.ObjectToJSON(list);

			res.setCharacterEncoding("utf-8");
			res.getWriter().write(JSONUtil.ObjectToJSON(jsonData));
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
