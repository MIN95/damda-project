package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bit.pro.util.PageMaker;
import com.bit.pro.vo.LoginVo;

public interface LoginDao {
	//로그인체크
	HashMap<String, Object> login(Map<String, Object> map) throws SQLException;
	//아이디찾기
	HashMap<String,Object> fnid(HashMap<String, Object> map) throws SQLException;
	//비밀번호찾기
	HashMap<String, Object> fnpw(HashMap<String, Object> map) throws SQLException;
	
	/*km*/
	//관리자 or 회원 출력
	List<LoginVo> selectUserListAll(LoginVo loginVo) throws SQLException;
	//회원만 등급별로출력(all,family,silver,gold,vip)
	List<LoginVo> selectUserList(LoginVo loginVo) throws SQLException;
	
	//페이징하기위한 셀렉트박스값에 따른 카운트
	//관리자 or 회원 카운트
	int selectUserCntAll(int category) throws SQLException;
	//유저 등급따라 카운트
	int selectUserCnt(String userGrade) throws SQLException;
	//유저 삭제
	int deleteUserList(int userNum) throws SQLException;
}
