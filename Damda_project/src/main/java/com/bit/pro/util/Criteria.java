package com.bit.pro.util;

public class Criteria {
	
	//���� ������ ��ȣ
	private int page;
	//���������� ������ �Խñ��� ����
    private int perPageNum;
    //Ư�������� �� ����
    private String selectVal;
    

	//Ư�� �������� �Խñ� ���۹�ȣ,�Խñ� ���� �� ��ȣ
    public int getPageStart() {
        return (this.page-1)*perPageNum;
    }
    
    public Criteria() {
    	//�⺻ ������
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
    	//�������� ������ �Խñ� ���� ������ �ʰ� ����(10��)
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