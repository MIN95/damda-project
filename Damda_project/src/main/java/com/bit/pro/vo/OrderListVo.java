package com.bit.pro.vo;

public class OrderListVo {
	private int orderlistnum;
	private int o_itemnum;
	private int o_cstmtnum;
	private String o_ordernum;
	private int price;
	
	//allitem
	private String itemname;

	//custom
	private String cstmmatelist;
	
	//ordermanage
	private int deliverstatus;
	
	//photo
	private String photopath;
	
	//가격합계
	private String allprice;
	
	//bbsnum
	private int bbsnum;
	
	//userinfo
	private String username;
	private String userid;
	
	public OrderListVo() {
		// TODO Auto-generated constructor stub
	}

	public OrderListVo(int orderlistnum, int o_itemnum, int o_cstmtnum, String o_ordernum, int price, String itemname
				,String cstmmatelist,int deliverstatus,String photopath,String allprice,int bbsnum,String username,String userid) {
		super();
		this.orderlistnum = orderlistnum;
		this.o_itemnum = o_itemnum;
		this.o_cstmtnum = o_cstmtnum;
		this.o_ordernum = o_ordernum;
		this.price = price;
		this.itemname = itemname;
		this.cstmmatelist = cstmmatelist;
		this.deliverstatus = deliverstatus;
		this.photopath = photopath;
		this.allprice = allprice;
		this.bbsnum = bbsnum;
		this.username = username;
		this.userid = userid;
	}

	public int getOrderlistnum() {
		return orderlistnum;
	}

	public void setOrderlistnum(int orderlistnum) {
		this.orderlistnum = orderlistnum;
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

	public String getO_ordernum() {
		return o_ordernum;
	}

	public void setO_ordernum(String o_ordernum) {
		this.o_ordernum = o_ordernum;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	
	public String getCstmmatelist() {
		return cstmmatelist;
	}

	public void setCstmmatelist(String cstmmatelist) {
		this.cstmmatelist = cstmmatelist;
	}

	public int getDeliverstatus() {
		return deliverstatus;
	}

	public void setDeliverstatus(int deliverstatus) {
		this.deliverstatus = deliverstatus;
	}

	public String getPhotopath() {
		return photopath;
	}

	public void setPhotopath(String photopath) {
		this.photopath = photopath;
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((allprice == null) ? 0 : allprice.hashCode());
		result = prime * result + bbsnum;
		result = prime * result + ((cstmmatelist == null) ? 0 : cstmmatelist.hashCode());
		result = prime * result + deliverstatus;
		result = prime * result + ((itemname == null) ? 0 : itemname.hashCode());
		result = prime * result + o_cstmtnum;
		result = prime * result + o_itemnum;
		result = prime * result + ((o_ordernum == null) ? 0 : o_ordernum.hashCode());
		result = prime * result + orderlistnum;
		result = prime * result + ((photopath == null) ? 0 : photopath.hashCode());
		result = prime * result + price;
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
		if (bbsnum != other.bbsnum)
			return false;
		if (cstmmatelist == null) {
			if (other.cstmmatelist != null)
				return false;
		} else if (!cstmmatelist.equals(other.cstmmatelist))
			return false;
		if (deliverstatus != other.deliverstatus)
			return false;
		if (itemname == null) {
			if (other.itemname != null)
				return false;
		} else if (!itemname.equals(other.itemname))
			return false;
		if (o_cstmtnum != other.o_cstmtnum)
			return false;
		if (o_itemnum != other.o_itemnum)
			return false;
		if (o_ordernum == null) {
			if (other.o_ordernum != null)
				return false;
		} else if (!o_ordernum.equals(other.o_ordernum))
			return false;
		if (orderlistnum != other.orderlistnum)
			return false;
		if (photopath == null) {
			if (other.photopath != null)
				return false;
		} else if (!photopath.equals(other.photopath))
			return false;
		if (price != other.price)
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
		return "OrderListVo [orderlistnum=" + orderlistnum + ", o_itemnum=" + o_itemnum + ", o_cstmtnum=" + o_cstmtnum
				+ ", o_ordernum=" + o_ordernum + ", price=" + price + ", itemname=" + itemname + ", cstmmatelist="
				+ cstmmatelist + ", deliverstatus=" + deliverstatus + ", photopath=" + photopath + ", allprice="
				+ allprice + ", bbsnum=" + bbsnum + ", username=" + username + ", userid=" + userid + "]";
	}
}
