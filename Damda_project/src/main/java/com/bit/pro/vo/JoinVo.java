package com.bit.pro.vo;

public class JoinVo {
	private String userid, userpw, username, useraddr1, useraddr2, useremail,userbirth, userphone,useracc,userGrade;
	private int userpostnum,category;
	
	public JoinVo() {
	}
	public JoinVo(String userid, String userpw, String username, String useraddr1, String useraddr2, String useremail,
			String userbirth, String userphone, String useracc, String userGrade, int userpostnum, int category) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.useraddr1 = useraddr1;
		this.useraddr2 = useraddr2;
		this.useremail = useremail;
		this.userbirth = userbirth;
		this.userphone = userphone;
		this.useracc = useracc;
		this.userGrade = userGrade;
		this.userpostnum = userpostnum;
		this.category = category;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getUserbirth() {
		return userbirth;
	}
	public void setUserbirth(String userbirth) {
		this.userbirth = userbirth;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public String getUseracc() {
		return useracc;
	}
	public void setUseracc(String useracc) {
		this.useracc = useracc;
	}
	public String getUserGrade() {
		return userGrade;
	}
	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}
	public int getUserpostnum() {
		return userpostnum;
	}
	public void setUserpostnum(int userpostnum) {
		this.userpostnum = userpostnum;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "JoinVo [userid=" + userid + ", userpw=" + userpw + ", username=" + username + ", useraddr1=" + useraddr1
				+ ", useraddr2=" + useraddr2 + ", useremail=" + useremail + ", userbirth=" + userbirth + ", userphone="
				+ userphone + ", useracc=" + useracc + ", userGrade=" + userGrade + ", userpostnum=" + userpostnum
				+ ", category=" + category + "]";
	}
	
}
