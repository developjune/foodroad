package com.foodload.domain;

import java.io.Serializable;
import java.sql.Date;

public class Picture implements Serializable {
	private int no;
	private int restaurantNo;
	private String logicalName;
	private String physicalName;
	private Date registrationDate;
	
	public Picture() {
		
	}
	
	public Picture(int no, int restaurantNo, String logicalName, String physicalName, Date registrationDate) {
		this.no = no;
		this.logicalName = logicalName;
		this.physicalName = physicalName;
		this.restaurantNo = restaurantNo;
		this.registrationDate = registrationDate;
	}
	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getRestaurantNo() {
		return restaurantNo;
	}
	
	public void setRestaurantNo(int restaurantNo) {
		this.restaurantNo = restaurantNo;
	}
	
	public String getLogicalName() {
		return logicalName;
	}
	
	public void setLogicalName(String logicalName) {
		this.logicalName = logicalName;
	}
	
	public String getPhysicalName() {
		return physicalName;
	}
	
	public void setPhysicalName(String physicalName) {
		this.physicalName = physicalName;
	}
	
	public Date getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}
}
