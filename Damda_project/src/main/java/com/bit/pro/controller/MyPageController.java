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
import org.springframework.web.servlet.ModelAndView;

import com.bit.pro.service.CartService;
import com.bit.pro.service.JoinService;
import com.bit.pro.service.MyRecipeService;
import com.bit.pro.service.WishItemService;
import com.bit.pro.vo.JoinVo;
import com.bit.pro.vo.NoticePager;
import com.bit.pro.vo.OrderListVo;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Resource
	private CartService cartService ;
	
	@Resource 
	private WishItemService wishItemService;
	
	@Resource 
	private MyRecipeService myRecipeService;
	
	String dir = "mypage";
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String myPage() {
		
		return dir+"/mypage"; 
	}
	/***************************미현 시작****************************************************/
	@RequestMapping(value = "/detail/{idx}", method = RequestMethod.GET)
	public ModelAndView mypageDetail(@PathVariable("idx") String o_ordernum,Model model,@RequestParam(defaultValue = "1") int curPage) throws SQLException {
		//레코드의 갯수 계산
		int count = cartService.countArticle();
		
		//페이지 나누기 관련 처리
		int limit = 5;
		NoticePager noticePager = new NoticePager(count, curPage, limit);
		
		int nowPage = (curPage-1) * 5;
		int scale = 5;
				
		List<OrderListVo> mypageDetail = cartService.mypageDetail(o_ordernum, nowPage, scale);
		System.out.println("mypageDetail:"+mypageDetail);
		//데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mypageDetail",mypageDetail);	//list
		map.put("count", count);	//레코드 갯수
		map.put("noticePager", noticePager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName(dir+"/mypage_detail");
		
		return mav; 
	}
	/**************************미현 끝****************************************************/
	
	/***************************************찜 start ******************************************************/
	@RequestMapping(value = "/jjim", method = RequestMethod.GET)
	public String jjim(Model model, HttpSession session, @RequestParam(value="p", defaultValue = "0") int p) throws SQLException {
		int userNum = (int)session.getAttribute("userNum");
		
		//장바구니 비교용
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
	/***************************************찜 end******************************************************/
	
	
	/***************************************마이레시피 start******************************************************/
	@RequestMapping(value = "/myrecipe", method = RequestMethod.GET)
	public String myRecipe(Model model, HttpSession session, @RequestParam(value="p", defaultValue = "0") int p) throws SQLException {
		int userNum = (int)session.getAttribute("userNum");
		
		myRecipeService.recipeList(model, userNum, p);
		
		//장바구니 커스텀 번호 비교
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
	
	/***************************************마이레시피 end******************************************************/

	/***************************************회원정보수정 start******************************************************/
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
	
	//유저 정보 수정
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
			System.out.println("올바른 비밀번호 입력");
			mav.addObject("incorrect", "맞음");
			
		}else {
			System.out.println("잘못된 비밀번호 입력");
			mav.addObject("incorrect", "incorrect");
			
		}
		return mav;
	}
	/***************************************회원정보수정 end******************************************************/
	
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
	
	/***************************************장바구니 start******************************************************/	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(Model model, HttpSession session) throws SQLException {
		int userNum = 0;
		String noUser = session.getId();
		
		if(session.getAttribute("userNum")!=null) {
			userNum = (int) session.getAttribute("userNum");
			System.out.println("userNum : "+userNum);
			
			//로그인시 비회원장바구니 -> 회원장바구니에 넣어주기
			cartService.noUser_updateCart(userNum, noUser);
		}
		
		
		if(session.getAttribute("userNum") != null) {
			userNum = (int) session.getAttribute("userNum");
			cartService.selectCart(model, userNum);			
		}else {
			System.out.println("noUser: "+noUser);
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

	/***************************************장바구니 end******************************************************/	
	
}
