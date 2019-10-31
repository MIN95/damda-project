package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bit.pro.vo.AddrVo;
import com.bit.pro.vo.CartVo;
import com.bit.pro.vo.OrderDataVo;
import com.bit.pro.vo.OrderDetailVo;
import com.bit.pro.vo.OrderListVo;
import com.bit.pro.vo.OrderVo;

public interface OrderDao {
	//�ֹ��ϱ�
	List<OrderVo> selectOrder(int c_usernum) throws SQLException;

	List<OrderVo> nouserOrder(String c_nousernum) throws SQLException;
	
	//�ּҷ� �ҷ�����
	List<AddrVo> selectAddr(int c_usernum) throws SQLException;

	int insertAddr(AddrVo bean) throws SQLException;

	int countAddr(int usernum) throws SQLException;

	int deleteAddr(int usernum, int idx) throws SQLException;

	//�ֹ����� ����
	int insertOrderData(OrderDataVo bean) throws SQLException;
	int insertOrderNouser(OrderDataVo bean) throws SQLException; // ��ȸ��
	//������ �ֹ����� �ҷ���
	OrderDataVo selectOrderData(String ordernum) throws SQLException;

	//�ֹ��� ��ǰ ����
	List<OrderDetailVo> selectOrderItem(String o_ordernum) throws SQLException;
	
	/****************************���� ����**********************************/
	//�ֹ���� ���ڵ��� ���� ���
	int countArticle(String deliverstatus) throws Exception;
	//admin>orderlist �ֹ���� ����Ʈ
	List<OrderListVo> orderlistSelect(int nowPage,int scale,String deliverstatus, String ordernum) throws Exception;
	//ajax deliverstatus update
	int changeDeliver(String deliverstatus, String ordernum) throws Exception;
	/****************************���� ��**********************************/
	
	List<CartVo> selectCartItem(int co_usernum) throws Exception;
	List<CartVo> selectCartItemNouser(String co_nousernum) throws Exception;

	int insertOrderItem(Map<String, String> map) throws SQLException;

	int insertOrderCustum(Map<String, String> map) throws SQLException;

	int deleteCart(int co_usernum) throws SQLException;

	int insertOrderlist(String ordernum, int deliverstatus) throws SQLException;

	int selectUserbuy(int co_usernum) throws SQLException;

	int updateUserbuy(int myuserbuy, int co_usernum) throws SQLException;

	int updateGrade(String grade,int co_usernum) throws SQLException;

	int updateUseracc(Map<String, String> map) throws SQLException;
	
}
