package com.bit.pro.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.pro.vo.ReviewVo;

public interface ReviewService {
	
	//������ detail���� �������
	Model selectList(int no, int p, String align, Model model) throws Exception;
	
	//������ detail���� ���� count
	Model reviewCount(int no, Model model);
	
	//���信�� item ���
	int insertItemReview(int userNum, int itemNum, String reviewCon, MultipartHttpServletRequest multi) throws SQLException, Exception;
	
	//���信�� custom ���
	int insertCustomReview(int userNum, int customNum, String reviewCon, MultipartHttpServletRequest multi) throws SQLException, Exception;
	
	//������������
	Model adminReviewItem(Model model, String select, int p) throws SQLException;

	Model adminReviewCustom(Model model, String select, int p) throws SQLException;
	
	int deleteReview(int reviewNum) throws SQLException;

	int bestCheck(int adminSelect, int reviewNum) throws SQLException;
	
	//����Ʈ����
	Model bestReviewImg(Model model) throws SQLException;
	
	//Ŀ���� ����
	Model customReview(Model model, String select, int p) throws SQLException;
	
	//���� ��ȸ��
	int reviewView(int reviewNum) throws SQLException;
	
	/***************** ���� ���� **************************/ 
	//������̰� �ִ��� Ȯ��
	List<ReviewVo> mypagereview(String o_ordernum) throws Exception;
	/***************** ���� �� **************************/
}
