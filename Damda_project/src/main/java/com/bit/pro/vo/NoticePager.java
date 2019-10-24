package com.bit.pro.vo;

public class NoticePager {
	//�������� �Խù� ��
	public static final int PAGE_SCALE = 10;
	private int limit;
	
	//ȭ�� �� ������ ��
	public static final double BLOCK_SCALE = 5.0;
	
	//���� ������
	private int curPage;
	//��ü ������ ����
	private int totPage;
	//��ü ������ ��� ����
	private int totBlock;
	//���� ������ ���
	private int curBlock; 
	//���� ������ ���
	private int prevBlock;
	//���� ������ ���
	private int nextBlock;
	
	//���� ������ ����� ���۹�ȣ
	private int blockBegin;
	//���� ������ ����� �� ��ȣ
	private int blockEnd;
	
	//������
	public NoticePager(int count, int curPage,int limit){
		//���� ������ ����
		this.curPage = curPage;
		//��ü ������ ���� ���
		setTotPage(count,limit);
		//��ü ������ ��� ���� ���
		setTotBlock();
		//������ ����� ����,�� ��ȣ ���
		setBlockRange();
	}

	private void setBlockRange() {
	  //���� �������� ���° ������ ��Ͽ� ���ϴ��� ���
		//(����������-1)/��������ϴ���+1
		//1������ -> 1��� (1-1)/10 +1 = 1
		curBlock = (int)Math.ceil((curPage-1) / BLOCK_SCALE)+1;
			
	  //������ ����� ���۹�ȣ ���
		if(curPage==1 || curPage==2) {
			blockBegin = 1;
		}else if(curPage == totPage-1) {
			blockBegin = totPage-4;
		}else {
			blockBegin = (int)(curPage - (BLOCK_SCALE-1)/2);
		}
		
	  //������ ����� ����ȣ ���
		blockEnd = (int)(blockBegin+(BLOCK_SCALE-1));
	  //������ ����� ������ �ʰ����� �ʵ��� ���
		if(blockEnd > totPage) blockEnd = totPage;
	}
	
	
	//getter/setter
	public int getCurPage() {
		return curPage;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int count,int limit) {
		// Math.ceil(�Ǽ�) �ø� ó��
		totPage = (int) Math.ceil(count*1.0 / limit);
	}

	public int getTotBlock() {
		return totBlock;
	}
	
	public void setTotBlock() {
		// ��ü ������ ���� / 10
		totBlock = (int)Math.ceil(totPage / BLOCK_SCALE);
	}
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getPrevBlock() {
		return prevBlock;
	}
	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}
	public int getNextBlock() {
		return nextBlock;
	}
	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}
	public int getBlockBegin() {
		return blockBegin;
	}
	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}
	public int getBlockEnd() {
		return blockEnd;
	}
	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}
	
}