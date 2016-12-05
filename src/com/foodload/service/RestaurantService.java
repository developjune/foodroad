package com.foodload.service;

import java.util.List;
import java.util.Map;

import com.foodload.domain.Menu;
import com.foodload.domain.Restaurant;

public interface RestaurantService {
	public List<Restaurant> find(Restaurant restaurant);
	public void add(Restaurant restaurant);
	public void remove(int no);
	public void edit(Restaurant restaurant);
	public int count(Restaurant restaurant);
	public List<Restaurant> findMap(Restaurant restaurant);
}
