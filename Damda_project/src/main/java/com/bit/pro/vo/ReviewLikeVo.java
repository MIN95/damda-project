package com.bit.pro.vo;

public class ReviewLikeVo {

	private int likeNum;
	private int like_userNum;
	private int like_status;
	private int like_reviewNum;
	
	public ReviewLikeVo() {	}

	public int getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}

	public int getLike_userNum() {
		return like_userNum;
	}

	public void setLike_userNum(int like_userNum) {
		this.like_userNum = like_userNum;
	}

	public int getLike_status() {
		return like_status;
	}

	public void setLike_status(int like_status) {
		this.like_status = like_status;
	}

	public int getLike_reviewNum() {
		return like_reviewNum;
	}

	public void setLike_reviewNum(int like_reviewNum) {
		this.like_reviewNum = like_reviewNum;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + likeNum;
		result = prime * result + like_reviewNum;
		result = prime * result + like_status;
		result = prime * result + like_userNum;
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
		ReviewLikeVo other = (ReviewLikeVo) obj;
		if (likeNum != other.likeNum)
			return false;
		if (like_reviewNum != other.like_reviewNum)
			return false;
		if (like_status != other.like_status)
			return false;
		if (like_userNum != other.like_userNum)
			return false;
		return true;
	}
	
	
	
	
}
