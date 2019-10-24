package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.pro.vo.WishItemVo;

@Repository("wishItemDao")
public class WishItemDaoImpl implements WishItemDao{

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bit.pro.mappers.wishItemMapper";
	
	//����Ʈ ���
	@Override
	public List<WishItemVo> wishList(WishItemVo bean) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".wishList", bean);
	}

	//����
	@Override
	public void deleteWish(WishItemVo bean) throws SQLException {
		sqlSession.delete(NAMESPACE + ".deleteWish", bean);
	}

	//����Ʈ����
	@Override
	public int wishCount(WishItemVo bean) throws SQLException {
		return sqlSession.selectOne(NAMESPACE +".wishCount", bean);
	}

	//detail�ߺ��˻��
	@Override
	public List<WishItemVo> compareWishList(WishItemVo bean) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".compareWishList", bean);
	}

	//detail �� ���
	@Override
	public void insertWish(WishItemVo bean) throws SQLException {
		sqlSession.insert(NAMESPACE +".insertWish", bean);
	}

	
}
