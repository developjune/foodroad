package com.foodload.domain;

import java.io.Serializable;

public class Page implements Serializable {
	private static final long serialVersionUID = 872779774172689012L;

	private int itemStartNo;
	private int itemEndNo;
	private String searchType;
	private String searchKeyword;

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public int getItemStartNo() {
		return itemStartNo;
	}

	public int getItemEndNo() {
		return itemEndNo;
	}

	public void setItemStartNo(int itemStartNo) {
		this.itemStartNo = itemStartNo;
	}

	public void setItemEndNo(int itemEndNo) {
		this.itemEndNo = itemEndNo;
	}
}
