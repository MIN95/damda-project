package com.bit.pro.service;

import java.sql.SQLException;
import java.util.Map;

public interface CustomService {
	//Ŀ���� ����
	int customsave(Map<String, Object> map) throws SQLException;
	//ī�忡 ����
	int cartsave(Map<String, Object> map) throws SQLException;
	//���̷����ǿ� ����
	int myrecipesave(Map<String, Object> map) throws SQLException;
	//īƮ�� ���� Ŀ���� ĸ�ĵȰ� ��� ����
	int cartsaveCapture(Map<String, Object> capturemap) throws SQLException;
	//���̷����Ƿ� ���� Ŀ���� ĸ�ĵȰ� ��� ����
	int myrecipesaveCapture(Map<String, Object> capturemap) throws SQLException;
}
