package com.foodload.domain;

import java.io.Serializable;

public class Paging implements Serializable {
	private int pageSize; // �� �������� ���� �Խñ� ��
	private int firstPageNo; // ù ��° ������ ��ȣ
	private int prevPageNo; // ���� ������ ��ȣ
	private int startPageNo; // ���� ������ (����¡ �׺� ����)
	private int pageNo; // ������ ��ȣ
	private int endPageNo; // �� ������ (����¡ �׺� ����)
	private int nextPageNo; // ���� ������ ��ȣ
	private int finalPageNo; // ������ ������ ��ȣ
	private int totalRecord; // �Խñ� ��ü ��
	private int blockSize; // ������ ��ȣ ��ũ ����
	private int startRowNum; // �Խñ� ��ȸ ������ �� row ������
	private int endRowNum; // �Խñ� ��ȸ ������ �� row ����
	private String keyword;
	
	public Paging() {
	}

	public Paging(int pageSize, int firstPageNo, int prevPageNo, int startPageNo, int pageNo, int endPageNo,
			int nextPageNo, int finalPageNo, int totalRecord, int blockSize, int startRowNum, int endRowNum,
			String keyword) {
		this.pageSize = pageSize;
		this.firstPageNo = firstPageNo;
		this.prevPageNo = prevPageNo;
		this.startPageNo = startPageNo;
		this.pageNo = pageNo;
		this.endPageNo = endPageNo;
		this.nextPageNo = nextPageNo;
		this.finalPageNo = finalPageNo;
		this.totalRecord = totalRecord;
		this.blockSize = blockSize;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.keyword = keyword;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFirstPageNo() {
		return firstPageNo;
	}

	public void setFirstPageNo(int firstPageNo) {
		this.firstPageNo = firstPageNo;
	}

	public int getPrevPageNo() {
		return prevPageNo;
	}

	public void setPrevPageNo(int prevPageNo) {
		this.prevPageNo = prevPageNo;
	}

	public int getStartPageNo() {
		return startPageNo;
	}

	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
		
		this.setEndRowNum(pageNo * pageSize);
		this.setStartRowNum(endRowNum - (pageSize - 1));
	}

	public int getEndPageNo() {
		return endPageNo;
	}

	public void setEndPageNo(int endPageNo) {
		this.endPageNo = endPageNo;
	}

	public int getNextPageNo() {
		return nextPageNo;
	}

	public void setNextPageNo(int nextPageNo) {
		this.nextPageNo = nextPageNo;
	}

	public int getFinalPageNo() {
		return finalPageNo;
	}

	public void setFinalPageNo(int finalPageNo) {
		this.finalPageNo = finalPageNo;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		this.makePaging();
	}
	
	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	
	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	private void makePaging() {
		if (this.totalRecord == 0)
			return; // �Խñ� ��ü ���� ���� ���
		if (this.pageNo == 0)
			this.setPageNo(1); // �⺻ �� ����
		if (this.pageSize == 0)
			this.setPageSize(10); // �⺻ �� ����

		int finalPage = (totalRecord + (pageSize - 1)) / pageSize; // ������ ������
		if (this.pageNo > finalPage)
			this.setPageNo(finalPage); // �⺻ �� ����

		if (this.pageNo < 0 || this.pageNo > finalPage)
			this.pageNo = 1; // ���� ������ ��ȿ�� üũ

		boolean isNowFirst = pageNo == 1 ? true : false; // ���� ������ (��ü)
		boolean isNowFinal = pageNo == finalPage ? true : false; // ������ ������ (��ü)

		int startPage = ((pageNo - 1) / blockSize) * blockSize + 1; // ���� ������ (����¡ �׺� ����)
		int endPage = startPage + blockSize - 1; // �� ������ (����¡ �׺� ����)

		if (endPage > finalPage) { // [������ ������ (����¡ �׺� ����) > ������ ������]���� ū ���
			endPage = finalPage;
		}

		this.setFirstPageNo(1); // ù ��° ������ ��ȣ

		if (isNowFirst) {
			this.setPrevPageNo(1); // ���� ������ ��ȣ
		} else {
			this.setPrevPageNo(((pageNo - 1) < 1 ? 1 : (pageNo - 1))); // ���� ������ ��ȣ
		}

		this.setStartPageNo(startPage); // ���� ������ (����¡ �׺� ����)
		this.setEndPageNo(endPage); // �� ������ (����¡ �׺� ����)

		if (isNowFinal) {
			this.setNextPageNo(finalPage); // ���� ������ ��ȣ
		} else {
			this.setNextPageNo(((pageNo + 1) > finalPage ? finalPage : (pageNo + 1))); // ���� ������ ��ȣ
		}

		this.setFinalPageNo(finalPage); // ������ ������ ��ȣ
	}
}
