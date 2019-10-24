package com.bit.pro.dao;

import com.bit.pro.vo.PhotoVo;

public interface PhotoDao {
	//���
	//item
	int insertPhoto(PhotoVo photoVo)throws Exception;

	int deletePhoto(PhotoVo photoVo)throws Exception;

	int updateNewPhoto(PhotoVo photoVo)throws Exception;
	//qna
	int insertQnaPhoto(PhotoVo photoVo)throws Exception;
	
	int deleteQnaPhoto(PhotoVo photoVo) throws Exception;
	
	//����
	//���������
	int insertMatePhoto(PhotoVo photoVo)throws Exception;
	int updateMatePhoto(PhotoVo photoVo) throws Exception;
	//�̺�Ʈ������
	int insertEventPhoto(PhotoVo photoVo) throws Exception;
	int updateEventPhoto(PhotoVo photoVo) throws Exception;
	
}
