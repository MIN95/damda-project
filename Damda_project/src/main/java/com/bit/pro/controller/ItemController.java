package com.bit.pro.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.pro.service.CartService;
import com.bit.pro.service.ItemService;
import com.bit.pro.service.LikeService;
import com.bit.pro.service.ReviewService;
import com.bit.pro.service.WishItemService;
import com.bit.pro.vo.AllItemVo;
import com.bit.pro.vo.ReviewVo;

@Controller
@RequestMapping("/item")
public class ItemController {
	
	String dir = "item";
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	@Resource
	private ItemService itemService;
	
	@Resource
	private ReviewService reviewService;
	
	@Resource
	private CartService cartService;
	
	@Resource
	private WishItemService wishItemService;
	
	@Resource
	private LikeService likeService;
	
	private int row = 30;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Locale locale, Model model,@RequestParam(value="item", defaultValue = "salad") String item) throws Exception {
		model.addAttribute("item", item);
		return dir+"/main";
	}
	
	@RequestMapping(value = "/salad", method = RequestMethod.GET)
	public String salad(Locale locale, Model model, @RequestParam(value="select", defaultValue = "new") String select, @RequestParam(value="p", defaultValue = "0") int p) throws Exception {
		itemService.selectItem(1, p, select, model);
		return dir+"/list";
	}
	
	@RequestMapping(value = "/dessert", method = RequestMethod.GET)
	public String dessert(Locale locale, Model model, @RequestParam(value="select", defaultValue = "new") String select, @RequestParam(value="p", defaultValue = "0") int p) throws Exception {
		itemService.selectItem(2, p, select, model);
		return dir+"/list";
	}
	
	@RequestMapping(value = "/drink", method = RequestMethod.GET)
	public String drink(Locale locale, Model model, @RequestParam(value="select", defaultValue = "new") String select, @RequestParam(value="p", defaultValue = "0") int p) throws Exception {
		itemService.selectItem(3, p, select, model);
		return dir+"/list";
	}
	
	@RequestMapping(value = "/best", method = RequestMethod.GET)
	public String best(Model model) throws Exception {
		itemService.selectBest(0, 30, model);
		return dir+"/list";
	}
	

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String itemDetail(Model model, HttpServletRequest request, @RequestParam(value="p", defaultValue = "0") int p, HttpSession session) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		itemService.selectOne(no, model);
		itemService.selectOne_detailImg(no, model);
		
		//리뷰 세팅
		reviewService.reviewCount(no, model);
		if(session.getAttribute("userNum")!=null) {
			int userNum = (int)session.getAttribute("userNum");
			reviewService.selectList(no, p, "reviewnew", model, userNum);			
		}else if(session.getAttribute("userNum")==null) {
			reviewService.selectList(no, p, "reviewnew", model, 0);			
		}
		
		//장바구니 중복값 확인용
		if(session.getAttribute("userNum")!=null) {
			int userNum = (int)session.getAttribute("userNum");
			cartService.user_compareCart(model, userNum);
			wishItemService.compareWishList(model, userNum);
		}else if(session.getAttribute("userNum")==null) {
			String noUser = session.getId();
			cartService.noUser_compareCart(model, noUser);
		}
		
		model.addAttribute("no", no);
		return dir+"/detail";
	}	
	
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public String itemCart(HttpServletRequest request, HttpSession session) throws Exception {
		int userNum = Integer.parseInt(request.getParameter("usernum"));
		int itemNum = Integer.parseInt(request.getParameter("no"));
		int ea =Integer.parseInt(request.getParameter("ea"));
		System.out.println("userNum, itemNum, ea : "+userNum+","+itemNum+","+ea);
		
		cartService.insertItem(userNum, itemNum, ea);			
		
		return dir+"/detail";
	}
	
	@RequestMapping(value = "/detailnouser", method = RequestMethod.POST)
	public String itemCart_noUser(HttpServletRequest request, HttpSession session) throws Exception {
		int itemNum = Integer.parseInt(request.getParameter("no"));
		int ea =Integer.parseInt(request.getParameter("ea"));
		
		String noUser = session.getId();
		System.out.println(noUser);
		cartService.insertItem_noUser(noUser, itemNum, ea);
		
		return dir+"/detail";
	}
	
	@RequestMapping(value = "/cartUpdate", method = RequestMethod.POST)
	public String cartUpdate(HttpServletRequest request, HttpSession session) throws Exception {
		int itemNum = Integer.parseInt(request.getParameter("no"));
		int ea =Integer.parseInt(request.getParameter("ea"));
		
		if(session.getAttribute("userNum") != null) {
			int userNum =(int)session.getAttribute("userNum");
			cartService.user_eaUpdate(userNum, ea, itemNum);
		}else if(session.getAttribute("userNum") == null) {
			String noUser = session.getId();
			cartService.noUser_eaUpdate(noUser, ea, itemNum);
		}
		
		return dir+"/detail";
	}
	
	@RequestMapping(value = "/insertwish", method = RequestMethod.POST)
	public String insertWish(HttpServletRequest request, HttpSession session) throws Exception {
		int userNum = (int)session.getAttribute("userNum");
		int itemNum = Integer.parseInt(request.getParameter("no"));
		
		wishItemService.insertWish(userNum, itemNum);
		
		return dir+"/detail";
	}
	
	//비동기 리뷰 페이지
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String reviewNew(Model model, HttpServletRequest request, HttpSession session, @RequestParam(value="align", defaultValue = "reviewnew") String align, @RequestParam(value="p", defaultValue = "0") int p) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		
		if(session.getAttribute("userNum")!=null) {
			int userNum = (int)session.getAttribute("userNum");
			reviewService.selectList(no, p, align, model, userNum);			
		}else if(session.getAttribute("userNum")==null) {
			reviewService.selectList(no, p, align, model, 0);			
		}
		
		return dir+"/d_list";
	}
	
	//좋아요
	@RequestMapping(value = "/reviewlike", method = RequestMethod.POST)
	public String reviewLike(HttpServletRequest request, HttpSession session) throws Exception {
		int userNum =(int)session.getAttribute("userNum");
		int reviewNum = Integer.parseInt(request.getParameter("reviewnum"));
		
		likeService.reviewLike(userNum, reviewNum);
		return dir+"/d_list";		
	}
	
	//좋아요 취소
	@RequestMapping(value = "/likecancel", method = RequestMethod.POST)
	public String likeCancel(HttpServletRequest request, HttpSession session) throws Exception {
		int userNum =(int)session.getAttribute("userNum");
		int reviewNum = Integer.parseInt(request.getParameter("reviewnum"));

		likeService.likeCancel(userNum, reviewNum);
		return dir+"/d_list";
	}
	
}














