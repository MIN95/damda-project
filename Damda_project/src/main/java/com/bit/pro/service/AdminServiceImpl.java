package com.bit.pro.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.bit.pro.dao.ItemDao;
import com.bit.pro.dao.LoginDao;
import com.bit.pro.dao.PhotoDao;
import com.bit.pro.util.Criteria;
import com.bit.pro.util.PageMaker;
import com.bit.pro.util.UploadFileUtil;
import com.bit.pro.vo.AllItemVo;
import com.bit.pro.vo.LoginVo;
import com.bit.pro.vo.PhotoVo;


@Service("adminService")
public class AdminServiceImpl implements AdminService {
   
   private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);

   @Resource(name="photoDao")
   private PhotoDao photoDao;
   
   @Resource(name="itemDao")
   private ItemDao itemDao;
   
   @Resource(name="loginDao")
   private LoginDao loginDao;
   
   @Autowired 
   ServletContext servletContext;
   
   @Transactional
   @Override
   public int insertAllitem(AllItemVo allitemVo, PhotoVo photoVo, MultipartHttpServletRequest multi) throws Exception {
      //다중업로드,이미지카테고리(photoCtg)값따라 사진이 들어가는 폴더가 다르게하기(salad,dessert,beverage,ingredient)
      int category   = 0;
      String photoCtg = photoVo.getPhotoCtg();
      if(photoCtg.equals("salad")) {
         category = 1;
      }else if(photoCtg.equals("dessert")) {
         category = 2;
      }else if(photoCtg.equals("beverage")) {
         category = 3; 
      }
      String uploadPath = servletContext.getRealPath("/resources/imgs");
      String imgUploadPath = uploadPath + File.separator + photoCtg + File.separator;
   
      //다중업로드한 파일 순서대로 하나씩 뽑아내서 폴더에 생성
      int count = 0;
      int sqlResult = 0;
      int lastId = 0;
      Iterator<String> files = multi.getFileNames();
      while(files.hasNext()) {
         String uploadFile = files.next();

         MultipartFile mFile = multi.getFile(uploadFile);
         String originalName  = mFile.getOriginalFilename();

         if(originalName!=""&& originalName!=null) {
            //UploadFileUtil클래스의 fileUpload메소드를 통해 파일을 저장할 폴더를 생성하고 사진을 저장
            //썸네일은 이미지 이름앞에 's_'가 붙고 디테일은 'd_'가 붙는다
            String fileName = null;
            String photoCtg2 = null;
            String photoPath = null;
            
            if(mFile != null) {
             fileName =  UploadFileUtil.fileUpload(imgUploadPath, mFile.getOriginalFilename(), mFile.getBytes(),count,photoVo); 
            } else {
             fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
            }           
            
            if(count==0){
               photoCtg2 = "thumbnail";
               photoPath = imgUploadPath + fileName;
               allitemVo.setCategory(category);
               sqlResult = itemDao.insertItem(allitemVo);
               
            }else {
               photoCtg2 = "detail";
               photoPath = imgUploadPath + fileName;   
            } 
            //photoVo에 파라미터 set
            photoVo.setPhotoCtg2(photoCtg2);
            photoVo.setPhotoCtg(photoCtg);
            photoVo.setPhotoPath(photoPath);
            photoVo.setPhotoName(fileName);
            photoVo.setOriginalName(originalName);
            //DB에 데이터 넣기(사진만 max개까지 넣기)            
            sqlResult = photoDao.insertPhoto(photoVo); 
         }else if (originalName==""&& count==0) {
            allitemVo.setCategory(category);
            sqlResult = itemDao.insertItem(allitemVo);
         }
         lastId = allitemVo.getItemNum();
         count++;
      }
      if(sqlResult==1) {
    	  return lastId;    	  
      }else {
    	  return sqlResult;
      }
   }
   
   //아이템 수정페이지로 해당 아이템의 정보를 가져옴
   @Override
   public Model selectOne(int no, Model model) throws Exception {
      AllItemVo bean = new AllItemVo();
      bean.setItemNum(no);
      //아이템 정보
      AllItemVo list = itemDao.selectOne(bean);
      model.addAttribute("List", list);
      System.out.println(list.getPhotoCtg());
      return model;
   }
   @Override
   public Model selectOne_detailImg(int no, Model model) throws Exception {
      AllItemVo bean = new AllItemVo();
      bean.setItemNum(no);
      //디테일 이미지
      List<AllItemVo> imglist = itemDao.selectOne_detailImg(bean);
      model.addAttribute("imgList", imglist);
      return model;
   }
   
   @Transactional
   @Override
   public int itemUpdateSave(ArrayList<String> photoPathList, ArrayList<String> photoNameList
		   						,ArrayList<String> photoStatusList,AllItemVo allitemVo
		   						,PhotoVo photoVo, MultipartHttpServletRequest multi) throws Exception {   
      //다중업로드한 파일 순서대로 하나씩 뽑아내서 폴더에 생성

      int count = 0;
      int sqlResult = 0;
      int category   = 0;
      String photoCtg = photoVo.getPhotoCtg();
      if(photoCtg.equals("salad")) {
         category = 1;
      }else if(photoCtg.equals("dessert")) {
        category = 2;
      }else if(photoCtg.equals("beverage")) {
         category = 3; 
      }
      allitemVo.setCategory(category);
      int p_itemNum = allitemVo.getItemNum();
      photoVo.setP_itemNum(p_itemNum);
      String photoCtg2 = null;
      String uploadPath = servletContext.getRealPath("/resources/imgs");
      String imgUploadPath = uploadPath + File.separator + photoCtg + File.separator;   
      String photoStatus = "";
      String existPhotoName = "";
      int existitemLength = photoVo.getExistPhotoLength();
      
      sqlResult = itemDao.updateItem(allitemVo);
      for(int imgCnt=0;imgCnt<=existitemLength;imgCnt++) {
    	  photoStatus = photoStatusList.get(imgCnt);
    	  if(photoStatus.equals("remove")) {
			if(imgCnt==0) {
			photoCtg2 = "thumbnail"; 
			}else {
			photoCtg2 = "detail"; 
			}
			existPhotoName = photoNameList.get(imgCnt);
			photoVo.setExistPhotoName(existPhotoName);
			photoVo.setPhotoCtg2(photoCtg2);
			new File(photoPathList.get(imgCnt)).delete();
			sqlResult=photoDao.deletePhoto(photoVo);
    	  }
      }
      
      // 기존 파일을 삭제     
      Iterator<String> files = multi.getFileNames();
      while(files.hasNext()) {
		 String uploadFile = files.next();
		 MultipartFile mFile = multi.getFile(uploadFile);
		 String originalName  = mFile.getOriginalFilename();         
		 String fileName = null;
		 String photoPath=null;
		 if(mFile != null) {
			 fileName =  UploadFileUtil.fileUpload(imgUploadPath, mFile.getOriginalFilename(), mFile.getBytes(),count,photoVo); 
		 } else {
			 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		 }           
		 photoPath = imgUploadPath + fileName;
		 photoVo.setPhotoPath(photoPath);
		 photoVo.setOriginalName(originalName);
		 photoVo.setPhotoName(fileName);
		 if(photoStatusList.get(0).equals("change") && count==0) {
			 photoCtg2 = "thumbnail";
			 photoVo.setPhotoCtg2(photoCtg2);
			 existPhotoName = photoNameList.get(count);
			 photoVo.setExistPhotoName(existPhotoName);
			 new File(photoPathList.get(count)).delete();
			 sqlResult=photoDao.deletePhoto(photoVo);
		 }else {
			 photoCtg2 = "detail";  
			 photoVo.setPhotoCtg2(photoCtg2);
		 }
		 sqlResult= photoDao.updateNewPhoto(photoVo); 
		 count++;
      }
      return sqlResult;
   }

	@Override
	public List<AllItemVo> selectProductAll() throws Exception {
		return itemDao.selectProductAll();		
	}

	@Override
	public List<AllItemVo> selectProduct(AllItemVo allitemVo) throws Exception {
		String selectVal = allitemVo.getSelectVal();
		List<AllItemVo> List = new ArrayList<AllItemVo>();
		if(selectVal.equals("salad")) {
			allitemVo.setCategory(1);
			List= itemDao. selectProduct(allitemVo);		
		}else if(selectVal.equals("dessert")) {
			allitemVo.setCategory(2);
			List= itemDao. selectProduct(allitemVo);	
		}else if(selectVal.equals("drink")) {
			allitemVo.setCategory(3);
			List= itemDao. selectProduct(allitemVo);
		}
		return List;
	}

	@Override
	public List<AllItemVo> selectProductBest() throws Exception {
		return itemDao.selectProductBest();
	}

	@Override
	public int deleteProduct(List<String> deleteList) throws Exception {//패스가져와서 폴더의 사진도 지우기
		int sqlResult = 0;
		for(String itemNum :deleteList ) {
			sqlResult=itemDao.deleteProduct(itemNum);
		}
		
		return sqlResult;
		
	}

	@Override
	public int selectAllCnt() throws Exception {
		return itemDao.selectAllCnt();
	}

	@Override
	public int selectProductCnt(AllItemVo bean) throws Exception {
		String selectVal = bean.getSelectVal();
		if(selectVal.equals("salad")) {
			bean.setCategory(1);	
		}else if(selectVal.equals("dessert")) {
			bean.setCategory(2);
		}else if(selectVal.equals("drink")) {
			bean.setCategory(3);
		}
		return itemDao.totalItem(bean);
	}
	
	@Override
	public List<AllItemVo> selectPagingList(Criteria cri,AllItemVo bean) throws Exception {
		List<AllItemVo> List = new ArrayList<AllItemVo>();
		String selectVal = cri.getSelectVal();

			bean.setStartpoint(cri.getPageStart());
			bean.setRow(cri.getPerPageNum());
			
			if(selectVal.equals("all")) {
				bean.setItemalign("itemnum");
				List = itemDao.selectPagingListAll(bean);
			}else if(selectVal.equals("salad")) {
				bean.setCategory(1); 
				List = itemDao.selectPagingList(bean);
			}else if(selectVal.equals("dessert")) {
				bean.setCategory(2);
				List = itemDao.selectPagingList(bean);
			}else if(selectVal.equals("drink")) {
				bean.setCategory(3);
				List = itemDao.selectPagingList(bean);
			}else if(selectVal.equals("best")) {
				bean.setItemalign("itemsales");
				List = itemDao.selectPagingListAll(bean);
			}

		return List;
	}
	//user manage(master,staff page)
	//select user list
	@Override
	public List<LoginVo> selectUserList(Criteria cri,LoginVo loginVo) throws Exception {
		int Category = loginVo.getCategory();
		String userGrade  = loginVo.getUserGrade();
		loginVo.setStartpoint(cri.getPageStart());
		loginVo.setRow(cri.getPerPageNum());
		
		if(Category==1) {
			return loginDao.selectUserListAll(loginVo);
		}else {
			if("all".equals(userGrade)) {
				return loginDao.selectUserListAll(loginVo);
			}else{
				
			} 	return loginDao.selectUserList(loginVo);
		}
		
	}
	//usermanage paging
	@Override
	public PageMaker selectUserBtn(Criteria cri, LoginVo loginVo) throws Exception {
		int Category = loginVo.getCategory();
		String userGrade  = loginVo.getUserGrade();
		int dataCnt = 0;
		if(Category==1) {
			dataCnt = loginDao.selectUserCntAll(Category);
		}else {
			if(userGrade.equals("all")) {
				dataCnt = loginDao.selectUserCntAll(Category);
			}else if(!userGrade.equals("all")){
			 	dataCnt = loginDao.selectUserCnt(userGrade);
			}
		} 
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dataCnt);
		return pageMaker;		
	}
	//delete user
	@Override
	public int deleteUserList(List<Integer> deleteList) throws Exception {
		int sqlResult = 0;
		for(int userNum :deleteList) {
			sqlResult=loginDao.deleteUserList(userNum);
	}
	return sqlResult;	
	}
}
      