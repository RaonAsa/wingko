/*
 * @(#)TopWord.java  2013. 9. 20.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 9. 20.
 */
public class TopWord {

	private int rank;
	private String word;
	private String edit_date;
	private String reg_date;

	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getEdit_date() {
		return edit_date;
	}
	public void setEdit_date(String edit_date) {
		this.edit_date = edit_date;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "TopWord [rank=" + rank + ", word=" + word + ", edit_date="
				+ edit_date + ", reg_date=" + reg_date + "]";
	}
	
	
}

