package com.bit.pro.service;

import java.sql.SQLException;
import java.util.List;

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
	
	//detail ���� ��ٱ��� ��� 
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

	
	//��ٱ��� ���
	@Override
	public Model selectCart(Model model, int userNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_userNum(userNum);
		
		List<CartJoinVo> list = cartDao.selectCart_user(bean);
		System.out.println("list : "+list);
		model.addAttribute("List", list);
		return model;
	}

	//��ȸ�� ��ٱ��� ���
	@Override
	public Model selectCart_noUser(Model model, String noUser) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_nouserNum(noUser);
		
		List<CartJoinVo> list = cartDao.selectCart_noUser(bean);
		System.out.println("list : "+list);
		model.addAttribute("List", list);
		return model;
	}

	
	//��ȸ����ٱ��� -> ȸ����ٱ���(�ߺ��˻�)
	@Override
	public void noUser_updateCart(int c_userNum, String c_nouserNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_userNum(c_userNum);
		bean.setC_nouserNum(c_nouserNum);
		
		//��ȸ���̿��� �� ��ٱ���
		List<CartVo> noUser_ItemList = cartDao.noUser_compareCart(bean);
		System.out.println("noUser_ItemList: "+noUser_ItemList);
		
		//ȸ�� ��ٱ��� 
		List<CartVo> user_ItemList = cartDao.user_compareCart(bean);
		System.out.println("user_ItemList: "+user_ItemList);
		
		if(user_ItemList.size()>0 && noUser_ItemList.size()>0) {
			for (int i = 0; i < noUser_ItemList.size(); i++) {
				for(int j = 0; j < user_ItemList.size(); j++) {
					System.out.println("1. for�� ��ȸ�� �ߺ� ������ " +i+"��° :"+ noUser_ItemList.get(i).getC_itemNum());
					System.out.println("1. for�� ȸ�� �ߺ� ������ " +j+"��° :"+ user_ItemList.get(j).getC_itemNum());
					if(noUser_ItemList.get(i).getC_itemNum() == user_ItemList.get(j).getC_itemNum()) {
						System.out.println("1. if�� ��ȸ�� �ߺ� ������ " +i+"��° :"+ noUser_ItemList.get(i).getC_itemNum());
						System.out.println("1. if�� ȸ�� �ߺ� ������ " +j+"��° :"+ user_ItemList.get(j).getC_itemNum());
						//ȸ�� ��ٱ��� �����ۿ� 
						int itemNum = user_ItemList.get(j).getC_itemNum();
						System.out.println("1. if�� ȸ�� �ߺ� ������ " +j+"��° itemNum :"+ itemNum);
						
						//��ȸ���� �� ��ٱ����� ������ �߰�
						int ea = noUser_ItemList.get(i).getEa();
						System.out.println("1. if�� ȸ�� �ߺ� ������ " +i+"��° Ea :"+ ea);
						
						bean.setC_itemNum(itemNum);
						bean.setEa(ea);
						
						//���� �� ȸ����ٱ��� ������ �����߰� update
						cartDao.noUser_updateCart2(bean);
						
						//��ȸ�� ��ٱ��� �ߺ������� delete
						cartDao.noUser_deleteCart(bean);
						
					}else {
						int itemNum = noUser_ItemList.get(i).getC_itemNum();
						int customNum = noUser_ItemList.get(i).getC_customNum();
						System.out.println("1. �ߺ��ƴҶ� ��ȸ�� ��ٱ��� itemNum : "+itemNum);
						System.out.println("1. �ߺ��ƴҶ� ��ȸ�� ��ٱ��� customNum : "+customNum);
						bean.setC_itemNum(itemNum);
						bean.setC_customNum(customNum);
						
						//��ȸ�� -> ȸ����ٱ��� update
						cartDao.noUser_updateCart(bean);
						cartDao.noUser_updateCart3(bean);
						//��ȸ�� -> ȸ����ٱ��� ��ȸ������ ���� update
						cartDao.user_updateCart(bean);
						cartDao.user_updateCart2(bean);
					}
				}
			}
		}else if(user_ItemList.size()==0 && noUser_ItemList.size()>0) {
			for (int i = 0; i < noUser_ItemList.size(); i++) {
				System.out.println("2. for�� ��ȸ�� �ߺ� ������ " +i+"��° :"+ noUser_ItemList.get(i).getC_itemNum());
	
				int itemNum = noUser_ItemList.get(i).getC_itemNum();
				int customNum = noUser_ItemList.get(i).getC_customNum();
				System.out.println("2. �ߺ��ƴҶ� ��ȸ�� ��ٱ��� itemNum : "+itemNum);
				System.out.println("2. �ߺ��ƴҶ� ��ȸ�� ��ٱ��� customNum : "+customNum);
				bean.setC_itemNum(itemNum);
				bean.setC_customNum(customNum);				
				
				//��ȸ�� -> ȸ����ٱ��� update
				cartDao.noUser_updateCart(bean);
				cartDao.noUser_updateCart3(bean);
				//��ȸ�� -> ȸ����ٱ��� ��ȸ������ ���� update
				cartDao.user_updateCart(bean);
				cartDao.user_updateCart2(bean);
			}
		}else if(user_ItemList.size()>=0 && noUser_ItemList.size()==0) {
			System.out.println("3. ��ٱ��� �̵� �ʿ� ����");
		}
	}
	
	//ȸ�� ��ٱ��� ���� ����
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

	
	//��ȸ�� ��ٱ��� ���� ����
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

	//ȸ�� ��ٱ��� ����
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

	//��ȸ�� ��ٱ��� ����
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
	
	//ȸ�� ��ٱ��� �ߺ�Ȯ��
	@Override
	public Model user_compareCart(Model model, int userNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_userNum(userNum);
		
		List<CartVo> cartList = cartDao.user_compareCart(bean);
		model.addAttribute("cartList", cartList);
		return model;
	}

	//��ȸ�� ��ٱ��� �ߺ�Ȯ��
	@Override
	public Model noUser_compareCart(Model model, String nouserNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_nouserNum(nouserNum);
		
		List<CartVo> cartList = cartDao.noUser_compareCart(bean);
		model.addAttribute("cartList", cartList);
		return model;
	}

	//��ٱ��� �ߺ��� ���� update
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

	//Ŀ���� ���
	@Override
	public void myRecipeInsert(int userNum, int customNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_userNum(userNum);
		bean.setC_customNum(customNum);
		
		cartDao.myrecipeInsert(bean);
	}

	
	/**********************��������*********************************************************/
	//�ֹ��󼼳��� ���
	@Override
	public List<OrderListVo> mypageDetail(String o_ordernum,int nowPage, int scale) throws SQLException {
		return cartDao.mypageDetail(o_ordernum, nowPage, scale);
	}
	//�ֹ� ���ڵ� ����
	@Override
	public int countArticle() throws SQLException {
		return cartDao.countArticle();
	}
	/**********************������*********************************************************/
}
