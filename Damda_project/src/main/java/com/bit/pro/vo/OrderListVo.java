package com.bit.pro.vo;

import java.sql.Date;

public class OrderListVo {
   private int orderlistnum;
   private String o_ordernum;
   private int o_usernum;
   private String o_nousernum;
   private int o_itemnum;
   private int o_cstmtnum;
   private int o_ea;
   
   private Date orderdate;

   //allitem table
   private int category;
   private int itemPrice;
   private String itemName;
   private String itemCon;
   private int itemNum;
   private int itemStock;
   private int itemSales;

   //custom table 
   private int cstmtNum;
   private int cstmPrice;
   private String cstmMatelist;
   
   //ordermanage
   private int deliverstatus;
   
   //photo table
   private int photoNum;
   private String photoCtg;
   private String photoCtg2;
   private String photoPath;
   private String photoName;
   private String originalName;
   private int p_itemNum;
   private int p_ingredientNum;
   private int p_reviewNum;
   private int p_eventNum;
   private int p_noticeNum;
   private int p_qnaNum;
   private int p_customNum;
   
   //가격합계
   private String allprice;
   
   //bbsnum
   private int bbsnum;
   
   //userinfo
   private String username;
   private String userid;
   
   //cart
   private String nousername;
   private String co_nousernum;
   private String receivername;
   private int receiverphone;
   private String bank;
   private String refundaccount;
   private String refundaccowner;
   
   //review
   private int reviewnum;
   
