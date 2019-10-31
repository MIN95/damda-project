package com.bit.pro.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.pro.vo.ReviewVo;

public interface ReviewService {
	
	//아이템 detail에서 리뷰출력
	Model selectList(int no, int p, String align, Model model) throws Exception;
	
	//아이템 detail에서 리뷰 count
	Model reviewCount(int no, Model model);
	
	//리뷰에서 item 등록
	int insertItemReview(int userNum, int itemNum, String reviewCon, MultipartHttpServletRequest multi) throws SQLException, Exception;
	
	//리뷰에서 custom 등록
	int insertCustomReview(int userNum, int customNum, String reviewCon, MultipartHttpServletRequest multi) throws SQLException, Exception;
	
	//관리자페이지
	Model adminReviewItem(Model model, String select, int p) throws SQLException;

	Model adminReviewCustom(Model model, String select, int p) throws SQLException;
	
	int deleteReview(int reviewNum) throws SQLException;

	int bestCheck(int adminSelect, int reviewNum) throws SQLException;
	
	//베스트리뷰
	Model bestReviewImg(Model model) throws SQLException;
	
	//커스텀 리뷰
	Model customReview(Model model, String select, int p) throws SQLException;
	
	//리뷰 조회수
	int reviewView(int reviewNum) throws SQLException;
	
	/***************** 미현 시작 **************************/ 
	//리뷰더미가 있는지 확인
	List<ReviewVo> mypagereview(String o_ordernum) throws Exception;
	/***************** 미현 끝 **************************/
}
