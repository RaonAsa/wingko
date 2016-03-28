/*
 * @(#)FileUtil.java  2013. 8. 9.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.util;

import java.io.File;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 9.
 */
public class FileUtil {
	
	public static void checkAndMakeFolder(String path) {
		File file = new File(path);

		if (file.exists()) {
		} else {
			file.mkdir();
		}
	}

}

