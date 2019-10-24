package com.bit.pro.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

public interface LikeService {

	//좋아요
	void reviewLike(int userNum, int reviewNum) throws SQLException;
	
	//좋아요 취소
	void likeCancel(int userNum, int reviewNum) throws SQLException;
}
