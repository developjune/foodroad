package com.foodload.domain;

import java.io.Serializable;

public class Menu implements Serializable {
	private int no;
	private String name;
	private String type;
	private int price;
	private int restaurantNo;
	private String restaurantName;
	private double xCoordinate;
	private double yCoordinate;
	private String tel;

	public Menu() {
		
	}
	
	public Menu(int no, String name, String type, int price, int restaurantNo, String restaurantName, 
			double xCoordinate, double yCoordinate, String tel) {
		this.no = no;
		this.name = name;
		this.type = type;
		this.price = price;
		this.restaurantNo = restaurantNo;
		this.restaurantName = restaurantName;
		this.xCoordinate = xCoordinate;
		this.yCoordinate = yCoordinate;
		this.tel = tel;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
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
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getRestaurantNo() {
		return restaurantNo;
	}
	
	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}
	
	public String getRestaurantName() {
		return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
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
}
