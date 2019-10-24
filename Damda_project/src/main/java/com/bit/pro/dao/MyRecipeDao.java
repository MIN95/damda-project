package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.List;

import com.bit.pro.vo.MyRecipeVo;

public interface MyRecipeDao {

	//리스트 출력
	List<MyRecipeVo> recipeList(MyRecipeVo bean) throws SQLException;
	
	//페이징용
	int recipeCount(MyRecipeVo bean) throws SQLException;
	
	//삭제
	void deleteRecipe(MyRecipeVo bean) throws SQLException;
}
