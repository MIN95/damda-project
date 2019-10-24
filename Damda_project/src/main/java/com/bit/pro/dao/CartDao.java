package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.List;

import com.bit.pro.vo.CartJoinVo;
import com.bit.pro.vo.CartVo;
import com.bit.pro.vo.OrderListVo;

public interface CartDao {
	
	//detail.jsp���� ��ٱ��� �߰�
	void insertCart(CartVo bean) throws SQLException;
	void insertCart_noUser(CartVo bean) throws SQLException;

	//��ٱ��� ��� ȸ��
	List<CartJoinVo> selectCart_user(CartVo bean) throws SQLException;

	//��ٱ��� ��� ��ȸ�� 
	List<CartJoinVo> selectCart_noUser(CartVo bean) throws SQLException;
	
	//��ȸ����ٱ��� -> ȸ����ٱ���(�ߺ� ���� ��)
	int noUser_updateCart(CartVo bean) throws SQLException;
	//��ȸ����ٱ��� -> ȸ����ٱ���(�ߺ��� ��)
	int noUser_updateCart2(CartVo bean) throws SQLException;
	//��ȸ����ٱ��� -> ȸ����ٱ���(Ŀ���� �ߺ�x)
	int noUser_updateCart3(CartVo bean) throws SQLException;
	//�ߺ��˻��� ���� ������ ����
	int noUser_deleteCart(CartVo bean) throws SQLException;
	//��ȸ�� -> ȸ�� �̵��� ��ȸ�����������(������)
	int user_updateCart(CartVo bean) throws SQLException;
	//��ȸ�� -> ȸ�� �̵��� ��ȸ�����������(Ŀ����)
	int user_updateCart2(CartVo bean) throws SQLException;
	
	//ȸ�� ��ٱ��� ��������
	int userUpdate_item(CartVo bean) throws SQLException;
	int userUpdate_custom(CartVo bean) throws SQLException;
	
	//��ȸ�� ��ٱ��� ��������
	int nouserUpdate_item(CartVo bean) throws SQLException;
	int nouserUpdate_custom(CartVo bean) throws SQLException;
	
	//ȸ�� ��ٱ��� ����
	void userDelete_item(CartVo bean) throws SQLException;
	void userDelete_custom(CartVo bean) throws SQLException;
	
	//��ȸ�� ��ٱ��� ����
	void nouserDelete_item(CartVo bean) throws SQLException;
	void nouserDelete_custom(CartVo bean) throws SQLException;
	
	//��ٱ��� �ߺ�Ȯ��
	List<CartVo> user_compareCart(CartVo bean) throws SQLException;
	List<CartVo> noUser_compareCart(CartVo bean) throws SQLException;
	
	//��ٱ��� �ߺ��� ���� update
	void user_eaUpdate(CartVo bean) throws SQLException;
	void noUser_eaUpdate(CartVo bean) throws SQLException;

	//Ŀ���ҵ��
	void myrecipeInsert(CartVo bean) throws SQLException;
	
	/******************��������************************************************************/
	//�ֹ��󼼳��� ���
	List<OrderListVo> mypageDetail(String o_ordernum,int nowPage, int scale) throws SQLException;
	//notice ���ڵ� ����
	int countArticle() throws SQLException;
	/******************������************************************************************/
}
