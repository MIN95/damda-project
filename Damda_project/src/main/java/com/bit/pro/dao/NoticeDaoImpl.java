package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bit.pro.vo.NoticeVo;

@Repository("noticeDao")
public class NoticeDaoImpl implements NoticeDao {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeDao.class);
	private static final String NAMESPACE = "com.bit.pro.mappers.noticeMapper";
	private static final String PHOTONAMESPACE = "com.bit.pro.mappers.photoMapper";
	
	//notice list
	@Override
	public List<NoticeVo> selectNotice(int nowPage, int scale) throws SQLException {
		//맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nowPage", nowPage);
		map.put("scale", scale);
		
		return sqlSession.selectList(NAMESPACE + ".selectNotice", map);
	}
	//notice 레코드 개수
	@Override
	public int countArticle() throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".countArticle");
	}
	
	/***********************************************************************/
	//notice detail
	@Override
	public NoticeVo detailNotice(Integer bbsnum) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".detailNotice", bbsnum);
	}
	//photo detail
	@Override
	public List<NoticeVo> photoDetailNotice(Integer bbsseq, Integer bbsnum) throws SQLException {
		if(bbsseq==0) {
			return  sqlSession.selectList(NAMESPACE + ".photoNoticeNum", bbsnum);
		}else if(bbsnum==0){
			return sqlSession.selectList(NAMESPACE + ".photoNoticeSeq", bbsseq);
		}
		return null;
	}
	//조회수 증가
	@Override
	public int updateViewCnt(Integer bbsseq) throws SQLException {
		return sqlSession.update(NAMESPACE + ".updateViewCnt" , bbsseq);
	}
	//notice prev detail
	@Override
	public NoticeVo prevDetailNotice(int prevbbsseq) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".prevDetailNotice", prevbbsseq);
	}
	//notice prev detail
	@Override
	public NoticeVo nextDetailNotice(int nextbbsseq) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".prevDetailNotice", nextbbsseq);
	}
	
	/***********************************************************************/
	//notice add
	@Override
	public int addNotice(NoticeVo noticeVo) throws SQLException {
		return sqlSession.insert(NAMESPACE + ".addNotice", noticeVo);
	}
	//photo add
	@Override
	public void upload(Map<String, Object> map) throws SQLException {
		sqlSession.insert(PHOTONAMESPACE + ".noticePhotoInsert", map);
	}
	
	/***********************************************************************/
	//notice delete
	@Override
	public int deleteNotice(int bbsseq) throws SQLException {
		return sqlSession.delete(NAMESPACE + ".deleteNotice", bbsseq);
	}
	//All photo notice delete
	@Override
	public int deleteAllPhotoNotice(int bbsseq) throws SQLException {
		return sqlSession.delete(NAMESPACE + ".deletephotoFKAll",bbsseq);
	}
	//photo notice find originalname delete
	@Override
	public int deleteNamePhotoNotice(String dbPhotoname) throws SQLException {
		return sqlSession.delete(NAMESPACE + ".deletephotoFKOne",dbPhotoname);
	}
	/***********************************************************************/
	//notice update
	@Override
	public int updateNotice(NoticeVo noticeVo) throws SQLException {
		return sqlSession.update(NAMESPACE + ".updateNotice" , noticeVo);
	}
	//notice photo update
	@Override
	public int updateNoticePhoto(Map<String, Object> map) throws SQLException {
		return sqlSession.update(PHOTONAMESPACE + ".noticePhotoInsert", map);
	}
}
