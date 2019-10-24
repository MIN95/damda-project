package com.bit.pro.service;

import java.sql.SQLException;
import java.util.List;

import com.bit.pro.vo.AddrVo;
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
	int deleteAddr(int usernum, int idx) throws SQLException;;
	
}
