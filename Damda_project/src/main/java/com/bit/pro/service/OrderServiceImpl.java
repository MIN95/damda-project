package com.bit.pro.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bit.pro.dao.OrderDao;
import com.bit.pro.vo.AddrVo;
import com.bit.pro.vo.CartVo;
import com.bit.pro.vo.OrderDataVo;
import com.bit.pro.vo.OrderDetailVo;
import com.bit.pro.vo.OrderVo;

@Service("orderSerivce")
public class OrderServiceImpl implements OrderService {

	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Resource(name="orderDao")
	OrderDao orderDao;
	
	//�ֹ��ϱ�
	@Override
	public List<OrderVo> selectOrder(int c_usernum) throws SQLException {
		return orderDao.selectOrder(c_usernum);
	}

	//��ȸ�� �ֹ�
	@Override
	public List<OrderVo> selectOrderNouser(String c_nousernum) throws SQLException {
		return orderDao.nouserOrder(c_nousernum);
	}

	@Override
	public List<AddrVo> selectAddr(int c_usernum) throws SQLException {
		return orderDao.selectAddr(c_usernum);
	}

	//�ּҷϿ� �ּ��߰�
	@Override
	public void insertAddr(AddrVo bean) throws SQLException {
		System.out.println("controller : " + bean.toString());
		orderDao.insertAddr(bean);
	}

	@Override
	public int countAddr(int usernum) throws SQLException {
		return orderDao.countAddr(usernum);
	}

	@Override
	public int deleteAddr(int usernum, int idx) throws SQLException {
		int result=orderDao.deleteAddr(usernum, idx);
		if(result>0) {System.out.println("����");}else {System.out.println("����");}
		return result;
		
	}

	@Override
	public OrderDataVo insertOrderData(OrderDataVo bean) throws SQLException {
		//ȸ��/��ȸ���� ���� insert
		String nousernum= bean.getCo_nousernum();
		int result = 0;
		if(nousernum==null) {
			//ȸ��
			result= orderDao.insertOrderData(bean);
		}else {
			//��ȸ��
			result = orderDao.insertOrderNouser(bean);
		}
		
		if(result>0) {
			System.out.println(bean.toString());
			String ordernum = bean.getOrdernum();
			OrderDataVo orderData = orderDao.selectOrderData(ordernum);
			return orderData;
		}else {
			System.out.println("�ֹ����� �Է� ����");
			
		}
		return null;
	}

	@Override
	public List<OrderDetailVo> selectOrderItem(String o_ordernum) throws SQLException {
		
		return orderDao.selectOrderItem(o_ordernum);
	}

	@Override
	public List<CartVo> selectCartItem(int co_usernum) throws Exception {
		
		return orderDao.selectCartItem(co_usernum);
	}
	
	@Override
	public List<CartVo> selectCartItemNouser(String co_nousernum) throws Exception {
		
		return orderDao.selectCartItemNouser(co_nousernum);
	}


	//ȸ��
	@Override
	public int insertOrderItem(int co_usernum, String ordernum, List<CartVo> noworder) throws SQLException {
		
		Map<String, String> map = new HashMap<String,String>();
		map.put("o_ordernum", ordernum);
		map.put("o_usernum",Integer.toString(co_usernum));
		int result=0;
		for(int i=0; i<noworder.size(); i++) {
			map.put("o_itemnum", Integer.toString(noworder.get(i).getC_itemNum()));
			map.put("o_cstmtnum", Integer.toString(noworder.get(i).getC_customNum()));
			map.put("o_ea", Integer.toString(noworder.get(i).getEa()));
			
			for(String key : map.keySet()) {
				System.out.println("key : "+key+"value:"+map.get(key));
			}
			
			if(noworder.get(i).getC_itemNum()<99990 && noworder.get(i).getC_itemNum()>0 ) {
				//99990 ���ϸ� ������
				result=orderDao.insertOrderItem(map);
			}else {
				//99991���͸� Ŀ����
				result=orderDao.insertOrderCustum(map);
			}
			
			if(result>0) {
				System.out.println("����");
			}
			
		}
		
		
		return result;
	}

	//��ȸ��
	@Override
	public int insertOrderItemNouser(String co_nousernum, String ordernum, List<CartVo> noworder) throws SQLException {
		Map<String, String> map = new HashMap<String,String>();
		map.put("o_ordernum", ordernum);
		map.put("o_nousernum",co_nousernum);
		int result=0;
		for(int i=0; i<noworder.size(); i++) {
			map.put("o_itemnum", Integer.toString(noworder.get(i).getC_itemNum()));
			map.put("o_cstmtnum", Integer.toString(noworder.get(i).getC_customNum()));
			map.put("o_ea", Integer.toString(noworder.get(i).getEa()));
			
			for(String key : map.keySet()) {
				System.out.println("key : "+key+"value:"+map.get(key));
			}
			
			if(noworder.get(i).getC_itemNum()<99990 && noworder.get(i).getC_itemNum()>0 ) {
				//99990 ���ϸ� ������
				result=orderDao.insertOrderItem(map);
			}else {
				//99991���͸� Ŀ����
				result=orderDao.insertOrderCustum(map);
			}
			
			if(result>0) {
				System.out.println("����");
			}
			
		}
		return result;
	}

	@Override
	public int deleteCart(int co_usernum) throws Exception {
		
		return orderDao.deleteCart(co_usernum);
	}


	@Override
	public void addUserbuy(int co_usernum, int adduserbuy) throws Exception {
		
		int myuserbuy = orderDao.selectUserbuy(co_usernum);
		myuserbuy += adduserbuy; // �ֹ��ݾ� ����
		System.out.println("���� �����ݾ�: "+myuserbuy+", ���� �ֹ� �ݾ� : " + adduserbuy);
		orderDao.updateUserbuy(myuserbuy, co_usernum); //�ֹ��ݾ� ������Ʈ
		
		//���� �ֹ��ݾ׿� ���� ȸ����� �����ϱ�
		int forgrade = orderDao.selectUserbuy(co_usernum); //������Ʈ �� �ݾ��� �޾ƿ�
		
		String grade="";
		int result=0;
		if(forgrade>=100000) {
			//ȸ����� �ǹ��� ����
			grade="silver";
			result= orderDao.updateGrade(grade, co_usernum);
		}else if (forgrade>200000) {
			grade="gold";
			result=orderDao.updateGrade(grade, co_usernum);
		}else if (forgrade>500000) {
			grade="vip";
			result=orderDao.updateGrade(grade, co_usernum);
		}
		
		if(result>0) {System.out.println("��� ���� ���� : " +grade);}
		
		
			
	}

	@Override
	public int insertOrderlist(String ordernum, int ordertype) throws Exception {
		int deliverstatus = 0;
		if(ordertype==2) {
			deliverstatus=2;
		}else {
			deliverstatus=3;
		}
		
		return orderDao.insertOrderlist(ordernum, deliverstatus);
	}
	
	@Override
	public int updateUseracc(Map<String, String> map) throws Exception {
		
		return orderDao.updateUseracc(map);
	}

	


	
}
