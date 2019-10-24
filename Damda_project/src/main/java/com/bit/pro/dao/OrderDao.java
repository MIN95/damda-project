package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.List;

import com.bit.pro.vo.AddrVo;
import com.bit.pro.vo.OrderVo;

public interface OrderDao {
	//주문하기
	List<OrderVo> selectOrder(int c_usernum) throws SQLException;

	List<OrderVo> nouserOrder(String c_nousernum) throws SQLException;
	
	//주소록 불러오기
	List<AddrVo> selectAddr(int c_usernum) throws SQLException;

	int insertAddr(AddrVo bean) throws SQLException;

	int countAddr(int usernum) throws SQLException;

	int deleteAddr(int usernum, int idx) throws SQLException;
	
}
