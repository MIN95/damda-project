package com.bit.pro.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.pro.dao.PhotoDao;
import com.bit.pro.dao.ReviewDao;
import com.bit.pro.util.UploadFileUtil;
import com.bit.pro.vo.AllItemVo;
import com.bit.pro.vo.PhotoVo;
import com.bit.pro.vo.ReviewVo;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{

	private static final Logger logger = LoggerFactory.getLogger(ReviewServiceImpl.class);
	
	@Resource(name="reviewDao")
	private ReviewDao reviewDao;
	
	@Resource(name="photoDao")
	private PhotoDao photoDao;

    @Autowired 
    ServletContext servletContext;
	   
	//������ detail���� �������
	@Override
	public Model selectList(int no, int p, String align, Model model) throws Exception {
		ReviewVo bean = new ReviewVo();
		//�����ۺ� ���� �ҷ�����
		bean.setR_itemNum(no);
		
		//���� paging
		int totalCnt = reviewDao.reviewCount(bean);
		
		//���� ����
		String msg="";
		if(align.equals("reviewnew")) {
			msg="reviewnum desc";
		}else if(align.equals("reviewbest")) {
			msg="recommend desc";
		}
		bean.setItemalign(msg);
		
		
		int row = 10;//10�������̱�
		int totalpage = 0;
		if(totalCnt == 0) {
			totalpage = 0;
		}else {			
	        totalpage = totalCnt / row - 1;
	        if((totalCnt % row) > 0) totalpage++;
		}
        
        int startpoint = p * row;
        bean.setStartpoint(startpoint);
        bean.setRow(row);
        
        List<ReviewVo> reviewList = reviewDao.selectList(bean);
        model.addAttribute("URL", "/item/detail?no="+no);
		model.addAttribute("p", p);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("reviewalign", align);
		model.addAttribute("reviewList", reviewList);
		
		return model;
	}


	//������ detail���� ���� count
	@Override
	public Model reviewCount(int no, Model model) {
		ReviewVo bean = new ReviewVo();
		bean.setR_itemNum(no);
		model.addAttribute("reviewCount", reviewDao.reviewCount(bean));
		return model;
	}


	//���信�� item ���
	@Override
	public int insertItemReview(int userNum, int itemNum, String reviewCon, MultipartHttpServletRequest multi) throws IOException, Exception {
		int result = 0;
		
		PhotoVo bean2 = new PhotoVo();
		ReviewVo bean = new ReviewVo();
		bean.setR_userNum(userNum);
		bean.setR_itemNum(itemNum);
		bean.setReviewCon(reviewCon);
		System.out.println(bean.getR_userNum());
		System.out.println(bean.getR_itemNum());
		System.out.println(bean.getReviewCon());
		//������
		result = reviewDao.insertItemReview(bean);
		
		//����� ���䰪 ���ϱ�
		int recentReviewNum = reviewDao.maxReviewNum();
		System.out.println("photo table insert�� reviewNum: "+ recentReviewNum);
		
		String uploadPath = servletContext.getRealPath("/resources/imgs");
		System.out.println("uploadPath: "+uploadPath);
	    String imgUploadPath = uploadPath + File.separator + "review" + File.separator;
	    System.out.println("imgUploadPath: "+imgUploadPath);
	      
		Iterator<String> files = multi.getFileNames();
		while(files.hasNext()) {
			insertPhoto(files, multi, imgUploadPath, bean2, recentReviewNum);
		}
		
		return result;
	}

	//���信�� custom ���
	@Override
	public int insertCustomReview(int userNum, int customNum, String reviewCon,  MultipartHttpServletRequest multi) throws IOException, Exception {
		int result = 0;
		
		ReviewVo bean = new ReviewVo();
		PhotoVo bean2 = new PhotoVo();
		bean.setR_userNum(userNum);
		bean.setR_customNum(customNum);
		bean.setReviewCon(reviewCon);
		
		System.out.println("Multi: "+ multi);
		System.out.println("userNum: " + bean.getR_userNum());
		System.out.println("customNum: " + bean.getR_customNum());
		System.out.println("reviewCon: " + bean.getReviewCon());
		
		result = reviewDao.insertCustomReview(bean);
		
		//����� ���䰪 ���ϱ�
		int recentReviewNum = reviewDao.maxReviewNum();
		System.out.println("photo table insert�� reviewNum: "+ recentReviewNum);		
		
		String uploadPath = servletContext.getRealPath("/resources/imgs");
		System.out.println("uploadPath: "+uploadPath);
	    String imgUploadPath = uploadPath + File.separator + "review" + File.separator;
	    System.out.println("imgUploadPath: "+imgUploadPath);
	      
		Iterator<String> files = multi.getFileNames();
		while(files.hasNext()) {
		     insertPhoto(files, multi, imgUploadPath, bean2, recentReviewNum);
		}
		return result;
	}
	
	
	public void insertPhoto(Iterator<String> files, MultipartHttpServletRequest multi, String imgUploadPath, PhotoVo bean2, int recentReviewNum) throws IOException, Exception {
		 String uploadFile = files.next();
			
	     MultipartFile mFile = multi.getFile(uploadFile);
	     String originalName  = mFile.getOriginalFilename();
	
	     if(originalName!=""&& originalName!=null) {
	    	 //UploadFileUtilŬ������ fileUpload�޼ҵ带 ���� ������ ������ ������ �����ϰ� ������ ����
	    	 //������� �̹��� �̸��տ� 's_'�� �ٰ� �������� 'd_'�� �ٴ´�
	    	 String fileName = null;
	
			if(mFile != null) {
				fileName = fileUpload(imgUploadPath, mFile.getOriginalFilename(), mFile.getBytes());
				System.out.println("fileName: "+fileName);
			}
			bean2.setPhotoPath(imgUploadPath + fileName);
			bean2.setPhotoName(fileName);
			bean2.setOriginalName(originalName);
			bean2.setP_reviewNum(recentReviewNum);
			
			//����� ���䰪���� photo ���
			photoDao.reviewPhotoInsert(bean2);
	     }
	}
	
	
	public static String fileUpload(String uploadPath, String fileName, byte[] fileData) throws Exception {
		 //�����̸� ���� DB�÷��̸� photoName
		 UUID uid = UUID.randomUUID();
		 String newFileName = null;
		 
		newFileName = "review_" +uid + "_" + fileName;

		 
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

	//������������
	@Override
	public Model adminReviewItem(Model model,String select, int p) throws SQLException {
		ReviewVo bean = new ReviewVo();
		
		
		int row =25;
		
		bean.setItemType(1);
		int totalList = reviewDao.adminReviewCount(bean);
		System.out.println("totalList count: "+totalList);
		int totalpage = totalList / row - 1;
	    if((totalList % row) > 0) {
	    	totalpage++;
	    }
	    
	    int startpoint = p * row;
	    
	    System.out.println("p: "+p);
	    System.out.println("select: "+select);
	    System.out.println("startpoint: "+startpoint);
	    System.out.println("row: "+row);
	    //����
	    bean.setItemalign(select);
	    //����¡
	    bean.setStartpoint(startpoint);
	    //row����
	    bean.setRow(row);
		
	    List<ReviewVo> reviewList = reviewDao.adminReviewItem(bean);
		if(reviewList.size() == 0) {
			totalpage = 1;
		}
		
		model.addAttribute("p", p);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("reviewList", reviewList);
		return model;
	}


	@Override
	public Model adminReviewCustom(Model model, String select, int p) throws SQLException {
		ReviewVo bean = new ReviewVo();
		
		
		int row =25;
		
		bean.setItemType(2);
		int totalList = reviewDao.adminReviewCount(bean);
		System.out.println("totalList count: "+totalList);
		int totalpage = totalList / row - 1;
	    if((totalList % row) > 0) {
	    	totalpage++;
	    }
	    
	    int startpoint = p * row;
	    
	    System.out.println("p: "+p);
	    System.out.println("select: "+select);
	    System.out.println("startpoint: "+startpoint);
	    System.out.println("row: "+row);
	    //����
	    bean.setItemalign(select);
	    //����¡
	    bean.setStartpoint(startpoint);
	    //row����
	    bean.setRow(row);
		
	    List<ReviewVo> reviewList = reviewDao.adminReviewCustom(bean);
		if(reviewList.size() == 0) {
			totalpage = 1;
		}
		
		model.addAttribute("p", p);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("reviewList", reviewList);
		return model;
	}


	@Override
	public int deleteReview(int reviewNum) throws SQLException {
		ReviewVo reviewVo = new ReviewVo();
		reviewVo.setReviewNum(reviewNum);
		int result = reviewDao.deleteReview(reviewVo);

		PhotoVo photoVo = new PhotoVo();
		photoVo.setP_reviewNum(reviewNum);
		photoDao.deleteReview(photoVo);
		
		return result;
		
	}


	@Override
	public int bestCheck(int adminSelect, int reviewNum) throws SQLException {
		ReviewVo reviewVo = new ReviewVo();
		reviewVo.setReviewNum(reviewNum);
		reviewVo.setAdminSelect(adminSelect);
		
		return reviewDao.bestCheck(reviewVo);
	}


	@Override
	public Model bestReviewImg(Model model) throws SQLException {
		ReviewVo reviewVo = new ReviewVo();
		reviewVo.setStartpoint(0);
		reviewVo.setRow(30);
		List<ReviewVo> bestList = reviewDao.bestReviewImg(reviewVo);
		reviewVo.setStartpoint(0);
		reviewVo.setRow(10);
		List<ReviewVo> top10 = reviewDao.bestReviewImg(reviewVo);
		model.addAttribute("bestList", bestList);
		model.addAttribute("Top10", top10);
		return model;
	}


	@Override
	public Model customReview(Model model, String select, int p) throws SQLException {
		ReviewVo bean = new ReviewVo();
		
		
		int row =20;
		
		bean.setItemType(2);
		int totalList = reviewDao.adminReviewCount(bean);
		System.out.println("totalList count: "+totalList);
		int totalpage = totalList / row - 1;
	    if((totalList % row) > 0) {
	    	totalpage++;
	    }
	    
	    int startpoint = p * row;
	    
	    System.out.println("p: "+p);
	    System.out.println("select: "+select);
	    System.out.println("startpoint: "+startpoint);
	    System.out.println("row: "+row);
	    //����
	    bean.setItemalign(select);
	    //����¡
	    bean.setStartpoint(startpoint);
	    //row����
	    bean.setRow(row);
		
	    List<ReviewVo> reviewList = reviewDao.adminReviewCustom(bean);
		if(reviewList.size() == 0 || reviewList == null) {
			totalpage = 1;
		}
		
		model.addAttribute("p", p);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("reviewList", reviewList);
		return model;
	}


	@Override
	public int reviewView(int reviewNum) throws SQLException {
		ReviewVo bean = new ReviewVo();
		bean.setReviewNum(reviewNum);
		
		int result = reviewDao.reviewView(bean);
		
		return result;
	}
	
	/***************** ���� ���� **************************/ 
	//������̰� �ִ��� Ȯ��
	@Override
	public List<ReviewVo> mypagereview(String o_ordernum) throws Exception {
		return reviewDao.mypagereview(o_ordernum);
	}
	/***************** ���� �� **************************/ 

}
