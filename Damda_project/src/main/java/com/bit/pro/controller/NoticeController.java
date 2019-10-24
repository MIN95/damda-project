package com.bit.pro.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.pro.service.NoticeService;
import com.bit.pro.vo.NoticePager;
import com.bit.pro.vo.NoticeVo;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	String dir = "notice";
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Resource
	private NoticeService noticeService;
	
	//���ε� ���
	@Autowired ServletContext servletContext;
	
	//notice list + paging
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView notice(@RequestParam(defaultValue = "1") int curPage, Model model) throws SQLException {
		//���ڵ��� ���� ���
		int count = noticeService.countArticle();
		
		//������ ������ ���� ó��
		int limit = 10;
		NoticePager noticePager = new NoticePager(count, curPage, limit);
		
		int nowPage = (curPage-1) * 10;
		int scale = 10;
	
		List<NoticeVo> noticeList = noticeService.selectNotice(nowPage,scale);
		
		//�����͸� �ʿ� ����
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeList",noticeList);	//list
		map.put("count", count);	//���ڵ� ����
		map.put("noticePager", noticePager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);	//�ʿ� ����� �����͸� mav�� ����
		mav.setViewName(dir+"/notice_list"); //view�� notice_list�� ����
		
		return mav;
	}
	
	/*************************************************************************************/
	//notice detail
	@RequestMapping(value = "/detail/{idx}", method = RequestMethod.GET)
	public String noticeDetail(@PathVariable("idx") int bbsnum,Model model) throws SQLException {
		//����� 
		NoticeVo noticeDetail = noticeService.detailNotice(bbsnum);
		//photo detail
		int bbsseq=0;
		List<NoticeVo> noticePhotoDetail = noticeService.photoDetail(bbsseq, bbsnum);
		//view update
		bbsseq = noticeDetail.getBbsseq();
		noticeService.viewCount(bbsseq);
		//prev ����
		int prevbbsseq = noticeDetail.getBbsnum() - 1; 
		NoticeVo noticePrevDetail = noticeService.detailPrevNotice(prevbbsseq); 
		//���� �� ���� 
		int nextbbsseq = noticeDetail.getBbsnum() + 1; 
		NoticeVo noticeNextDetail = noticeService.detailNextNotice(nextbbsseq); 
		
		//model ���
		model.addAttribute("noticeDetail", noticeDetail);
		model.addAttribute("noticePhotoDetail", noticePhotoDetail);
		model.addAttribute("noticePrevDetail", noticePrevDetail);
		model.addAttribute("noticeNextDetail", noticeNextDetail);
		
		return dir+"/notice_detail"; 
	}

	/*************************************************************************************/
	@RequestMapping("/download/{filename:.+}")
	public String download(@PathVariable String filename,HttpServletResponse resp) {
		//���Ͼ��ε� ���
		String upload = servletContext.getRealPath("/resources/notice/");
		File file = new File(upload+filename);
		OutputStream os = null;
		InputStream is = null;
		
		try {
			os=resp.getOutputStream();
			is=new FileInputStream(file);
			int temp=0;
			while((temp=is.read())!=-1) {
				os.write(temp);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally { 
			try {
				if(os!=null)os.close(); 
				if(is!=null)is.close(); 
			} catch (IOException e) {
				e.printStackTrace(); 
			} 
		}
		
		return "redirect:/notice/"; 
	}
	
	/*************************************************************************************/
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String noticeInsert() {
		return dir+"/notice_insert";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String noticeAdd(@ModelAttribute NoticeVo noticeVo,@RequestParam(value = "fileImgInput", required = false) MultipartFile fileImgInput,@RequestParam(value = "fileWriteInput", required = false) MultipartFile fileWriteInput,HttpServletResponse resp) throws SQLException, IOException {
		//���,���� sql��
		noticeService.addNotice(noticeVo);
		//timestamp
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyyMMddhhmmss");
		Calendar cal = Calendar.getInstance();
		String today = formatter.format(cal.getTime());
		//���Ͼ��ε� ���
		String upload = servletContext.getRealPath("/resources/notice/");
		//���� �����
		String floderPath = servletContext.getRealPath("/resources/notice");
		File Folder = new File(floderPath);
		//�ش� ���丮 ���� ��� ����
		if(!Folder.exists()) {
			try {
				Folder.mkdir();
			}catch(Exception e) {
				e.getStackTrace();
			}
		}
		//���� ���� �̸�
		String originalPhotoName = fileImgInput.getOriginalFilename();
		//�� ���� �̸�
		String originalWriteName = fileWriteInput.getOriginalFilename();
		//���� ���ε� ����
		if(originalPhotoName != "") {
			//���� ���� �̸�
			String realname = originalPhotoName.substring(0,originalPhotoName.lastIndexOf("."));
			String nameEx = originalPhotoName.substring(originalPhotoName.lastIndexOf("."));
			String photoName = realname+"__"+today+nameEx;
			//���� ���ε�
			File file = new File(upload + photoName);
			try {
				fileImgInput.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			String photoPath = "/resources/notice/"+photoName;
			
			//Map�� ���
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("photoName", photoName);
			map.put("originalName", originalPhotoName);
			map.put("photoPath", photoPath);
			map.put("p_noticenum", noticeVo.getBbsseq());
			
			//service�� ������
			noticeService.upload(map);
		}
		
		if(originalWriteName != "") {
			//�� ���� �̸�
			String realname = originalWriteName.substring(0,originalWriteName.lastIndexOf("."));
			String nameEx = originalWriteName.substring(originalWriteName.lastIndexOf("."));
			String photoName = realname+"__"+today+nameEx;
			//���� ���ε�
			File file = new File(upload + photoName);
			
			try {
				fileWriteInput.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			String photoPath = "/resources/notice/" + photoName;
			
			//Map�� ���
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("photoName", photoName);
			map.put("originalName", originalWriteName);
			map.put("photoPath", photoPath);
			map.put("p_noticenum", noticeVo.getBbsseq());
			
			//service�� ������
			noticeService.upload(map);
		}
		
		return "redirect:/notice/";
	}
	
	/*************************************************************************************/
	//ajax delete
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public  String noticeDeleteAjax(@RequestParam(value="delSeqNo") List<String> delSeqNo,Model model) throws SQLException {
		//���ε� �� ���� ����
		String delfile = servletContext.getRealPath("/resources/notice/");
		int bbsnum=0;
		int bbsseq=0;
		for(String i : delSeqNo) {
			bbsseq = Integer.parseInt(i);
			//�̸�������
			List<NoticeVo> noticePhotoDetail = noticeService.photoDetail(bbsseq,bbsnum);
			//���ϻ���
			if(!noticePhotoDetail.isEmpty()) {
				String listPhotoname = "";
				String photoname = "";
				//�ݺ����� ���� photoname ������
				for(int j=0; j<noticePhotoDetail.size(); j++) {
					listPhotoname = noticePhotoDetail.get(j).getPhotoname();
					photoname += ","+listPhotoname;
				}
				String photos = photoname.substring(1);
				String photocnt[] = photos.split(",");
				//
				String photoName = "";
				String writeName = "";
				if(photocnt.length > 1) {
					photoName = photos.substring(0,photos.lastIndexOf(","));
					writeName = photos.substring(photos.lastIndexOf(",")+1);
					File file2 = new File(delfile+writeName);
					if(file2.exists()==true) {
						file2.delete();
					}
				}else {
					photoName = photos;	
				}
				File file = new File(delfile+photoName);
				if(file.exists()==true) {
					file.delete();
				}
			}
			//photoFk all del
			int delFkOk = noticeService.deleteAllPhotoNotice(bbsseq);
			//noitce del
			int delNoticeOk = noticeService.deleteNotice(bbsseq);
			//���� ���� �� ���� �޼���
		}
		String result="OK";
		return result;
	}
	//delete
	@RequestMapping(value = "/delete/{idx}", method = RequestMethod.GET)
	public String noticeDelete(@PathVariable("idx") int bbsseq) throws SQLException {
		//���ε� �� ���� ����
		String delfile = servletContext.getRealPath("/resources/notice/");
		//�̸� ������
		int bbsnum=0;
		List<NoticeVo> noticePhotoDetail = noticeService.photoDetail(bbsseq,bbsnum);
		//���� ����
		if(!noticePhotoDetail.isEmpty()) {
			String listPhotoname = "";
			String photoname = "";
			//�ݺ����� ���� photoname ������
			for(int j=0; j<noticePhotoDetail.size(); j++) {
				listPhotoname = noticePhotoDetail.get(j).getPhotoname();
				photoname += ","+listPhotoname;
			}
			String photos = photoname.substring(1);
			String photocnt[] = photos.split(",");
			//
			String photoName = "";
			String writeName = "";
			if(photocnt.length > 1) {
				photoName = photos.substring(0,photos.lastIndexOf(","));
				writeName = photos.substring(photos.lastIndexOf(",")+1);
				File file2 = new File(delfile+writeName);
				if(file2.exists()==true) {
					file2.delete();
				}
			}else {
				photoName = photos;	
			}
			File file = new File(delfile+photoName);
			if(file.exists()==true) {
				file.delete();
			}
		}
		//photoFk all del
		int delFkOk = noticeService.deleteAllPhotoNotice(bbsseq);
		//noitce del
		int delNoticeOk = noticeService.deleteNotice(bbsseq);
		//���� ���� �� ���� �޼���
		return "redirect:/notice/";
	}
	
	/*************************************************************************************/
	@RequestMapping(value = "/update/{idx}", method = RequestMethod.GET)
	public String noticeUpdateGet(@PathVariable("idx") int bbsnum, Model model) throws SQLException {
		NoticeVo noticeUpdate = noticeService.detailNotice(bbsnum);
		//photo detail
		int bbsseq=0;
		List<NoticeVo> noticePhotoDetail = noticeService.photoDetail(bbsseq, bbsnum);
		model.addAttribute("noticePhotoDetail", noticePhotoDetail);
		model.addAttribute("noticeUpdate", noticeUpdate);
		
		return dir+"/notice_insert";
	}
	
	@RequestMapping(value = "/update/{idx}", method = RequestMethod.POST)
	public String noticeUpdatePost(String kang, @ModelAttribute NoticeVo noticeVo, @PathVariable("idx") int bbsseq, @RequestParam(value = "fileImgInput") MultipartFile fileImgInput, @RequestParam(value = "fileWriteInput") MultipartFile fileWriteInput,String cloneuserwritefile,String cloneuserfile) throws SQLException, IllegalStateException, IOException {
		/****************************���� �����*****************************************/
		//���Ͼ��ε� ���
		String upload = servletContext.getRealPath("/resources/notice/");
		//���� �����
		String floderPath = servletContext.getRealPath("/resources/notice");
		File Folder = new File(floderPath);
		//�ش� ���丮 ���� ��� ����
		if(!Folder.exists()) {
			try {
				Folder.mkdir();
			}catch(Exception e) {
				e.getStackTrace();
			}
		}
		/********************************************************************************/
		//����,�� ���� �̸�
		String originalPhotoName = fileImgInput.getOriginalFilename();
		String originalWriteName = fileWriteInput.getOriginalFilename();
		//timestamp
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyyMMddhhmmss");
		Calendar cal = Calendar.getInstance();
		String today = formatter.format(cal.getTime());
		/****************************���� ����*****************************************/
		int bbsnum=0;
		List<NoticeVo> noticePhotoDetail = noticeService.photoDetail(bbsseq,bbsnum);
		if(!noticePhotoDetail.isEmpty()) {
			//�̸�������
			String photoname = "";
			String writename = "";
			//photoname ������
			if(noticePhotoDetail.size()==1) {
				String names =  noticePhotoDetail.get(0).getPhotoname();
				String exNames = names.substring(names.lastIndexOf("."));
				if((".jpg").equals(exNames) || (".png").equals(exNames)) {
					photoname = noticePhotoDetail.get(0).getPhotoname();
				}else {
					writename = noticePhotoDetail.get(0).getPhotoname();
				}
			}else if(noticePhotoDetail.size()==2) {
				String names = noticePhotoDetail.get(0).getPhotoname();
				String exNames = names.substring(names.lastIndexOf("."));
				if((".jpg").equals(exNames) || (".png").equals(exNames)) {
					photoname =  noticePhotoDetail.get(0).getPhotoname();
					writename =  noticePhotoDetail.get(1).getPhotoname();
				}else {
					photoname =  noticePhotoDetail.get(1).getPhotoname();
					writename =  noticePhotoDetail.get(0).getPhotoname();
				}
			}

			/**********************�������� ���ϻ���*************************/
			if((cloneuserfile).equals("")) {
				//���� ����
				File photoFile = new File(upload+photoname);
				if(photoFile.exists()==true) {
					photoFile.delete();
				}
				//�ش��ϴ� �������̺� db ���� (�̸���ġ��)
				String dbPhotoname = photoname;
				int delFkOk = noticeService.deleteNamePhotoNotice(dbPhotoname);
			}
			if((cloneuserwritefile).equals("")) {
				//���� ����
				File writeFile = new File(upload+writename);
				if(writeFile.exists()==true) {
					writeFile.delete();
				}
				//�ش��ϴ� �������̺� db ���� (�̸���ġ��)
				String dbPhotoname = writename;
				int delFkOk = noticeService.deleteNamePhotoNotice(dbPhotoname);
			}
			if(originalPhotoName != "") {
				//���� ����
				File photoFile = new File(upload+photoname);
				if(photoFile.exists()==true) {
					photoFile.delete();
				}
				//�ش��ϴ� �������̺� db ���� (�̸���ġ��)
				String dbPhotoname = photoname;
				int delFkOk = noticeService.deleteNamePhotoNotice(dbPhotoname);
			}
			if(originalWriteName != "")  {
				//���� ����
				File writeFile = new File(upload+writename);
				if(writeFile.exists()==true) {
					writeFile.delete();
				}
				//�ش��ϴ� �������̺� db ���� (�̸���ġ��)
				String dbPhotoname = writename;
				int delFkOk = noticeService.deleteNamePhotoNotice(dbPhotoname);
			}
		}
		/****************************���� �Է�*****************************************/
		//���� ���ε� ����
		String realphotoname = "";
		String photonameEx = "";
		String photoName = "";
		String realwritename = "";
		String wrtienameEx = "";
		String writeName = "";
		File photoFile = null;
		File writeFile = null;
		
		//�����̸�
		if(originalPhotoName != "") {
			realphotoname = originalPhotoName.substring(0,originalPhotoName.lastIndexOf("."));
			photonameEx = originalPhotoName.substring(originalPhotoName.lastIndexOf("."));
			photoName = realphotoname+"__"+today+photonameEx;
			//���ε�
			photoFile = new File(upload + photoName);
			fileImgInput.transferTo(photoFile);
			//db�� ����� ���
			String photoPath = "/resources/notice/"+photoName;
			//photo Map�� ���
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("photoName", photoName);
			map.put("originalName", originalPhotoName);
			map.put("photoPath", photoPath);
			map.put("p_noticenum", noticeVo.getBbsseq());
			//photo insert
			noticeService.updateNoticePhoto(map);
		}
		//�� �̸�
		if(originalWriteName != "") {
			realwritename = originalWriteName.substring(0,originalWriteName.lastIndexOf("."));
			wrtienameEx = originalWriteName.substring(originalWriteName.lastIndexOf("."));
			writeName = realwritename+"__"+today+wrtienameEx;
			writeFile = new File(upload + writeName);
			fileWriteInput.transferTo(writeFile);
			//db�� ����� ���
			String writePath = "/resources/notice/"+writeName;
			//write Map�� ���
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("photoName", writeName);
			map.put("originalName", originalWriteName);
			map.put("photoPath", writePath);
			map.put("p_noticenum", noticeVo.getBbsseq());
			//write insert
			noticeService.updateNoticePhoto(map);
		}
		//noticeVo update
		noticeService.updateNotice(noticeVo);
		
		return "redirect:/notice/";
	}
	
	/*************************************************************************************/
	//faq
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faq() {
		return dir+"/faq";
	}
}