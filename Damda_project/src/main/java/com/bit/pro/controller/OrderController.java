package com.bit.pro.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.pro.service.JoinService;
import com.bit.pro.service.OrderService;
import com.bit.pro.vo.AddrVo;
import com.bit.pro.vo.JoinVo;
import com.bit.pro.vo.OrderVo;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	String dir = "order";
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Resource
	private OrderService orderService;
	
	@Resource
	private JoinService joinService;
	
	//업로드 경로
	@Autowired ServletContext servletContext;
	
	//주문하기
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String order(HttpServletRequest req, HttpSession session,Model model) throws Exception {
		session = req.getSession();
		
		//회원/비회원 확인
		String isuser = (String) session.getAttribute("userid");

		if(isuser!=null) {
			String who = (String) session.getAttribute("userid");
			System.out.println("회원 주문 : " + who);
			int c_usernum = (int) session.getAttribute("userNum");
			
			
			//유저 정보를 찾아서 담음
			String userid = (String) session.getAttribute("userid");
			JoinVo userInfo = joinService.userInfo(userid);
			
			model.addAttribute("userInfo", userInfo);
			List<OrderVo> selectOrder = orderService.selectOrder(c_usernum);
			System.out.println("selectOrder:"+selectOrder);
			//담기
			model.addAttribute("selectOrder", selectOrder);
			
			//유저 주소록 정보 전송
			List<AddrVo> selectAddr = orderService.selectAddr(c_usernum);
			model.addAttribute("selectAddr", selectAddr);
			//jsonArray에 담음
			JSONArray jsonArray = new JSONArray();
			
			model.addAttribute("jsonList", jsonArray.fromObject(selectAddr));
			
			//user구분값 세팅
			session.setAttribute("isuser", "1");
			
		}else {
			//비회원
			String c_nousernum = session.getId();
			session.setAttribute("nousernum", c_nousernum);
			
			System.out.println("비회원 주문 세션: " + c_nousernum);
			
			List<OrderVo> selectOrder = orderService.selectOrderNouser(c_nousernum);
			model.addAttribute("selectOrder", selectOrder);
			
			//user구분값 세팅
			session.setAttribute("isuser", "0");
			
		}
		
		
		
		return dir+"/order";
	}
	
	@RequestMapping(value = "/myaddr", method = RequestMethod.GET)
	public ModelAndView myAddr(HttpServletRequest req, HttpSession session,Model model) throws SQLException {
		ModelAndView mav = new ModelAndView( dir+"/myAddr");
		int c_usernum = (int) session.getAttribute("userNum");
		
		//회원의 주소록 정보 세팅
		List<AddrVo> selectAddr = orderService.selectAddr(c_usernum);
		System.out.println("selectAddr:"+selectAddr);
		//담기
		model.addAttribute("selectAddr", selectAddr);
	
			
		return mav;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String orderList() {
		
		return dir+"/orderList";
	}
	
	//주소추가 팝업
	@RequestMapping(value = "/addaddr")
	public String addaddr(Locale locale, Model model) {
	
		return dir+"/addAddr";
	}
	
	//주소추가
	@RequestMapping(value = "addmyaddr", method = RequestMethod.POST)
	public ModelAndView addmyaddr(HttpSession session, @ModelAttribute AddrVo bean) throws Exception {
		ModelAndView mav = new ModelAndView();
		//usernum 세팅
		int usernum = (int) session.getAttribute("userNum");
		bean.setUsernum(usernum);
		int count = orderService.countAddr(usernum);
			
		if(count<5) {
			System.out.println("주소록에 주소 추가");
			orderService.insertAddr(bean);
			mav.addObject("addr","yes");
		}else {
			System.out.println("주소록 개수는 5개까지");
			mav.addObject("addr","no");
		}
		//회원의 주소록 정보 세팅
		List<AddrVo> selectAddr = orderService.selectAddr(usernum);
		System.out.println("selectAddr:"+selectAddr);
		//담기
		mav.addObject("selectAddr", selectAddr);
		mav.setViewName("/order/myAddr");
		return mav;
	}
	
	//삭제
	@RequestMapping(value="deleteAddr")
	public ModelAndView deleteAddr(HttpSession session, @RequestParam int idx) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:/order/myaddr");
		//usernum 세팅
		int usernum = (int) session.getAttribute("userNum");
				
		orderService.deleteAddr(usernum, idx);
		
		return mav;
	}
	
		
	//주소찾기 팝업
	@RequestMapping(value = "/popup")
	public String popup(Locale locale, Model model) {
	
		return dir+"/findJuso";
	}
	
	
}
