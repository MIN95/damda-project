package com.bit.pro.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.pro.dao.WishItemDao;
import com.bit.pro.vo.ReviewVo;
import com.bit.pro.vo.WishItemVo;

@Service("wishItemSevice")
public class WishItemServiceImpl implements WishItemService {

	
	private static final Logger logger = LoggerFactory.getLogger(WishItemServiceImpl.class);
	
	@Resource(name="wishItemDao")
	private WishItemDao wishItemDao;
	
	//리스트 출력
	@Override
	public Model wishList(Model model, int userNum, int p) throws SQLException {
		WishItemVo bean = new WishItemVo();
		bean.setW_userNum(userNum);
		
		//리뷰 paging
		int totalCnt = wishItemDao.wishCount(bean);		
		
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
        
        List<WishItemVo> list = wishItemDao.wishList(bean);
        model.addAttribute("List", list);
		model.addAttribute("p", p);
		model.addAttribute("totalpage",totalpage);
		
		return model;
	}

	//아이템 삭제
	@Override
	public void deleteWish(int userNum, int itemNum) throws SQLException {
		WishItemVo bean = new WishItemVo();
		bean.setW_userNum(userNum);
		bean.setW_itemNum(itemNum);
		
		wishItemDao.deleteWish(bean);
	}

	//아이템 등록
	@Override
	public void insertWish(int userNum, int itemNum) throws SQLException {
		WishItemVo bean = new WishItemVo();
		bean.setW_userNum(userNum);
		bean.setW_itemNum(itemNum);
		
		wishItemDao.insertWish(bean);
	}

	//중복검사용
	@Override
	public Model compareWishList(Model model, int userNum) throws SQLException {
		WishItemVo bean = new WishItemVo();
		bean.setW_userNum(userNum);
		//중복검사용
		List<WishItemVo> wishList = wishItemDao.compareWishList(bean);
		model.addAttribute("wishList", wishList);
		return model;
	}

}
