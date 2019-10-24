package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.pro.util.pagination;
import com.bit.pro.vo.EventVo;

public interface EventDao {

	List<EventVo> selectEventAll(pagination pagination) throws SQLException;

	int insertEvent(EventVo eventVo) throws SQLException;
	
	List<EventVo> selectEventOne(int eventnum);

	int updateEvent(EventVo eventVo);
	
	int deleteEvent(int eventnum);
	
	int deleteEventPhoto(int eventnum);
	
	int selectEventCnt();

}
