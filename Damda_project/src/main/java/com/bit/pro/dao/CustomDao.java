package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.Map;

public interface CustomDao {
	//Ŀ���ҿ� ����
	int customsave(Map<String, Object> map) throws SQLException;
	//īƮ�� ����
	int cartsave(Map<String, Object> map) throws SQLException;
	//���̷����ǿ� ����
	int myrecipesave(Map<String, Object> map) throws SQLException;
	//īƮ�� ���� Ŀ���� ĸ�ĵȰ� ��� ����
	int cartsaveCapture(Map<String, Object> capturemap) throws SQLException;
	//���̷����Ƿ� ���� Ŀ���� ĸ�ĵȰ� ��� ����
	int myrecipesaveCapture(Map<String, Object> capturemap) throws SQLException;
}
