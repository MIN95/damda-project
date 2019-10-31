package com.bit.pro.service;

import java.sql.SQLException;
import java.util.Map;

public interface CustomService {
	//커스텀 저장
	int customsave(Map<String, Object> map) throws SQLException;
	//카드에 저장
	int cartsave(Map<String, Object> map) throws SQLException;
	//마이레시피에 저장
	int myrecipesave(Map<String, Object> map) throws SQLException;
	//카트로 보낸 커스텀 캡쳐된것 디비에 저장
	int cartsaveCapture(Map<String, Object> capturemap) throws SQLException;
	//마이레시피로 보낸 커스텀 캡쳐된것 디비에 저장
	int myrecipesaveCapture(Map<String, Object> capturemap) throws SQLException;
}
