package com.bit.pro.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bit.pro.vo.NoticeVo;

public interface NoticeService {
	//notice list
	List<NoticeVo> selectNotice(int nowPage, int scale) throws SQLException;
	//notice 레코드 갯수
	int countArticle() throws SQLException;
	/***********************************************************************/
	//notice detail
	NoticeVo detailNotice(Integer bbsnum) throws SQLException;
	//photo detail
	List<NoticeVo> photoDetail(Integer bbsseq, Integer bbsnum) throws SQLException;
	//notice detail클릭 시 조회수 증가
	int viewCount(Integer bbsseq)throws SQLException;
	//prev 제목
	NoticeVo detailPrevNotice(int prevbbsseq) throws SQLException;
	//next 제목
	NoticeVo detailNextNotice(int nextbbsseq) throws SQLException;
	/***********************************************************************/
	//notice add
	int addNotice(NoticeVo noticeVo) throws SQLException;
	//photo add
	void upload(Map<String, Object> map) throws SQLException;
	/***********************************************************************/
	//notice delete
	int deleteNotice(int bbsseq) throws SQLException;
	//All photo notice delete
	int deleteAllPhotoNotice(int bbsseq) throws SQLException;
	//photo notice find originalname delete
	int deleteNamePhotoNotice(String dbPhotoname) throws SQLException;
	/***********************************************************************/
	//notice update
	int updateNotice(NoticeVo noticeVo) throws SQLException;
	//notice photo update
	int updateNoticePhoto(Map<String, Object> map) throws SQLException;
}
