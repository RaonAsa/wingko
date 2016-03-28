/*
 * @(#)AdminCouponDaoImpl.java  2013. 8. 1.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.PayAcount;
import com.wingko.story.domain.PayMain;
import com.wingko.story.domain.PayMainSearch;
import com.wingko.story.domain.SelectData;
import com.wingko.story.session.SqlSessionManager;
import com.wingko.story.util.DateUtil;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 1.
 */
@Repository
public class PayMainDaoImpl implements PayMainDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();
	
	@Override
	public int setInsert(PayMain paymain) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.insert("AdminPayMainMapper.insert", paymain);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int setUpdate(PayMain paymain) {
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.update("AdminPayMainMapper.update", paymain);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public PayMain getData(String pid) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		PayMain paymain = null;
		try {
			paymain = session.selectOne("AdminPayMainMapper.select", pid);
		} finally {
			session.close();
		}
		return paymain;
	}
	
	@Override
	public PayMain getData(String pid, int user_no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		PayMain paymain = null;
		try {
			PayMain search = new PayMain();
			search.setPid(pid);
			search.setUser_no(user_no);
			
			paymain = session.selectOne("AdminPayMainMapper.select_user", search);
		} finally {
			session.close();
		}
		return paymain;
	}
	
	

	@Override
	public int getSearchCount(PayMainSearch search)
	{
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.selectOne("AdminPayMainMapper.search_count", search);
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public List<PayMain> getSearchAll(PayMainSearch search){
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<PayMain> list = new ArrayList<PayMain>();
		try {
			list = session.selectList("AdminPayMainMapper.search_all", search);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public List<PayMain> getSearchList(PayMainSearch search)
	{
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<PayMain> list = new ArrayList<PayMain>();
		try {
			list = session.selectList("AdminPayMainMapper.search_list", search);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public List<PayMain> getSearchListStatus(PayMainSearch search){
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<PayMain> list = new ArrayList<PayMain>();
		try {
			list = session.selectList("AdminPayMainMapper.search_list_status", search);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public int getSearchStatusCount(PayMainSearch search){
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.selectOne("AdminPayMainMapper.search_list_status_count", search);
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public List<PayMain> getCheckList(String[] arr_pid)
	{
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<PayMain> list = new ArrayList<PayMain>();
		try {
			list = session.selectList("AdminPayMainMapper.check_list", arr_pid);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public List<PayAcount> getAcountList(PayMainSearch search)
	{
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<PayAcount> list = new ArrayList<PayAcount>();
		try {
			list = session.selectList("AdminPayMainMapper.acount_list", search);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public int getAcountCount(PayMainSearch search)
	{
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		int result = 0;
		try {
			result = session.selectOne("AdminPayMainMapper.acount_count", search);
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public List<PayAcount> getAcountCheckList(String[] arr_regdate)
	{
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<PayAcount> list = new ArrayList<PayAcount>();
		try {
			list = session.selectList("AdminPayMainMapper.acount_chk_list", arr_regdate);
		} finally {
			session.close();
		}
		return list;
	}
	
		
	
	@Override
	public int setComplete(String pid)
	{
		int result = 0;
		
		PayMain paymain = getData(pid);
		if(paymain != null)
		{
			if( paymain.getPay_state().equals(PayMain.PAYSTATE_PAY_COMPLETE) == false){
				paymain.setPay_state(PayMain.PAYSTATE_PAY_COMPLETE);
				paymain.setPay_date( DateUtil.getCurrentTimeByFormat("C") );
				if(paymain.getPay_method().equals(PayMain.PAYMETHOD_CARD) == true){
					paymain.setSale_price_ko(paymain.getPay_price_ko());
					paymain.setSale_price_cn(0);
				}else{
					paymain.setSale_price_ko(0);
					paymain.setSale_price_cn(paymain.getPay_price_cn());
				}
				paymain.setCancel_price_ko(0);
				paymain.setCancel_price_cn(0);
				
				result = setUpdate(paymain);
			}
		}
		
		return result;
	}
	
	@Override
	public int setCancelComplete(String pid, String cancel_msg)
	{
		int result = 0;
		
		PayMain paymain = getData(pid);
		if(paymain != null)
		{
			if( paymain.getPay_state().equals(PayMain.PAYSTATE_CANCEL_COMPLETE) == false){
				paymain.setPay_state(PayMain.PAYSTATE_CANCEL_COMPLETE);
				paymain.setCancel_date(DateUtil.getCurrentTimeByFormat("C") );
				paymain.setCancel_msg(cancel_msg);
				if(paymain.getPay_method().equals(PayMain.PAYMETHOD_CARD) == true){
					paymain.setCancel_price_ko(paymain.getPay_price_ko());
					paymain.setCancel_price_cn(0);
				}else{
					paymain.setCancel_price_ko(0);
					paymain.setCancel_price_cn(paymain.getPay_price_cn());
				}
				paymain.setSale_price_ko(0);
				paymain.setSale_price_cn(0);
				
				result = setUpdate(paymain);
			}
		}
		
		return result;
	}
	
	@Override
	public List<SelectData> getStateSelect()
	{
		List<SelectData> list = new ArrayList<SelectData>();
		list.add( new SelectData("입금대기", PayMain.PAYSTATE_PAY_WAIT) );
		list.add( new SelectData("입금완료", PayMain.PAYSTATE_PAY_COMPLETE) );
		list.add( new SelectData("취소완료", PayMain.PAYSTATE_CANCEL_COMPLETE) );
		list.add( new SelectData("환불요청", PayMain.PAYSTATE_REFUND_REQUEST) );
		list.add( new SelectData("환불완료", PayMain.PAYSTATE_REFUND_COMPLETE) );
		return list;
	}
	
	@Override
	public List<SelectData> getStateSelectPay()
	{
		List<SelectData> list = new ArrayList<SelectData>();
		list.add( new SelectData("입금대기", PayMain.PAYSTATE_PAY_WAIT) );
		list.add( new SelectData("입금완료", PayMain.PAYSTATE_PAY_COMPLETE) );
		return list;
	}
	
	@Override
	public List<SelectData> getStateSelectCancel()
	{
		List<SelectData> list = new ArrayList<SelectData>();
		list.add( new SelectData("취소완료", PayMain.PAYSTATE_CANCEL_COMPLETE) );
		list.add( new SelectData("환불요청", PayMain.PAYSTATE_REFUND_REQUEST) );
		list.add( new SelectData("환불완료", PayMain.PAYSTATE_REFUND_COMPLETE) );
		return list;
	}
	
	@Override
	public List<SelectData> getTypeSelect()
	{
		List<SelectData> list = new ArrayList<SelectData>();
		list.add( new SelectData("STORE", PayMain.PAYTYPE_STORE) );
		list.add( new SelectData("RESERVATION", PayMain.PAYTYPE_RESERVATION) );
		list.add( new SelectData("DEAL", PayMain.PAYTYPE_DEAL) );
		return list;
	}
	
	@Override
	public List<SelectData> getMethodSelect(){
		List<SelectData> list = new ArrayList<SelectData>();
		list.add( new SelectData("BANK", PayMain.PAYMETHOD_BANK) );
		list.add( new SelectData("CARD", PayMain.PAYMETHOD_CARD) );
		return list;
	}
	
}

