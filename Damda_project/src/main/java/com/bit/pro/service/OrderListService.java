package com.bit.pro.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

public interface OrderListService {
	
	//�����ۼ� item
	Model reviewItem(Model model, String orderNum, int userNum, int itemNum) throws SQLException;
	
	//�����ۼ� 
	Model reviewCustom(Model model, String orderNum, int userNum, int customNum) throws SQLException;
}
