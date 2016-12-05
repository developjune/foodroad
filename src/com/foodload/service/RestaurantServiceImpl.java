package com.foodload.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.foodload.domain.Restaurant;
import com.foodload.persistence.MenuMapper;
import com.foodload.persistence.RestaurantMapper;

@Service
public class RestaurantServiceImpl implements RestaurantService {
	@Resource
	private RestaurantMapper restaurantMapper;
	
	@Resource
	private MenuMapper menuMapper;

	@Override
	public List<Restaurant> find(Restaurant restaurant) {
		return this.restaurantMapper.list(restaurant);
	}

	@Override
	public void add(Restaurant restaurant) {
		this.restaurantMapper.insert(restaurant);
	}

	@Override
	public void remove(int no) {
		this.restaurantMapper.delete(no);
	}

	@Override
	public void edit(Restaurant restaurant) {
		this.restaurantMapper.update(restaurant);
	}

	@Override
	public int count(Restaurant restaurant) {
		return this.restaurantMapper.count(restaurant);
	}

	@Override
	public List<Restaurant> findMap(Restaurant restaurant) {
		return this.restaurantMapper.listMap(restaurant);
	}
}
