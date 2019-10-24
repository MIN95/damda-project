package com.bit.pro.vo;

public class CartJoinVo {
	//inner join (allitem, custom, photo, cart)
	private int userNum;
	private int cartNum;
	private int itemNum;
	private String itemName;
	private int itemPrice;
	private String itemPhotoName;
	private String itemPhotoCtg;
	private int customNum;
	private int customPrice;
	private String customPhotoName;
	private String customPhotoCtg;
	private String cstmMateList;
	private int ea;
	
	public CartJoinVo() {}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public int getCartNum() {
		return cartNum;
	}

	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getItemPhotoName() {
		return itemPhotoName;
	}

	public void setItemPhotoName(String itemPhotoName) {
		this.itemPhotoName = itemPhotoName;
	}

	public String getItemPhotoCtg() {
		return itemPhotoCtg;
	}

	public void setItemPhotoCtg(String itemPhotoCtg) {
		this.itemPhotoCtg = itemPhotoCtg;
	}

	public int getCustomNum() {
		return customNum;
	}

	public void setCustomNum(int customNum) {
		this.customNum = customNum;
	}

	public int getCustomPrice() {
		return customPrice;
	}

	public void setCustomPrice(int customPrice) {
		this.customPrice = customPrice;
	}

	public String getCustomPhotoName() {
		return customPhotoName;
	}

	public void setCustomPhotoName(String customPhotoName) {
		this.customPhotoName = customPhotoName;
	}

	public String getCustomPhotoCtg() {
		return customPhotoCtg;
	}

	public void setCustomPhotoCtg(String customPhotoCtg) {
		this.customPhotoCtg = customPhotoCtg;
	}

	public String getCstmMateList() {
		return cstmMateList;
	}

	public void setCstmMateList(String cstmMateList) {
		this.cstmMateList = cstmMateList;
	}

	public int getEa() {
		return ea;
	}

	public void setEa(int ea) {
		this.ea = ea;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cartNum;
		result = prime * result + ((cstmMateList == null) ? 0 : cstmMateList.hashCode());
		result = prime * result + customNum;
		result = prime * result + ((customPhotoCtg == null) ? 0 : customPhotoCtg.hashCode());
		result = prime * result + ((customPhotoName == null) ? 0 : customPhotoName.hashCode());
		result = prime * result + customPrice;
		result = prime * result + ea;
		result = prime * result + ((itemName == null) ? 0 : itemName.hashCode());
		result = prime * result + itemNum;
		result = prime * result + ((itemPhotoCtg == null) ? 0 : itemPhotoCtg.hashCode());
		result = prime * result + ((itemPhotoName == null) ? 0 : itemPhotoName.hashCode());
		result = prime * result + itemPrice;
		result = prime * result + userNum;
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
		CartJoinVo other = (CartJoinVo) obj;
		if (cartNum != other.cartNum)
			return false;
		if (cstmMateList == null) {
			if (other.cstmMateList != null)
				return false;
		} else if (!cstmMateList.equals(other.cstmMateList))
			return false;
		if (customNum != other.customNum)
			return false;
		if (customPhotoCtg == null) {
			if (other.customPhotoCtg != null)
				return false;
		} else if (!customPhotoCtg.equals(other.customPhotoCtg))
			return false;
		if (customPhotoName == null) {
			if (other.customPhotoName != null)
				return false;
		} else if (!customPhotoName.equals(other.customPhotoName))
			return false;
		if (customPrice != other.customPrice)
			return false;
		if (ea != other.ea)
			return false;
		if (itemName == null) {
			if (other.itemName != null)
				return false;
		} else if (!itemName.equals(other.itemName))
			return false;
		if (itemNum != other.itemNum)
			return false;
		if (itemPhotoCtg == null) {
			if (other.itemPhotoCtg != null)
				return false;
		} else if (!itemPhotoCtg.equals(other.itemPhotoCtg))
			return false;
		if (itemPhotoName == null) {
			if (other.itemPhotoName != null)
				return false;
		} else if (!itemPhotoName.equals(other.itemPhotoName))
			return false;
		if (itemPrice != other.itemPrice)
			return false;
		if (userNum != other.userNum)
			return false;
		return true;
	}

	
}
