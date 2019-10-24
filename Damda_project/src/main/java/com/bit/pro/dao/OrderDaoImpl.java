package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bit.pro.vo.AddrVo;
import com.bit.pro.vo.OrderVo;

@Repository("orderDao")
public class OrderDaoImpl implements OrderDao {

	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeDao.class);
	private static final String NAMESPACE = "com.bit.pro.mappers.orderMapper";
	
	@Override
	public List<OrderVo> selectOrder(int c_usernum) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectOrder", c_usernum);
	}

	@Override
	public List<OrderVo> nouserOrder(String c_nousernum) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".nouserOrder", c_nousernum);
	}

	@Override
	public List<AddrVo> selectAddr(int c_usernum) throws SQLException {
		return sqlSession.selectList(NAMESPACE +".selectAddr",c_usernum);
	}

	@Override
	public int insertAddr(AddrVo bean) throws SQLException {
		return sqlSession.insert(NAMESPACE +".insertAddr", bean);
		
	}

	@Override
	public int countAddr(int usernum) throws SQLException {
		return sqlSession.selectOne(NAMESPACE +".countAddr", usernum);
	}

	@Override
	public int deleteAddr(int usernum, int idx) throws SQLException {
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("usernum", usernum);
		map.put("idx", idx);
		return sqlSession.delete(NAMESPACE +".deleteAddr", map);
		
		
	}

}
