package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bit.pro.util.PageMaker;
import com.bit.pro.vo.LoginVo;

public interface LoginDao {
	//�α���üũ
	HashMap<String, Object> login(Map<String, Object> map) throws SQLException;
	//���̵�ã��
	HashMap<String,Object> fnid(HashMap<String, Object> map) throws SQLException;
	//��й�ȣã��
	HashMap<String, Object> fnpw(HashMap<String, Object> map) throws SQLException;
	
	/*km*/
	//������ or ȸ�� ���
	List<LoginVo> selectUserListAll(LoginVo loginVo) throws SQLException;
	//ȸ���� ��޺������(all,family,silver,gold,vip)
	List<LoginVo> selectUserList(LoginVo loginVo) throws SQLException;
	
	//����¡�ϱ����� ����Ʈ�ڽ����� ���� ī��Ʈ
	//������ or ȸ�� ī��Ʈ
	int selectUserCntAll(int category) throws SQLException;
	//���� ��޵��� ī��Ʈ
	int selectUserCnt(String userGrade) throws SQLException;
	//���� ����
	int deleteUserList(int userNum) throws SQLException;
}
