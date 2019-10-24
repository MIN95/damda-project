package com.bit.pro.vo;

public class AllItemVo {
	//allitem table
	private int category;
	private int itemPrice;
	private String itemName;
	private String itemCon;
	private int itemNum;
	private int itemStock;
	private int itemSales;
	
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
	
	//페이징
	private int p;
	private int startpoint;
	private int row;
	
	//아이템정렬 
	private String itemalign;
	
	//사진 폴더명
	private String ctgToadd;
	
	//관리자페이지 셀렉트 박스값
	private String selectVal;
	
	public AllItemVo() {}

	public AllItemVo(int category, int itemPrice, String itemName, String itemCon, int itemNum, int itemStock,
			int itemSales, int photoNum, String photoCtg, String photoCtg2, String photoPath, String photoName,
			String originalName, int p_itemNum, int p_ingredientNum, int p_reviewNum, int p_eventNum, int p_noticeNum,
			int p_qnaNum, int p_customNum, int p, int startpoint, int row, String itemalign, String ctgToadd,
			String selectVal) {
		super();
		this.category = category;
		this.itemPrice = itemPrice;
		this.itemName = itemName;
		this.itemCon = itemCon;
		this.itemNum = itemNum;
		this.itemStock = itemStock;
		this.itemSales = itemSales;
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
		this.p = p;
		this.startpoint = startpoint;
		this.row = row;
		this.itemalign = itemalign;
		this.ctgToadd = ctgToadd;
		this.selectVal = selectVal;
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

	public int getP() {
		return p;
	}

	public void setP(int p) {
		this.p = p;
	}

	public int getStartpoint() {
		return startpoint;
	}

	public void setStartpoint(int startpoint) {
		this.startpoint = startpoint;
	}

	public int getRow() {
		return row;
	}

	public void setRow(int row) {
		this.row = row;
	}

	public String getItemalign() {
		return itemalign;
	}

	public void setItemalign(String itemalign) {
		this.itemalign = itemalign;
	}

	public String getCtgToadd() {
		return ctgToadd;
	}

	public void setCtgToadd(String ctgToadd) {
		this.ctgToadd = ctgToadd;
	}

	public String getSelectVal() {
		return selectVal;
	}

	public void setSelectVal(String selectVal) {
		this.selectVal = selectVal;
	}

	@Override
	public String toString() {
		return "AllItemVo [category=" + category + ", itemPrice=" + itemPrice + ", itemName=" + itemName + ", itemCon="
				+ itemCon + ", itemNum=" + itemNum + ", itemStock=" + itemStock + ", itemSales=" + itemSales
				+ ", photoNum=" + photoNum + ", photoCtg=" + photoCtg + ", photoCtg2=" + photoCtg2 + ", photoPath="
				+ photoPath + ", photoName=" + photoName + ", originalName=" + originalName + ", p_itemNum=" + p_itemNum
				+ ", p_ingredientNum=" + p_ingredientNum + ", p_reviewNum=" + p_reviewNum + ", p_eventNum=" + p_eventNum
				+ ", p_noticeNum=" + p_noticeNum + ", p_qnaNum=" + p_qnaNum + ", p_customNum=" + p_customNum + ", p="
				+ p + ", startpoint=" + startpoint + ", row=" + row + ", itemalign=" + itemalign + ", ctgToadd="
				+ ctgToadd + ", selectVal=" + selectVal + "]";
	}
	
}
