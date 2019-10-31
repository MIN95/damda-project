package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bit.pro.vo.LoginVo;

@Repository("loginDao")
public class LoginDaoImpl implements LoginDao {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginDaoImpl.class);
	private static final String NAMESPACE = "com.bit.pro.mappers.loginMapper";
	
	//로그인체크
	@Override
	public HashMap<String, Object> login(Map<String, Object> map) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".login",map);
		
	}
	//아이디찾기
	@Override
	public HashMap<String, Object> fnid(HashMap<String, Object> map) throws SQLException {
		if(map.get("userphone")==null) {
			return sqlSession.selectOne(NAMESPACE + ".fnidnoph",map);
		}else if(map.get("useremail")==null){
			return sqlSession.selectOne(NAMESPACE + ".fnidnoem",map);
		}else {
			return null;
		}
	}
	//비밀번호찾기
	@Override
	public HashMap<String, Object> fnpw(HashMap<String, Object> map) throws SQLException {
		if(map.get("userphone")==null) {
			return sqlSession.selectOne(NAMESPACE + ".fnpwnoph",map);
		}else if(map.get("useremail")==null){
			return sqlSession.selectOne(NAMESPACE + ".fnpwnoem",map);
		}else {
			return null;
		}
	}
	
	//km
	//카테고리따라 데이터 출력
	@Override
	public List<LoginVo> selectUserListAll(LoginVo loginVo) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectUserListAll",loginVo);
	}
	//회원등급에 따라 데이터 출력
	@Override
	public List<LoginVo> selectUserList(LoginVo loginVo) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectUserList",loginVo);
	}
	//관리자 or 회원의 수 체크
	@Override
	public int selectUserCntAll(int category) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectUserCntAll",category);
	}
	//회원 등급에따라 데이터 수 체크
	@Override
	public int selectUserCnt(String userGrade) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectUserCnt",userGrade);
	}
	//유저 삭제
	@Override
	public int deleteUserList(int userNum) throws SQLException {
		return sqlSession.delete(NAMESPACE + ".deleteUserList",userNum);
	}
}
