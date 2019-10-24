package com.bit.pro.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.pro.vo.AllItemVo;

@Repository("itemDao")
public class itemDaoImpl implements ItemDao {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bit.pro.mappers.itemMapper";
	
	//home
	@Override
	public List<AllItemVo> selectHome(AllItemVo bean) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".selectHome", bean);
	}
	
	//main
	@Override
	public List<AllItemVo> selectItem(AllItemVo bean) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".selectItem", bean);
	}

	@Override
	public int totalItem(AllItemVo bean) {
		return sqlSession.selectOne(NAMESPACE +".totalItem",bean);
	}

	//best
	@Override
	public List<AllItemVo> selectBest(AllItemVo bean) throws Exception {
		return sqlSession.selectList(NAMESPACE +".selectBest",bean);
	}
	
	//detail
	@Override
	public AllItemVo selectOne(AllItemVo bean) throws Exception {
		return sqlSession.selectOne(NAMESPACE +".itemDetail", bean);
	}

	@Override
	public List<AllItemVo> selectOne_detailImg(AllItemVo bean) throws Exception {
		return sqlSession.selectList(NAMESPACE +".detailImg", bean);
	}
	
	//°æ¹Î************************************************************************
		//item-insert
		@Override 
		public int insertItem(AllItemVo allitemVo) throws Exception {
			return sqlSession.insert(NAMESPACE + ".insertAllitem",allitemVo);
		}
		
		//item-update
		@Override
		public int updateItem(AllItemVo allitemVo) {
			return sqlSession.insert(NAMESPACE + ".updateAllitem",allitemVo);
		}

		//select selectBox value-all,category,best
		//all
		@Override
		public List<AllItemVo> selectProductAll() throws Exception {
			return sqlSession.selectList(NAMESPACE + ".selectProductAll");
		}
		
		//category
		@Override
		public List<AllItemVo> selectProduct(AllItemVo allitemVo) throws Exception {
			return sqlSession.selectList(NAMESPACE + ".selectProduct",allitemVo);
		}
		
		//best
		@Override
		public List<AllItemVo> selectProductBest() throws Exception {
			return sqlSession.selectList(NAMESPACE + ".selectProductBest");
		}
		
		//delete item
		@Override
		public int deleteProduct(String itemNum) throws Exception {
			return sqlSession.delete(NAMESPACE + ".deleteProduct",itemNum);
			
		}
		
		//for paging
		//get the allitem data count
		@Override
		public int selectAllCnt() throws Exception {
			return sqlSession.selectOne(NAMESPACE + ".selectAllCnt");
		}
		
		//paging result
		@Override
		public List<AllItemVo> selectPagingListAll(AllItemVo bean) throws Exception {
			return sqlSession.selectList(NAMESPACE + ".selectPagingListAll", bean);
		}

		@Override
		public List<AllItemVo> selectPagingList(AllItemVo bean) throws Exception {
			return sqlSession.selectList(NAMESPACE + ".selectPagingList", bean);
		}

}
