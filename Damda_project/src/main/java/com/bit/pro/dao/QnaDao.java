package com.bit.pro.dao;

import java.util.List;

import com.bit.pro.vo.PhotoVo;
import com.bit.pro.vo.QnaVo;

public interface QnaDao {
	
	List<QnaVo> selectQnaListAll(QnaVo qnaVo) throws Exception;
	
	List<QnaVo> selectQnaList(QnaVo qnaVo) throws Exception;	
	
	List<QnaVo> selectMyQna(QnaVo qnaVo) throws Exception;
	
	int insertQna(QnaVo qnaVo) throws Exception;

	QnaVo selectQna(int qnaNum) throws Exception;

	List<PhotoVo> selectQnaFileList(int qnaNum)throws Exception;

	int updateQna(QnaVo qnaVo) throws Exception;

	int deleteQna(int qnaNum)throws Exception;

	int selectAllCnt()throws Exception;

	int selectCnt(String qnaKind) throws Exception;

	int selectMyQnaCnt(int m_userNum) throws Exception;

	List<PhotoVo> getfilePath(int qnaNum) throws Exception;

	int deleteQnaList(int qnaNum) throws Exception;

	int insertQnaAnswer(QnaVo qnaVo) throws Exception;


}
