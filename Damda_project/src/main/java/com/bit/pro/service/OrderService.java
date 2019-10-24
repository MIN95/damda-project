package com.bit.pro.service;

import java.sql.SQLException;
import java.util.List;

import com.bit.pro.vo.AddrVo;
import com.bit.pro.vo.OrderVo;

public interface OrderService {
	//주문하기
	List<OrderVo> selectOrder(int c_usernum) throws SQLException;

	//비회원 주문
	List<OrderVo> selectOrderNouser(String c_nousernum) throws SQLException;
	
	//주소록 불러오기
	List<AddrVo> selectAddr(int c_usernum) throws SQLException;
	
	//주소록에 주소 추가
	void insertAddr(AddrVo bean) throws SQLException;

	//유저당 주소록 개수
	int countAddr(int usernum) throws SQLException;

	//주소 삭제
	int deleteAddr(int usernum, int idx) throws SQLException;;
	
}
