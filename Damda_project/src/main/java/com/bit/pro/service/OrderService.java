package com.bit.pro.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bit.pro.vo.AddrVo;
import com.bit.pro.vo.CartVo;
import com.bit.pro.vo.OrderDataVo;
import com.bit.pro.vo.OrderDetailVo;
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
	int deleteAddr(int usernum, int idx) throws SQLException;

	//주문정보 저장
	OrderDataVo insertOrderData(OrderDataVo bean) throws SQLException;

	//주문 상품 저장
	List<OrderDetailVo> selectOrderItem(String o_ordernum) throws SQLException;

	//카트 상품중 cartcheck=1인거 가져옴
	List<CartVo> selectCartItem(int co_usernum) throws SQLException, Exception;
	List<CartVo> selectCartItemNouser(String co_nousernum) throws Exception;

	//카트에 담긴 상품을 주문 정보에 저장한다
	int insertOrderItem(int co_usernum,  String ordernum, List<CartVo> noworder) throws SQLException;
	int insertOrderItemNouser(String co_nousernum, String ordernum, List<CartVo> noworder) throws SQLException;

	int deleteCart(int co_usernum) throws Exception;

	void addUserbuy(int co_usernum, int adduserbuy) throws Exception;

	int insertOrderlist(String ordernum, int ordertype) throws Exception;

	int updateUseracc(Map<String, String> map) throws Exception;


	
	
}
