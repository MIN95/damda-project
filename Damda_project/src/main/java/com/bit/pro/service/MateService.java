package com.bit.pro.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.pro.util.pagination;
import com.bit.pro.vo.MateVo;
import com.bit.pro.vo.PhotoVo;

public interface MateService {
	
	List<MateVo> selectMateCtgP(pagination pagination,PhotoVo photoVo, Model mode) throws Exception;
	List<MateVo> selectMateSaleP(pagination pagination, PhotoVo photoVo, Model model) throws Exception;
	
	int insertMate(MateVo mateVo,PhotoVo photoVo, MultipartHttpServletRequest multi) throws IOException, Exception;
	List<MateVo> selectMateOne(int matenum,PhotoVo photoVo, Model model);
	
	int deleteMatePhoto(int matenum);
	
	int deleteMate(int matenum);
	
	int selectMateAllCnt(MateVo mateVo, String matectg);
	int selectMateSaleCnt(MateVo mateVo, int salestatus);
	
	int updateMate(int matenum,MateVo mateVo, PhotoVo photoVo, MultipartHttpServletRequest multi) throws Exception;
	
	
	/******************* 미현시작 *****************************/
	//custom select list
	List<MateVo> customSelectThnumb() throws Exception;
	MateVo customSelectDetail(int matenum) throws Exception;
	/******************* 미현끝 *****************************/
}
