package com.bit.pro.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bit.pro.dao.NoticeDao;
import com.bit.pro.vo.NoticeVo;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Resource(name="noticeDao")
	NoticeDao noticeDao;
	
	//notice list
	@Override
	public List<NoticeVo> selectNotice(int nowPage, int scale) throws SQLException {
		return noticeDao.selectNotice(nowPage, scale);
	}
	//notice ���ڵ� ����
	@Override
	public int countArticle() throws SQLException {
		return noticeDao.countArticle();
	}
	
	/*********************************************************************************/
	//notice detail
	@Override public NoticeVo detailNotice(Integer bbsnum) throws SQLException {
		return noticeDao.detailNotice(bbsnum);
	}
	//photo detail
	@Override
	public List<NoticeVo> photoDetail(Integer bbsseq, Integer bbsnum) throws SQLException {
		return noticeDao.photoDetailNotice(bbsseq, bbsnum);
	}
	//notice detailŬ�� �� ��ȸ�� ����
	@Override
	public int viewCount(Integer bbsseq) throws SQLException {
		return noticeDao.updateViewCnt(bbsseq);
	}
	//prev ����
	@Override
	public NoticeVo detailPrevNotice(int prevbbsseq) throws SQLException {
		return noticeDao.prevDetailNotice(prevbbsseq);
	}
	//next ����
	@Override
	public NoticeVo detailNextNotice(int nextbbsseq) throws SQLException {
		return noticeDao.nextDetailNotice(nextbbsseq);
	}
	
	/*********************************************************************************/
	//notice add
	@Override
	public int addNotice(NoticeVo noticeVo) throws SQLException {
		int nullcheck = noticeDao.addNotice(noticeVo);
		return nullcheck;
	}
	//photo add
	@Override
	public void upload(Map<String, Object> map) throws SQLException {
		noticeDao.upload(map);
	}
	
	/*********************************************************************************/
	//notice delete
	@Override
	public int deleteNotice(int bbsseq) throws SQLException {
		return noticeDao.deleteNotice(bbsseq);
	}
	//All photo notice delete
	@Override
	public int deleteAllPhotoNotice(int bbsseq) throws SQLException {
		return noticeDao.deleteAllPhotoNotice(bbsseq);
	}
	//photo notice find originalname delete
	@Override
	public int deleteNamePhotoNotice(String dbPhotoname) throws SQLException {
		return noticeDao.deleteNamePhotoNotice(dbPhotoname);
	}
	/*********************************************************************************/
	//notice update
	@Override
	public int updateNotice(NoticeVo noticeVo) throws SQLException {
		return noticeDao.updateNotice(noticeVo);
	}
	//notice photo update
	@Override
	public int updateNoticePhoto(Map<String, Object> map) throws SQLException {
		return noticeDao.updateNoticePhoto(map);
	}
}
