package com.bit.pro.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

import com.bit.pro.dao.MateDao;
import com.bit.pro.dao.PhotoDao;
import com.bit.pro.util.UploadFileUtil2;
import com.bit.pro.util.pagination;
import com.bit.pro.vo.MateVo;
import com.bit.pro.vo.PhotoVo;

@Service("MateService")
public class MateServiceImpl implements MateService{
	private static final Logger logger= LoggerFactory.getLogger(MateServiceImpl.class);
	
	@Inject
	private MateDao mateDao;
	
	//추가
	@Resource(name="photoDao")
	private PhotoDao photoDao;
	
	@Override
	public List<MateVo> selectMateCtgP(pagination pagination, PhotoVo photoVo,Model model) throws Exception{
		List<MateVo> pagelist = new ArrayList<MateVo>();
		pagelist =mateDao.selectMateCtgP(pagination);
		
		return pagelist;
	}
	
	@Override
	public List<MateVo> selectMateSaleP(pagination pagination, PhotoVo photoVo, Model model) throws Exception{
		List<MateVo> pagelist2 = new ArrayList<MateVo>();
		pagelist2 = mateDao.selectMateSaleP(pagination);
		return pagelist2;
	}	
	
	@Autowired
	ServletContext servletContext;
		
	@Override
	public int insertMate(MateVo mateVo, PhotoVo photoVo, MultipartHttpServletRequest multi) throws IOException, Exception {
		String upload = servletContext.getRealPath("/resources/ingredientnum/");
		String imgUploadPath = upload; //서버저장
		String imgUploadPath2 = "/resources/ingredientnum/"; //DB저장
		int sqlResult=0;
		int count=0;
		sqlResult = mateDao.insertMate(mateVo);	//자료넣고
		//파일들을 열로 가져옴[] []
		Iterator<String> files = multi.getFileNames();
		for(count = 0; count<2;count++) {//두개만 돌릴것 반복문을 통해 열 풀기
			String uploadFile = files.next();
			MultipartFile mfile = multi.getFile(uploadFile);
			String fileName = null;
			String originalName = mfile.getOriginalFilename();
			if(originalName != null) {//첨부여부
				fileName = UploadFileUtil2.fileUpload(imgUploadPath, mfile.getOriginalFilename(), mfile.getBytes(),count);
			}else {
				fileName = upload+"fail/";
			}
			//파일 있으면 이름 생성
			String photoCtg2 = "";
			String photoPath2 = null;//db넣기용
			if(count==0) {
				System.out.println("썸네일 이름"+fileName);
				photoCtg2 = "thnumbnail";
			}else if(count==1) {
				System.out.println("디테일 이름"+fileName);
				photoCtg2 = "detail";
			}
			photoPath2 = imgUploadPath2 +fileName;
			photoVo.setPhotoCtg2(photoCtg2);
			photoVo.setPhotoPath(photoPath2);//db엔가짜넣기
			photoVo.setPhotoName(fileName);
			photoVo.setOriginalName(mfile.getOriginalFilename());
			sqlResult=photoDao.insertMatePhoto(photoVo);//db에 사진만	
			if (mfile.getOriginalFilename()=="") {
				sqlResult=mateDao.insertMate(mateVo);//중복이름이면 자료만 넣기
				logger.info("중복mate>>>>>>>>>>:"+mateDao.insertMate(mateVo));
			}
		}		
		return sqlResult;
	}

	@Override
	public List<MateVo> selectMateOne(int matenum, PhotoVo photoVo, Model model){
		List<MateVo> list = mateDao.selectMateOne(matenum);
		System.out.println("list>>>>"+list);
		return list;
	}
	
