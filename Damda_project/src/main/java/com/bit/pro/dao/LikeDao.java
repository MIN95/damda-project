package com.bit.pro.dao;

import java.sql.SQLException;

import com.bit.pro.vo.ReviewLikeVo;

public interface LikeDao {

	//좋아요
	void reviewLike(ReviewLikeVo bean) throws SQLException;
	//좋아요 취소
	void likeCancel(ReviewLikeVo bean) throws SQLException;
}
