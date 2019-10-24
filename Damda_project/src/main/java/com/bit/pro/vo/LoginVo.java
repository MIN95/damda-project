package com.bit.pro.vo;

public class LoginVo {

	private int userNum;
	private String userId;
	private String userPw;
	private String userName;
	private	String userAddr1;
	private String userAddr2;
	private int userPostnum;
	private String userPhone;
	private String userEmail;
	private int userBuy;
	private String userAcc;
	private String userBank;
	private String userAccOwner;
	private String userGrade;
	private int category;
	private int userPoint;
	private String userbirth;
	
	
	//페이징
	private int page;
	private int startpoint;
	private int row;
		
	//아이템정렬 
	private String itemalign;
	
	public LoginVo() {
	}

	public LoginVo(int userNum, String userId, String userPw, String userName, String userAddr1, String userAddr2,
			int userPostnum, String userPhone, String userEmail, int userBuy, String userAcc, String userBank,
			String userAccOwner, String userGrade, int category, int userPoint, String userbirth, int page,
			int startpoint, int row, String itemalign) {
		super();
		this.userNum = userNum;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userAddr1 = userAddr1;
		this.userAddr2 = userAddr2;
		this.userPostnum = userPostnum;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userBuy = userBuy;
		this.userAcc = userAcc;
		this.userBank = userBank;
		this.userAccOwner = userAccOwner;
		this.userGrade = userGrade;
		this.category = category;
		this.userPoint = userPoint;
		this.userbirth = userbirth;
		this.page = page;
		this.startpoint = startpoint;
		this.row = row;
		this.itemalign = itemalign;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserAddr1() {
		return userAddr1;
	}

	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}

	public String getUserAddr2() {
		return userAddr2;
	}

	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}

	public int getUserPostnum() {
		return userPostnum;
	}

	public void setUserPostnum(int userPostnum) {
		this.userPostnum = userPostnum;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public int getUserBuy() {
		return userBuy;
	}

	public void setUserBuy(int userBuy) {
		this.userBuy = userBuy;
	}

	public String getUserAcc() {
		return userAcc;
	}

	public void setUserAcc(String userAcc) {
		this.userAcc = userAcc;
	}

	public String getUserBank() {
		return userBank;
	}

	public void setUserBank(String userBank) {
		this.userBank = userBank;
	}

	public String getUserAccOwner() {
		return userAccOwner;
	}

	public void setUserAccOwner(String userAccOwner) {
		this.userAccOwner = userAccOwner;
	}

	public String getUserGrade() {
		return userGrade;
	}

	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getUserPoint() {
		return userPoint;
	}

	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}

	public String getUserbirth() {
		return userbirth;
	}

	public void setUserbirth(String userbirth) {
		this.userbirth = userbirth;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
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

	@Override
	public String toString() {
		return "LoginVo [userNum=" + userNum + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
				+ ", userAddr1=" + userAddr1 + ", userAddr2=" + userAddr2 + ", userPostnum=" + userPostnum
				+ ", userPhone=" + userPhone + ", userEmail=" + userEmail + ", userBuy=" + userBuy + ", userAcc="
				+ userAcc + ", userBank=" + userBank + ", userAccOwner=" + userAccOwner + ", userGrade=" + userGrade
				+ ", category=" + category + ", userPoint=" + userPoint + ", userbirth=" + userbirth + ", page=" + page
				+ ", startpoint=" + startpoint + ", row=" + row + ", itemalign=" + itemalign + "]";
	}

	
}
