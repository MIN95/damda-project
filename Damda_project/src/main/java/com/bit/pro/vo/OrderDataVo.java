package com.bit.pro.vo;

import java.sql.Date;

public class OrderDataVo {
	private int co_usernum, ordertype, price, delivertype, deliverpostnum, co_couponnum;
	private String ordernum, co_nousernum, nousername, refundaccowner, refundaccount, orderpw, receivername, bank, deliveraddr, receiverphone, nouserphone;
	private Date orderdate, deliverdate;
	
	public OrderDataVo() {
		toString();
	}



	public int getCo_couponnum() {
		return co_couponnum;
	}



	public void setCo_couponnum(int co_couponnum) {
		this.co_couponnum = co_couponnum;
	}



	/**
	 * @param receivername the receivername to set
	 */
	public void setReceivername(String receivername) {
		this.receivername = receivername;
	}


	/**
	 * @return the co_usernum
	 */
	public int getCo_usernum() {
		return co_usernum;
	}

	/**
	 * @return the ordertype
	 */
	public int getOrdertype() {
		return ordertype;
	}

	/**
	 * @return the price
	 */
	public int getPrice() {
		return price;
	}

	/**
	 * @return the delivertype
	 */
	public int getDelivertype() {
		return delivertype;
	}

	/**
	 * @return the deliverpostnum
	 */
	public int getDeliverpostnum() {
		return deliverpostnum;
	}

	/**
	 * @return the ordernum
	 */
	public String getOrdernum() {
		return ordernum;
	}

	/**
	 * @return the co_nousernum
	 */
	public String getCo_nousernum() {
		return co_nousernum;
	}

	/**
	 * @return the nousername
	 */
	public String getNousername() {
		return nousername;
	}

	/**
	 * @return the refundaccowner
	 */
	public String getRefundaccowner() {
		return refundaccowner;
	}

	/**
	 * @return the refundaccount
	 */
	public String getRefundaccount() {
		return refundaccount;
	}

	/**
	 * @return the orderpw
	 */
	public String getOrderpw() {
		return orderpw;
	}

	/**
	 * @return the recievername
	 */
	public String getReceivername() {
		return receivername;
	}

	/**
	 * @return the bank
	 */
	public String getBank() {
		return bank;
	}

	/**
	 * @return the deliveraddr
	 */
	public String getDeliveraddr() {
		return deliveraddr;
	}

	/**
	 * @return the receiverphone
	 */
	public String getReceiverphone() {
		return receiverphone;
	}

	/**
	 * @return the nouserphone
	 */
	public String getNouserphone() {
		return nouserphone;
	}

	/**
	 * @return the deliverdate
	 */
	public Date getDeliverdate() {
		return deliverdate;
	}

	/**
	 * @return the orderdate
	 */
	public Date getOrderdate() {
		return orderdate;
	}

	/**
	 * @param co_usernum the co_usernum to set
	 */
	public void setCo_usernum(int co_usernum) {
		this.co_usernum = co_usernum;
	}

	/**
	 * @param ordertype the ordertype to set
	 */
	public void setOrdertype(int ordertype) {
		this.ordertype = ordertype;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(int price) {
		this.price = price;
	}

	/**
	 * @param delivertype the delivertype to set
	 */
	public void setDelivertype(int delivertype) {
		this.delivertype = delivertype;
	}

	/**
	 * @param deliverpostnum the deliverpostnum to set
	 */
	public void setDeliverpostnum(int deliverpostnum) {
		this.deliverpostnum = deliverpostnum;
	}

	/**
	 * @param ordernum the ordernum to set
	 */
	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}

	/**
	 * @param co_nousernum the co_nousernum to set
	 */
	public void setCo_nousernum(String co_nousernum) {
		this.co_nousernum = co_nousernum;
	}

	/**
	 * @param nousername the nousername to set
	 */
	public void setNousername(String nousername) {
		this.nousername = nousername;
	}

	/**
	 * @param refundaccowner the refundaccowner to set
	 */
	public void setRefundaccowner(String refundaccowner) {
		this.refundaccowner = refundaccowner;
	}

	/**
	 * @param refundaccount the refundaccount to set
	 */
	public void setRefundaccount(String refundaccount) {
		this.refundaccount = refundaccount;
	}

	/**
	 * @param orderpw the orderpw to set
	 */
	public void setOrderpw(String orderpw) {
		this.orderpw = orderpw;
	}

	/**
	 * @param recievername the recievername to set
	 */
	public void setRecievername(String recievername) {
		this.receivername = recievername;
	}

	/**
	 * @param bank the bank to set
	 */
	public void setBank(String bank) {
		this.bank = bank;
	}

	/**
	 * @param deliveraddr the deliveraddr to set
	 */
	public void setDeliveraddr(String deliveraddr) {
		this.deliveraddr = deliveraddr;
	}

	/**
	 * @param receiverphone the receiverphone to set
	 */
	public void setReceiverphone(String receiverphone) {
		this.receiverphone = receiverphone;
	}

	/**
	 * @param nouserphone the nouserphone to set
	 */
	public void setNouserphone(String nouserphone) {
		this.nouserphone = nouserphone;
	}

	/**
	 * @param deliverdate the deliverdate to set
	 */
	public void setDeliverdate(Date deliverdate) {
		this.deliverdate = deliverdate;
	}

	/**
	 * @param orderdate the orderdate to set
	 */
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}


	@Override
	public String toString() {
		return "OrderDataVo [co_usernum=" + co_usernum + ", ordertype=" + ordertype + ", price=" + price
				+ ", delivertype=" + delivertype + ", deliverpostnum=" + deliverpostnum + ", co_couponnum="
				+ co_couponnum + ", ordernum=" + ordernum + ", co_nousernum=" + co_nousernum + ", nousername="
				+ nousername + ", refundaccowner=" + refundaccowner + ", refundaccount=" + refundaccount + ", orderpw="
				+ orderpw + ", receivername=" + receivername + ", bank=" + bank + ", deliveraddr=" + deliveraddr
				+ ", receiverphone=" + receiverphone + ", nouserphone=" + nouserphone + ", orderdate=" + orderdate
				+ ", deliverdate=" + deliverdate + "]";
	}

	



	
	

	
	
	
	
	
}
