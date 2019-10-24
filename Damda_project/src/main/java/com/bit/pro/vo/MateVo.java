package com.bit.pro.vo;

public class MateVo {
	private int matenum;
	private String mateName;
	private int mateprice;
	private String matectg;
	private int salestatus;
	// photo.photoctg2, photo.p_ingredientnum, photo.photopath, 
	//photo.photoname, photo.originalname
	
	//detail¿¡¼­ ¾µ
	private String photoCtg2;
	private int p_ingredientNum;
	private String photoPath;
	private String photoName;
	private String originalName;
	private int photoNum;
		
	public MateVo(){
		
	}

	public int getMatenum() {
		return matenum;
	}

	public void setMatenum(int matenum) {
		this.matenum = matenum;
	}

	public String getMateName() {
		return mateName;
	}

	public void setMateName(String mateName) {
		this.mateName = mateName;
	}

	public int getMateprice() {
		return mateprice;
	}

	public void setMateprice(int mateprice) {
		this.mateprice = mateprice;
	}

	public String getMatectg() {
		return matectg;
	}

	public void setMatectg(String matectg) {
		this.matectg = matectg;
	}

	public int getSalestatus() {
		return salestatus;
	}

	public void setSalestatus(int salestatus) {
		this.salestatus = salestatus;
	}

	public String getPhotoCtg2() {
		return photoCtg2;
	}

	public void setPhotoCtg2(String photoCtg2) {
		this.photoCtg2 = photoCtg2;
	}

	public int getP_ingredientNum() {
		return p_ingredientNum;
	}

	public void setP_ingredientNum(int p_ingredientNum) {
		this.p_ingredientNum = p_ingredientNum;
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

	public int getPhotoNum() {
		return photoNum;
	}

	public int setPhotoNum(int photoNum) {
		return this.photoNum = photoNum;
	}

	@Override
	public String toString() {
		return "MateVo [matenum=" + matenum + ", mateName=" + mateName + ", mateprice=" + mateprice + ", matectg="
				+ matectg + ", salestatus=" + salestatus + ", photoCtg2=" + photoCtg2 + ", p_ingredientNum="
				+ p_ingredientNum + ", photoPath=" + photoPath + ", photoName=" + photoName + ", originalName="
				+ originalName + ", photoNum=" + photoNum + "]";
	}
	
	

	
	

}