   public OrderListVo() {}

public int getOrderlistnum() {
	return orderlistnum;
}

public void setOrderlistnum(int orderlistnum) {
	this.orderlistnum = orderlistnum;
}

public String getO_ordernum() {
	return o_ordernum;
}

public void setO_ordernum(String o_ordernum) {
	this.o_ordernum = o_ordernum;
}

public int getO_usernum() {
	return o_usernum;
}

public void setO_usernum(int o_usernum) {
	this.o_usernum = o_usernum;
}

public String getO_nousernum() {
	return o_nousernum;
}

public void setO_nousernum(String o_nousernum) {
	this.o_nousernum = o_nousernum;
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

public Date getOrderdate() {
	return orderdate;
}

public void setOrderdate(Date orderdate) {
	this.orderdate = orderdate;
}

public int getCategory() {
	return category;
}

public void setCategory(int category) {
	this.category = category;
}

public int getItemPrice() {
	return itemPrice;
}

public void setItemPrice(int itemPrice) {
	this.itemPrice = itemPrice;
}

public String getItemName() {
	return itemName;
}

public void setItemName(String itemName) {
	this.itemName = itemName;
}

public String getItemCon() {
	return itemCon;
}

public void setItemCon(String itemCon) {
	this.itemCon = itemCon;
}

public int getItemNum() {
	return itemNum;
}

public void setItemNum(int itemNum) {
	this.itemNum = itemNum;
}

public int getItemStock() {
	return itemStock;
}

public void setItemStock(int itemStock) {
	this.itemStock = itemStock;
}

public int getItemSales() {
	return itemSales;
}

public void setItemSales(int itemSales) {
	this.itemSales = itemSales;
}

public int getCstmtNum() {
	return cstmtNum;
}

public void setCstmtNum(int cstmtNum) {
	this.cstmtNum = cstmtNum;
}

public int getCstmPrice() {
	return cstmPrice;
}

public void setCstmPrice(int cstmPrice) {
	this.cstmPrice = cstmPrice;
}

public String getCstmMatelist() {
	return cstmMatelist;
}

public void setCstmMatelist(String cstmMatelist) {
	this.cstmMatelist = cstmMatelist;
}

public int getDeliverstatus() {
	return deliverstatus;
}

public void setDeliverstatus(int deliverstatus) {
	this.deliverstatus = deliverstatus;
}

public int getPhotoNum() {
	return photoNum;
}

public void setPhotoNum(int photoNum) {
	this.photoNum = photoNum;
}

public String getPhotoCtg() {
	return photoCtg;
}

public void setPhotoCtg(String photoCtg) {
	this.photoCtg = photoCtg;
}

public String getPhotoCtg2() {
	return photoCtg2;
}

public void setPhotoCtg2(String photoCtg2) {
	this.photoCtg2 = photoCtg2;
}

public String getPhotoPath() {
	return photoPath;
}

public void setPhotoPath(String photoPath) {
	this.photoPath = photoPath;
}

public String getPhotoName() {
	return photoName;
}

public void setPhotoName(String photoName) {
	this.photoName = photoName;
}

public String getOriginalName() {
	return originalName;
}

public void setOriginalName(String originalName) {
	this.originalName = originalName;
}

public int getP_itemNum() {
	return p_itemNum;
}

public void setP_itemNum(int p_itemNum) {
	this.p_itemNum = p_itemNum;
}

public int getP_ingredientNum() {
	return p_ingredientNum;
}

public void setP_ingredientNum(int p_ingredientNum) {
	this.p_ingredientNum = p_ingredientNum;
}

public int getP_reviewNum() {
	return p_reviewNum;
}

public void setP_reviewNum(int p_reviewNum) {
	this.p_reviewNum = p_reviewNum;
}

public int getP_eventNum() {
	return p_eventNum;
}

public void setP_eventNum(int p_eventNum) {
	this.p_eventNum = p_eventNum;
}

public int getP_noticeNum() {
	return p_noticeNum;
}

public void setP_noticeNum(int p_noticeNum) {
	this.p_noticeNum = p_noticeNum;
}

public int getP_qnaNum() {
	return p_qnaNum;
}

public void setP_qnaNum(int p_qnaNum) {
	this.p_qnaNum = p_qnaNum;
}

public int getP_customNum() {
	return p_customNum;
}

public void setP_customNum(int p_customNum) {
	this.p_customNum = p_customNum;
}

public String getAllprice() {
	return allprice;
}

public void setAllprice(String allprice) {
	this.allprice = allprice;
}

public int getBbsnum() {
	return bbsnum;
}

public void setBbsnum(int bbsnum) {
	this.bbsnum = bbsnum;
}

public String getUsername() {
	return username;
}

public void setUsername(String username) {
	this.username = username;
}

public String getUserid() {
	return userid;
}

public void setUserid(String userid) {
	this.userid = userid;
}

public String getNousername() {
	return nousername;
}

public void setNousername(String nousername) {
	this.nousername = nousername;
}

public String getCo_nousernum() {
	return co_nousernum;
}

public void setCo_nousernum(String co_nousernum) {
	this.co_nousernum = co_nousernum;
}

public String getReceivername() {
	return receivername;
}

public void setReceivername(String receivername) {
	this.receivername = receivername;
}

public int getReceiverphone() {
	return receiverphone;
}

public void setReceiverphone(int receiverphone) {
	this.receiverphone = receiverphone;
}

public String getBank() {
	return bank;
}

public void setBank(String bank) {
	this.bank = bank;
}

public String getRefundaccount() {
	return refundaccount;
}

public void setRefundaccount(String refundaccount) {
	this.refundaccount = refundaccount;
}

public String getRefundaccowner() {
	return refundaccowner;
}

public void setRefundaccowner(String refundaccowner) {
	this.refundaccowner = refundaccowner;
}

public int getReviewnum() {
	return reviewnum;
}

public void setReviewnum(int reviewnum) {
	this.reviewnum = reviewnum;
}

@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((allprice == null) ? 0 : allprice.hashCode());
	result = prime * result + ((bank == null) ? 0 : bank.hashCode());
	result = prime * result + bbsnum;
	result = prime * result + category;
	result = prime * result + ((co_nousernum == null) ? 0 : co_nousernum.hashCode());
	result = prime * result + ((cstmMatelist == null) ? 0 : cstmMatelist.hashCode());
	result = prime * result + cstmPrice;
	result = prime * result + cstmtNum;
	result = prime * result + deliverstatus;
	result = prime * result + ((itemCon == null) ? 0 : itemCon.hashCode());
	result = prime * result + ((itemName == null) ? 0 : itemName.hashCode());
	result = prime * result + itemNum;
	result = prime * result + itemPrice;
	result = prime * result + itemSales;
	result = prime * result + itemStock;
	result = prime * result + ((nousername == null) ? 0 : nousername.hashCode());
	result = prime * result + o_cstmtnum;
	result = prime * result + o_ea;
	result = prime * result + o_itemnum;
	result = prime * result + ((o_nousernum == null) ? 0 : o_nousernum.hashCode());
	result = prime * result + ((o_ordernum == null) ? 0 : o_ordernum.hashCode());
	result = prime * result + o_usernum;
	result = prime * result + ((orderdate == null) ? 0 : orderdate.hashCode());
	result = prime * result + orderlistnum;
	result = prime * result + ((originalName == null) ? 0 : originalName.hashCode());
	result = prime * result + p_customNum;
	result = prime * result + p_eventNum;
	result = prime * result + p_ingredientNum;
	result = prime * result + p_itemNum;
	result = prime * result + p_noticeNum;
	result = prime * result + p_qnaNum;
	result = prime * result + p_reviewNum;
	result = prime * result + ((photoCtg == null) ? 0 : photoCtg.hashCode());
	result = prime * result + ((photoCtg2 == null) ? 0 : photoCtg2.hashCode());
	result = prime * result + ((photoName == null) ? 0 : photoName.hashCode());
	result = prime * result + photoNum;
	result = prime * result + ((photoPath == null) ? 0 : photoPath.hashCode());
	result = prime * result + ((receivername == null) ? 0 : receivername.hashCode());
	result = prime * result + receiverphone;
	result = prime * result + ((refundaccount == null) ? 0 : refundaccount.hashCode());
	result = prime * result + ((refundaccowner == null) ? 0 : refundaccowner.hashCode());
	result = prime * result + reviewnum;
	result = prime * result + ((userid == null) ? 0 : userid.hashCode());
	result = prime * result + ((username == null) ? 0 : username.hashCode());
	return result;
}

@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	OrderListVo other = (OrderListVo) obj;
	if (allprice == null) {
		if (other.allprice != null)
			return false;
	} else if (!allprice.equals(other.allprice))
		return false;
	if (bank == null) {
		if (other.bank != null)
			return false;
	} else if (!bank.equals(other.bank))
		return false;
	if (bbsnum != other.bbsnum)
		return false;
	if (category != other.category)
		return false;
	if (co_nousernum == null) {
		if (other.co_nousernum != null)
			return false;
	} else if (!co_nousernum.equals(other.co_nousernum))
		return false;
	if (cstmMatelist == null) {
		if (other.cstmMatelist != null)
			return false;
	} else if (!cstmMatelist.equals(other.cstmMatelist))
		return false;
	if (cstmPrice != other.cstmPrice)
		return false;
	if (cstmtNum != other.cstmtNum)
		return false;
	if (deliverstatus != other.deliverstatus)
		return false;
	if (itemCon == null) {
		if (other.itemCon != null)
			return false;
	} else if (!itemCon.equals(other.itemCon))
		return false;
	if (itemName == null) {
		if (other.itemName != null)
			return false;
	} else if (!itemName.equals(other.itemName))
		return false;
	if (itemNum != other.itemNum)
		return false;
	if (itemPrice != other.itemPrice)
		return false;
	if (itemSales != other.itemSales)
		return false;
	if (itemStock != other.itemStock)
		return false;
	if (nousername == null) {
		if (other.nousername != null)
			return false;
	} else if (!nousername.equals(other.nousername))
		return false;
	if (o_cstmtnum != other.o_cstmtnum)
		return false;
	if (o_ea != other.o_ea)
		return false;
	if (o_itemnum != other.o_itemnum)
		return false;
	if (o_nousernum == null) {
		if (other.o_nousernum != null)
			return false;
	} else if (!o_nousernum.equals(other.o_nousernum))
		return false;
	if (o_ordernum == null) {
		if (other.o_ordernum != null)
			return false;
	} else if (!o_ordernum.equals(other.o_ordernum))
		return false;
	if (o_usernum != other.o_usernum)
		return false;
	if (orderdate == null) {
		if (other.orderdate != null)
			return false;
	} else if (!orderdate.equals(other.orderdate))
		return false;
	if (orderlistnum != other.orderlistnum)
		return false;
	if (originalName == null) {
		if (other.originalName != null)
			return false;
	} else if (!originalName.equals(other.originalName))
		return false;
	if (p_customNum != other.p_customNum)
		return false;
	if (p_eventNum != other.p_eventNum)
		return false;
	if (p_ingredientNum != other.p_ingredientNum)
		return false;
	if (p_itemNum != other.p_itemNum)
		return false;
	if (p_noticeNum != other.p_noticeNum)
		return false;
	if (p_qnaNum != other.p_qnaNum)
		return false;
	if (p_reviewNum != other.p_reviewNum)
		return false;
	if (photoCtg == null) {
		if (other.photoCtg != null)
			return false;
	} else if (!photoCtg.equals(other.photoCtg))
		return false;
	if (photoCtg2 == null) {
		if (other.photoCtg2 != null)
			return false;
	} else if (!photoCtg2.equals(other.photoCtg2))
		return false;
	if (photoName == null) {
		if (other.photoName != null)
			return false;
	} else if (!photoName.equals(other.photoName))
		return false;
	if (photoNum != other.photoNum)
		return false;
	if (photoPath == null) {
		if (other.photoPath != null)
			return false;
	} else if (!photoPath.equals(other.photoPath))
		return false;
	if (receivername == null) {
		if (other.receivername != null)
			return false;
	} else if (!receivername.equals(other.receivername))
		return false;
	if (receiverphone != other.receiverphone)
		return false;
	if (refundaccount == null) {
		if (other.refundaccount != null)
			return false;
	} else if (!refundaccount.equals(other.refundaccount))
		return false;
	if (refundaccowner == null) {
		if (other.refundaccowner != null)
			return false;
	} else if (!refundaccowner.equals(other.refundaccowner))
		return false;
	if (reviewnum != other.reviewnum)
		return false;
	if (userid == null) {
		if (other.userid != null)
			return false;
	} else if (!userid.equals(other.userid))
		return false;
	if (username == null) {
		if (other.username != null)
			return false;
	} else if (!username.equals(other.username))
		return false;
	return true;
}

