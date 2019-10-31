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
	//�ֹ��ϱ�
	List<OrderVo> selectOrder(int c_usernum) throws SQLException;

	//��ȸ�� �ֹ�
	List<OrderVo> selectOrderNouser(String c_nousernum) throws SQLException;
	
	//�ּҷ� �ҷ�����
	List<AddrVo> selectAddr(int c_usernum) throws SQLException;
	
	//�ּҷϿ� �ּ� �߰�
	void insertAddr(AddrVo bean) throws SQLException;

	//������ �ּҷ� ����
	int countAddr(int usernum) throws SQLException;

	//�ּ� ����
	int deleteAddr(int usernum, int idx) throws SQLException;

	//�ֹ����� ����
	OrderDataVo insertOrderData(OrderDataVo bean) throws SQLException;

	//�ֹ� ��ǰ ����
	List<OrderDetailVo> selectOrderItem(String o_ordernum) throws SQLException;

	//īƮ ��ǰ�� cartcheck=1�ΰ� ������
	List<CartVo> selectCartItem(int co_usernum) throws SQLException, Exception;
	List<CartVo> selectCartItemNouser(String co_nousernum) throws Exception;

	//īƮ�� ��� ��ǰ�� �ֹ� ������ �����Ѵ�
	int insertOrderItem(int co_usernum,  String ordernum, List<CartVo> noworder) throws SQLException;
	int insertOrderItemNouser(String co_nousernum, String ordernum, List<CartVo> noworder) throws SQLException;

	int deleteCart(int co_usernum) throws Exception;

	void addUserbuy(int co_usernum, int adduserbuy) throws Exception;

	int insertOrderlist(String ordernum, int ordertype) throws Exception;

	int updateUseracc(Map<String, String> map) throws Exception;


	
	
}
