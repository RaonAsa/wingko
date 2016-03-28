/*
 * @(#)JSONUtil.java  2013. 4. 16.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.util;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializationConfig;
import org.codehaus.jackson.type.TypeReference;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 4. 16.
 */
public class JSONUtil {


	/**
	 * Object to JSON
	 * 
	 * @param object
	 * @return
	 * @throws Exception
	 */
	public static String ObjectToJSON(Object object) throws Exception {

		if (object == null) {
			return null;
		}

		ObjectMapper mapper = new ObjectMapper();

		mapper.configure(SerializationConfig.Feature.INDENT_OUTPUT, true);

		StringWriter sw = new StringWriter();
		mapper.writeValue(sw, object);

		return sw.toString();
	}
	
	public static Map<String, Object> JsonToMap(String json) throws JsonParseException, JsonMappingException, IOException {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map = mapper.readValue(json, new TypeReference<Map<String, Object>>(){});
		
		return map;		
	}

	//		JsonNode root = mapper.readTree(json);
}

