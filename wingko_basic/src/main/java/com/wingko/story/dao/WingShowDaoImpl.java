/*
 * @(#)WingShowDaoImpl.java  2013. 8. 26.
 *
 * Copyright 2013 Wingko All rights reserved.
 */
package com.wingko.story.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.wingko.story.domain.MyCart;
import com.wingko.story.domain.PayItem;
import com.wingko.story.domain.PayMain;
import com.wingko.story.domain.User;
import com.wingko.story.domain.WingMyItem;
import com.wingko.story.domain.WingShow;
import com.wingko.story.session.SqlSessionManager;

/**
 * TODO
 *
 * @author  meeroojin
 * @version 1.0,  2013. 8. 26.
 */
@Repository
public class WingShowDaoImpl implements WingShowDao {
	private SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSession();
	
	@Override
	public int removeCart(int user_no, String[] arr_id){
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_no", user_no);
		map.put("arr_id", arr_id);
		
		try {
			result = session.delete("WingShowMapper.delete_cart", map);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public int removeCartLast(int user_no){
		// TODO Auto-generated method stub
		int result = 0;
		SqlSession session = sessionFactory.openSession();
		try {
			result = session.delete("WingShowMapper.delete_cart_last", user_no);
			session.commit();
		} finally {
			session.close();
		}
		return result;
	}
	
	@Override
	public List<WingShow> getPidList(String pid){
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		
		List<WingShow> list = null;
		try {
			list = session.selectList("WingShowMapper.list_pid", pid);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public List<WingShow> getListUser(int user_no) {
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<WingShow> list;
		try {
			list = session.selectList("WingShowMapper.list_user", user_no);
		} finally {
			session.close();
		}
		return list;
	}
	
	
	
	@Override
	public WingShow getWingShow(int user_no, int cart_id){
		SqlSession session = sessionFactory.openSession();
		
		MyCart mycart = new MyCart();
		mycart.setUser_no(user_no);
		mycart.setCart_id(cart_id);
		
		WingShow wingshow = null;
		try{
			wingshow = session.selectOne("WingShowMapper.get_wingshow", mycart);
		} finally{
			session.close();
		}
		return wingshow;
	}
	
	
	@Override
	public User getUserInfo(int user_no){
		SqlSession session = sessionFactory.openSession();
		
		User user = null;
		try {
			user = session.selectOne("WingShowMapper.select_userinfo", user_no);
		} finally {
			session.close();
		}
		return user;
	}
	
	@Override
	public List<PayMain> getMyReservationOrder(PayMain paymain){
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<PayMain> list;
		try {
			list = session.selectList("WingShowMapper.my_reservation_order", paymain);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public List<WingMyItem> getMyCalendarItem(int user_no, String used_date){
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<WingMyItem> list;
		try {
			Map<String, String> map = new HashMap<String, String>();
			map.put("user_no", Integer.toString(user_no) );
			map.put("used_date", used_date);
			
			list = session.selectList("WingShowMapper.my_calendar_item", map);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public List<WingMyItem> getMyPaymentItem(String pid){
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<WingMyItem> list;
		try {
			list = session.selectList("WingShowMapper.my_payment_item", pid);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public List<PayMain> getMyPaymentOrder(PayMain paymain){
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<PayMain> list;
		try {
			list = session.selectList("WingShowMapper.my_payment_order", paymain);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public List<PayMain> getMyRefundOrder(PayMain paymain){
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<PayMain> list;
		try {
			list = session.selectList("WingShowMapper.my_refund_order", paymain);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public List<Map> getMyPayDealOrder(PayMain paymain){
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Map> list;
		try {
			list = session.selectList("WingShowMapper.my_paydeal_order", paymain);
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public List<Map> getMyRefundDealOrder(PayMain paymain){
		// TODO Auto-generated method stub
		SqlSession session = sessionFactory.openSession();
		List<Map> list;
		try {
			list = session.selectList("WingShowMapper.my_refund_deal_order", paymain);
		} finally {
			session.close();
		}
		return list;
	}
	

}

