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
	
	//�α���üũ
	@Override
	public HashMap<String, Object> login(Map<String, Object> map) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".login",map);
		
	}
	//���̵�ã��
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
	//��й�ȣã��
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
	//ī�װ����� ������ ���
	@Override
	public List<LoginVo> selectUserListAll(LoginVo loginVo) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectUserListAll",loginVo);
	}
	//ȸ����޿� ���� ������ ���
	@Override
	public List<LoginVo> selectUserList(LoginVo loginVo) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectUserList",loginVo);
	}
	//������ or ȸ���� �� üũ
	@Override
	public int selectUserCntAll(int category) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectUserCntAll",category);
	}
	//ȸ�� ��޿����� ������ �� üũ
	@Override
	public int selectUserCnt(String userGrade) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectUserCnt",userGrade);
	}
	//���� ����
	@Override
	public int deleteUserList(int userNum) throws SQLException {
		return sqlSession.delete(NAMESPACE + ".deleteUserList",userNum);
	}
}
