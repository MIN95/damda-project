package com.bit.pro.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bit.pro.dao.QnaDao;
import com.bit.pro.service.QnaService;
import com.bit.pro.util.Criteria;
import com.bit.pro.util.PageMaker;
import com.bit.pro.vo.AllItemVo;
import com.bit.pro.vo.MailVo;
import com.bit.pro.vo.PhotoVo;
import com.bit.pro.vo.QnaVo;

@Controller
@RequestMapping("/qna")
public class QnaController {
	 
	String dir = "qna";
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Resource
	private QnaService qnaService;
	
	//User section
	//qna ������
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String qnaList(HttpServletRequest req,HttpSession session,Model model) throws Exception {
		if((String) session.getAttribute("userid")!=null) {	
			int user_ctg = (int) session.getAttribute("user_ctg");
			model.addAttribute("user_ctg", user_ctg);
		}	
		return dir+"/qna_list";
	}
	
	//����¡����Ʈ(ajax)
	@ResponseBody 
	@RequestMapping(value = "/pagingList", method = RequestMethod.GET)
	public List<QnaVo> itemPagingList(Criteria cri,QnaVo qnaVo) throws Exception {
		return qnaService.selectQnaList(cri,qnaVo);	
	}	
	//��������
	@RequestMapping(value = "/detail",method= RequestMethod.GET)
	public String qnaDetail(HttpServletRequest req,HttpSession session,Model model) throws Exception {
		session=req.getSession();
		if((String) session.getAttribute("userid")!=null) {	
			int user_ctg = (int) session.getAttribute("user_ctg");
			int userNum = (int) session.getAttribute("userNum");
			model.addAttribute("user_ctg", user_ctg);
			model.addAttribute("userNum", userNum); 
		}	 
		int qnaNum = Integer.parseInt(req.getParameter("no"));
		int sqlResult = 0;
		sqlResult =qnaService.selectQna(qnaNum,model);
		 
		if(sqlResult==1) {
			return dir+"/qna_detail"; 
		}else {
			model.addAttribute("msg", "���ٽ���");
			return "redirect:/qna/";
		} 
	}
	//������ qna�亯���
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public String insertQnaAnswer(QnaVo qnaVo,MailVo mailVo) throws Exception {
		qnaService.insertQnaAnswer(qnaVo);
		System.out.println("qnaVo--->"+qnaVo);
		//�亯�˸� ���� ������ 
		if(qnaVo.getAnswerNotice()==1 && qnaVo.getAnswerStatus().equals("�̴亯")) {
			qnaService.sendEmail(mailVo,qnaVo);
		} 
		 
		int qnaNum = qnaVo.getQnaNum();
		return "redirect:/qna/detail?no="+qnaNum;
	}
	
	//÷������ �ٿ�ε�
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public ModelAndView downloadQnaFile(HttpServletRequest req,HttpServletResponse resp) throws Exception {
		String fileFullPath = req.getParameter("filePath");
		File downloadFile = new File(fileFullPath);
		if(!downloadFile.canRead()){
			 throw new Exception("File can't read(������ ã�� �� �����ϴ�)");
		}
		return new ModelAndView("fileDownloadView", "downloadFile",downloadFile);
    }
	
	//qna���������
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String qnaInsert(Model model,HttpServletRequest req,HttpSession session) {
		//���ǻ��� �� ������ ���θ������(�α��ε�)�����̸� ���Ǳ� �ۼ�����or�α���â���� ������
		session=req.getSession();
		if((String) session.getAttribute("userid")!=null) {		 
			String m_userId = (String) session.getAttribute("userid");
			int m_userNum = (int) session.getAttribute("userNum");
			model.addAttribute("m_userId", m_userId);
			model.addAttribute("m_userNum", m_userNum);
			return dir+"/qna_insert";
		}else {
			return "redirect:/login/";		 
		}
	}
	
