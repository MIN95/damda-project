package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository("customDao")
public class CustomDaoImpl implements CustomDao {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bit.pro.mappers.customRegiMapper";
	
	//Ŀ���ҿ� ����
	@Override
	public int customsave(Map<String, Object> map) {
		return  sqlSession.insert(NAMESPACE + ".customsave", map);
	}
	//īƮ�� ����
	@Override
	public int cartsave(Map<String, Object> map) throws SQLException {
		int savesuccess = 0;
		String c_usernum = (String) map.get("c_usernum");
		String c_nousernum = (String) map.get("c_nousernum");
		if(c_usernum != null) {
			savesuccess = sqlSession.insert(NAMESPACE + ".cartsaveUser", map);
		}else {
			savesuccess = sqlSession.insert(NAMESPACE + ".cartsaveNouser", map);
		}
		return savesuccess;
	}
	//���̷����ǿ� ����
	@Override
	public int myrecipesave(Map<String, Object> map) throws SQLException {
		return sqlSession.insert(NAMESPACE + ".myrecipesave", map);
	}
	//īƮ�� ���� Ŀ���� ĸ�ĵȰ� ��� ����
	@Override
	public int cartsaveCapture(Map<String, Object> capturemap) throws SQLException {
		return sqlSession.insert(NAMESPACE + ".captureCart", capturemap);
	}
	//īƮ�� ���� Ŀ���� ĸ�ĵȰ� ��� ����
	@Override
	public int myrecipesaveCapture(Map<String, Object> capturemap) throws SQLException {
		return sqlSession.insert(NAMESPACE + ".captureMyrecipe", capturemap);
	}

}
