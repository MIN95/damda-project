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

		if("��ü".equals(qnaKind)) {
			return qnaDao.selectQnaListAll(qnaVo);			
		}else if("����������".equals(qnaKind)) {
			return qnaDao.selectMyQna(qnaVo);			
		}else {
			return qnaDao.selectQnaList(qnaVo);			
		}
	}

	@Transactional
	@Override
	//qna���(user)
	public int insertQna(QnaVo qnaVo, PhotoVo photoVo, MultipartHttpServletRequest multi) throws Exception {
		// qna���� �����ϰ� �״����� photo�ֱ�
		// sql=qna �Է��ϰ� ��ȣ�����ͼ� int qnaNum=�� �ְ� photovo�� �ֱ�
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
					// qna�� ��ȣ ���,qna���̺� �ִ°� �ѹ���
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
	
	//qna�󼼺���
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
	//qna�������(user)
	@Transactional
	@Override
	public int UpdateQna(QnaVo qnaVo, PhotoVo photoVo, MultipartHttpServletRequest multi
							, List<Integer> statusList, List<String> pathList)
			throws Exception {
		//�����ϴ� ���Ǳ� ��ȣ set
		int qnaNum = qnaVo.getQnaNum();
		photoVo.setP_qnaNum(qnaNum);
		//�������� ����
		int sqlResult=0;
		//main_qna ������Ʈ
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
		//������ insert
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
	//qna����(user)
	@Transactional
	@Override
	public int deleteQna(int qnaNum,List<String> pathList) throws Exception {
		for(String filePath: pathList) {
			File file = new File(filePath); 
			if( file.exists() ){ 
				if(file.delete()){ 
					System.out.println("���ϻ��� ����"); 
				}else{ 
					System.out.println("���ϻ��� ����"); 
				} 
			}else{ 
				System.out.println("������ �������� �ʽ��ϴ�."); 
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
	//qna�����(�������������� sql�ٸ���)
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
							System.out.println("���ϻ��� ����");
							sqlResult=1; 
						}else{ 
							System.out.println("���ϻ��� ����");
							sqlResult=0;
						} 
					}else{ 
						System.out.println("������ �������� �ʽ��ϴ�.");
						sqlResult=1;
					}
				}
				if(sqlResult==1) {
					sqlResult=qnaDao.deleteQnaList(qnaNum);
				}
			}else {
				System.out.println("������ �������� �ʽ��ϴ�.");
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
