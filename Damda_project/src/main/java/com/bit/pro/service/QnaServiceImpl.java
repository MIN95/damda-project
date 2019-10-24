package com.bit.pro.service;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.bit.pro.dao.PhotoDao;
import com.bit.pro.dao.QnaDao;
import com.bit.pro.util.Criteria;
import com.bit.pro.util.MailConfigUtil;
import com.bit.pro.util.UploadFileUtil;
import com.bit.pro.vo.MailVo;
import com.bit.pro.vo.PhotoVo;
import com.bit.pro.vo.QnaVo;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {

	private static final Logger logger = LoggerFactory.getLogger(QnaServiceImpl.class);

	@Resource(name = "qnaDao")
	private QnaDao qnaDao;

	@Resource(name = "photoDao")
	private PhotoDao photoDao;

	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private JavaMailSenderImpl mailSender;

	@Override
	public List<QnaVo> selectQnaList(Criteria cri, QnaVo qnaVo) throws Exception {
		String qnaKind = qnaVo.getQnaKind();
		qnaVo.setStartpoint(cri.getPageStart());
		qnaVo.setRow(cri.getPerPageNum());

		if("전체".equals(qnaKind)) {
			return qnaDao.selectQnaListAll(qnaVo);			
		}else if("마이페이지".equals(qnaKind)) {
			return qnaDao.selectMyQna(qnaVo);			
		}else {
			return qnaDao.selectQnaList(qnaVo);			
		}
	}

	@Transactional
	@Override
	//qna등록(user)
	public int insertQna(QnaVo qnaVo, PhotoVo photoVo, MultipartHttpServletRequest multi) throws Exception {
		// qna먼저 생성하고 그다음에 photo넣기
		// sql=qna 입력하고 번호가져와서 int qnaNum=에 넣고 photovo에 넣기
		String photoCtg = "qna";
		photoVo.setPhotoCtg(photoCtg);
		String uploadPath = servletContext.getRealPath("/resources/imgs");
		String imgUploadPath = uploadPath + File.separator + photoCtg + File.separator;
		int count = 0;
		int sqlResult = 0;
		int lastId = 0;
		Iterator<String> files = multi.getFileNames();
		while (files.hasNext()) {
			String uploadFile = files.next();
			MultipartFile mFile = multi.getFile(uploadFile);
			String originalName = mFile.getOriginalFilename();
			if (originalName != "") {
				String fileName = null;
				String photoPath = null;
				fileName = UploadFileUtil.fileUpload(imgUploadPath, mFile.getOriginalFilename(), mFile.getBytes(),
						count, photoVo);
				photoPath = imgUploadPath + fileName;

				if (count == 0) {
					// qna글 번호 출력,qna테이블에 넣는건 한번만
					sqlResult = qnaDao.insertQna(qnaVo);
					lastId = qnaVo.getQnaNum();
				}
				photoVo.setP_qnaNum(lastId);
				photoVo.setPhotoPath(photoPath);
				photoVo.setPhotoName(fileName);
				photoVo.setOriginalName(originalName);
				sqlResult = photoDao.insertQnaPhoto(photoVo);
				count++;
			}
		}
		if (count == 0) {
			sqlResult = qnaDao.insertQna(qnaVo);
			lastId = qnaVo.getQnaNum();
		}
		if (sqlResult != 0) {
			sqlResult = lastId;
		}
		return sqlResult;
	}
	
	//qna상세보기
	@Override
	public int selectQna(int qnaNum,Model model) throws Exception {
		int sqlResult = 0;
		QnaVo qnaVo = qnaDao.selectQna(qnaNum);
		List<PhotoVo> FileList = qnaDao.selectQnaFileList(qnaNum);
		
		if(qnaVo!=null) {
			model.addAttribute("qnaVo", qnaVo);
			sqlResult=1;
		}else {
			sqlResult=0;
		}
		if(FileList !=null) {
			model.addAttribute("FileList", FileList);
		}
		return sqlResult;
	}
	//qna수정등록(user)
	@Transactional
	@Override
	public int UpdateQna(QnaVo qnaVo, PhotoVo photoVo, MultipartHttpServletRequest multi
							, List<Integer> statusList, List<String> pathList)
			throws Exception {
		//수정하는 문의글 번호 set
		int qnaNum = qnaVo.getQnaNum();
		photoVo.setP_qnaNum(qnaNum);
		//기존파일 삭제
		int sqlResult=0;
		//main_qna 업데이트
		sqlResult = qnaDao.updateQna(qnaVo);
		int index = 0;
		for(Integer fileStatus: statusList) {
			if(fileStatus==1) {
				String filePath = pathList.get(index);
				photoVo.setPhotoPath(filePath);
				sqlResult=photoDao.deleteQnaPhoto(photoVo);
				new File(filePath).delete();
				
			} 
			index++;
		}
		//새파일 insert
		String photoCtg = "qna";
		photoVo.setPhotoCtg(photoCtg);
		String uploadPath = servletContext.getRealPath("/resources/imgs");
		String imgUploadPath = uploadPath + File.separator + photoCtg + File.separator;
		int count = 0;
		Iterator<String> files = multi.getFileNames();
		while (files.hasNext()) {
			String uploadFile = files.next();
			MultipartFile mFile = multi.getFile(uploadFile);
			String originalName = mFile.getOriginalFilename();
			if (originalName != "") {
				String fileName = null;
				String photoPath = null;
				fileName = UploadFileUtil.fileUpload(imgUploadPath, mFile.getOriginalFilename(), mFile.getBytes(),
						count, photoVo);
				photoPath = imgUploadPath + fileName;
				photoVo.setPhotoPath(photoPath);
				photoVo.setPhotoName(fileName);
				photoVo.setOriginalName(originalName);
				sqlResult = photoDao.insertQnaPhoto(photoVo);
				count++;
			}
		}
		if (sqlResult != 0) {
			sqlResult = qnaNum;
		}
		return sqlResult;
	}
	//qna삭제(user)
	@Transactional
	@Override
	public int deleteQna(int qnaNum,List<String> pathList) throws Exception {
		for(String filePath: pathList) {
			File file = new File(filePath); 
			if( file.exists() ){ 
				if(file.delete()){ 
					System.out.println("파일삭제 성공"); 
				}else{ 
					System.out.println("파일삭제 실패"); 
				} 
			}else{ 
				System.out.println("파일이 존재하지 않습니다."); 
			}

		}
		return qnaDao.deleteQna(qnaNum);
	}

	@Override
	public int selectAllCnt() throws Exception {
		return qnaDao.selectAllCnt();
	}

	@Override
	public int selectCnt(String qnaKind) throws Exception {
		return qnaDao.selectCnt(qnaKind);
	}

	@Override
	public int selectMyQnaCnt(int m_userNum) throws Exception {
		return qnaDao.selectMyQnaCnt(m_userNum);
	}
	@Transactional
	//qna지우기(파일유무에따라 sql다르게)
	@Override
	public int deleteQnaList(List<Integer> deleteList) throws Exception {
		int sqlResult = 0;
		for(int qnaNum :deleteList) {
			List<PhotoVo> filePathList =qnaDao.getfilePath(qnaNum);
			if(filePathList.size()>0) {
				for(PhotoVo photoVo : filePathList) {
					String filePath=photoVo.getPhotoPath();
					File file = new File(filePath); 
					if( file.exists() ){ 
						if(file.delete()){ 
							System.out.println("파일삭제 성공");
							sqlResult=1; 
						}else{ 
							System.out.println("파일삭제 실패");
							sqlResult=0;
						} 
					}else{ 
						System.out.println("파일이 존재하지 않습니다.");
						sqlResult=1;
					}
				}
				if(sqlResult==1) {
					sqlResult=qnaDao.deleteQnaList(qnaNum);
				}
			}else {
				System.out.println("파일이 존재하지 않습니다.");
				sqlResult=qnaDao.deleteQnaList(qnaNum);
			}
		}
		return sqlResult;
	}

	@Override	//insert answer (admin)
	public int insertQnaAnswer(QnaVo qnaVo) throws Exception {
		return qnaDao.insertQnaAnswer(qnaVo);
	}
	
	@Override	//send email (admin)
	public void sendEmail(MailVo mailVo,QnaVo qnaVo) {
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
            @Override
            public void prepare(MimeMessage mimeMessage) throws Exception {
                final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                MailVo newMailVo = MailConfigUtil.mailConfig(mailVo, qnaVo);
                
                helper.setFrom(newMailVo.getMailFrom()); // recipient
                helper.setTo(newMailVo.getMailTo()); //sender
                helper.setSubject(newMailVo.getMailSubject()); // mail title
                helper.setText(newMailVo.getMailContent(), true); // mail content
            }
        };
 
        mailSender.send(preparator);
    }
}
