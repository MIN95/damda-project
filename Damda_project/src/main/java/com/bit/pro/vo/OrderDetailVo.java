package com.bit.pro.vo;

public class OrderDetailVo {
	private int orderlistnum, o_usernum, o_itemnum, o_cstmtnum, o_ea;
	private String o_ordernum,o_nousernum;
	
	
	
	public int getOrderlistnum() {
		return orderlistnum;
	}
	public void setOrderlistnum(int orderlistnum) {
		this.orderlistnum = orderlistnum;
	}
	public int getO_usernum() {
		return o_usernum;
	}
	public void setO_usernum(int o_usernum) {
		this.o_usernum = o_usernum;
	}
	public int getO_itemnum() {
		return o_itemnum;
	}
	public void setO_itemnum(int o_itemnum) {
		this.o_itemnum = o_itemnum;
	}
	public int getO_cstmtnum() {
		return o_cstmtnum;
	}
	public void setO_cstmtnum(int o_cstmtnum) {
		this.o_cstmtnum = o_cstmtnum;
	}
	public int getO_ea() {
		return o_ea;
	}
	public void setO_ea(int o_ea) {
		this.o_ea = o_ea;
	}
	public String getO_ordernum() {
		return o_ordernum;
	}
	public void setO_ordernum(String o_ordernum) {
		this.o_ordernum = o_ordernum;
	}
	public String getO_nousernum() {
		return o_nousernum;
	}
	public void setO_nousernum(String o_nousernum) {
		this.o_nousernum = o_nousernum;
	}
	
	@Override
	public String toString() {
		return "OrderListUser [orderlistnum=" + orderlistnum + ", o_usernum=" + o_usernum + ", o_itemnum=" + o_itemnum
				+ ", o_cstmtnum=" + o_cstmtnum + ", o_ea=" + o_ea + ", o_ordernum=" + o_ordernum + ", o_nousernum="
				+ o_nousernum + "]";
	}
	
	
	
	
	
	
	
}
