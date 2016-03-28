/*
 * @(#)TimestampFileRenamePolicy.java  2013. 8. 9.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.util;

import java.io.File;

import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 9.
 */
public class TimestampFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File f) {
		// TODO Auto-generated method stub
		String name = f.getName();
		String body = null;
		String ext = null;
 
		int dot = name.lastIndexOf(".");
		if (dot != -1) {
			ext = name.substring(dot);
		} else {
			ext = "";
		}
		body = Long.toString( System.currentTimeMillis() );

		File renameFile = new File( f.getParent(), body + ext );
		if( renameFile.exists() ){
			int count = 0;
			do {
				count++;
				String newName = body + count + ext;
				renameFile = new File(f.getParent(), newName);
			}while( renameFile.exists() && count < 9999 );
        }

        f.renameTo( renameFile );

        return renameFile;
	}
}