@Override
public String toString() {
	return "OrderListVo [orderlistnum=" + orderlistnum + ", o_ordernum=" + o_ordernum + ", o_usernum=" + o_usernum
			+ ", o_nousernum=" + o_nousernum + ", o_itemnum=" + o_itemnum + ", o_cstmtnum=" + o_cstmtnum + ", o_ea="
			+ o_ea + ", orderdate=" + orderdate + ", category=" + category + ", itemPrice=" + itemPrice + ", itemName="
			+ itemName + ", itemCon=" + itemCon + ", itemNum=" + itemNum + ", itemStock=" + itemStock + ", itemSales="
			+ itemSales + ", cstmtNum=" + cstmtNum + ", cstmPrice=" + cstmPrice + ", cstmMatelist=" + cstmMatelist
			+ ", deliverstatus=" + deliverstatus + ", photoNum=" + photoNum + ", photoCtg=" + photoCtg + ", photoCtg2="
			+ photoCtg2 + ", photoPath=" + photoPath + ", photoName=" + photoName + ", originalName=" + originalName
			+ ", p_itemNum=" + p_itemNum + ", p_ingredientNum=" + p_ingredientNum + ", p_reviewNum=" + p_reviewNum
			+ ", p_eventNum=" + p_eventNum + ", p_noticeNum=" + p_noticeNum + ", p_qnaNum=" + p_qnaNum
			+ ", p_customNum=" + p_customNum + ", allprice=" + allprice + ", bbsnum=" + bbsnum + ", username="
			+ username + ", userid=" + userid + ", nousername=" + nousername + ", co_nousernum=" + co_nousernum
			+ ", receivername=" + receivername + ", receiverphone=" + receiverphone + ", bank=" + bank
			+ ", refundaccount=" + refundaccount + ", refundaccowner=" + refundaccowner + ", reviewnum=" + reviewnum
			+ "]";
}

