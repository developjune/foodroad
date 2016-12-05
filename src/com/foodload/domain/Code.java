package com.foodload.domain;

import java.io.Serializable;

public class Code implements Serializable {
	private String code;
	private String name;

	public Code() {
	}

	public Code(String code, String name) {
		this.code = code;
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
