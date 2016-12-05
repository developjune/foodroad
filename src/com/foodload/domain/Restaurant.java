package com.foodload.domain;

import java.io.Serializable;
import java.util.List;

public class Restaurant extends Page implements Serializable {
	private int no;
	private String name;
	private double xCoordinate;
	private double yCoordinate;
	private String address;
	private String tel;
	private int rowNum;
	private int type;
	
	private List<Menu> menus;
	
	public Restaurant() {
		
	}

	public Restaurant(int no, String name, double xCoordinate, double yCoordinate, String address, String tel,
			 int rowNum, int type, List<Menu> menus) {
		this.no = no;
		this.name = name;
		this.xCoordinate = xCoordinate;
		this.yCoordinate = yCoordinate;
		this.address = address;
		this.tel = tel;
		this.rowNum = rowNum;
		this.type = type;
		this.menus = menus;
	}

	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public double getxCoordinate() {
		return xCoordinate;
	}
	
	public void setxCoordinate(double xCoordinate) {
		this.xCoordinate = xCoordinate;
	}
	
	public double getyCoordinate() {
		return yCoordinate;
	}
	
	public void setyCoordinate(double yCoordinate) {
		this.yCoordinate = yCoordinate;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
	public List<Menu> getMenus() {
		return menus;
	}

	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}
}
