package com.foodload.domain;

import java.io.Serializable;
import java.sql.Date;

public class Picture implements Serializable {
	private int no;
	private int menuNo;
	private String logicalName;
	private String physicalName;
	private Date registrationDate;
	
	public Picture() {
		
	}
	
	public Picture(int no, int menuNo, String logicalName, String physicalName, Date registrationDate) {
		this.no = no;
		this.logicalName = logicalName;
		this.physicalName = physicalName;
		this.menuNo = menuNo;
		this.registrationDate = registrationDate;
	}
	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getMenuNo() {
		return menuNo;
	}
	
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
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
