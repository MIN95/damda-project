package com.bit.pro.dao;

import java.sql.SQLException;

import com.bit.pro.vo.OrderListVo;

public interface OrderListDao {

	//���������� item
	OrderListVo reviewItem(OrderListVo bean) throws SQLException; 
	
	//���������� custom
	OrderListVo reviewCustom(OrderListVo bean) throws SQLException; 
}
