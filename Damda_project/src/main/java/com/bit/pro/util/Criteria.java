package com.bit.pro.util;

public class Criteria {
	
	//현재 페이지 번호
	private int page;
	//한페이지당 보여줄 게시글의 갯수
    private int perPageNum;
    //특정페이지 값 유지
    private String selectVal;
    

	//특정 페이지의 게시글 시작번호,게시글 시작 행 번호
    public int getPageStart() {
        return (this.page-1)*perPageNum;
    }
    
    public Criteria() {
    	//기본 생성자
        this.page = 1;
        this.perPageNum = 10;
    }
    
    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        if(page <= 0) {
            this.page = 1;
        } else {
            this.page = page;
        }
    }
    public int getPerPageNum() {
        return perPageNum;
    }
    public void setPerPageNum(int pageCount) {
    	//페이지당 보여줄 게시글 수가 변하지 않게 설정(10개)
        int cnt = this.perPageNum;
        if(pageCount != cnt) {
            this.perPageNum = cnt;
        } else {
            this.perPageNum = pageCount;
        }
    }

	public String getSelectVal() {
		return selectVal;
	}

	public void setSelectVal(String selectVal) {
		this.selectVal = selectVal;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", selectVal=" + selectVal + "]";
	}

    
}