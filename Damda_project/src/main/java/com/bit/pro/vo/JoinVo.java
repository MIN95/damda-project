package com.bit.pro.vo;

public class JoinVo {
	private String userid, userpw, username, useraddr1, useraddr2, useremail,userbirth, userphone,useracc,userGrade, userbank, useraccowner;
	private int userpostnum,category;
	
	public JoinVo() {
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

	public String getUserbank() {
		return userbank;
	}

	public void setUserbank(String userbank) {
		this.userbank = userbank;
	}

	public String getUseraccowner() {
		return useraccowner;
	}

	public void setUseraccowner(String useraccowner) {
		this.useraccowner = useraccowner;
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
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + category;
		result = prime * result + ((userGrade == null) ? 0 : userGrade.hashCode());
		result = prime * result + ((useracc == null) ? 0 : useracc.hashCode());
		result = prime * result + ((useraccowner == null) ? 0 : useraccowner.hashCode());
		result = prime * result + ((useraddr1 == null) ? 0 : useraddr1.hashCode());
		result = prime * result + ((useraddr2 == null) ? 0 : useraddr2.hashCode());
		result = prime * result + ((userbank == null) ? 0 : userbank.hashCode());
		result = prime * result + ((userbirth == null) ? 0 : userbirth.hashCode());
		result = prime * result + ((useremail == null) ? 0 : useremail.hashCode());
		result = prime * result + ((userid == null) ? 0 : userid.hashCode());
		result = prime * result + ((username == null) ? 0 : username.hashCode());
		result = prime * result + ((userphone == null) ? 0 : userphone.hashCode());
		result = prime * result + userpostnum;
		result = prime * result + ((userpw == null) ? 0 : userpw.hashCode());
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
		JoinVo other = (JoinVo) obj;
		if (category != other.category)
			return false;
		if (userGrade == null) {
			if (other.userGrade != null)
				return false;
		} else if (!userGrade.equals(other.userGrade))
			return false;
		if (useracc == null) {
			if (other.useracc != null)
				return false;
		} else if (!useracc.equals(other.useracc))
			return false;
		if (useraccowner == null) {
			if (other.useraccowner != null)
				return false;
		} else if (!useraccowner.equals(other.useraccowner))
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
		if (userbank == null) {
			if (other.userbank != null)
				return false;
		} else if (!userbank.equals(other.userbank))
			return false;
		if (userbirth == null) {
			if (other.userbirth != null)
				return false;
		} else if (!userbirth.equals(other.userbirth))
			return false;
		if (useremail == null) {
			if (other.useremail != null)
				return false;
		} else if (!useremail.equals(other.useremail))
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
		if (userphone == null) {
			if (other.userphone != null)
				return false;
		} else if (!userphone.equals(other.userphone))
			return false;
		if (userpostnum != other.userpostnum)
			return false;
		if (userpw == null) {
			if (other.userpw != null)
				return false;
		} else if (!userpw.equals(other.userpw))
			return false;
		return true;
	}

	public JoinVo(String userid, String userpw, String username, String useraddr1, String useraddr2, String useremail,
			String userbirth, String userphone, String useracc, String userGrade, String userbank, String useraccowner,
			int userpostnum, int category) {
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
		this.userbank = userbank;
		this.useraccowner = useraccowner;
		this.userpostnum = userpostnum;
		this.category = category;
	}

	
	
	
}
