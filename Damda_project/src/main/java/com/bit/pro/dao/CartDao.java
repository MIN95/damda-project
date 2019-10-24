package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.List;

import com.bit.pro.vo.CartJoinVo;
import com.bit.pro.vo.CartVo;
import com.bit.pro.vo.OrderListVo;

public interface CartDao {
	
	//detail.jsp에서 장바구니 추가
	void insertCart(CartVo bean) throws SQLException;
	void insertCart_noUser(CartVo bean) throws SQLException;

	//장바구니 출력 회원
	List<CartJoinVo> selectCart_user(CartVo bean) throws SQLException;

	//장바구니 출력 비회원 
	List<CartJoinVo> selectCart_noUser(CartVo bean) throws SQLException;
	
	//비회원장바구니 -> 회원장바구니(중복 없을 때)
	int noUser_updateCart(CartVo bean) throws SQLException;
	//비회원장바구니 -> 회원장바구니(중복일 때)
	int noUser_updateCart2(CartVo bean) throws SQLException;
	//비회원장바구니 -> 회원장바구니(커스텀 중복x)
	int noUser_updateCart3(CartVo bean) throws SQLException;
	//중복검사후 남은 아이템 삭제
	int noUser_deleteCart(CartVo bean) throws SQLException;
	//비회원 -> 회원 이동후 비회원정보지우기(아이템)
	int user_updateCart(CartVo bean) throws SQLException;
	//비회원 -> 회원 이동후 비회원정보지우기(커스텀)
	int user_updateCart2(CartVo bean) throws SQLException;
	
	//회원 장바구니 수량변경
	int userUpdate_item(CartVo bean) throws SQLException;
	int userUpdate_custom(CartVo bean) throws SQLException;
	
	//비회원 장바구니 수량변경
	int nouserUpdate_item(CartVo bean) throws SQLException;
	int nouserUpdate_custom(CartVo bean) throws SQLException;
	
	//회원 장바구니 삭제
	void userDelete_item(CartVo bean) throws SQLException;
	void userDelete_custom(CartVo bean) throws SQLException;
	
	//비회원 장바구니 삭제
	void nouserDelete_item(CartVo bean) throws SQLException;
	void nouserDelete_custom(CartVo bean) throws SQLException;
	
	//장바구니 중복확인
	List<CartVo> user_compareCart(CartVo bean) throws SQLException;
	List<CartVo> noUser_compareCart(CartVo bean) throws SQLException;
	
	//장바구니 중복시 개수 update
	void user_eaUpdate(CartVo bean) throws SQLException;
	void noUser_eaUpdate(CartVo bean) throws SQLException;

	//커스텀등록
	void myrecipeInsert(CartVo bean) throws SQLException;
	
	/******************미현시작************************************************************/
	//주문상세내역 출력
	List<OrderListVo> mypageDetail(String o_ordernum,int nowPage, int scale) throws SQLException;
	//notice 레코드 개수
	int countArticle() throws SQLException;
	/******************미현끝************************************************************/
}
