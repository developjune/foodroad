package com.foodload.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.foodload.domain.Menu;
import com.foodload.persistence.MenuMapper;

@Service
public class MenuServiceImpl implements MenuService {
	@Resource
	private MenuMapper menuMapper;
	
	@Override
	public List<Menu> find(Menu menu) {
		return this.menuMapper.list(menu);
	}

	@Override
	public void add(Menu menu) {
		this.menuMapper.insert(menu);
	}

	@Override
	public void edit(Menu menu) {
		this.menuMapper.update(menu);
	}

	@Override
	public void remove(Menu menu) {
		this.menuMapper.delete(menu);
		
	}
}