public OrderListVo(int orderlistnum, String o_ordernum, int o_usernum, String o_nousernum, int o_itemnum,
		int o_cstmtnum, int o_ea, Date orderdate, int category, int itemPrice, String itemName, String itemCon,
		int itemNum, int itemStock, int itemSales, int cstmtNum, int cstmPrice, String cstmMatelist, int deliverstatus,
		int photoNum, String photoCtg, String photoCtg2, String photoPath, String photoName, String originalName,
		int p_itemNum, int p_ingredientNum, int p_reviewNum, int p_eventNum, int p_noticeNum, int p_qnaNum,
		int p_customNum, String allprice, int bbsnum, String username, String userid, String nousername,
		String co_nousernum, String receivername, int receiverphone, String bank, String refundaccount,
		String refundaccowner, int reviewnum) {
	super();
	this.orderlistnum = orderlistnum;
	this.o_ordernum = o_ordernum;
	this.o_usernum = o_usernum;
	this.o_nousernum = o_nousernum;
	this.o_itemnum = o_itemnum;
	this.o_cstmtnum = o_cstmtnum;
	this.o_ea = o_ea;
	this.orderdate = orderdate;
	this.category = category;
	this.itemPrice = itemPrice;
	this.itemName = itemName;
	this.itemCon = itemCon;
	this.itemNum = itemNum;
	this.itemStock = itemStock;
	this.itemSales = itemSales;
	this.cstmtNum = cstmtNum;
	this.cstmPrice = cstmPrice;
	this.cstmMatelist = cstmMatelist;
	this.deliverstatus = deliverstatus;
	this.photoNum = photoNum;
	this.photoCtg = photoCtg;
	this.photoCtg2 = photoCtg2;
	this.photoPath = photoPath;
	this.photoName = photoName;
	this.originalName = originalName;
	this.p_itemNum = p_itemNum;
	this.p_ingredientNum = p_ingredientNum;
	this.p_reviewNum = p_reviewNum;
	this.p_eventNum = p_eventNum;
	this.p_noticeNum = p_noticeNum;
	this.p_qnaNum = p_qnaNum;
	this.p_customNum = p_customNum;
	this.allprice = allprice;
	this.bbsnum = bbsnum;
	this.username = username;
	this.userid = userid;
	this.nousername = nousername;
	this.co_nousernum = co_nousernum;
	this.receivername = receivername;
	this.receiverphone = receiverphone;
	this.bank = bank;
	this.refundaccount = refundaccount;
	this.refundaccowner = refundaccowner;
	this.reviewnum = reviewnum;
}
}