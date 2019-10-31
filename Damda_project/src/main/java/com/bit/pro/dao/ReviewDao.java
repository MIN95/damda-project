package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.bit.pro.vo.ReviewVo;

public interface ReviewDao {
	
	//아이템 detail에서 리뷰출력
	List<ReviewVo> selectList(ReviewVo bean) throws Exception;
	
	//아이템 detail에서 리뷰 count
	int reviewCount(ReviewVo bean);

	//리뷰에서 item 등록
	int insertItemReview(ReviewVo bean) throws SQLException;
	
	//리뷰에서 custom 등록
	int insertCustomReview(ReviewVo bean) throws SQLException;
	
	//방금등록한 리뷰 번호
	int maxReviewNum() throws SQLException;
	
	//관리자페이지
	List<ReviewVo> adminReviewItem(ReviewVo bean) throws SQLException;
	
	List<ReviewVo> adminReviewCustom(ReviewVo bean) throws SQLException;
	
	int adminReviewCount(ReviewVo bean) throws SQLException;
	
	int deleteReview(ReviewVo bean) throws SQLException;
	
	int bestCheck(ReviewVo bean) throws SQLException;
	
	List<ReviewVo> bestReviewImg(ReviewVo bean) throws SQLException;

	List<ReviewVo> customReview(ReviewVo bean) throws SQLException;
	
	int reviewView(ReviewVo bean) throws SQLException;
	
	/***************** 미현 시작 **************************/ 
	//리뷰더미가 있는지 확인
	List<ReviewVo> mypagereview(String o_ordernum) throws Exception;
	/***************** 미현 끝 **************************/
}