	//qna�������
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String qnaInsertSave(QnaVo qnaVo,PhotoVo photoVo,Model model,MultipartHttpServletRequest multi) throws Exception {
		int sqlResult = qnaService.insertQna(qnaVo,photoVo,multi); 
		//���ϰ��	
		if(sqlResult==0) {
			//���ǵ�Ͻ���
			model.addAttribute("msg","�ٽ� �õ����ּ���");
			return "redirect:/qna/insert";
		}else {
			//��ǰ��ϼ���
			model.addAttribute("msg","���������� ���Ǹ� ����ϼ̽��ϴ�");
			//����� ���Ǳ۹�ȣ ����
			return "redirect:/qna/detail?no="+sqlResult;
		}
	}
	//���Ǳ� ����������
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String qnaUpdate(HttpServletRequest req,Model model) throws Exception {	 
		int qnaNum = Integer.parseInt(req.getParameter("no"));
		int sqlResult = 0;
		sqlResult =qnaService.selectQna(qnaNum,model);
		 
		if(sqlResult==1) {
			return dir+"/qna_update"; 
		}else {
			model.addAttribute("msg", "���ٽ���");
			return "redirect:/qna/detail?no="+qnaNum;
		}
	
	}
	//qna��������
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String qnaUpdateSave(@RequestParam(required=false,defaultValue="0",value="fileStatus")List<Integer> statusList
									,@RequestParam(required=false,defaultValue="0",value="filePath")List<String> pathList
									,QnaVo qnaVo,PhotoVo photoVo,Model model,MultipartHttpServletRequest multi) throws Exception {
			int sqlResult = qnaService.UpdateQna(qnaVo,photoVo,multi,statusList,pathList); 
			//���ϰ��	
			if(sqlResult==0) {
				//���ǵ�Ͻ���
				model.addAttribute("msg","�ٽ� �õ����ּ���");
				return "redirect:/qna/update?no="+sqlResult;
			}else {
				//��ǰ��ϼ���
				model.addAttribute("msg","���������� ���Ǹ� �����ϼ̽��ϴ�");
				//����� ���Ǳ۹�ȣ ����
				return "redirect:/qna/detail?no="+sqlResult;
			}
		}
	//delete
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deleteQna(Model model
							,@RequestParam(required=false,defaultValue="0",value="filePath")List<String> pathList
							,@RequestParam(required=false,defaultValue="0",value="qnaNum")int qnaNum) throws Exception {
		System.out.println("qnaNum--->"+qnaNum);
		int sqlResult = qnaService.deleteQna(qnaNum,pathList);
		
		if(sqlResult==1) {
			model.addAttribute("msg", "���� ���������� �����Ǿ����ϴ�");
		}else {
			model.addAttribute("msg", "�ٽ� �õ����ּ���");
		}
		return "redirect:/qna/";
	}
	//Admin section
	//insert answer
	@RequestMapping(value = "/qnaAnswer/insert", method = RequestMethod.GET)
	public String qnaAnswerInsert() {
		
		return dir+"/qna_detail";
	}
	
	//update answer
	@RequestMapping(value = "/qnaAnswer/update", method = RequestMethod.GET)
	public String qnaAnswerUpdate() {
		
		return dir+"/qna_detail";
	}
	
	//����¡ ��ư
	@ResponseBody 
	@RequestMapping(value = "/pagingBtn", method = RequestMethod.GET)
	public PageMaker itemPagingBtn(Criteria cri,QnaVo qnaVo,HttpServletRequest req) throws Exception {
		String qnaKind = qnaVo.getQnaKind();
		int m_userNum = qnaVo.getM_userNum();
		int dataCnt = 0;
		if(qnaKind!=null) {
			if(qnaKind.equals("��ü")) {
				dataCnt = qnaService.selectAllCnt();
			}else if(qnaKind.equals("����������")){
				dataCnt = qnaService.selectMyQnaCnt(m_userNum);
			}else {
				dataCnt = qnaService.selectCnt(qnaKind);				
			}			
		}else if(qnaKind==null) {
			dataCnt = qnaService.selectAllCnt();		
		}
		 
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dataCnt);
		return pageMaker;		
		
	}
	//delete qna by admin(select one or all)
	@ResponseBody 
	@RequestMapping(value = "/deleteQnaList", method = RequestMethod.POST)
	public int deleteQnaList(@RequestParam(required=false,defaultValue="0",value="deleteList[]") 
								List<Integer> deleteList) throws Exception {
		int sqlResult = 0;
		sqlResult = qnaService.deleteQnaList(deleteList);

		return sqlResult;
	}
	
}