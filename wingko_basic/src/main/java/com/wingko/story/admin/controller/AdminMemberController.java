/*
 * @(#)AdminMemberController.java  2013. 8. 12.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wingko.story.admin.dao.AdminMailDataDao;
import com.wingko.story.admin.dao.MemberDao;
import com.wingko.story.domain.JoinCode;
import com.wingko.story.domain.MailData;
import com.wingko.story.domain.Member;
import com.wingko.story.util.JSONUtil;
import com.wingko.story.util.MailUtil;
import com.wingko.story.util.PagedList;

/**
 * TODO
 *
 * @author  ysh
 * @version 1.0,  2013. 8. 12.
 */
@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	Logger logger = LoggerFactory.getLogger(AdminMemberController.class);
	
	@Autowired
	private MemberDao dao;
	@Autowired
	private AdminMailDataDao dao_maildata;
	
	
	@RequestMapping("/list.do")
	public String list(Model model, Member member) {

		int totalCount = dao.getListCount(member);
		PagedList<Member> list = null;
		list = new PagedList<Member>(dao.getList(member), member.getPage(), member.getPageSize(), totalCount);
		
		logger.info("dao.getJoinCode()" + dao.getJoinCode().toString());


		model.addAttribute("leftMenu", "1");
		model.addAttribute("list", list);
		model.addAttribute("member", member);
		model.addAttribute("selectData", dao.getJoinCode());

		return "/admin/member/list";
	}
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public String write(Model model, Member member) {
		member = dao.getMember(member);
		
		model.addAttribute("leftMenu", "1");
		model.addAttribute("member",  member);

		return "/admin/member/write";
	}
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String writeSubmit(Model model, Member member) {
		dao.getMemberUpdate(member);
		
		model.addAttribute("page",  member.getPage());
		
		return "redirect:/admin/member/list.do";
	}
	
	
	
	@RequestMapping("/join_list.do")
	public String join_list(Model model, JoinCode joinCode) {

		int totalCount = dao.getJoinListCount(joinCode);
		PagedList<JoinCode> list = null;
		list = new PagedList<JoinCode>(dao.getJoinList(joinCode), joinCode.getPage(), joinCode.getPageSize(), totalCount);

		model.addAttribute("leftMenu", "2");
		model.addAttribute("list", list);

		return "/admin/member/join_list";
	}
	
	@RequestMapping(value="/join_write.do", method=RequestMethod.GET)
	public String join_write(Model model, JoinCode joinCode) {
		if ( joinCode.getJoin_no() > 0) {
			joinCode = dao.getJoin(joinCode); 
		}
		model.addAttribute("leftMenu", "2");
		model.addAttribute("joinCode",  joinCode);
		

		return "/admin/member/join_write";
	}
	@RequestMapping(value="/join_write.do", method=RequestMethod.POST)
	public String join_writeSubmit(Model model, JoinCode joinCode) {
		if ( joinCode.getJoin_no() > 0) {
			dao.getJoinUpdate(joinCode); 
		} else {
			dao.getJoinInsert(joinCode);
		}
		
		model.addAttribute("page",  joinCode.getPage());

		return "redirect:/admin/member/join_list.do";
	}
	@RequestMapping("/join_delete.do")
	public String join_delete(Model model, JoinCode joinCode) {
		dao.getJoinDelete(joinCode); 

		model.addAttribute("page",  joinCode.getPage());
		
		return "redirect:/admin/member/join_list.do";
	}
	
	@RequestMapping("/mail_list.do")
	public String mail_list(Model model, MailData maildata) {
		if(maildata == null){
			maildata = new MailData();
			
		}
		
		int totalCount = dao_maildata.getListAllCount(maildata);
		PagedList<MailData> list = new PagedList<MailData>(dao_maildata.getListAll(maildata), maildata.getPage(), maildata.getPageSize(), totalCount);
		
		model.addAttribute("leftMenu", "3");
		model.addAttribute("list", list);
		
		return "/admin/member/mail_list";
	}
	
	
	@RequestMapping("/mail_form.do")
	public String mai_form(Model model, HttpServletRequest request) {
		
		String mail_type = request.getParameter("mail_type");
		String to_addr = request.getParameter("to_addr");

		model.addAttribute("mail_type", mail_type);
		model.addAttribute("to_addr", to_addr);
		model.addAttribute("from_addr", MailUtil.MAIL_FROM_ADDRESS);
		
		return "/admin/member/mail_form";
	}
	
	
	@RequestMapping("/mail_send_proc.do")
	public void mail_send_proc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setCharacterEncoding("UTF-8");
		Map<String, Object> map = new HashMap<String, Object>();
		
		String mail_type = request.getParameter("mail_type");
		String to_addr = request.getParameter("to_addr");
		
		String from_addr = request.getParameter("from_addr");
		String mail_title = request.getParameter("mail_title");
		String mail_body = request.getParameter("mail_body");
		
		int send_count = 0;
		
		if(mail_type != null && mail_type.equals("all")){
			
			// DB User data
			List<Member> list_member = dao_maildata.getListMemberAll();
			for (Member member : list_member) {
				
				MailUtil.SendMailBody(from_addr, member.getEmail(), mail_title, mail_body); 
				send_count++;
				
				if(send_count % 100 == 0){
					try {
						Thread.sleep(300);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}
			
			MailData maildata = new MailData();
			maildata.setMail_type(mail_type);
			maildata.setAddr_to("");
			maildata.setMail_title(mail_title);
			maildata.setMail_body(mail_body);
			maildata.setSend_count(send_count);
			
			dao_maildata.setInsert(maildata);
			
		}else{ // sel
			if(to_addr != null && to_addr.length() > 0){
				String[] arr_to_addr = to_addr.split(",");
				for(int i = 0; i< arr_to_addr.length; ++i){
					MailUtil.SendMailBody(from_addr, arr_to_addr[i], mail_title, mail_body); 
					send_count++;
				}
				
				MailData maildata = new MailData();
				maildata.setMail_type(mail_type);
				maildata.setAddr_to(to_addr);
				maildata.setMail_title(mail_title);
				maildata.setMail_body(mail_body);
				maildata.setSend_count(send_count);
				
				dao_maildata.setInsert(maildata);
			}
		}
		
		map.put("success", true);
		
		response.getWriter().write(JSONUtil.ObjectToJSON(map));
	}
	
	
	@RequestMapping("/mail_delete.do")
	public String mail_delete(Model model, HttpServletRequest request) {
		
		String arrChkId[] = request.getParameterValues("chk_id");
		
		for(int i=0; i<arrChkId.length; ++i)
		{
			MailData maildata = new MailData();
			maildata.setMail_no( Integer.parseInt(arrChkId[i]) );
			dao_maildata.setDelete(maildata);
		}
		
		return "redirect:/admin/member/mail_list.do";
	}

}

