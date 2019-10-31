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
	
	//커스텀에 저장
	@Override
	public int customsave(Map<String, Object> map) throws SQLException {
		return customDao.customsave(map);
	}
	//카트에 저장
	@Override
	public int cartsave(Map<String, Object> map) throws SQLException {
		return customDao.cartsave(map);
	}
	//마이레시피에 저장
	@Override
	public int myrecipesave(Map<String, Object> map) throws SQLException {
		return customDao.myrecipesave(map);
	}
	//카트로 보낸 커스텀 캡쳐된것 디비에 저장
	@Override
	public int cartsaveCapture(Map<String, Object> capturemap) throws SQLException {
		return customDao.cartsaveCapture(capturemap);
	}
	//마이레시피로 보낸 커스텀 캡쳐된것 디비에 저장
	@Override
	public int myrecipesaveCapture(Map<String, Object> capturemap) throws SQLException {
		return customDao.myrecipesaveCapture(capturemap);
	}

}
