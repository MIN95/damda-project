package com.bit.pro.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.pro.dao.CartDao;
import com.bit.pro.vo.CartJoinVo;
import com.bit.pro.vo.CartVo;
import com.bit.pro.vo.OrderListVo;

@Service("cartService")
public class CartServiceImpl implements CartService{

	
	private static final Logger logger = LoggerFactory.getLogger(CartServiceImpl.class);
	
	@Resource(name="cartDao")
	private CartDao cartDao;
	
	//detail 에서 장바구니 담기 
	@Override
	public void insertItem(int c_userNum, int c_itemNum, int ea) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_userNum(c_userNum);
		bean.setC_itemNum(c_itemNum);
		bean.setEa(ea);
		
		cartDao.insertCart(bean);
	}
	
	@Override
	public void insertItem_noUser(String noUser, int c_itemNum, int ea) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_nouserNum(noUser);
		bean.setC_itemNum(c_itemNum);
		bean.setEa(ea);
		
		cartDao.insertCart_noUser(bean);
	}

	
	//장바구니 출력
	@Override
	public Model selectCart(Model model, int userNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_userNum(userNum);
		
		List<CartJoinVo> list = cartDao.selectCart_user(bean);
		System.out.println("list : "+list);
		model.addAttribute("List", list);
		return model;
	}

	//비회원 장바구니 출력
	@Override
	public Model selectCart_noUser(Model model, String noUser) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_nouserNum(noUser);
		
		List<CartJoinVo> list = cartDao.selectCart_noUser(bean);
		System.out.println("list : "+list);
		model.addAttribute("List", list);
		return model;
	}

	
	//비회원장바구니 -> 회원장바구니(중복검사)
	@Override
	public void noUser_updateCart(int c_userNum, String c_nouserNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_userNum(c_userNum);
		bean.setC_nouserNum(c_nouserNum);
		
		//비회원이였을 때 장바구니
		List<CartVo> noUser_ItemList = cartDao.noUser_compareCart(bean);
		System.out.println("noUser_ItemList: "+noUser_ItemList);
		
		//회원 장바구니 
		List<CartVo> user_ItemList = cartDao.user_compareCart(bean);
		System.out.println("user_ItemList: "+user_ItemList);
		
		if(user_ItemList.size()>0 && noUser_ItemList.size()>0) {
			for (int i = 0; i < noUser_ItemList.size(); i++) {
				for(int j = 0; j < user_ItemList.size(); j++) {
					System.out.println("1. for문 비회원 중복 아이템 " +i+"번째 :"+ noUser_ItemList.get(i).getC_itemNum());
					System.out.println("1. for문 회원 중복 아이템 " +j+"번째 :"+ user_ItemList.get(j).getC_itemNum());
					if(noUser_ItemList.get(i).getC_itemNum() == user_ItemList.get(j).getC_itemNum()) {
						System.out.println("1. if문 비회원 중복 아이템 " +i+"번째 :"+ noUser_ItemList.get(i).getC_itemNum());
						System.out.println("1. if문 회원 중복 아이템 " +j+"번째 :"+ user_ItemList.get(j).getC_itemNum());
						//회원 장바구니 아이템에 
						int itemNum = user_ItemList.get(j).getC_itemNum();
						System.out.println("1. if문 회원 중복 아이템 " +j+"번째 itemNum :"+ itemNum);
						
						//비회원일 때 장바구니의 수량을 추가
						int ea = noUser_ItemList.get(i).getEa();
						System.out.println("1. if문 회원 중복 아이템 " +i+"번째 Ea :"+ ea);
						
						bean.setC_itemNum(itemNum);
						bean.setEa(ea);
						
						//같을 때 회원장바구니 아이템 수량추가 update
						cartDao.noUser_updateCart2(bean);
						
						//비회원 장바구니 중복아이템 delete
						cartDao.noUser_deleteCart(bean);
						
					}else {
						int itemNum = noUser_ItemList.get(i).getC_itemNum();
						int customNum = noUser_ItemList.get(i).getC_customNum();
						System.out.println("1. 중복아닐때 비회원 장바구니 itemNum : "+itemNum);
						System.out.println("1. 중복아닐때 비회원 장바구니 customNum : "+customNum);
						bean.setC_itemNum(itemNum);
						bean.setC_customNum(customNum);
						
						//비회원 -> 회원장바구니 update
						cartDao.noUser_updateCart(bean);
						cartDao.noUser_updateCart3(bean);
						//비회원 -> 회원장바구니 비회원정보 비우기 update
						cartDao.user_updateCart(bean);
						cartDao.user_updateCart2(bean);
					}
				}
			}
		}else if(user_ItemList.size()==0 && noUser_ItemList.size()>0) {
			for (int i = 0; i < noUser_ItemList.size(); i++) {
				System.out.println("2. for문 비회원 중복 아이템 " +i+"번째 :"+ noUser_ItemList.get(i).getC_itemNum());
	
				int itemNum = noUser_ItemList.get(i).getC_itemNum();
				int customNum = noUser_ItemList.get(i).getC_customNum();
				System.out.println("2. 중복아닐때 비회원 장바구니 itemNum : "+itemNum);
				System.out.println("2. 중복아닐때 비회원 장바구니 customNum : "+customNum);
				bean.setC_itemNum(itemNum);
				bean.setC_customNum(customNum);				
				
				//비회원 -> 회원장바구니 update
				cartDao.noUser_updateCart(bean);
				cartDao.noUser_updateCart3(bean);
				//비회원 -> 회원장바구니 비회원정보 비우기 update
				cartDao.user_updateCart(bean);
				cartDao.user_updateCart2(bean);
			}
		}else if(user_ItemList.size()>=0 && noUser_ItemList.size()==0) {
			System.out.println("3. 장바구니 이동 필요 없음");
		}
	}
	
	//회원 장바구니 수량 수정
	@Override
	public void userUpdate_item(int itemNum, int userNum, int ea) throws Exception {
		CartVo bean = new CartVo();
		bean.setC_itemNum(itemNum);
		bean.setC_userNum(userNum);
		bean.setEa(ea);
		
		cartDao.userUpdate_item(bean);
	}

	@Override
	public void userUpdate_custom(int customNum, int userNum, int ea) throws Exception {
		CartVo bean = new CartVo();
		bean.setC_customNum(customNum);
		bean.setC_userNum(userNum);
		bean.setEa(ea);
		
		cartDao.userUpdate_custom(bean);
	}

	
	//비회원 장바구니 수량 수정
	@Override
	public void nouserUpdate_item(int itemNum, String nouserNum, int ea) throws Exception {
		CartVo bean = new CartVo();
		bean.setC_nouserNum(nouserNum);
		bean.setC_itemNum(itemNum);
		bean.setEa(ea);
		
		cartDao.nouserUpdate_item(bean);
	}

	@Override
	public void nouserUpdate_custom(int customNum, String nouserNum, int ea) throws Exception {
		CartVo bean = new CartVo();
		bean.setC_nouserNum(nouserNum);
		bean.setC_customNum(customNum);
		bean.setEa(ea);
		
		cartDao.nouserUpdate_custom(bean);
	}

	//회원 장바구니 삭제
	@Override
	public void userDelete_item(int userNum, int itemNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_userNum(userNum);
		bean.setC_itemNum(itemNum);
		
		cartDao.userDelete_item(bean);
	}

	@Override
	public void userDelete_custom(int userNum, int customNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_userNum(userNum);
		bean.setC_customNum(customNum);
		
		cartDao.userDelete_custom(bean);
	}

	//비회원 장바구니 삭제
	@Override
	public void nouserDelete_item(String nouserNum, int itemNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_nouserNum(nouserNum);
		bean.setC_itemNum(itemNum);
		
		cartDao.nouserDelete_item(bean);
	}

	@Override
	public void nouserDelete_custom(String nouserNum, int customNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_nouserNum(nouserNum);
		bean.setC_customNum(customNum);
		
		cartDao.nouserDelete_custom(bean);
	}
	
	//회원 장바구니 중복확인
	@Override
	public Model user_compareCart(Model model, int userNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_userNum(userNum);
		
		List<CartVo> cartList = cartDao.user_compareCart(bean);
		model.addAttribute("cartList", cartList);
		return model;
	}

	//비회원 장바구니 중복확인
	@Override
	public Model noUser_compareCart(Model model, String nouserNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_nouserNum(nouserNum);
		
		List<CartVo> cartList = cartDao.noUser_compareCart(bean);
		model.addAttribute("cartList", cartList);
		return model;
	}

	//장바구니 중복시 수량 update
	@Override
	public void user_eaUpdate(int userNum, int ea, int itemNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_userNum(userNum);
		bean.setEa(ea);
		bean.setC_itemNum(itemNum);
		
		cartDao.user_eaUpdate(bean);
	}

	@Override
	public void noUser_eaUpdate(String nouserNum, int ea, int itemNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_nouserNum(nouserNum);
		bean.setEa(ea);
		bean.setC_itemNum(itemNum);
		
		cartDao.noUser_eaUpdate(bean);
	}

	//커스텀 등록
	@Override
	public void myRecipeInsert(int userNum, int customNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_userNum(userNum);
		bean.setC_customNum(customNum);
		
		cartDao.myrecipeInsert(bean);
	}

	//주문페이지 이동
	@Override
	public void cartOrder(int cartCheck, int userNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setCartCheck(cartCheck);
		bean.setC_userNum(userNum);

		cartDao.cartOrder(bean);
	}
	
	//주문 취소후 장바구니로 돌아왔을때 대비
	@Override
	public void cartOrder_noUser(int cartCheck, String nouserNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setCartCheck(cartCheck);
		bean.setC_nouserNum(nouserNum);
		
		cartDao.cartOrder_noUser(bean);
	}
	/**********************미현시작*********************************************************/
	//주문내역 출력
	@Override
	public List<OrderListVo> mypage(int usernum, int nowPage, int scale) throws SQLException {
		return cartDao.mypage(usernum,nowPage,scale);
	}
	//주문내역 개수
	@Override
	public int mypagecountArticle(int usernum) throws SQLException{
		return cartDao.mypagecountArticle(usernum);
	}
	//주문디테일 출력
	@Override
	public List<OrderListVo> mypageDetail(String o_ordernum,int nowPage, int scale) throws SQLException {
		return cartDao.mypageDetail(o_ordernum, nowPage, scale);
	}
	//주문디테일 갯수
	@Override
	public int countArticle(String o_ordernum) throws SQLException {
		return cartDao.countArticle(o_ordernum);
	}
	//비회원일때 주문조회체크
	@Override
	public HashMap<String, Object> chknouser(Map<String, Object> chkmap) throws SQLException {
		return cartDao.chknouser(chkmap);
	}
	//비회원 주문조회 디테일
	@Override
	public List<OrderListVo> nouserDetail(String o_ordernum, int nowPage, int scale) throws SQLException {
		return cartDao.nouserDetail(o_ordernum,nowPage,scale);
	}
	/**********************미현끝*********************************************************/
}
