package com.bit.pro.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

public interface MyRecipeService {

	//리스트, 페이징출력
	Model recipeList(Model model, int userNum, int p) throws SQLException;
	
	//삭제
	void deleteRecipe(int userNum, int customNum) throws SQLException;
}
