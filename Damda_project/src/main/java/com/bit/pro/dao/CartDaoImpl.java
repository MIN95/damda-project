package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.pro.vo.CartJoinVo;
import com.bit.pro.vo.CartVo;
import com.bit.pro.vo.OrderListVo;

@Repository("cartDao")
public class CartDaoImpl implements CartDao{

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bit.pro.mappers.cartMapper";
	
	//detail.jsp에서 장바구니 추가
	@Override
	public void insertCart(CartVo bean) throws SQLException {
		sqlSession.insert(NAMESPACE + ".insertCart", bean);
	}

	@Override
	public void insertCart_noUser(CartVo bean) throws SQLException {
		sqlSession.insert(NAMESPACE + ".insertCart_noUser", bean);
	}
	
	
	//장바구니 출력 회원 
	@Override
	public List<CartJoinVo> selectCart_user(CartVo bean) throws SQLException {
		return sqlSession.selectList(NAMESPACE +".selectCart_user", bean);
	}	
	
	//장바구니 출력 비회원 
	@Override
	public List<CartJoinVo> selectCart_noUser(CartVo bean) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectCart_noUser", bean);
	}	
	
	//비회원장바구니 -> 회원장바구니 중복 없을 때
	@Override
	public int noUser_updateCart(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".noUser_updateCart", bean);
	}
	//비회원장바구니 -> 회원장바구니 중복일 때 
	@Override
	public int noUser_updateCart2(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".noUser_updateCart2", bean);
	}
	//비회원장바구니 -> 회원장바구니 커스텀 중복없음
	@Override
	public int noUser_updateCart3(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".noUser_updateCart3", bean);
	}
	//비회원장바구니 -> 회원장바구니 중복아이템 삭제
	@Override
	public int noUser_deleteCart(CartVo bean) throws SQLException {
		return sqlSession.delete(NAMESPACE + ".noUser_deleteCart" , bean);
	}
	//비회원장바구니 -> 회원장바구니 비회원 정보 지우기 (아이템)
	@Override
	public int user_updateCart(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".User_updateCart", bean);
	}
	//비회원장바구니 -> 회원장바구니 비회원 정보 지우기 (커스텀)
	@Override
	public int user_updateCart2(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".User_updateCart2", bean);
	}

	
	//회원 장바구니 수량변경
	@Override
	public int userUpdate_item(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".userUpdate_item", bean);
	}

	@Override
	public int userUpdate_custom(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".userUpdate_custom", bean);
	}

	
	//비회원 장바구니 수량변경
	@Override
	public int nouserUpdate_item(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".nouserUpdate_item", bean);
	}

	@Override
	public int nouserUpdate_custom(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".nouserUpdate_custom", bean);
	}

	//회원 장바구니 삭제
	@Override
	public void userDelete_item(CartVo bean) throws SQLException {
		sqlSession.delete(NAMESPACE + ".userDelete_item", bean);
	}

	@Override
	public void userDelete_custom(CartVo bean) throws SQLException {
		sqlSession.delete(NAMESPACE + ".userDelete_custom", bean);
	}

	
	//비회원 장바구니 삭제
	@Override
	public void nouserDelete_item(CartVo bean) throws SQLException {
		sqlSession.delete(NAMESPACE + ".nouserDelete_item", bean);
	}

	@Override
	public void nouserDelete_custom(CartVo bean) throws SQLException {
		sqlSession.delete(NAMESPACE + ".nouserDelete_custom", bean);
	}

	//회원 장바구니 중복 확인용
	@Override
	public List<CartVo> user_compareCart(CartVo bean) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".user_compareCart", bean);
	}

	//비회원 장바구니 중복 확인용
	@Override
	public List<CartVo> noUser_compareCart(CartVo bean) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".nouser_compareCart", bean);
	}

	//장바구니 중복시 개수 update
	@Override
	public void user_eaUpdate(CartVo bean) throws SQLException {
		sqlSession.update(NAMESPACE + ".user_eaUpdate", bean);
	}

	@Override
	public void noUser_eaUpdate(CartVo bean) throws SQLException {
		sqlSession.update(NAMESPACE + ".nouser_eaUpdate", bean);
	}

	@Override
	public void myrecipeInsert(CartVo bean) throws SQLException {
		sqlSession.insert(NAMESPACE + ".myrecipeInsert", bean);
	}

	//주문페이지로 이동시
	@Override
	public void cartOrder(CartVo bean) throws SQLException {
		sqlSession.update(NAMESPACE + ".cartOrder", bean);
	}
	
	//주문 취소시 장바구니로 돌아올 때
	@Override
	public void cartOrder_noUser(CartVo bean) throws SQLException {
		sqlSession.update(NAMESPACE + ".cartOrder_noUser", bean);
	}
	
	/**********************미현시작********************************************************/
	//주문내역 출력
	@Override
	public List<OrderListVo> mypage(int usernum, int nowPage, int scale) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usernum", usernum);
		map.put("nowPage", nowPage);
		map.put("scale", scale);
		return sqlSession.selectList(NAMESPACE + ".mypage", map);
	}
	//주문내역 레코드 개수
	@Override
	public int mypagecountArticle(int usernum) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".mypagecountArticle", usernum);
	}
	//주문상세내역 출력
	@Override
	public List<OrderListVo> mypageDetail(String o_ordernum,int nowPage, int scale) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("o_ordernum", o_ordernum);
		map.put("nowPage", nowPage);
		map.put("scale", scale);
		return sqlSession.selectList(NAMESPACE + ".mypageDetail", map);
	}
	//notice 레코드 개수
	@Override
	public int countArticle(String o_ordernum) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".countArticle", o_ordernum);
	}	
	//비회원일때 주문조회체크
	@Override
	public HashMap<String, Object> chknouser(Map<String, Object> chkmap) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".chknouser", chkmap);
	}
	//비회원 주문조회 디테일
	@Override
	public List<OrderListVo> nouserDetail(String o_ordernum, int nowPage, int scale) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("o_ordernum", o_ordernum);
		map.put("nowPage", nowPage);
		map.put("scale", scale);
		return sqlSession.selectList(NAMESPACE + ".nouserDetail", map);
	}
	/**********************미현 끝********************************************************/
}