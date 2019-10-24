package com.bit.pro.service;

import java.io.File;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.pro.dao.EventDao;
import com.bit.pro.dao.PhotoDao;
import com.bit.pro.util.UploadFileUtil;
import com.bit.pro.util.pagination;
import com.bit.pro.vo.EventVo;
import com.bit.pro.vo.PhotoVo;

@Service("eventService")
public class EventServiceImpl implements EventService{
	private static final Logger logger = LoggerFactory.getLogger(EventServiceImpl.class);
	
	@Inject
	private EventDao eventDao;
	
	//�߰�
	@Resource(name="photoDao")
	private PhotoDao photoDao;
	
	@Autowired
	ServletContext servletContext;
	
	@Override
	public List<EventVo> selectEventAll(pagination pagination, PhotoVo photoVo) throws SQLException{
		return eventDao.selectEventAll(pagination);
		//pagination���̰� 
	}

	@Override
	public int insertEvent(EventVo eventVo, PhotoVo photoVo, MultipartHttpServletRequest multi) throws Exception {
		String upload = servletContext.getRealPath("/resources/event/");
		String imgUploadPath = upload; //��������
		String imgUploadPath2 = "/resources/event/"; //DB����
		int sqlResult=0;
		sqlResult = eventDao.insertEvent(eventVo);	//�ڷ�ְ�
		int count=0;
		String fileName = "";
		//���ϵ��� ���� ������[] []
		Iterator<String> files = multi.getFileNames();
		for(count = 0; count<2;count++) {//�ΰ��� ������ �ݺ����� ���� �� Ǯ��
			String uploadFile = files.next();
			MultipartFile mfile = multi.getFile(uploadFile);
			String originalName = mfile.getOriginalFilename();
			if(originalName != null) {//÷�ο���
				fileName = UploadFileUtil.fileUpload(imgUploadPath, mfile.getOriginalFilename(), mfile.getBytes(),count,photoVo);
			}else {
				fileName = upload+"fail/";
			}
			//���� ������ �̸� ����
			String photoCtg2 = "";
			String photoPath2 = null;//db�ֱ��
			if(count==0) {
				System.out.println("��� �̸�"+fileName);
				photoCtg2 = "thumbnail";
				photoPath2 = imgUploadPath2 +fileName;
			}else if(count==1) {
				System.out.println("������ �̸�"+fileName);
				photoCtg2 = "detail";
				photoPath2 = imgUploadPath2 +fileName;
			}
			photoVo.setPhotoCtg2(photoCtg2);
			photoVo.setPhotoPath(photoPath2);//db����¥�ֱ�
			photoVo.setPhotoName(fileName);
			photoVo.setOriginalName(originalName);
			sqlResult=photoDao.insertEventPhoto(photoVo);//db�� ������
			if (mfile.getOriginalFilename()=="") {
				sqlResult=eventDao.insertEvent(eventVo);//�ߺ��̸��̸� �ڷḸ �ֱ�
				logger.info("�ߺ�mate>>>>>>>>>>:"+eventDao.insertEvent(eventVo));
			}
			
		}		
		
		return sqlResult;
	}

	@Override
	public List<EventVo> selectEventOne(Model model, PhotoVo photoVo, int eventnum) {
		List<EventVo> list = eventDao.selectEventOne(eventnum);
		return list;
	}

	@Override
	public int updateEvent(int eventnum, EventVo eventVo, PhotoVo photoVo, MultipartHttpServletRequest multi) throws Exception {
		int sqlResult=0;
		int num = eventDao.selectEventOne(eventnum).get(0).getEventnum();
		int pnum1 = eventDao.selectEventOne(eventnum).get(0).getPhotoNum();
		int pnum2 = eventDao.selectEventOne(eventnum).get(1).getPhotoNum();
		System.out.println(pnum1);
		System.out.println(pnum2);
		String BaName = eventDao.selectEventOne(eventnum).get(0).getPhotoName();
		String BaOriginal = eventDao.selectEventOne(eventnum).get(0).getOriginalName();
		String ConName = eventDao.selectEventOne(eventnum).get(1).getPhotoName();
		String ConOriginal = eventDao.selectEventOne(eventnum).get(1).getOriginalName();
		
		
		photoVo.setP_eventNum(num);
		
		String upload = servletContext.getRealPath("/resources/event/");
		String imgUploadPath = upload;
		String imgUploadPath2 = "/resources/event/";
		String fileName = null;
		String fileName2 = null;
		String photoCtg2=null;
		Iterator<String> files = multi.getFileNames();
		int i=0;
		while(files.hasNext()) {
			String uplaodFile  = files.next();
			MultipartFile mfile = multi.getFile(uplaodFile);
			String originalName = mfile.getOriginalFilename();			
			if(originalName !="") {
				System.out.println("���������̸�====>"+originalName);
				String photoPath = null;
				
				if(mfile != null) {
					fileName = UploadFileUtil.fileUpload(imgUploadPath, originalName, mfile.getBytes(), i,photoVo);
				}else {
					fileName2=upload+"none.png";
					System.out.println("���������̸�����");
				}
				if(i==0) {
					photoVo.setPhotoNum(pnum1);
					photoCtg2="thumbnail";
					System.out.println("��� ���̸�===>"+fileName);
					photoPath = imgUploadPath2 + fileName;
					if(BaOriginal==originalName) {
						photoVo.setPhotoName(BaName);
					}else {
						photoVo.setPhotoName(fileName);
						File file = new File(upload+BaName);
						if(file.exists()) {
							if(file.delete()) {
								System.out.println("======> ����̹��� ��������");
							}else {
								System.out.println("=======> ����̹��� ���� ����");
							}
						}else {
							System.out.println("+++++++++��ʰ� �����ϴ�.");
						}
					}
				}else if(i==1) {
					photoVo.setPhotoNum(pnum2);
					photoCtg2="detail";
					System.out.println("�����̹��� ���̸�==>"+fileName);
					photoPath = imgUploadPath2 + fileName;
					if(ConOriginal==originalName) {
						photoVo.setPhotoName(ConName);
					}else {
						File file = new File(upload+ConName);
						if(file.exists()) {
							if(file.delete()) {
								System.out.println("====>�����̹������� ����");
							}else {
								System.out.println("====>�����̹��� ���� ����");
							}
						}else {
							System.out.println("+++++ �����̹����� �����ϴ�");
						}
						photoVo.setPhotoName(fileName);
					}
				}
				photoVo.setPhotoCtg2(photoCtg2);
				photoVo.setPhotoPath(photoPath);
				photoVo.setOriginalName(originalName);
				sqlResult= photoDao.updateEventPhoto(photoVo);
				
			}else if(originalName =="" && i==0) {
				sqlResult = eventDao.updateEvent(eventVo);
			}
			i++;
		}
		return sqlResult;
	}

	@Override
	public int deleteEventPhoto(int eventnum) {
		int sqlresult = eventDao.deleteEventPhoto(eventnum);//��������
		return sqlresult;
	}
	
	@Override
	public int deleteEvent(int eventnum) {
		return eventDao.deleteEvent(eventnum);
	}
	
	@Override
	public int selectEventCnt() {
		return eventDao.selectEventCnt();
	}
	
}
