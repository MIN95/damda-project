package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.List;

import com.bit.pro.vo.WishItemVo;

public interface WishItemDao {

	//���ø���Ʈ ���
	List<WishItemVo> wishList(WishItemVo bean) throws SQLException;
	
	//���ø���Ʈ ����
	void deleteWish(WishItemVo bean) throws SQLException;
	
	//����Ʈ ����
	int wishCount(WishItemVo bean) throws SQLException;
	
	//detail �ߺ�Ȯ�ο�
	List<WishItemVo> compareWishList(WishItemVo bean) throws SQLException;
	
	//detail ����
	void insertWish(WishItemVo bean) throws SQLException;
}
