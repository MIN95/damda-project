package com.bit.pro.dao;

import java.util.List;

import org.springframework.ui.Model;

import com.bit.pro.util.pagination;
import com.bit.pro.vo.MateVo;
import com.bit.pro.vo.PhotoVo;

public interface MateDao {
	
	List<MateVo> selectMateAll(pagination pagination);
	
	int insertMate(MateVo mateVo);
	
	List<MateVo> selectMateOne(int matenum);//사진포함
	
	int updateMate(MateVo mateVo);
	
	int deleteMatePhoto(int matenum);
	int deleteMate(int matenum);
	
	int selectMateAllCnt();

	/******************* 미현시작 *****************************/
	//custom select list
	List<MateVo> customSelectThnumb() throws Exception;
	MateVo customSelectDetail(int matenum) throws Exception;
	/******************* 미현끝 *****************************/
}
