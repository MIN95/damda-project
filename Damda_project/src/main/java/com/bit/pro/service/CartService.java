package com.bit.pro.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.pro.vo.OrderListVo;

public interface CartService {
	
	//detail.jsp에서 장바구니 추가
	void insertItem(int userNum, int itemNum, int ea) throws SQLException;
	void insertItem_noUser(String noUser, int itemNum, int ea) throws SQLException;

	//장바구니 출력
	Model selectCart(Model model, int userNum) throws SQLException;
	Model selectCart_noUser(Model model, String noUser) throws SQLException;
	
	//비회원장바구니 -> 회원장바구니
	void noUser_updateCart(int c_userNum, String c_nouserNum) throws SQLException;

	//회원 장바구니 수량 수정
	void userUpdate_item(int itemNum, int userNum, int ea) throws Exception;
	void userUpdate_custom(int customNum, int userNum, int ea) throws Exception;
	
	//비회원 장바구니 수량 수정
	void nouserUpdate_item(int itemNum, String nouserNum, int ea) throws Exception;
	void nouserUpdate_custom(int customNum, String nouserNum, int ea) throws Exception;
	
	//회원 장바구니 삭제
	void userDelete_item(int userNum, int itemNum) throws SQLException;
	void userDelete_custom(int userNum, int customNum) throws SQLException;
		
	//비회원 장바구니 삭제
	void nouserDelete_item(String nouserNum, int itemNum) throws SQLException;
	void nouserDelete_custom(String nouserNum, int customNum) throws SQLException;
	
	//회원 장바구니 중복확인
	Model user_compareCart(Model model, int userNum) throws SQLException;
	//비회원 장바구니 중복확인
	Model noUser_compareCart(Model model, String nouserNum) throws SQLException;
	
	//장바구니 중복시 수량update
	void user_eaUpdate(int userNum, int ea, int itemNum) throws SQLException;
	void noUser_eaUpdate(String nouserNum, int ea, int itemNum) throws SQLException;
	
	//커스텀등록
	void myRecipeInsert(int userNum, int customNum) throws SQLException;
	
	/********************미현 시작**********************************************************/
	//주문상세내역 출력
	List<OrderListVo> mypageDetail(String o_ordernum,int nowPage, int scale) throws SQLException;
	//주문 레코드 갯수
	int countArticle() throws SQLException;
	/********************미현 끝**********************************************************/
}
