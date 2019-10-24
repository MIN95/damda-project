package com.bit.pro.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.pro.util.pagination;
import com.bit.pro.vo.EventVo;
import com.bit.pro.vo.PhotoVo;

public interface EventService {
	List<EventVo> selectEventAll(pagination pagination, PhotoVo photoVo) throws SQLException;
	
	int insertEvent(EventVo eventVo,PhotoVo photoVo, MultipartHttpServletRequest multi) throws SQLException, Exception;
	List<EventVo> selectEventOne(Model model,PhotoVo photoVo,int eventnum);
	
	int updateEvent(int eventnum, EventVo eventVo, PhotoVo photoVo, MultipartHttpServletRequest multi) throws Exception;
	
	int deleteEvent(int eventnum);
	int deleteEventPhoto(int eventnum);
	int selectEventCnt();
}

