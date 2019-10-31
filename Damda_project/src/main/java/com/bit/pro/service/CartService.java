package com.bit.pro.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.bit.pro.vo.OrderListVo;

public interface CartService {
	
	//detail.jsp���� ��ٱ��� �߰�
	void insertItem(int userNum, int itemNum, int ea) throws SQLException;
	void insertItem_noUser(String noUser, int itemNum, int ea) throws SQLException;

	//��ٱ��� ���
	Model selectCart(Model model, int userNum) throws SQLException;
	Model selectCart_noUser(Model model, String noUser) throws SQLException;
	
	//��ȸ����ٱ��� -> ȸ����ٱ���
	void noUser_updateCart(int c_userNum, String c_nouserNum) throws SQLException;

	//ȸ�� ��ٱ��� ���� ����
	void userUpdate_item(int itemNum, int userNum, int ea) throws Exception;
	void userUpdate_custom(int customNum, int userNum, int ea) throws Exception;
	
	//��ȸ�� ��ٱ��� ���� ����
	void nouserUpdate_item(int itemNum, String nouserNum, int ea) throws Exception;
	void nouserUpdate_custom(int customNum, String nouserNum, int ea) throws Exception;
	
	//ȸ�� ��ٱ��� ����
	void userDelete_item(int userNum, int itemNum) throws SQLException;
	void userDelete_custom(int userNum, int customNum) throws SQLException;
		
	//��ȸ�� ��ٱ��� ����
	void nouserDelete_item(String nouserNum, int itemNum) throws SQLException;
	void nouserDelete_custom(String nouserNum, int customNum) throws SQLException;
	
	//ȸ�� ��ٱ��� �ߺ�Ȯ��
	Model user_compareCart(Model model, int userNum) throws SQLException;
	//��ȸ�� ��ٱ��� �ߺ�Ȯ��
	Model noUser_compareCart(Model model, String nouserNum) throws SQLException;
	
	//��ٱ��� �ߺ��� ����update
	void user_eaUpdate(int userNum, int ea, int itemNum) throws SQLException;
	void noUser_eaUpdate(String nouserNum, int ea, int itemNum) throws SQLException;
	
	//Ŀ���ҵ��
	void myRecipeInsert(int userNum, int customNum) throws SQLException;
	
	//�ֹ������� �̵�
	void cartOrder(int cartCheck, int userNum) throws SQLException;
	
	//�ֹ� ��ҽ�
	void cartOrder_noUser(int cartCheck, String nouserNum) throws SQLException;
	
	
	/********************���� ����**********************************************************/
	//�ֹ����� ���
	List<OrderListVo> mypage(int usernum, int nowPage, int scale) throws SQLException;
	//�ֹ����� ���ڵ� ����
	int mypagecountArticle(int usernum) throws SQLException;
	//�ֹ������� ���
	List<OrderListVo> mypageDetail(String o_ordernum,int nowPage, int scale) throws SQLException;
	//�ֹ������� ���ڵ� ����
	int countArticle(String o_ordernum) throws SQLException;
	//��ȸ���϶� �ֹ���ȸüũ
	HashMap<String, Object> chknouser(Map<String, Object> chkmap) throws SQLException;
	//��ȸ�� �ֹ���ȸ ������
	List<OrderListVo> nouserDetail(String o_ordernum, int nowPage, int scale) throws SQLException;
	/********************���� ��**********************************************************/
}
