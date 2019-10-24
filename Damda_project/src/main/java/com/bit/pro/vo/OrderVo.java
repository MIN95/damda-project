package com.bit.pro.vo;

import java.util.List;

public class OrderVo {
	private int cartnum;
	private int c_usernum;
	private String c_nousernum;
	private int c_itemnum;
	private int c_customnum;
	private int ea;
	private int cartcheck;
	
	
	//allitem
	private String itemname;
	private int itemprice;
	private String itemcon;
	
	//custom
	private String cstmmatelist;
	private int cstmprice;
	
	public OrderVo() {
		// TODO Auto-generated constructor stub
	}

	public OrderVo(int cartnum, int c_usernum, String c_nousernum, int c_itemnum, int c_customnum, int ea,
			int cartcheck, String itemname, int itemprice, String itemcon, String cstmmatelist, int cstmprice) {
		super();
		this.cartnum = cartnum;
		this.c_usernum = c_usernum;
		this.c_nousernum = c_nousernum;
		this.c_itemnum = c_itemnum;
		this.c_customnum = c_customnum;
		this.ea = ea;
		this.cartcheck = cartcheck;
		this.itemname = itemname;
		this.itemprice = itemprice;
		this.itemcon = itemcon;
		this.cstmmatelist = cstmmatelist;
		this.cstmprice = cstmprice;
	}

	public int getCartnum() {
		return cartnum;
	}

	public void setCartnum(int cartnum) {
		this.cartnum = cartnum;
	}

	public int getC_usernum() {
		return c_usernum;
	}

	public void setC_usernum(int c_usernum) {
		this.c_usernum = c_usernum;
	}

	public String getC_nousernum() {
		return c_nousernum;
	}

	public void setC_nousernum(String c_nousernum) {
		this.c_nousernum = c_nousernum;
	}

	public int getC_itemnum() {
		return c_itemnum;
	}

	public void setC_itemnum(int c_itemnum) {
		this.c_itemnum = c_itemnum;
	}

	public int getC_customnum() {
		return c_customnum;
	}

	public void setC_customnum(int c_customnum) {
		this.c_customnum = c_customnum;
	}

	public int getEa() {
		return ea;
	}

	public void setEa(int ea) {
		this.ea = ea;
	}

	public int getCartcheck() {
		return cartcheck;
	}

	public void setCartcheck(int cartcheck) {
		this.cartcheck = cartcheck;
	}
	
	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public int getItemprice() {
		return itemprice;
	}

	public void setItemprice(int itemprice) {
		this.itemprice = itemprice;
	}

	public String getItemcon() {
		return itemcon;
	}

	public void setItemcon(String itemcon) {
		this.itemcon = itemcon;
	}

	public String getCstmmatelist() {
		return cstmmatelist;
	}

	public void setCstmmatelist(String cstmmatelist) {
		this.cstmmatelist = cstmmatelist;
	}

	public int getCstmprice() {
		return cstmprice;
	}

	public void setCstmprice(int cstmprice) {
		this.cstmprice = cstmprice;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + c_customnum;
		result = prime * result + c_itemnum;
		result = prime * result + ((c_nousernum == null) ? 0 : c_nousernum.hashCode());
		result = prime * result + c_usernum;
		result = prime * result + cartcheck;
		result = prime * result + cartnum;
		result = prime * result + ((cstmmatelist == null) ? 0 : cstmmatelist.hashCode());
		result = prime * result + cstmprice;
		result = prime * result + ea;
		result = prime * result + ((itemcon == null) ? 0 : itemcon.hashCode());
		result = prime * result + ((itemname == null) ? 0 : itemname.hashCode());
		result = prime * result + itemprice;
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
		OrderVo other = (OrderVo) obj;
		if (c_customnum != other.c_customnum)
			return false;
		if (c_itemnum != other.c_itemnum)
			return false;
		if (c_nousernum == null) {
			if (other.c_nousernum != null)
				return false;
		} else if (!c_nousernum.equals(other.c_nousernum))
			return false;
		if (c_usernum != other.c_usernum)
			return false;
		if (cartcheck != other.cartcheck)
			return false;
		if (cartnum != other.cartnum)
			return false;
		if (cstmmatelist == null) {
			if (other.cstmmatelist != null)
				return false;
		} else if (!cstmmatelist.equals(other.cstmmatelist))
			return false;
		if (cstmprice != other.cstmprice)
			return false;
		if (ea != other.ea)
			return false;
		if (itemcon == null) {
			if (other.itemcon != null)
				return false;
		} else if (!itemcon.equals(other.itemcon))
			return false;
		if (itemname == null) {
			if (other.itemname != null)
				return false;
		} else if (!itemname.equals(other.itemname))
			return false;
		if (itemprice != other.itemprice)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "OrderVo [cartnum=" + cartnum + ", c_usernum=" + c_usernum + ", c_nousernum=" + c_nousernum
				+ ", c_itemnum=" + c_itemnum + ", c_customnum=" + c_customnum + ", ea=" + ea + ", cartcheck="
				+ cartcheck + ", itemname=" + itemname + ", itemprice=" + itemprice + ", itemcon=" + itemcon
				+ ", cstmmatelist=" + cstmmatelist + ", cstmprice=" + cstmprice + "]";
	}
}
