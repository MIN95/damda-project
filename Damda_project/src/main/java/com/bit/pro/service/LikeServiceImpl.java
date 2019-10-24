package com.bit.pro.service;

import java.sql.SQLException;

import javax.annotation.Resource;
import javax.sound.sampled.ReverbType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.pro.dao.LikeDao;
import com.bit.pro.vo.ReviewLikeVo;

@Service("likeService")
public class LikeServiceImpl implements LikeService{

		private static final Logger logger = LoggerFactory.getLogger(LikeServiceImpl.class);
		
		@Resource(name="likeDao")
		private LikeDao likeDao;

		@Override
		//좋아요
		public void reviewLike(int userNum, int reviewNum) throws SQLException {
			ReviewLikeVo bean = new ReviewLikeVo();
			bean.setLike_userNum(userNum);
			bean.setLike_reviewNum(reviewNum);
			
			likeDao.reviewLike(bean);
		}

		//좋아요 취소
		@Override
		public void likeCancel(int userNum, int reviewNum) throws SQLException {
			ReviewLikeVo bean = new ReviewLikeVo();
			bean.setLike_userNum(userNum);
			bean.setLike_reviewNum(reviewNum);
			
			likeDao.likeCancel(bean);
		}

		
}
