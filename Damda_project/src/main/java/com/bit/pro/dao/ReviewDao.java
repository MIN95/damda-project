package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.bit.pro.vo.ReviewVo;

public interface ReviewDao {
	
	//������ detail���� �������
	List<ReviewVo> selectList(ReviewVo bean) throws Exception;
	
	//������ detail���� ���� count
	int reviewCount(ReviewVo bean);

	//���信�� item ���
	int insertItemReview(ReviewVo bean) throws SQLException;
	
	//���信�� custom ���
	int insertCustomReview(ReviewVo bean) throws SQLException;
	
	//��ݵ���� ���� ��ȣ
	int maxReviewNum() throws SQLException;
	
	//������������
	List<ReviewVo> adminReviewItem(ReviewVo bean) throws SQLException;
	
	List<ReviewVo> adminReviewCustom(ReviewVo bean) throws SQLException;
	
	int adminReviewCount(ReviewVo bean) throws SQLException;
	
	int deleteReview(ReviewVo bean) throws SQLException;
	
	int bestCheck(ReviewVo bean) throws SQLException;
	
	List<ReviewVo> bestReviewImg(ReviewVo bean) throws SQLException;

	List<ReviewVo> customReview(ReviewVo bean) throws SQLException;
	
	int reviewView(ReviewVo bean) throws SQLException;
	
	/***************** ���� ���� **************************/ 
	//������̰� �ִ��� Ȯ��
	List<ReviewVo> mypagereview(String o_ordernum) throws Exception;
	/***************** ���� �� **************************/
}
