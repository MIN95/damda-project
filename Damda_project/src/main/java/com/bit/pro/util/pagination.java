package com.bit.pro.util;

public class pagination {
	
	private int listSize=20;
	private int listSize_event = 3;
	private int rangeSize=10;
	private int page;
	private int range;
	private int listCnt;
	private int pageCnt;
	private int startPage;
	private int startList;
	private int endPage;
	private boolean prev;
	private boolean next;	
	private String matectg;
	private int salestatus;
	
	public int getRangeSize() {

		return rangeSize;

	}



	public int getPage() {

		return page;

	}



	public void setPage(int page) {

		this.page = page;

	}



	public int getRange() {

		return range;

	}



	public void setRange(int range) {

		this.range = range;

	}



	public int getStartPage() {

		return startPage;

	}



	public void setStartPage(int startPage) {

		this.startPage = startPage;

	}



	public int getEndPage() {

		return endPage;

	}



	public void setEndPage(int endPage) {

		this.endPage = endPage;

	}



	public boolean isPrev() {

		return prev;

	}



	public void setPrev(boolean prev) {

		this.prev = prev;

	}



	public boolean isNext() {

		return next;

	}



	public void setNext(boolean next) {

		this.next = next;

	}



	public int getListSize() {

		return listSize;

	}



	public void setListSize(int listSize) {

		this.listSize = listSize;

	}
	public int getListSize_event() {

		return listSize_event;

	}



	public void setListSize_event(int listSize_event) {

		this.listSize_event = listSize_event;

	}

	

	public int getListCnt() {

		return listCnt;

	}



	public void setListCnt(int listCnt) {

		this.listCnt = listCnt;

	}

	public int getStartList() {

		return startList;

	}
	public String getMatectg() {
		return matectg;
	}
		
	public int getSalestatus() {
		return salestatus;
	}
	
	public void pageInfo(int page, int range, int listCnt,String matectg) {
		this.matectg = matectg;
		//����������, ��������������, �Խù� �� ����
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		//��ü �������� 
		this.pageCnt = (int) Math.ceil((double)listCnt/listSize);
		//���� ������
		this.startPage = (range - 1) * rangeSize + 1;
		//�� ������
		this.endPage = range * rangeSize;
    	//�Խ��� ���۹�ȣ
		this.startList = (page - 1) * listSize;
		
		//���� ��ư ����
		this.prev = range == 1 ? false : true;
		//���� ��ư ����
		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
		System.out.println(page+"/"+range+"/"+listCnt+"/"+pageCnt+"/"+startPage+"/"+endPage+"/"+startList+"/"+listSize);
	}
	
	public void pageInfo2(int page, int range, int listCnt) {
		//����������, ��������������, �Խù� �� ����
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		//��ü �������� 
		this.pageCnt = (int) Math.ceil((double)listCnt/listSize_event);
		//���� ������
		this.startPage = (range - 1) * rangeSize + 1 ;
		//�� ������
		this.endPage = range * rangeSize;
    	//�Խ��� ���۹�ȣ
		this.startList = (page - 1) * listSize_event;
		//���� ��ư ����
		this.prev = range == 1 ? false : true;
		//���� ��ư ����
		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
		System.out.println(page+"/"+range+"/"+listCnt+"/"+pageCnt+"/"+startPage+"/"+endPage+"/"+startList+"/"+listSize_event);
	}
	
	public void pageInfo3(int page, int range, int listCnt,int salestatus) {
		this.salestatus = salestatus;
		//����������, ��������������, �Խù� �� ����
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		//��ü �������� 
		this.pageCnt = (int) Math.ceil((double)listCnt/listSize);
		//���� ������
		this.startPage = (range - 1) * rangeSize + 1;
		//�� ������
		this.endPage = range * rangeSize;
    	//�Խ��� ���۹�ȣ
		this.startList = (page - 1) * listSize;
		
		//���� ��ư ����
		this.prev = range == 1 ? false : true;
		//���� ��ư ����
		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
		System.out.println(page+"/"+range+"/"+listCnt+"/"+pageCnt+"/"+startPage+"/"+endPage+"/"+startList+"/"+listSize);
	}

}
