package com.bit.pro.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bit.pro.service.AdminService;
import com.bit.pro.service.ItemService;
import com.bit.pro.service.MateService;
import com.bit.pro.service.ReviewService;
import com.bit.pro.util.Criteria;
import com.bit.pro.util.PageMaker;
import com.bit.pro.util.pagination;
import com.bit.pro.vo.AllItemVo;
import com.bit.pro.vo.LoginVo;
import com.bit.pro.vo.MateVo;
import com.bit.pro.vo.NoticePager;
import com.bit.pro.vo.OrderListVo;
import com.bit.pro.vo.PhotoVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Resource
	private MateService mateService;
	
	String dir = "admin";
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	/////////////////////////////////////////////////////////////////////////경민
	@Inject
	AdminService adminService;
	
	@Inject
	ItemService itemService;

	@Inject
	ReviewService reviewService;
	
	//승은
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String itemList(Model model,pagination pagination, PhotoVo photoVo) { 
		//커스텀 목록 페이지
		//List<MateVo> matelist = mateService.selectMateAll(model, pagination, photoVo);
		
		return dir+"/itemlist";
	}
	//승은
	
	//경민**********************************************************************
		//////////////////////////////////////////////////////////////////////////회원관리(마스터계정)
		@RequestMapping(value = "/usermanage", method = RequestMethod.GET)
		public String memberManage(HttpServletRequest req,HttpSession session,Model model) {
			session=req.getSession();
			if((String) session.getAttribute("userid")!=null) {	
				int user_ctg = (int) session.getAttribute("user_ctg");
				model.addAttribute("user_ctg", user_ctg);
			}	
			return dir+"/memberManage";
		}
		
		@RequestMapping(value = "/callUserList", method = RequestMethod.POST)
		public String callUserList(Criteria cri,LoginVo loginVo,Model model) throws Exception {
			List<LoginVo> List = new ArrayList<LoginVo>();
			PageMaker pageMaker = new PageMaker();
			
			List = adminService.selectUserList(cri,loginVo);
			pageMaker = adminService.selectUserBtn(cri,loginVo);
			model.addAttribute("pageMaker",pageMaker);
			model.addAttribute("List",List);
			return dir+"/callUserList";
		}
		
		//관리자등록페이지
		@RequestMapping(value = "/adminregister", method = RequestMethod.GET)
		public String selectMember() {
			return dir+"/adminRegi";
		}
		
		//user 삭제
		@ResponseBody
		@RequestMapping(value = "/deleteUserList", method = RequestMethod.POST)
		public int deleteUserList(@RequestParam(required=false,defaultValue="0",value="deleteList[]") 
									List<Integer> deleteList) throws Exception {
			int sqlResult = 0;
			sqlResult = adminService.deleteUserList(deleteList);
			return sqlResult;
		}
		//////////////////////////////////////////////////////////////////////////회원관리(마스터계정)
		//////////////////////////////////////////////////////////////////////////아이템관리
		@ResponseBody
		@RequestMapping(value = "/selectval", method = RequestMethod.GET)
		public List<AllItemVo> itemSelectList(Model model,AllItemVo allitemVo) throws Exception {
			//전체상품출력
			List<AllItemVo> List = new ArrayList<AllItemVo>();
			String selectVal = allitemVo.getSelectVal();
			System.out.println("Dddd"+allitemVo.getSelectVal());
			if(selectVal!=null) {
				if(selectVal.equals("all")) {
					List =adminService.selectProductAll();
				}else if(selectVal.equals("best")) {
					List =adminService.selectProductBest();
				}else {
					List =adminService.selectProduct(allitemVo);
				} 
			}else {
				List =adminService.selectProductAll();
			
			}
			return List;
		}
		
		@ResponseBody 
		@RequestMapping(value = "/deleteitem", method = RequestMethod.POST)
		public int itemDeleteOne(@RequestParam(required=false,defaultValue="0",value="itemCheckList[]") 
												List<String> deleteList) throws Exception {
			//개별항목 삭제
			return adminService.deleteProduct(deleteList);
			
		}
		
		//페이징 버튼
		@ResponseBody 
		@RequestMapping(value = "/pagingBtn", method = RequestMethod.GET)
		public PageMaker itemPagingBtn(Criteria cri,AllItemVo bean) throws Exception {
			String selectVal = bean.getSelectVal();
			int dataCnt = 0;
			
			if(selectVal!=null) {
				if(selectVal.equals("all") || selectVal.equals("best")) {
					dataCnt = adminService.selectAllCnt();
				}else {
					dataCnt = adminService.selectProductCnt(bean);				
				}			
			}else if(selectVal==null) {
				dataCnt = adminService.selectAllCnt();		
			}
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(dataCnt);
			return pageMaker;		
			
		}
		
		
		//페이징리스트
		@ResponseBody 
		@RequestMapping(value = "/pagingList", method = RequestMethod.GET)
		public List<AllItemVo> itemPagingList(Criteria cri,AllItemVo bean) throws Exception {
			return adminService.selectPagingList(cri,bean);				
		}
		
		//item 등록페이지
		@RequestMapping(value = "/itemregi", method = RequestMethod.GET)
		public String itemRegi() {
			return dir+"/itemRegist";
		} 
		
		//상품등록(지정한 폴더에 사진이 저장됨)
		@RequestMapping(value = "/itemregi", method = RequestMethod.POST)
		public String itemRegiSave(MultipartHttpServletRequest multi,AllItemVo allitemVo,PhotoVo photoVo,Model model) throws Exception {

			int returnResult = adminService.insertAllitem(allitemVo,photoVo,multi); 
			//리턴결과	
			if(returnResult==1) {
				//상품등록성공
				model.addAttribute("msg","상품등록 성공");
				return "redirect:/admin/";	
			}else {
				//상품등록실패
				model.addAttribute("msg","상품등록 실패");
				return "redirect:/admin/";
			}

		}
		
		//item 수정페이지
		@RequestMapping(value = "/itemupdate", method = RequestMethod.GET)
		public String itemUpdate(HttpServletRequest request, Model model) throws Exception {
			//기존 아이템 등록정보 가져오기
			int no = Integer.parseInt(request.getParameter("no"));
			itemService.selectOne(no, model);
			itemService.selectOne_detailImg(no, model);
			model.addAttribute("no", no);
			
			return dir+"/itemUpdate";
		}
		
		//item 수정등록
		@RequestMapping(value = "/itemupdate", method = RequestMethod.POST)
		public String itemUpdateSave(@RequestParam(required=false,value="photoPathList") ArrayList<String> photoPathList
										,@RequestParam(value="photoNameList") ArrayList<String> photoNameList
										,@RequestParam(value="photoStatusList") ArrayList<String> photoStatusList
										,MultipartHttpServletRequest multi
										,AllItemVo allitemVo,PhotoVo photoVo,Model model) throws Exception {
			int no = allitemVo.getItemNum();
			int returnResult = 0;
		
			if (multi==null) {
				return "redirect:/admin/itemupdate?no="+no;	
			}else {
				returnResult = adminService.itemUpdateSave(photoPathList,photoNameList,photoStatusList,allitemVo,photoVo,multi);	
			}
			//리턴결과
			if(returnResult==1) {
				model.addAttribute("msg","상품수정 성공");
				return "redirect:/item/detail?no="+no;	
			}else {
				model.addAttribute("msg","상품수정 실패");
				return "redirect:/admin/";
			}	
		}
			
	
		//--------------------커스텀 등록----------------------
		//--------------------리스트조회(디폴트:상품리스트)----------------------승은
		@ResponseBody //페이징 리스트 호출
		@RequestMapping(value="/custom/ctgP",method=RequestMethod.POST)
		public List<MateVo> mateListCtgP(MateVo mateVo, Model model, PhotoVo photoVo
				,@RequestParam(required=false,value="idx")int page
				,@RequestParam(required=false,value="idx")int range,
				@RequestParam(required = false, value = "matectg")String matectg) throws Exception {
			System.out.println("matectg===>"+matectg);
			//전체게시글 수
			int listCnt = mateService.selectMateAllCnt(mateVo, matectg); 
			System.out.println("listCnt===>"+listCnt);
			System.out.println("page==>"+ page);
			//Paginaion객체 
			pagination pagination = new pagination();
			pagination.pageInfo(page, range, listCnt,matectg);
			model.addAttribute("pagination",pagination);
			
			List<MateVo> matelistCtgP = new ArrayList<MateVo>();
			matelistCtgP = mateService.selectMateCtgP( pagination, photoVo, model);
			model.addAttribute("matelistCtgP",matelistCtgP);
			return matelistCtgP;
		}
		
		@ResponseBody
		@RequestMapping(value="/custom/ctgP/B",method=RequestMethod.GET)
		public pagination paging(MateVo mateVo, Model model,@RequestParam(required=false,value="idx")int page
				,@RequestParam(required=false,value="idx")int range,
				@RequestParam(required = false, value = "matectg")String matectg
				) throws Exception {
			System.out.println(matectg);
			int listCnt = mateService.selectMateAllCnt(mateVo, matectg); 
			//전체게시글 수
			pagination pagination = new pagination();
			pagination.pageInfo(page, range, listCnt, matectg);
			
			model.addAttribute("pagination",pagination);
			
			return pagination;
		}
		
		@ResponseBody //페이징 리스트 호출
		@RequestMapping(value="/custom/saleP",method=RequestMethod.POST)
		public List<MateVo> mateListSaleP(MateVo mateVo, Model model, PhotoVo photoVo
				,@RequestParam(required=false,value="idx")int page
				,@RequestParam(required=false,value="idx")int range,
				@RequestParam(required = false, value = "salestatus")int salestatus) throws Exception {
			
			System.out.println("matectg===>"+salestatus);
			//전체게시글 수
			int listCnt = mateService.selectMateSaleCnt(mateVo, salestatus); 
			System.out.println("listCnt===>"+listCnt);
			System.out.println("page==>"+ page);
			//Paginaion객체 
			pagination pagination = new pagination();
			pagination.pageInfo3(page, range, listCnt, salestatus);
			model.addAttribute("pagination",pagination);
			
			List<MateVo> matelistSaleP = new ArrayList<MateVo>();
			matelistSaleP = mateService.selectMateSaleP( pagination, photoVo, model);
			model.addAttribute("matelistSaleP",matelistSaleP);
			return matelistSaleP;
		}
		
		@RequestMapping(value = "/materegi", method = RequestMethod.GET)
		public String mateRegi() {
			return dir+"/mateRegi";
		}
		
		@RequestMapping(value="/materegi",method= RequestMethod.POST)
		public String mateInsert( MultipartHttpServletRequest multi,MateVo mateVo,PhotoVo photoVo) throws IOException, Exception {//입력페이지->리스트
			
			int returnResult = mateService.insertMate(mateVo, photoVo, multi); 
			//리턴결과	
			if(returnResult==1) {
				return "redirect:/admin/";	
			}else {
				return dir+"/mateRegi";
			}
		}
		
		@RequestMapping(value="/detail/{idx}",method=RequestMethod.GET)
		public String mateDetail(@PathVariable("idx") int matenum,PhotoVo photoVo,Model model) {
			List<MateVo> list = mateService.selectMateOne(matenum, photoVo, model);
			model.addAttribute("mateone",list);
			return dir+"/mateDetail";
		}
		
		@RequestMapping(value="/detail/{idx}",method= {RequestMethod.PUT,RequestMethod.POST})
		public String mateUpdate(@PathVariable("idx") int matenum,Model model, MateVo mateVo,MultipartHttpServletRequest multi, PhotoVo photoVo) throws Exception {
			int result = mateService.updateMate(matenum,mateVo, photoVo, multi);
			if(result==0) {
				System.out.println("실패");
			}
			return "redirect:/admin/detail/"+matenum;		
		}
		
		@Autowired
		ServletContext servletContext;
		
		//커스텀 재료 개별 삭제/전체삭제
		@ResponseBody
		@RequestMapping(value="/custom/delete",method= {RequestMethod.POST,RequestMethod.GET})
		public int deletelist(@RequestParam(required=false, defaultValue="0", value="mateselectBox[]") List<String> mateselectBox, PhotoVo photoVo, Model model){
			int returnResult = 0;
			int matenum=0;
			int result=0;
			int result2=0;
			for(int i=0;i<mateselectBox.size();i++) {			
				matenum=Integer.parseInt(mateselectBox.get(i));
				System.out.println("matenum>>>>delte>>>>"+matenum);
				List<MateVo> list = mateService.selectMateOne(matenum, photoVo, model);
				String pathTh = list.get(0).getPhotoName();
				String pathDe = list.get(1).getPhotoName();
				String upload = servletContext.getRealPath("/resources/ingredientnum/");
				System.out.println(pathTh);
				System.out.println(pathDe);
				for(int m=0;m<2;m++) {
					if(m==0) {
						File file = new File(upload+pathTh);
						if(file.exists()) {
							if(file.delete()) {
								System.out.println("=====> 썸네일 삭제 성공");
							}else {
								System.out.println("=====> 썸네일 삭제 실패");
							}
						}else {
							System.out.println("+++++ 썸네일 파일이 없음 +++++");
						}
					}else if(m==1) {
						File file = new File(upload+pathDe);
						if(file.exists()) {
							if(file.delete()) {
								System.out.println("=====> 디테일 삭제 성공");
							}else {
								System.out.println("=====> 디테일 삭제 실패");
							}
						}else {
							System.out.println("+++++ 디테일 파일이 없음 ++++");
						}
					}
				}
				
				result =  mateService.deleteMate(matenum);
				System.out.println("result>>>delete>>>"+result);
				result2 = mateService.deleteMatePhoto(matenum);
				System.out.println("result2>>>>delte>>>>"+result2);
			}
			return 1;
		}
		
		//디테일에서 삭제
		@RequestMapping(value="/delete/{idx}",method= RequestMethod.GET)
		public String deleteMate(@PathVariable("idx") int matenum,PhotoVo photoVo, Model model) throws Exception {
			List<MateVo> list = mateService.selectMateOne(matenum, photoVo, model);
			String pathTh = list.get(0).getPhotoName();
			String pathDe = list.get(1).getPhotoName();
			String upload = servletContext.getRealPath("/resources/ingredientnum/");
			System.out.println(pathTh);
			System.out.println(pathDe);
			for(int i=0;i<2;i++) {
				if(i==0) {
					File file = new File(upload+pathTh);
					if(file.exists()) {
						if(file.delete()) {
							System.out.println("=====> 썸네일 삭제 성공");
						}else {
							System.out.println("=====> 썸네일 삭제 실패");
						}
					}else {
						System.out.println("+++++ 썸네일 파일이 없음 +++++");
					}
				}else if(i==1) {
					File file = new File(upload+pathDe);
					if(file.exists()) {
						if(file.delete()) {
							System.out.println("=====> 디테일 삭제 성공");
						}else {
							System.out.println("=====> 디테일 삭제 실패");
						}
					}else {
						System.out.println("+++++ 디테일 파일이 없음 ++++");
					}
				}
			}
			int returnResult = mateService.deleteMate(matenum);
			int returnResult2 = mateService.deleteMatePhoto(matenum);
			return "redirect:/admin/";
		}
	/************************************************************************************************/
		
		/****************************미현 시작**********************************/
		@RequestMapping(value = "/orderlist", method = RequestMethod.GET)
		public ModelAndView orderList(@RequestParam(defaultValue = "1") int curPage,@RequestParam(defaultValue = "%",value = "searchnum") String ordernum) throws Exception {
			System.out.println("ordernum:"+ordernum);
			String deliverstatus = "%";
			//주문목록 레코드의 갯수 계산
			int count = adminService.countArticle(deliverstatus);
			
			//페이지 나누기 관련 처리
			int limit = 10;
			NoticePager noticePager = new NoticePager(count, curPage, limit);
			int nowPage = (curPage-1) * 10;
			int scale = 10;
			
			//주문목록 리스트
			List<OrderListVo> adorderList = adminService.orderlistSelect(nowPage,scale,deliverstatus,ordernum);
			
			//데이터에 저장
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("adorderList", adorderList);
			map.put("noticePager", noticePager);
			//model
			ModelAndView mav = new ModelAndView();
			mav.addObject("map", map);
			mav.setViewName(dir+"/orderList");
			return mav;
		}
		//selectbox Ajax
		@RequestMapping(value="/wtdeliver", method = RequestMethod.POST)
		@ResponseBody
		public Object wtDeliver(@RequestParam(value="param") String deliverstatus,@RequestParam(defaultValue = "1") int curPage,HttpServletResponse resp,@RequestParam(defaultValue = "%",value = "searchnum") String ordernum) throws Exception {
			//주문목록 레코드의 갯수 계산
			int count = adminService.countArticle(deliverstatus);
			
			//페이지 나누기 관련 처리
			int limit = 10;
			NoticePager wtnoticePager = new NoticePager(count, curPage, limit);
			int nowPage = (curPage-1) * limit;
			int scale = 10;
			
			//주문목록 리스트
			List<OrderListVo> wtdeliver = adminService.orderlistSelect(nowPage,scale,deliverstatus,ordernum);
			//데이터에 저장
			
			Map<String, Object> wtmap = new HashMap<String, Object>();
			wtmap.put("wtdeliver", wtdeliver);
			wtmap.put("wtnoticePager", wtnoticePager);
			wtmap.put("deliverstatus", deliverstatus);
			
			return wtmap;
		}
		//ajax로 deliverstatus update
		@RequestMapping(value="/changedeliver",method = RequestMethod.POST)
		@ResponseBody
		public Object changeDeliver(@RequestParam(value="param1") String deliverstatus,@RequestParam(value="param2") String ordernum) throws Exception {
			if(("0").equals(deliverstatus)) {
				return false;
			}
			return adminService.changeDeliver(deliverstatus,ordernum);
		}
		/****************************미현 끝**********************************/
	
	/************************수연 리뷰관리 start ***********************************************************/
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String adminReview(Model model) throws SQLException {
		reviewService.adminReviewItem(model, "reviewnum" , 0);
		return dir+"/adminReview";
	}
	
	@RequestMapping(value = "/allitem", method = RequestMethod.GET)
	public String reviewAllitem(Model model, @RequestParam(value="select", defaultValue = "reviewnum") String select, @RequestParam(value="p", defaultValue = "0") int p) throws SQLException {
		
		reviewService.adminReviewItem(model, select , p);
		model.addAttribute("page", p);
		return dir+"/adminReviewList";
	}
	
	@RequestMapping(value = "/custom", method = RequestMethod.GET)
	public String reviewCustom(Model model, @RequestParam(value="select", defaultValue = "reviewnum") String select, @RequestParam(value="p", defaultValue = "0") int p) throws SQLException {
		
		reviewService.adminReviewCustom(model, select, p);
		model.addAttribute("page", p);
		return dir+"/adminReviewList";
	}
	
	@RequestMapping(value = "/reviewdelete", method = RequestMethod.POST)
	public String reviewDelete(Model model, HttpServletRequest request) throws SQLException {
		int reviewNum = Integer.parseInt(request.getParameter("reviewnum"));
		reviewService.deleteReview(reviewNum);
		return dir+"/adminReviewList";
	}
	
	@RequestMapping(value = "/reviewpick", method = RequestMethod.POST)
	public String reviewPick(Model model, HttpServletRequest request) throws SQLException {		
		int reviewNum = Integer.parseInt(request.getParameter("reviewnum"));
		reviewService.bestCheck(1, reviewNum);
		return dir+"/adminReviewList";
	}
	
	@RequestMapping(value = "/reviewpickcancel", method = RequestMethod.POST)
	public String reviewPickCancel(Model model, HttpServletRequest request) throws SQLException {		
		int reviewNum = Integer.parseInt(request.getParameter("reviewnum"));
		reviewService.bestCheck(0, reviewNum);
		return dir+"/adminReviewList";
	}
	/************************수연 리뷰관리 end***********************************************************/
}



















