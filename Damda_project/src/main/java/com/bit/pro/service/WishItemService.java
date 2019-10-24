package com.bit.pro.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

public interface WishItemService {

	//리스트 출력
	Model wishList(Model model, int userNum, int p) throws SQLException;
	
	//아이템 삭제
	void deleteWish(int userNum, int itemNum) throws SQLException;
	
	//아이템 추가
	void insertWish(int userNum, int itemNum) throws SQLException;
	
	//중복확인
	Model compareWishList(Model model, int userNum) throws SQLException;
}
