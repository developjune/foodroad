package com.foodload.persistence;

import java.util.List;

import com.foodload.domain.Menu;

public interface MenuMapper {
	public List<Menu> list(Menu menu);
	public void insert(Menu menu);
	public void update(Menu menu);
	public void delete(Menu menu);
}
