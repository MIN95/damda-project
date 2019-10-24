package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.List;

import com.bit.pro.vo.WishItemVo;

public interface WishItemDao {

	//위시리스트 출력
	List<WishItemVo> wishList(WishItemVo bean) throws SQLException;
	
	//위시리스트 삭제
	void deleteWish(WishItemVo bean) throws SQLException;
	
	//리스트 개수
	int wishCount(WishItemVo bean) throws SQLException;
	
	//detail 중복확인용
	List<WishItemVo> compareWishList(WishItemVo bean) throws SQLException;
	
	//detail 찜등록
	void insertWish(WishItemVo bean) throws SQLException;
}
