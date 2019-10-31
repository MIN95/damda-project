package com.bit.pro.dao;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.bit.pro.vo.PhotoVo;
import com.bit.pro.vo.QnaVo;

@Repository("qnaDao")
public class QnaDaoImpl implements QnaDao {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bit.pro.mappers.qnaMapper";
	
	@Override
	public List<QnaVo> selectQnaListAll(QnaVo qnaVo) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".selectQnaListAll",qnaVo);
	}
	
	@Override
	public List<QnaVo> selectQnaList(QnaVo qnaVo) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".selectQnaList",qnaVo);
	}
	
	@Override
	public List<QnaVo> selectMyQna(QnaVo qnaVo) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".selectMyQna",qnaVo);
	}
  
	@Override
	public int insertQna(QnaVo qnaVo) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertQna", qnaVo);
	}

	@Override
	public QnaVo selectQna(int qnaNum) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".selectQna", qnaNum);
	}

	@Override
	public List<PhotoVo> selectQnaFileList(int qnaNum) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".selectQnaFileList", qnaNum);
	}

	@Override
	public int updateQna(QnaVo qnaVo) throws Exception {
		return sqlSession.update(NAMESPACE + ".updateQna", qnaVo);
	}

	@Override
	public int deleteQna(int qnaNum) throws Exception {
		return sqlSession.delete(NAMESPACE + ".deleteQna", qnaNum);
	}

	@Override
	public int selectAllCnt() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".selectAllCnt");
	}

	@Override
	public int selectCnt(String qnaKind) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".selectCnt",qnaKind);
	}

	@Override
	public int selectMyQnaCnt(int m_userNum) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".selectMyQnaCnt",m_userNum);
	}

	@Override
	public List<PhotoVo> getfilePath(int qnaNum) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getfilePath",qnaNum);
	}

	@Override
	public int deleteQnaList(int qnaNum) throws Exception {
		return sqlSession.delete(NAMESPACE + ".deleteQnaList",qnaNum);
	}

	@Override
	public int insertQnaAnswer(QnaVo qnaVo) throws Exception {
		return sqlSession.update(NAMESPACE + ".insertQnaAnswer",qnaVo);
	}


}
