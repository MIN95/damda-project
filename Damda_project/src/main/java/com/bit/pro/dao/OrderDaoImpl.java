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
import com.bit.pro.vo.CartVo;
import com.bit.pro.vo.OrderDataVo;
import com.bit.pro.vo.OrderDetailVo;
import com.bit.pro.vo.OrderListVo;
import com.bit.pro.vo.OrderVo;

@Repository("orderDao")
public class OrderDaoImpl implements OrderDao {

	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeDao.class);
	private static final String NAMESPACE = "com.bit.pro.mappers.orderMapper";
	private static final String PHOTONAMESPACE = "com.bit.pro.mappers.photoMapper";
	
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

	@Override
	public int insertOrderData(OrderDataVo bean) throws SQLException {
		System.out.println("service: "+bean.toString());
		return sqlSession.insert(NAMESPACE+".insertOrderData", bean);
	}

	//비회원 주문저장
	@Override
	public int insertOrderNouser(OrderDataVo bean) throws SQLException {
		System.out.println("service: "+bean.toString());
		return sqlSession.insert(NAMESPACE+".insertOrderNouser", bean);
	}

	@Override
	public OrderDataVo selectOrderData(String ordernum) throws SQLException {
		OrderDataVo orderData = sqlSession.selectOne(NAMESPACE+".selectOrderData",ordernum);
		return orderData;
	}
	
	//주문한 상품 목록
	@Override
	public List<OrderDetailVo> selectOrderItem(String o_ordernum) throws SQLException {
		
		return sqlSession.selectList(NAMESPACE +".selectOrderItem",o_ordernum);
	}
	//상품 저장
	
	/****************************미현 시작**********************************/
	//주문목록 레코드의 갯수 계산
	@Override
	public int countArticle(String deliverstatus) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countArticle",deliverstatus);
	}
	//admin>orderlist 주문목록 리스트
	@Override
	public List<OrderListVo> orderlistSelect(int nowPage,int scale,String deliverstatus,String ordernum) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("deliverstatus", deliverstatus);
		map.put("ordernum", ordernum);
		map.put("nowPage", nowPage);
		map.put("scale", scale);
		return sqlSession.selectList(NAMESPACE + ".orderlistselect", map);
	}
	//ajax deliverstatus update
	@Override
	public int changeDeliver(String deliverstatus,String ordernum) throws Exception {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("deliverstatus", deliverstatus);
		map.put("ordernum", ordernum);
		return sqlSession.update(NAMESPACE + ".changeDeliver", map);
	}
	/****************************미현 끝**********************************/
	
	@Override
	public List<CartVo> selectCartItem(int co_usernum) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".selectCartItem", co_usernum);
	}

	@Override
	public List<CartVo> selectCartItemNouser(String co_nousernum) throws Exception {
		
		return sqlSession.selectList(NAMESPACE + ".selectCartItemNouser", co_nousernum);
	}
	
	@Override
	public int insertOrderItem(Map<String, String> map) throws SQLException {
		
		
		return sqlSession.insert(NAMESPACE +".insertOrderItem", map);
	}

	@Override
	public int insertOrderCustum(Map<String, String> map) throws SQLException {
		
		return sqlSession.insert(NAMESPACE +".insertOrderCustum", map);
	}

	@Override
	public int deleteCart(int co_usernum) throws SQLException {
		
		return sqlSession.delete(NAMESPACE +".deleteCart", co_usernum);
	}

	
	@Override
	public int insertOrderlist(String ordernum, int deliverstatus) throws SQLException {
		 Map<String,Object> map = new HashMap<String,Object>();
	      map.put("ordernum", ordernum);
	      map.put("deliverstatus", deliverstatus);
		return sqlSession.insert(NAMESPACE+".insertOrderlist", ordernum);
	}

	@Override
	public int selectUserbuy(int co_usernum) throws SQLException {
		return sqlSession.selectOne(NAMESPACE+".selectUserbuy", co_usernum);
	}

	@Override
	public int updateUserbuy(int myuserbuy,int co_usernum) throws SQLException {
		 Map<String,Object> map = new HashMap<String,Object>();
	      map.put("myuserbuy", myuserbuy);
	      map.put("usernum", co_usernum);
		return sqlSession.update(NAMESPACE+".updateUserbuy", map);
		
	}
	
	@Override
	public int updateGrade(String grade,int co_usernum) throws SQLException {
		 Map<String,Object> map = new HashMap<String,Object>();
	      map.put("grade", grade);
	      map.put("usernum", co_usernum);
		return sqlSession.update(NAMESPACE+".updateGrade", map);
		
	}
	
	@Override
	public int updateUseracc(Map<String, String> map) throws SQLException {
		
		return sqlSession.update(NAMESPACE+".updateUseracc", map);
	}
}