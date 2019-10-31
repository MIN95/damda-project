package com.bit.pro.service;

import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bit.pro.dao.CustomDao;

@Service("customService")
public class CustomServiceImpl implements CustomService {

	private static final Logger logger = LoggerFactory.getLogger(CartServiceImpl.class);
	
	@Resource(name="customDao")
	private CustomDao customDao;
	
	//Ŀ���ҿ� ����
	@Override
	public int customsave(Map<String, Object> map) throws SQLException {
		return customDao.customsave(map);
	}
	//īƮ�� ����
	@Override
	public int cartsave(Map<String, Object> map) throws SQLException {
		return customDao.cartsave(map);
	}
	//���̷����ǿ� ����
	@Override
	public int myrecipesave(Map<String, Object> map) throws SQLException {
		return customDao.myrecipesave(map);
	}
	//īƮ�� ���� Ŀ���� ĸ�ĵȰ� ��� ����
	@Override
	public int cartsaveCapture(Map<String, Object> capturemap) throws SQLException {
		return customDao.cartsaveCapture(capturemap);
	}
	//���̷����Ƿ� ���� Ŀ���� ĸ�ĵȰ� ��� ����
	@Override
	public int myrecipesaveCapture(Map<String, Object> capturemap) throws SQLException {
		return customDao.myrecipesaveCapture(capturemap);
	}

}
