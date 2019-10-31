package com.bit.pro.controller;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import com.bit.pro.vo.CartVo;
import com.bit.pro.vo.JoinVo;
import com.bit.pro.vo.LoginVo;
import com.bit.pro.vo.OrderDataVo;
import com.bit.pro.vo.OrderDetailVo;
import com.bit.pro.vo.OrderVo;
import com.mysql.cj.ParseInfo;

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
	
	//주문완료시 데이터를 담는 기능
	@RequestMapping(value = "orderdata", method = RequestMethod.POST)
	public ModelAndView orderdata(HttpSession session, @ModelAttribute OrderDataVo bean, @RequestParam String useraddr1, @RequestParam String useraddr2, @RequestParam String nouserphone, @RequestParam String receiverphone ) throws Exception {
		
		//주문번호 생성해서 넣어줌(날짜+시간)
		Date today = new Date();
		SimpleDateFormat day = new SimpleDateFormat("yyMMdd");
		SimpleDateFormat hour = new SimpleDateFormat("HHmmss");
		String ordernum= "DAMDA"+day.format(today)+"_"+hour.format(today);
		
		bean.setOrdernum(ordernum);
	
		//주소 addr1+addr2해서 넣어줌
		String addr = useraddr1+" "+useraddr2;
		bean.setDeliveraddr(addr);
		String co_nousernum;
		int co_usernum;		
		//orderdate, price(총 가격) 히든으로 order페이지에 설정해준다 받아옴
		
		//회원/비회원 정보 넣어줌
		String isuser = (String) session.getAttribute("userid");
		if(isuser==null) {
			//비회원
			co_nousernum = session.getId();
			bean.setCo_nousernum(co_nousernum);
			nouserphone = nouserphone.replace("-", "");
			bean.setNouserphone(nouserphone);
			
		}else {
			//회원
			co_usernum= (int) session.getAttribute("userNum");	
			bean.setCo_usernum(co_usernum);
			
		}
		

		//전화번호 - 제외하고 숫자로
		receiverphone = receiverphone.replace("-", "");
		bean.setReceiverphone(receiverphone);
		
		
		System.out.println(bean.toString());
		OrderDataVo orderInfo = orderService.insertOrderData(bean);
		
		
		//selectorder에 있는 아이템들이 주문번호와 함께 orderlist 테이블로 저장된다
		//List<OrderDetailVo>에 cart의 cartnum순서대로 입력
	
		//OrderDataVo, insert
		List<OrderVo> selectOrder;
		if(orderInfo!=null) {
			if(isuser==null) {
				//비회원
				co_nousernum = session.getId();
				List<CartVo> noworder= orderService.selectCartItemNouser(co_nousernum);
				int result=orderService.insertOrderItemNouser(co_nousernum, ordernum, noworder);
				selectOrder= orderService.selectOrderNouser(co_nousernum);
			}
			else {
				//회원
				co_usernum = (int) session.getAttribute("userNum");	
				//카트에 담긴 아이템 구함
				List<CartVo> noworder= orderService.selectCartItem(co_usernum);
				
				int result=orderService.insertOrderItem(co_usernum, ordernum, noworder);
				 selectOrder= orderService.selectOrder(co_usernum);
				 
				//카트에 담긴 cartcheck=1 삭제
				int result2 = orderService.deleteCart(co_usernum);
				
				//주문금액 누적 / 현재 주문금액
				int adduserbuy = bean.getPrice();
				orderService.addUserbuy(co_usernum, adduserbuy);
				
				//회원 환불계좌 정보 변경
				String userbank=bean.getBank();
				String useraccowner=bean.getRefundaccowner();
				String useracc = bean.getRefundaccount();
				Map<String, String> map = new HashMap<String, String>();
				map.put("usernum", Integer.toString(co_usernum));
				map.put("userbank", userbank);
				map.put("useraccowner", useraccowner);
				map.put("useracc", useracc);
				orderService.updateUseracc(map);
				
				
				
			}
			

			//ordermanage에도 함께 정보를 보내줘야함
			//결제방법에 따라 기본 배송상태 다르게 넣어줘야함
			int ordertype = bean.getOrdertype(); 
			
			int result = orderService.insertOrderlist(ordernum, ordertype);
			if(result >0) {System.out.println("관리자 주문목록 전송");}
				
			
			//완료된 페이지로 간다
			ModelAndView mav = new ModelAndView(dir+"/orderList");
			
			mav.addObject("ordernum",ordernum);
			mav.addObject("selectOrder", selectOrder);
			mav.addObject("orderInfo",orderInfo);
			
			
			
			
			return mav;
		}else {
			System.out.println("컨트롤러 실패");
			return null;
					
		}
		
		
		//--------------------------------
		
		
		
		
		
		
		//개수만큼 상품개수를 감소시켜준다
		
		
	}
	
	
	//주문완료시 이동하는 페이지
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String orderList(HttpSession session, Model model) throws Exception {
		
				
		//OrderDateVo와 카트에 담겼었던 아이템을 가져와서 뿌려줌
		
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
	
	//주소찾기 팝업
	@RequestMapping(value = "/myorder")
	public String myorder(Locale locale, Model model) {
	
		return dir+"/myOrder";
	}
	
	
}
