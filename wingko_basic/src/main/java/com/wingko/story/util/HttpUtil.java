/*
 * @(#)HttpUtil.java 2013. 7. 27.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
 
/**
 * TODO
 *
 * @author  yshsy
 * @version 1.0,  2013. 7. 27.
 */
public class HttpUtil {

	public static String getString(String urlString, String encoding) {
		StringBuffer sb = new StringBuffer();
		
		try {
			URL url = new URL(urlString);
			URLConnection conn = url.openConnection();
			conn.setConnectTimeout(15000);
			conn.setReadTimeout(15000);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), encoding));
			
			for ( ; ; ) {
				String line = br.readLine();
				if (line == null) {
					break;
				}
				sb.append(line + "\n");
			}
			br.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "";
		}
		
	
		return sb.toString();
	}
	
	public static String getString(String urlString) {
		StringBuffer sb = new StringBuffer();
		
		try {
			URL url = new URL(urlString);
			URLConnection conn = url.openConnection();
			conn.setConnectTimeout(15000);
			conn.setReadTimeout(15000);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			for ( ; ; ) {
				String line = br.readLine();
				if (line == null) {
					break;
				}
				sb.append(line + "\n");
			}
			br.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "";
		}
		
	
		return sb.toString();
	}
}
