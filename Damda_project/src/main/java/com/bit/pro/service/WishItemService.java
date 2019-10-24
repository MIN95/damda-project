package com.bit.pro.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

public interface WishItemService {

	//����Ʈ ���
	Model wishList(Model model, int userNum, int p) throws SQLException;
	
	//������ ����
	void deleteWish(int userNum, int itemNum) throws SQLException;
	
	//������ �߰�
	void insertWish(int userNum, int itemNum) throws SQLException;
	
	//�ߺ�Ȯ��
	Model compareWishList(Model model, int userNum) throws SQLException;
}
