package com.bit.pro.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

public interface MyRecipeService {

	//����Ʈ, ����¡���
	Model recipeList(Model model, int userNum, int p) throws SQLException;
	
	//����
	void deleteRecipe(int userNum, int customNum) throws SQLException;
}
