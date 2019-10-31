package com.bit.pro.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bit.pro.service.CartService;
import com.bit.pro.service.JoinService;
import com.bit.pro.service.MyRecipeService;
import com.bit.pro.service.OrderListService;
import com.bit.pro.service.ReviewService;
import com.bit.pro.service.WishItemService;
import com.bit.pro.vo.JoinVo;
import com.bit.pro.vo.NoticePager;
import com.bit.pro.vo.OrderListVo;
import com.bit.pro.vo.ReviewVo;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Resource
	private CartService cartService ;
	
	@Resource 
	private WishItemService wishItemService;
	
	@Resource 
	private MyRecipeService myRecipeService;
	
	@Resource
	private OrderListService orderListService;
	
	@Resource
	private ReviewService reviewService;
	
	String dir = "mypage";
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	
	/***************************���� ����****************************************************/
	//����������
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView myPage(HttpSession session,@RequestParam(defaultValue = "1") int curPage ) throws SQLException {
		//�����ѹ� ���ϱ�
		int usernum = (int)session.getAttribute("userNum");
		//�ֹ����� ���ڵ� �� ���
		int count = cartService.mypagecountArticle(usernum);
		//������ ������
		int limit = 3;
		NoticePager noticePager = new NoticePager(count ,curPage ,limit);
		int nowPage = (curPage-1) * 3;
		int scale = 3;
		//����Ʈ �̱�
		List<OrderListVo> mypage = cartService.mypage(usernum,nowPage,scale);
		//������ ����
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mypage", mypage);
		map.put("noticePager", noticePager);
		//model
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName(dir+"/mypage");
		return mav; 
	}
	//���������� - ������
	@RequestMapping(value = "/detail/{idx}", method = RequestMethod.GET)
	public ModelAndView mypageDetail(@PathVariable("idx") String o_ordernum,@RequestParam(defaultValue = "1") int curPage) throws Exception {
		//���ڵ��� ���� ���
		int count = cartService.countArticle(o_ordernum);
		
		//������ ������ ���� ó��
		int limit = 5;
		NoticePager noticePager = new NoticePager(count, curPage, limit);
		
		int nowPage = (curPage-1) * 5;
		int scale = 5;
				
		List<OrderListVo> mypageDetail = cartService.mypageDetail(o_ordernum, nowPage, scale);
		
		//������̰� �ִ��� Ȯ��
		//�����͸� �ʿ� ����
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mypageDetail",mypageDetail);	//list
		map.put("noticePager", noticePager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName(dir+"/mypage_detail");
		
		return mav; 
	}
	//��ȸ���϶� �ֹ���ȸ
	@RequestMapping(value="/nouser/{idx}",method = RequestMethod.GET)
	public ModelAndView nouserDetail(@PathVariable(value="idx") String o_ordernum,@RequestParam(defaultValue = "1") int curPage) throws Exception {
		//���ڵ��� ���� ���
		int count = cartService.countArticle(o_ordernum);
		
		//������ ������ ���� ó��
		int limit = 5;
		NoticePager noticePager = new NoticePager(count, curPage, limit);
		
		int nowPage = (curPage-1) * 5;
		int scale = 5;
				
		List<OrderListVo> nouserDetail = cartService.nouserDetail(o_ordernum, nowPage, scale);
		
		//������̰� �ִ��� Ȯ��
		List<ReviewVo> reviewT = reviewService.mypagereview(o_ordernum);
		
		//�����͸� �ʿ� ����
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nouserDetail",nouserDetail);	//list
		map.put("noticePager", noticePager);
		map.put("reviewT", reviewT);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName(dir+"/nouser_detail");
		
		return mav; 
	}
	/**************************���� ��****************************************************/
	
	
	//�ֹ��� ����� ������ ���ý� ������ �ۼ�������. ������ ǰ����������
	@RequestMapping(value = "/detail/review", method = RequestMethod.GET)
	public String myPageReview(Model model, HttpSession session, HttpServletRequest request) throws SQLException {
		int userNum = (int)session.getAttribute("userNum");
		String orderNum = request.getParameter("ordernum");
		
		if(request.getParameter("itemnum")!=null) { //�������϶�
			int itemNum = Integer.parseInt(request.getParameter("itemnum"));
			orderListService.reviewItem(model, orderNum, userNum, itemNum);
		}else if(request.getParameter("itemnum") == null) { //Ŀ�����϶�
			int customNum = Integer.parseInt(request.getParameter("customnum"));
			orderListService.reviewCustom(model, orderNum, userNum, customNum);
		}
		
		return dir+"/mypage_review"; 
	}
	
	
	//������ 
	@ResponseBody
	@RequestMapping(value = "/detail/review", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public int insertMyPageReview(HttpSession session, HttpServletRequest request, MultipartHttpServletRequest multi, ReviewVo reviewVo) throws Exception{
		int result = 0;
		int userNum = (int)session.getAttribute("userNum");
		String reviewCon = reviewVo.getReviewCon();
		int itemNum = reviewVo.getR_itemNum();
		String orderNum = request.getParameter("ordernum");
		
		System.out.println("MypageController reviewCon: "+reviewCon);
		
		if(itemNum<99991) {	//�������� ��	 	
			result = reviewService.insertItemReview(userNum, itemNum, reviewCon, multi);
		}else if(itemNum>=99991) { //Ŀ������ ��
			result = reviewService.insertCustomReview(userNum, itemNum, reviewCon, multi);
		}
		
		return result;
	}
	
	/***************************************�� start ******************************************************/
	@RequestMapping(value = "/jjim", method = RequestMethod.GET)
	public String jjim(Model model, HttpSession session, @RequestParam(value="p", defaultValue = "0") int p) throws SQLException {
		int userNum = (int)session.getAttribute("userNum");
		
		//��ٱ��� �񱳿�
		cartService.user_compareCart(model, userNum);
		
		//List
		wishItemService.wishList(model, userNum, p);
		
		return dir+"/jjim"; 
	}
	
	@RequestMapping(value = "/wishdelete", method = RequestMethod.POST)
	public String wishDelete(Model model, HttpSession session, HttpServletRequest request) throws SQLException {
		int userNum = (int)session.getAttribute("userNum");
		int itemNum = Integer.parseInt(request.getParameter("itemnum"));
		
		wishItemService.deleteWish(userNum, itemNum);
		
		return dir+"/jjim"; 
	}
	
	@RequestMapping(value = "/insertcart", method = RequestMethod.POST)
	public String insertCart(Model model, HttpSession session, HttpServletRequest request) throws SQLException {
		int userNum = (int)session.getAttribute("userNum");
		int itemNum = Integer.parseInt(request.getParameter("itemnum"));
		
		cartService.insertItem(userNum, itemNum, 1);
		
		return dir+"/jjim"; 
	}
	/***************************************�� end******************************************************/
	
	
	/***************************************���̷����� start******************************************************/
	@RequestMapping(value = "/myrecipe", method = RequestMethod.GET)
	public String myRecipe(Model model, HttpSession session, @RequestParam(value="p", defaultValue = "0") int p) throws SQLException {
		int userNum = (int)session.getAttribute("userNum");
		
		myRecipeService.recipeList(model, userNum, p);
		
		//��ٱ��� Ŀ���� ��ȣ ��
		cartService.user_compareCart(model, userNum);
		
		return dir+"/myrecipe"; 
	}
	
	@RequestMapping(value = "/insertcustom", method = RequestMethod.POST)
	public String insertCustom(Model model, HttpSession session, HttpServletRequest request) throws SQLException {
		int userNum = (int)session.getAttribute("userNum");
		int customNum = Integer.parseInt(request.getParameter("customnum"));
		
		cartService.myRecipeInsert(userNum, customNum);
		
		return dir+"/myrecipe"; 
	}
	
	@RequestMapping(value = "/deleterecipe", method = RequestMethod.POST)
	public String deleteRecipe(Model model, HttpSession session, HttpServletRequest request) throws SQLException {
		int userNum = (int)session.getAttribute("userNum");
		int customNum = Integer.parseInt(request.getParameter("customnum"));
		
		myRecipeService.deleteRecipe(userNum, customNum);
		
		return dir+"/myrecipe"; 
	}
	
	/***************************************���̷����� end******************************************************/

	/***************************************ȸ���������� start******************************************************/
	@Resource
	private JoinService joinService;
	@RequestMapping(value = "/userinfo", method = RequestMethod.GET)
	public ModelAndView edituser(HttpServletRequest req,HttpSession session) throws Exception {

		session=req.getSession();
		String userid = (String) session.getAttribute("userid");
		JoinVo userInfo = joinService.userInfo(userid);
		ModelAndView mav = new ModelAndView(dir+"/edituser");
		mav.addObject("userInfo",userInfo);
		return mav; 
	}
	
	//���� ���� ����
	@RequestMapping(value = "updateUser", method = RequestMethod.POST)
	public ModelAndView updateUser(@ModelAttribute JoinVo bean, HttpServletRequest req,HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		int result = joinService.updateUser(bean);
		
		session=req.getSession();
		String userid = (String) session.getAttribute("userid");
		JoinVo userInfo = joinService.userInfo(userid);
		mav.addObject("userInfo",userInfo);
		
		
		mav.setViewName("/mypage/edituser");
		if(result>0) {
			System.out.println("�ùٸ� ��й�ȣ �Է�");
			mav.addObject("incorrect", "correct");
			
		}else {
			System.out.println("�߸��� ��й�ȣ �Է�");
			mav.addObject("incorrect", "incorrect");
			
		}
		return mav;
	}
	
	//ȸ����й�ȣ Ȯ�� ������
	@RequestMapping(value = "/foreditpw", method = RequestMethod.GET)
	public ModelAndView foreditpw() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/mypage/foreditpw");
		
		return mav;
	}
	
	//��й�ȣ �´��� üũ > ������ �̵�
	@RequestMapping(value = "chkpw", method = RequestMethod.POST)
	public ModelAndView chkpw(@RequestParam String nowpw, HttpServletRequest req,HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		session=req.getSession();
		String userid = (String) session.getAttribute("userid");
		String inputpw = nowpw;
		System.out.println("inputpw: "+nowpw +", userid:" + userid);
		Map<String,String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("userpw", inputpw);
		int result=joinService.checkPw(map);
		
		if(result>0) {
			System.out.println("�ùٸ� ��й�ȣ �Է�");
			mav.addObject("incorrect", "correct");
			
		}else {
			System.out.println("�߸��� ��й�ȣ �Է�");
			mav.addObject("incorrect", "incorrect");
		}
		mav.setViewName("/mypage/foreditpw");
		return mav;
	}
	
	//��й�ȣ ����ó��
	@RequestMapping(value = "editpw", method = RequestMethod.POST)
	public ModelAndView editpw(@RequestParam String userpw, HttpServletRequest req,HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		session=req.getSession();
		String userid = (String) session.getAttribute("userid");
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("userpw", userpw);
		
		mav.setViewName("/mypage/edituser");
		int result=joinService.updatePw(map);

		if(result>0) {
			System.out.println("��й�ȣ ����");
			mav.addObject("incorrect", "editpw");
			
		}

		JoinVo userInfo = joinService.userInfo(userid);
		mav.addObject("userInfo",userInfo);
		
		//���â���� Ȯ�� ������ ����� ��й�ȣ�� ��α��� �ϵ��� �Ѵ�
		
		return mav;
	}
	
	

	
	/***************************************ȸ���������� end******************************************************/
	
	/***************************************qna start******************************************************/
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	   public String myPageQna(HttpServletRequest req,HttpSession session,Model model) {
	      session=req.getSession();
	      if(session.getAttribute("userNum")!=null) {   
	         int m_userNum = (int) session.getAttribute("userNum");
	         model.addAttribute("m_userNum", m_userNum);
	         System.out.println(m_userNum);
	      }
	      return dir+"/mypage_qna"; 
	   }
	   //qnalist on mypage
	   @RequestMapping(value = "/callMyQna", method = RequestMethod.POST)
	   public String callMyQna() throws Exception {
	      return dir+"/call_qnaList";
	   }
	/***************************************qna end******************************************************/
	
	/***************************************��ٱ��� start******************************************************/	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(Model model, HttpSession session) throws SQLException {
		int userNum = 0;
		String noUser = session.getId();
		
		if(session.getAttribute("userNum")!=null) {
			userNum = (int) session.getAttribute("userNum");
			System.out.println("userNum : "+userNum);
			
			//�α��ν� ��ȸ����ٱ��� -> ȸ����ٱ��Ͽ� �־��ֱ�
			cartService.noUser_updateCart(userNum, noUser);
		}
		
		
		if(session.getAttribute("userNum") != null) {
			userNum = (int) session.getAttribute("userNum");
			
			//�ֹ���ҽ� 1�� ���õȰ� 0���� ������ֱ�
			cartService.cartOrder(0, userNum);
			
			//���Ŀ� List���
			cartService.selectCart(model, userNum);			
		}else {
			System.out.println("noUser: "+noUser);
			cartService.cartOrder_noUser(0, noUser);
			cartService.selectCart_noUser(model, noUser);		
		}
		
		return dir+"/cart"; 
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public String cart_eaEdit(Model model, HttpSession session, HttpServletRequest request) throws Exception {
		int ea = Integer.parseInt(request.getParameter("ea"));
		int itemNum = 0;
		int userNum = 0;
		int customNum = 0;
		
		String noUser = session.getId();
		
		if(session.getAttribute("userNum")!=null) {
			userNum = (int) session.getAttribute("userNum");
			System.out.println("userNum : "+userNum);
			
			if(request.getParameter("itemnum") != null) {
				itemNum = Integer.parseInt(request.getParameter("itemnum"));
				
				System.out.println("itemNum : "+itemNum);
				
				cartService.userUpdate_item(itemNum, userNum, ea);
				
			}else if(request.getParameter("customnum") != null) {
				customNum = Integer.parseInt(request.getParameter("customnum"));
				
				System.out.println("customNum : "+customNum);
		
				cartService.userUpdate_custom(customNum, userNum, ea);
			
			}
		} else if(session.getAttribute("userNum")==null) {
			System.out.println(noUser);
			
			if(request.getParameter("itemnum") != null) {
				itemNum = Integer.parseInt(request.getParameter("itemnum"));
				
				System.out.println("itemNum : "+itemNum);
				
				cartService.nouserUpdate_item(itemNum, noUser, ea);
				
			}else if(request.getParameter("customnum") != null) {
				customNum = Integer.parseInt(request.getParameter("customnum"));
				
				System.out.println("customNum : "+customNum);
		
				cartService.nouserUpdate_custom(customNum, noUser, ea);
			
			}
			
		} 
		
		
		return dir+"/cart";
	}

	@RequestMapping(value = "/deleteitem", method = RequestMethod.POST)
	public String deleteItem(Model model, HttpSession session, HttpServletRequest request) throws SQLException {
		int itemNum = 0;
		
		int userNum = 0;
		
		String noUser = session.getId();
		
		if(session.getAttribute("userNum")!=null) {
			userNum = (int) session.getAttribute("userNum");
			System.out.println("userNum : "+userNum);
			
			if(request.getParameter("itemnum") != null) {
				itemNum = Integer.parseInt(request.getParameter("itemnum"));
				
				System.out.println("itemNum : "+itemNum);
				
				cartService.userDelete_item(userNum, itemNum);
			}
		} else if(session.getAttribute("userNum")==null) {
			System.out.println(noUser);
			
			if(request.getParameter("itemnum") != null) {
				itemNum = Integer.parseInt(request.getParameter("itemnum"));
				
				System.out.println("itemNum : "+itemNum);
				
				cartService.nouserDelete_item(noUser, itemNum);
			}
			
		} 
		
		return dir+"/cart"; 
	}
	
	@RequestMapping(value = "/deletecustom", method = RequestMethod.POST)
	public String deleteCustom(Model model, HttpSession session, HttpServletRequest request) throws SQLException {
		int customNum = 0;
		
		int userNum = 0;
		
		String noUser = session.getId();
		
		if(session.getAttribute("userNum")!=null) {
			userNum = (int) session.getAttribute("userNum");
			System.out.println("userNum : "+userNum);
			
			if(request.getParameter("customnum") != null) {
				customNum = Integer.parseInt(request.getParameter("customnum"));
				
				System.out.println("customNum : "+customNum);
		
				cartService.userDelete_custom(userNum, customNum);
			}
		} else if(session.getAttribute("userNum")==null) {
			System.out.println(noUser);
			
			if(request.getParameter("customnum") != null) {
				customNum = Integer.parseInt(request.getParameter("customnum"));
				
				System.out.println("customNum : "+customNum);
		
				cartService.nouserDelete_custom(noUser, customNum);
			}
			
		} 
		
		return dir+"/cart"; 
	}
	
	@RequestMapping(value = "/cartorder", method = RequestMethod.POST )
	public String cartOrder(HttpSession session, HttpServletRequest request) throws SQLException{
		
		if(session.getAttribute("userNum")!=null) {
			int userNum = (int)session.getAttribute("userNum");
			cartService.cartOrder(1, userNum);
		}else if(session.getAttribute("userNum")==null) {
			String nouserNum = session.getId();
			cartService.cartOrder_noUser(1, nouserNum);
		}
		
		
		return dir+"/cart";
	}

	/***************************************��ٱ��� end******************************************************/	
	
}
