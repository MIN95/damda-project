package com.bit.pro.dao;

import java.sql.SQLException;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.bit.pro.vo.PhotoVo;

@Repository("photoDao")
public class PhotoDaoImpl implements PhotoDao {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bit.pro.mappers.photoMapper";
	
	//경민
		//insert
		@Override 
		public int insertPhoto(PhotoVo photoVo) throws Exception {
			return sqlSession.insert(NAMESPACE + ".insertPhoto",photoVo);
		}
		//delete
		@Override
		public int deletePhoto(PhotoVo photoVo) throws Exception {
			return sqlSession.insert(NAMESPACE + ".deletePhotoOne",photoVo);
		}
		//update new photo
		@Override
		public int updateNewPhoto(PhotoVo photoVo) throws Exception {
			return sqlSession.insert(NAMESPACE + ".updateNewPhoto",photoVo);
		}
		//qna
		//insert qna photo
		@Override
		public int insertQnaPhoto(PhotoVo photoVo) throws Exception {
			return sqlSession.insert(NAMESPACE+".insertQnaPhoto",photoVo);
		}
		//delete qna photo
		@Override
		public int deleteQnaPhoto(PhotoVo photoVo) throws Exception {
			return sqlSession.insert(NAMESPACE+".deleteQnaPhoto",photoVo);
		}


	//승은
	//재료
	@Override
	public int insertMatePhoto(PhotoVo photoVo) throws Exception {
		return sqlSession.insert(NAMESPACE+ ".insertMatePhoto",photoVo);
	}
	@Override
	public int updateMatePhoto(PhotoVo photoVo) throws Exception {
		return sqlSession.update(NAMESPACE+".updateMatePhoto",photoVo);
	}
	//이벤트
	@Override
	public int insertEventPhoto(PhotoVo photoVo) throws Exception {
		return sqlSession.insert(NAMESPACE+".insertEventPhoto",photoVo);
	}
	@Override
	public int updateEventPhoto(PhotoVo photoVo) throws Exception {
		return sqlSession.update(NAMESPACE+".updateEventPhoto",photoVo);
	}
	
	
	//수연
	//리뷰등록
	@Override
	public void reviewPhotoInsert(PhotoVo bean) throws SQLException {
		sqlSession.insert(NAMESPACE +".reviewPhotoInsert", bean);
	}
	//삭제
	@Override
	public void deleteReview(PhotoVo bean) throws SQLException {
		sqlSession.delete(NAMESPACE +".deleteReview", bean);
	}

}
