package com.bit.pro.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

public interface OrderListService {
	
	//府轰累己 item
	Model reviewItem(Model model, String orderNum, int userNum, int itemNum) throws SQLException;
	
	//府轰累己 
	Model reviewCustom(Model model, String orderNum, int userNum, int customNum) throws SQLException;
}
