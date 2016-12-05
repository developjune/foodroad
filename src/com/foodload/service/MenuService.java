package com.foodload.service;

import java.util.List;

import com.foodload.domain.Menu;

public interface MenuService {
	public List<Menu> find(Menu menu);
	public void add(Menu menu);
	public void edit(Menu menu);
	public void remove(Menu menu);
}
