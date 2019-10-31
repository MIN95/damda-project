package com.bit.pro.dao;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.pro.vo.OrderListVo;

@Repository("orderListDao")
public class OrderListDaoImpl implements OrderListDao{

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bit.pro.mappers.orderListMapper";
	
	//���������� item
	@Override
	public OrderListVo reviewItem(OrderListVo bean) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".reviewItem", bean);
	}

	//���������� custom
	@Override
	public OrderListVo reviewCustom(OrderListVo bean) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".reviewCustom", bean);
	}

}
