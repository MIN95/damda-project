package com.bit.pro.dao;

import java.sql.SQLException;

import com.bit.pro.vo.OrderListVo;

public interface OrderListDao {

	//府轰其捞瘤 item
	OrderListVo reviewItem(OrderListVo bean) throws SQLException; 
	
	//府轰其捞瘤 custom
	OrderListVo reviewCustom(OrderListVo bean) throws SQLException; 
}
