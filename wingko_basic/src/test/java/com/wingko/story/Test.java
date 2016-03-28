/*
 * @(#)Test.java  2013. 8. 16.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.wingko.story.controller.JsonController;
import com.wingko.story.util.HttpUtil;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 16.
 */
public class Test {
	
	private static Logger logger = LoggerFactory.getLogger(Test.class);

	public static void main(String[] args) {
		String weatherSeoul = HttpUtil.getString("http://weather.yahooapis.com/forecastrss?w=1132599&u=c", "utf-8");
		
		try {
			String urlString = "http://weather.yahooapis.com/forecastrss?w=1132599&u=c";

			DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = builderFactory.newDocumentBuilder();
			Document doc = builder.parse(urlString);

            NodeList yweather = doc.getElementsByTagName("yweather:condition");
            Node weather = yweather.item(0);
            Element w = (Element) weather;
            
            logger.info("text ::: " + w.getAttribute("text"));
            logger.info("code ::: " + w.getAttribute("code"));
            logger.info("temp ::: " + w.getAttribute("temp"));
            logger.info("date ::: " + w.getAttribute("date"));
            
            NodeList description = doc.getElementsByTagName("description");
//            logger.info(description.getLength() + "");
//            logger.info(description.item(0).getNodeName());
//            logger.info(description.item(1).getNodeName());

            Node desc = description.item(1);
//            logger.info(desc.getTextContent() + "");
            String img =  desc.getTextContent();
            img = img.substring(img.indexOf("<img src=")+10, img.indexOf("\"/>"));
            logger.info(img);
            //line.substring(line.indexOf("<"))
//            Element d = (Element) desc;
//            logger.info(d.toString());

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}

