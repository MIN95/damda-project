package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.pro.vo.MyRecipeVo;

@Repository("myRecipeDao")
public class MyRecipeDaoImpl implements MyRecipeDao{

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bit.pro.mappers.myRecipeMapper";

	//����Ʈ
	@Override
	public List<MyRecipeVo> recipeList(MyRecipeVo bean) throws SQLException {
		return sqlSession.selectList(NAMESPACE +".recipeList", bean);
	}

	//����¡
	@Override
	public int recipeCount(MyRecipeVo bean) throws SQLException {
		return sqlSession.selectOne(NAMESPACE +".recipeCount", bean);
	}

	//����
	@Override
	public void deleteRecipe(MyRecipeVo bean) throws SQLException {
		sqlSession.delete(NAMESPACE + ".deleteRecipe", bean);
	}
}
 
