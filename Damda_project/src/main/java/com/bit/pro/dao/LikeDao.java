package com.bit.pro.dao;

import java.sql.SQLException;

import com.bit.pro.vo.ReviewLikeVo;

public interface LikeDao {

	//���ƿ�
	void reviewLike(ReviewLikeVo bean) throws SQLException;
	//���ƿ� ���
	void likeCancel(ReviewLikeVo bean) throws SQLException;
}
