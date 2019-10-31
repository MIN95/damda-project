package com.bit.pro.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.bit.pro.util.pagination;
import com.bit.pro.vo.MateVo;
import com.bit.pro.vo.PhotoVo;

@Repository("mateDao")
public class MateDaoImpl implements MateDao{

	@Inject
	private SqlSession sqlMate;
	
	private static final String NAMESPACE = "com.bit.pro.mappers.customRegiMapper";

	@Override
	public List<MateVo> selectMateCtgP(pagination pagination) {
		return sqlMate.selectList(NAMESPACE+".selectMateCtgP",pagination);
	}

	@Override
	public List<MateVo> selectMateSaleP(pagination pagination){
		return sqlMate.selectList(NAMESPACE+".selectMateSaleP",pagination);		
	}
	@Override
	public int insertMate(MateVo mateVo) {
		return sqlMate.insert(NAMESPACE+".insertMate",mateVo);			
	}

	@Override
	public List<MateVo> selectMateOne(int matenum) {
		System.out.println("matenum>>>>>>>>>>>>>>"+matenum);
		return sqlMate.selectList(NAMESPACE+".selectMateOne",matenum);
	}

	@Override
	public int updateMate(MateVo mateVo) {
		return sqlMate.update(NAMESPACE+".updateMate",mateVo);
	}

	@Override
	public int deleteMate(int matenum) {
		return sqlMate.delete(NAMESPACE+".deleteMate",matenum);
	}
	@Override
	public int deleteMatePhoto(int matenum) {
		return sqlMate.delete(NAMESPACE+".deleteMatePhoto",matenum);
	}
	
	@Override
	public int selectMateAllCnt(String matectg) {
		return sqlMate.selectOne(NAMESPACE+".selectMateAllCnt",matectg);
	}
	@Override
	public int selectMateSaleCnt(int salestatus) {
		return sqlMate.selectOne(NAMESPACE+".selectMateSaleCnt",salestatus);
	}
	
	/******************* 미현시작 *****************************/
	//custom select list
	@Override
	public List<MateVo> customSelectThnumb() throws Exception {
		return sqlMate.selectList(NAMESPACE + ".customSelectThnumb");
	}
	@Override
	public MateVo customSelectDetail(int matenum) throws Exception {
		return sqlMate.selectOne(NAMESPACE + ".customSelectDetail",matenum);
	}
	/******************* 미현시작 *****************************/
	
}
