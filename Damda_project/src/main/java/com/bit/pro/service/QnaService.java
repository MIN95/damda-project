package com.bit.pro.service;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.pro.util.Criteria;
import com.bit.pro.vo.MailVo;
import com.bit.pro.vo.PhotoVo;
import com.bit.pro.vo.QnaVo;

public interface QnaService {
	//selectList
	List<QnaVo> selectQnaList(Criteria cri,QnaVo qnaVo) throws Exception;
	//insert
	int insertQna(QnaVo qnaVo, PhotoVo photoVo, MultipartHttpServletRequest multi) throws Exception;
	//detail
	int selectQna(int qnaNum,Model model)throws Exception;
	//update
	int UpdateQna(QnaVo qnaVo, PhotoVo photoVo,MultipartHttpServletRequest multi
			, List<Integer> statusList,List<String> pathList) throws Exception;
	//delete
	int deleteQna(int qnaNum, List<String> pathList)throws Exception;
	
	//count alldata (for paging button)
	int selectAllCnt() throws Exception;
	
	//count selected data (for paging button)
	int selectCnt(String qnaKind) throws Exception;
	
	//count myqna data (for mypage)
	int selectMyQnaCnt(int m_userNum) throws Exception;
	
	//delete by admin
	int deleteQnaList(List<Integer> deleteList) throws Exception;
	
	//insert qna answer and take that answer
	int insertQnaAnswer(QnaVo qnaVo) throws Exception;
	
	//send mail(let user know about answer)
	void sendEmail(MailVo mailVo,QnaVo qnaVo);


}
