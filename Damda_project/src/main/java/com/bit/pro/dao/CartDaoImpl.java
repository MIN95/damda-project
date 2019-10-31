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
	
	//detail.jsp���� ��ٱ��� �߰�
	@Override
	public void insertCart(CartVo bean) throws SQLException {
		sqlSession.insert(NAMESPACE + ".insertCart", bean);
	}

	@Override
	public void insertCart_noUser(CartVo bean) throws SQLException {
		sqlSession.insert(NAMESPACE + ".insertCart_noUser", bean);
	}
	
	
	//��ٱ��� ��� ȸ�� 
	@Override
	public List<CartJoinVo> selectCart_user(CartVo bean) throws SQLException {
		return sqlSession.selectList(NAMESPACE +".selectCart_user", bean);
	}	
	
	//��ٱ��� ��� ��ȸ�� 
	@Override
	public List<CartJoinVo> selectCart_noUser(CartVo bean) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectCart_noUser", bean);
	}	
	
	//��ȸ����ٱ��� -> ȸ����ٱ��� �ߺ� ���� ��
	@Override
	public int noUser_updateCart(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".noUser_updateCart", bean);
	}
	//��ȸ����ٱ��� -> ȸ����ٱ��� �ߺ��� �� 
	@Override
	public int noUser_updateCart2(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".noUser_updateCart2", bean);
	}
	//��ȸ����ٱ��� -> ȸ����ٱ��� Ŀ���� �ߺ�����
	@Override
	public int noUser_updateCart3(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".noUser_updateCart3", bean);
	}
	//��ȸ����ٱ��� -> ȸ����ٱ��� �ߺ������� ����
	@Override
	public int noUser_deleteCart(CartVo bean) throws SQLException {
		return sqlSession.delete(NAMESPACE + ".noUser_deleteCart" , bean);
	}
	//��ȸ����ٱ��� -> ȸ����ٱ��� ��ȸ�� ���� ����� (������)
	@Override
	public int user_updateCart(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".User_updateCart", bean);
	}
	//��ȸ����ٱ��� -> ȸ����ٱ��� ��ȸ�� ���� ����� (Ŀ����)
	@Override
	public int user_updateCart2(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".User_updateCart2", bean);
	}

	
	//ȸ�� ��ٱ��� ��������
	@Override
	public int userUpdate_item(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".userUpdate_item", bean);
	}

	@Override
	public int userUpdate_custom(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".userUpdate_custom", bean);
	}

	
	//��ȸ�� ��ٱ��� ��������
	@Override
	public int nouserUpdate_item(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".nouserUpdate_item", bean);
	}

	@Override
	public int nouserUpdate_custom(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".nouserUpdate_custom", bean);
	}

	//ȸ�� ��ٱ��� ����
	@Override
	public void userDelete_item(CartVo bean) throws SQLException {
		sqlSession.delete(NAMESPACE + ".userDelete_item", bean);
	}

	@Override
	public void userDelete_custom(CartVo bean) throws SQLException {
		sqlSession.delete(NAMESPACE + ".userDelete_custom", bean);
	}

	
	//��ȸ�� ��ٱ��� ����
	@Override
	public void nouserDelete_item(CartVo bean) throws SQLException {
		sqlSession.delete(NAMESPACE + ".nouserDelete_item", bean);
	}

	@Override
	public void nouserDelete_custom(CartVo bean) throws SQLException {
		sqlSession.delete(NAMESPACE + ".nouserDelete_custom", bean);
	}

	//ȸ�� ��ٱ��� �ߺ� Ȯ�ο�
	@Override
	public List<CartVo> user_compareCart(CartVo bean) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".user_compareCart", bean);
	}

	//��ȸ�� ��ٱ��� �ߺ� Ȯ�ο�
	@Override
	public List<CartVo> noUser_compareCart(CartVo bean) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".nouser_compareCart", bean);
	}

	//��ٱ��� �ߺ��� ���� update
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

	//�ֹ��������� �̵���
	@Override
	public void cartOrder(CartVo bean) throws SQLException {
		sqlSession.update(NAMESPACE + ".cartOrder", bean);
	}
	
	//�ֹ� ��ҽ� ��ٱ��Ϸ� ���ƿ� ��
	@Override
	public void cartOrder_noUser(CartVo bean) throws SQLException {
		sqlSession.update(NAMESPACE + ".cartOrder_noUser", bean);
	}
	
	/**********************��������********************************************************/
	//�ֹ����� ���
	@Override
	public List<OrderListVo> mypage(int usernum, int nowPage, int scale) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usernum", usernum);
		map.put("nowPage", nowPage);
		map.put("scale", scale);
		return sqlSession.selectList(NAMESPACE + ".mypage", map);
	}
	//�ֹ����� ���ڵ� ����
	@Override
	public int mypagecountArticle(int usernum) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".mypagecountArticle", usernum);
	}
	//�ֹ��󼼳��� ���
	@Override
	public List<OrderListVo> mypageDetail(String o_ordernum,int nowPage, int scale) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("o_ordernum", o_ordernum);
		map.put("nowPage", nowPage);
		map.put("scale", scale);
		return sqlSession.selectList(NAMESPACE + ".mypageDetail", map);
	}
	//notice ���ڵ� ����
	@Override
	public int countArticle(String o_ordernum) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".countArticle", o_ordernum);
	}	
	//��ȸ���϶� �ֹ���ȸüũ
	@Override
	public HashMap<String, Object> chknouser(Map<String, Object> chkmap) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".chknouser", chkmap);
	}
	//��ȸ�� �ֹ���ȸ ������
	@Override
	public List<OrderListVo> nouserDetail(String o_ordernum, int nowPage, int scale) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("o_ordernum", o_ordernum);
		map.put("nowPage", nowPage);
		map.put("scale", scale);
		return sqlSession.selectList(NAMESPACE + ".nouserDetail", map);
	}
	/**********************���� ��********************************************************/
}