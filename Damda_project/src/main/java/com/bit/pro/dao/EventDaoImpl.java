package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.pro.util.pagination;
import com.bit.pro.vo.EventVo;

@Repository("eventDao")
public class EventDaoImpl implements EventDao{

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bit.pro.mappers.eventMapper";

	@Override
	public List<EventVo> selectEventAll(pagination pagination) {
		return sqlSession.selectList(NAMESPACE+".selectEventAll",pagination);
	}

	@Override
	public int insertEvent(EventVo eventVo) throws SQLException {
		return sqlSession.insert(NAMESPACE + ".insertEvent", eventVo);
	}

	@Override
	public List<EventVo> selectEventOne(int eventnum) {
		System.out.println("eventnum===>"+eventnum);
		return sqlSession.selectList(NAMESPACE+".selectEventOne",eventnum);
	}

	@Override
	public int updateEvent(EventVo eventVo) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+".updateEvent",eventVo);
	}

	@Override
	public int deleteEvent(int eventnum) {
		return sqlSession.delete(NAMESPACE+".deleteEvent", eventnum);
	}

	@Override
	public int deleteEventPhoto(int eventnum) {
		return sqlSession.delete(NAMESPACE+".deleteEventPhoto",eventnum);
	}

	@Override
	public int selectEventCnt() {
		return sqlSession.selectOne(NAMESPACE+".selectEventCnt");
	}

	
}
