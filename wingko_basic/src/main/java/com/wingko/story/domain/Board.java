/*
 * @(#)Board.java 2013. 8. 3.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.domain;
 
/**
 * TODO
 *
 * @author  yshsy
 * @version 1.0,  2013. 8. 3.
 */
public class Board extends Page {
	
	private int no;
	private int board_category_no;
	private String board_caetgory_name;
	private int location_no;
	private String location_name;
	private String notice_flag;
	private String title;
	private String content;
	private int user_no;
	private String user_id;
	private String user_nickname;
	private int hit;
	private int recommend;
	private String edit_date;
	private String reg_date;
	

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBoard_category_no() {
		return board_category_no;
	}
	public void setBoard_category_no(int board_category_no) {
		this.board_category_no = board_category_no;
	}
	public void setBoard_category_no(String board_name) {
		if ("blog".equals(board_name)) {
			this.board_category_no = 1;	
		} else if ("marketplace".equals(board_name)) {
			this.board_category_no = 2;	
		} else if ("jobinfo".equals(board_name)) {
			this.board_category_no = 3;	
		} else if ("question".equals(board_name)) {
			this.board_category_no = 4;	
		}
	}
	public String getBoard_caetgory_name() {
		return board_caetgory_name;
	}
	public void setBoard_caetgory_name(String board_caetgory_name) {
		this.board_caetgory_name = board_caetgory_name;
	}
	public int getLocation_no() {
		return location_no;
	}
	public void setLocation_no(int location_no) {
		this.location_no = location_no;
	}
	public String getLocation_name() {
		return location_name;
	}
	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}
	public String getNotice_flag() {
		return notice_flag;
	}
	public void setNotice_flag(String notice_flag) {
		this.notice_flag = notice_flag;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
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
		return "Board [no=" + no + ", board_category_no=" + board_category_no
				+ ", board_caetgory_name=" + board_caetgory_name
				+ ", location_no=" + location_no + ", location_name="
				+ location_name + ", notice_flag=" + notice_flag + ", title="
				+ title + ", content=" + content + ", user_no=" + user_no
				+ ", user_id=" + user_id + ", user_nickname=" + user_nickname
				+ ", hit=" + hit + ", recommend=" + recommend + ", edit_date="
				+ edit_date + ", reg_date=" + reg_date + "]";
	}

	
}
