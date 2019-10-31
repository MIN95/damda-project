package com.bit.pro.vo;

public class MyRecipeVo {
	
	//MyRecipe table
	private int recipeNum;
	private int mr_customNum;
	private int mr_userNum;
	
	//custom table 
	private int cstmtNum;
	private int cstmPrice;
	private String cstmMatelist;
	
	
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
	
	
	//∆‰¿Ã¬°
	private int p;
	private int startpoint;
	private int row;
	
	public MyRecipeVo() {}

	public int getRecipeNum() {
		return recipeNum;
	}

	public void setRecipeNum(int recipeNum) {
		this.recipeNum = recipeNum;
	}

	public int getMr_customNum() {
		return mr_customNum;
	}

	public void setMr_customNum(int mr_customNum) {
		this.mr_customNum = mr_customNum;
	}

	public int getMr_userNum() {
		return mr_userNum;
	}

	public void setMr_userNum(int mr_userNum) {
		this.mr_userNum = mr_userNum;
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

	public MyRecipeVo(int recipeNum, int mr_customNum, int mr_userNum, int cstmtNum, int cstmPrice, String cstmMatelist,
			int photoNum, String photoCtg, String photoCtg2, String photoPath, String photoName, String originalName,
			int p_itemNum, int p_ingredientNum, int p_reviewNum, int p_eventNum, int p_noticeNum, int p_qnaNum,
			int p_customNum, int p, int startpoint, int row) {
		super();
		this.recipeNum = recipeNum;
		this.mr_customNum = mr_customNum;
		this.mr_userNum = mr_userNum;
		this.cstmtNum = cstmtNum;
		this.cstmPrice = cstmPrice;
		this.cstmMatelist = cstmMatelist;
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
	}

	
	
}
