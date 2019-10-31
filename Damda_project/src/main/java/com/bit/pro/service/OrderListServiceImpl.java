package com.bit.pro.service;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.pro.dao.OrderListDao;
import com.bit.pro.vo.OrderListVo;

@Service("orserListService")
public class OrderListServiceImpl implements OrderListService{
	private static final Logger logger = LoggerFactory.getLogger(OrderListServiceImpl.class);

	@Resource(name="orderListDao")
	private OrderListDao orderListDao;
	
	@Override
	public Model reviewItem(Model model, String orderNum, int userNum, int itemNum) throws SQLException {
		OrderListVo bean = new OrderListVo();
		bean.setO_ordernum(orderNum);
		bean.setO_usernum(userNum);
		bean.setO_itemnum(itemNum);
		
		OrderListVo itemInfo = orderListDao.reviewItem(bean);
		model.addAttribute("itemInfo", itemInfo);
		return model;
	}

	@Override
	public Model reviewCustom(Model model, String orderNum, int userNum, int customNum) throws SQLException {
		OrderListVo bean = new OrderListVo();
		bean.setO_ordernum(orderNum);
		bean.setO_usernum(userNum);
		bean.setO_cstmtnum(customNum);
		
		OrderListVo customInfo = orderListDao.reviewCustom(bean);
		System.out.println(customInfo.getCstmMatelist().toString());
		
		model.addAttribute("customInfo", customInfo);
		return model;
	}

	
}
