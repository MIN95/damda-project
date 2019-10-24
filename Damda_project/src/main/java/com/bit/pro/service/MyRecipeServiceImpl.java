package com.bit.pro.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.pro.dao.MyRecipeDao;
import com.bit.pro.vo.MyRecipeVo;
import com.bit.pro.vo.WishItemVo;

@Service("myRecipeService")
public class MyRecipeServiceImpl implements MyRecipeService{

		private static final Logger logger = LoggerFactory.getLogger(MyRecipeServiceImpl.class);
		
		@Resource(name="myRecipeDao")
		private MyRecipeDao myRecipeDao;

		//리스트, 페이징
		@Override
		public Model recipeList(Model model, int userNum, int p) throws SQLException {
			MyRecipeVo bean = new MyRecipeVo();
			bean.setMr_userNum(userNum);
			
			//리뷰 paging
			int totalCnt = myRecipeDao.recipeCount(bean);		
			
			int row = 10;//10개씩보이기
			int totalpage = 0;
			if(totalCnt == 0) {
				totalpage = 0;
			}else {			
		        totalpage = totalCnt / row - 1;
		        if((totalCnt % row) > 0) totalpage++;
			}
	        
	        int startpoint = p * row;
	        bean.setStartpoint(startpoint);
	        bean.setRow(row);
	        
	        List<MyRecipeVo> list = myRecipeDao.recipeList(bean);
	        model.addAttribute("List", list);
			model.addAttribute("p", p);
			model.addAttribute("totalpage",totalpage);
			return model;
		}

		//삭제
		@Override
		public void deleteRecipe(int userNum, int customNum) throws SQLException {
			MyRecipeVo bean = new MyRecipeVo();
			bean.setMr_userNum(userNum);
			bean.setMr_customNum(customNum);
			
			myRecipeDao.deleteRecipe(bean);
		}
}
