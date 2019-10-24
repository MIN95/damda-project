package com.bit.pro.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bit.pro.dao.OrderDao;
import com.bit.pro.vo.AddrVo;
import com.bit.pro.vo.OrderVo;

@Service("orderSerivce")
public class OrderServiceImpl implements OrderService {

	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Resource(name="orderDao")
	OrderDao orderDao;
	
	//주문하기
	@Override
	public List<OrderVo> selectOrder(int c_usernum) throws SQLException {
		return orderDao.selectOrder(c_usernum);
	}

	//비회원 주문
	@Override
	public List<OrderVo> selectOrderNouser(String c_nousernum) throws SQLException {
		return orderDao.nouserOrder(c_nousernum);
	}

	@Override
	public List<AddrVo> selectAddr(int c_usernum) throws SQLException {
		return orderDao.selectAddr(c_usernum);
	}

	//주소록에 주소추가
	@Override
	public void insertAddr(AddrVo bean) throws SQLException {
		System.out.println("controller : " + bean.toString());
		orderDao.insertAddr(bean);
	}

	@Override
	public int countAddr(int usernum) throws SQLException {
		return orderDao.countAddr(usernum);
	}

	@Override
	public int deleteAddr(int usernum, int idx) throws SQLException {
		int result=orderDao.deleteAddr(usernum, idx);
		if(result>0) {System.out.println("삭제");}else {System.out.println("실패");}
		return result;
		
	}

}
