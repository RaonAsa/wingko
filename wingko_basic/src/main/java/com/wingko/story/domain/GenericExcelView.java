/*
 * @(#)GenericExcelView.java  2013. 8. 20.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

/**
 * TODO
 * 
 * @author meeroojin
 * @version 1.0, 2013. 8. 20.
 */
public class GenericExcelView extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map<String, Object> modelMap,
			HSSFWorkbook workbook, HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub

		String excelName = (String) modelMap.get("excelName");
		List<String> colName = (List<String>) modelMap.get("colName");
		List<Object> colValue = (List<Object>) modelMap.get("colValue");

		res.setContentType("application/msexcel");
		res.setHeader("Content-Disposition", "attachment; filename=" + excelName + ".xls");

		HSSFSheet sheet = workbook.createSheet(excelName);

		// 상단 메뉴명 생성
		HSSFRow menuRow = sheet.createRow(0);
		for (int i = 0; i < colName.size(); i++) {
			//sheet.setColumnWidth(i, colName.get(i).length() * 1000);
			
			HSSFCell cell = menuRow.createCell(i);
			cell.setCellValue(new HSSFRichTextString(colName.get(i)));
		}

		// 내용 생성
		for (int i = 0; i < colValue.size(); i++) {
			// 메뉴 ROW가 있기때문에 +1을 해준다.
			HSSFRow row = sheet.createRow(i + 1);
			List<String> arrValue = (List)colValue.get(i);
			for (int j = 0; j < arrValue.size(); j++) {
				HSSFCell cell = row.createCell(j);
				cell.setCellValue(new HSSFRichTextString(arrValue.get(j)));
			}
		}

	}

}
