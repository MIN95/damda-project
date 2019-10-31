package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.pro.vo.ReviewVo;

@Repository("reviewDao")
public class ReviewDaoImpl implements ReviewDao {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bit.pro.mappers.reviewMapper";

	//아이템 detail에서 리뷰출력
	@Override
	public List<ReviewVo> selectList(ReviewVo bean) throws Exception {
		return sqlSession.selectList(NAMESPACE +".selectList", bean);
	}

	//아이템 detail에서 리뷰 count
	@Override
	public int reviewCount(ReviewVo bean) {
		return sqlSession.selectOne(NAMESPACE +".reviewCount", bean);
	}

	//리뷰에서 item 등록
	@Override
	public int insertItemReview(ReviewVo bean) throws SQLException {
		return sqlSession.insert(NAMESPACE +".insertItemReview", bean);
	}

	//리뷰에서 custom 등록
	@Override
	public int insertCustomReview(ReviewVo bean) throws SQLException {
		return sqlSession.insert(NAMESPACE +".insertCustomReview", bean);
	}

	//방금등록한 리뷰 번호
	@Override
	public int maxReviewNum() throws SQLException {
		return sqlSession.selectOne(NAMESPACE +".maxReviewNum");
	}

	//관리자페이지
	@Override
	public List<ReviewVo> adminReviewItem(ReviewVo bean) throws SQLException {
		return sqlSession.selectList(NAMESPACE +".adminReviewItem", bean);
	}

	@Override
	public List<ReviewVo> adminReviewCustom(ReviewVo bean) throws SQLException {
		return sqlSession.selectList(NAMESPACE +".adminReviewCustom", bean);
	}

	@Override
	public int adminReviewCount(ReviewVo bean) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".adminReviewCount", bean);
	}

	@Override
	public int deleteReview(ReviewVo bean) throws SQLException {
		return sqlSession.delete(NAMESPACE + ".deleteReview", bean);
	}

	@Override
	public int bestCheck(ReviewVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".bestCheck", bean);
	}

	@Override
	public List<ReviewVo> bestReviewImg(ReviewVo bean) throws SQLException {
		return sqlSession.selectList(NAMESPACE +".bestReviewImg",bean);
	}

	@Override
	public List<ReviewVo> customReview(ReviewVo bean) throws SQLException {
		return sqlSession.selectList(NAMESPACE +".customReview", bean);
	}

	//조회수
	@Override
	public int reviewView(ReviewVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".reviewView", bean);
	}
	
	/***************** 미현 시작 **************************/ 
	//리뷰더미가 있는지 확인
	@Override
	public List<ReviewVo> mypagereview(String o_ordernum) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".mypagereview", o_ordernum);
	}
	/***************** 미현 끝 **************************/

}
