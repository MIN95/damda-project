package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.List;

import com.bit.pro.vo.MyRecipeVo;

public interface MyRecipeDao {

	//����Ʈ ���
	List<MyRecipeVo> recipeList(MyRecipeVo bean) throws SQLException;
	
	//����¡��
	int recipeCount(MyRecipeVo bean) throws SQLException;
	
	//����
	void deleteRecipe(MyRecipeVo bean) throws SQLException;
}