	@Override
	public int updateMate(int matenum, MateVo mateVo, PhotoVo photoVo, MultipartHttpServletRequest multi) throws Exception {
		int sqlResult=0;
		int num = mateDao.selectMateOne(matenum).get(0).getMatenum();//게시글 번호
		int pnum1= mateDao.selectMateOne(matenum).get(0).getPhotoNum();
		int pnum2 = mateDao.selectMateOne(matenum).get(1).getPhotoNum();
		String pnameTh = mateDao.selectMateOne(matenum).get(0).getPhotoName();
		String pnameDe = mateDao.selectMateOne(matenum).get(1).getPhotoName();
		
		photoVo.setP_ingredientNum(num);
		
		String upload = servletContext.getRealPath("/resources/ingredientnum/");
		String imgUploadPath = upload;
		String imgUploadPath2 = "/resources/ingredientnum/";//DB용!
		String fileName = null;
		String fileName2 = null;
		
		
	Iterator<String> files = multi.getFileNames();
	int i=0;
	while(files.hasNext()) {
		String uploadFile = files.next();
		
		MultipartFile mfile = multi.getFile(uploadFile);
		String originalName= mfile.getOriginalFilename();
		
		System.out.println("오리지널이름===>"+originalName);
		
		if(originalName != "") {	
			String photoPath = null;
			String photoCtg2 = null;
			
			if(mfile != null) {
				fileName = UploadFileUtil2.fileUpload(imgUploadPath, originalName, mfile.getBytes(), i);
			}else {
				fileName2 = upload+"_none.png";
				System.out.println("오리지널이름없어==>"+fileName2);
			}
			if(i==0) {
				photoVo.setPhotoNum(pnum1);
				photoCtg2 = "thnumbnail";
				photoVo.setPhotoCtg2(photoCtg2);
				System.out.println("썸네일 새 이름==>"+fileName);
				photoPath = imgUploadPath2 +fileName;
				File file = new File(upload+pnameTh);
				if(file.exists()) {
					//파일 있으면 다음 진행
					if(file.delete()) {
						System.out.println("=========> 썸파일 삭제 성공");
					}else {
						System.out.println("=========> 썸파일 삭제 실패");
					}
				}else {
					System.out.println("++++++ 썸네일 파일이 없습니다 ++++++");
				}
			}else if(i==1) {
				photoVo.setPhotoNum(pnum2);
				photoCtg2 = "detail";
				photoVo.setPhotoCtg2(photoCtg2);
				System.out.println("디테일 새 이름==>"+fileName);
				photoPath = imgUploadPath2 +fileName;
				File file = new File(upload+pnameDe);
				if(file.exists()) {
					//파일 있으면 다음 진행
					if(file.delete()) {
						System.out.println("=========> 디파일 삭제 성공");
					}else {
						System.out.println("=========> 디파일 삭제 실패");
					}
				}else {
					System.out.println("++++++ 디테일 파일이 없습니다 ++++++");
				}
			}
			photoVo.setPhotoName(fileName);
			photoVo.setPhotoPath(photoPath);
			photoVo.setOriginalName(originalName);
			sqlResult = photoDao.updateMatePhoto(photoVo);//사진업뎃
		}else if( originalName =="" && i==0) {
			sqlResult = mateDao.updateMate(mateVo);
		}
			i++;
	}
	return sqlResult;
	}
	

	@Override
	public int deleteMatePhoto(int matenum)  {
		return mateDao.deleteMatePhoto(matenum);
	}
	@Override
	public int deleteMate(int matenum) {
		return mateDao.deleteMate(matenum);
	}
	
	@Override
	public int selectMateAllCnt(MateVo mateVo, String matectg) {
		return mateDao.selectMateAllCnt(matectg);
	}
	@Override
	public int selectMateSaleCnt(MateVo mateVo, int salestatus) {
		return mateDao.selectMateSaleCnt(salestatus);
	}
	
	/******************* 미현시작 *****************************/
	//custom select list
	@Override
	public List<MateVo> customSelectThnumb() throws Exception {
		return mateDao.customSelectThnumb();
	}
	@Override
	public MateVo customSelectDetail(int matenum) throws Exception {
		return mateDao.customSelectDetail(matenum);
	}
	/******************* 미현끝 *****************************/

		
}
