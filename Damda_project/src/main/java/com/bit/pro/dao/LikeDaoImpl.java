package com.bit.pro.dao;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.pro.vo.ReviewLikeVo;

@Repository("likeDao")
public class LikeDaoImpl implements LikeDao{

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bit.pro.mappers.likeMapper";

	//���ƿ�
	@Override
	public void reviewLike(ReviewLikeVo bean) throws SQLException {
		sqlSession.insert(NAMESPACE + ".reviewLike", bean);
	}

	//���ƿ� ���
	@Override
	public void likeCancel(ReviewLikeVo bean) throws SQLException {
		sqlSession.delete(NAMESPACE + ".likeCancel", bean);
	}
	
	
	

	
}
