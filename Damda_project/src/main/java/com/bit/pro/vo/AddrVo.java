package com.bit.pro.vo;

public class AddrVo {
	int usernum, addridx, userpostnum;
	String addrname, useraddr1, useraddr2;
	
	
	
	public int getUserpostnum() {
		return userpostnum;
	}

	public void setUserpostnum(int userpostnum) {
		this.userpostnum = userpostnum;
	}

	public AddrVo() {
	}

	public int getUsernum() {
		return usernum;
	}

	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}

	public String getAddrname() {
		return addrname;
	}

	public void setAddrname(String addrname) {
		this.addrname = addrname;
	}

	public String getUseraddr1() {
		return useraddr1;
	}

	public void setUseraddr1(String useraddr1) {
		this.useraddr1 = useraddr1;
	}

	public String getUseraddr2() {
		return useraddr2;
	}

	public void setUseraddr2(String useraddr2) {
		this.useraddr2 = useraddr2;
	}

	public int getAddridx() {
		return addridx;
	}

	public void setAddridx(int addridx) {
		this.addridx = addridx;
	}

	@Override
	public String toString() {
		return "AddrVo [usernum=" + usernum + ", addridx=" + addridx + ", userpostnum=" + userpostnum + ", addrname="
				+ addrname + ", useraddr1=" + useraddr1 + ", useraddr2=" + useraddr2 + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + addridx;
		result = prime * result + ((addrname == null) ? 0 : addrname.hashCode());
		result = prime * result + ((useraddr1 == null) ? 0 : useraddr1.hashCode());
		result = prime * result + ((useraddr2 == null) ? 0 : useraddr2.hashCode());
		result = prime * result + usernum;
		result = prime * result + userpostnum;
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
		AddrVo other = (AddrVo) obj;
		if (addridx != other.addridx)
			return false;
		if (addrname == null) {
			if (other.addrname != null)
				return false;
		} else if (!addrname.equals(other.addrname))
			return false;
		if (useraddr1 == null) {
			if (other.useraddr1 != null)
				return false;
		} else if (!useraddr1.equals(other.useraddr1))
			return false;
		if (useraddr2 == null) {
			if (other.useraddr2 != null)
				return false;
		} else if (!useraddr2.equals(other.useraddr2))
			return false;
		if (usernum != other.usernum)
			return false;
		if (userpostnum != other.userpostnum)
			return false;
		return true;
	}

	

	
	
	
	
}

 