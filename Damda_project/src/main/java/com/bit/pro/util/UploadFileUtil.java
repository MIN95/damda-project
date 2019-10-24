package com.bit.pro.util;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

import com.bit.pro.controller.ItemController;
import com.bit.pro.vo.PhotoVo;

//사진 저장하는 폴더생성 및 사진 삽입
public class UploadFileUtil {
	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtil.class);
  
	 public static String fileUpload(String uploadPath,String fileName,byte[] fileData,int count,PhotoVo photoVo) throws Exception {
		 //랜덤이름 생성 DB컬럼이름 photoName
		 String photoCtg = photoVo.getPhotoCtg();
		 UUID uid = UUID.randomUUID();
		 String newFileName = null;
		 
		 if(photoCtg.equals("salad")||photoCtg.equals("dessert")||photoCtg.equals("beverage")) {
			 if(count==0) {
				 newFileName = "s_" +uid + "_" + fileName;
			 }else {
				 newFileName = "d_" +uid + "_" + fileName;
			 }		 
		 }else if(photoCtg.equals("qna")) {
			 newFileName = "qna_" +uid + "_" + fileName;
		 }else {
			 newFileName = "pic_" +uid + "_" + fileName;
		 }
		 
		 String imgPath = uploadPath;
		 
		 File dirPath = new File(uploadPath);
		 if (!dirPath.exists()) {
			 dirPath.mkdirs();
		 }
		 
	  	File target = new File(imgPath, newFileName);
	  	FileCopyUtils.copy(fileData, target);
	  	File image = new File(imgPath + File.separator + newFileName);
	  	
		return newFileName;
		  
	 }
}
