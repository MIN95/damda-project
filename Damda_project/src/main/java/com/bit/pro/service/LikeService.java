package com.bit.pro.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

public interface LikeService {

	//���ƿ�
	void reviewLike(int userNum, int reviewNum) throws SQLException;
	
	//���ƿ� ���
	void likeCancel(int userNum, int reviewNum) throws SQLException;
}
