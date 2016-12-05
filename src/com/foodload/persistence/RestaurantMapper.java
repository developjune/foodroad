package com.foodload.persistence;

import java.util.List;

import com.foodload.domain.Restaurant;

public interface RestaurantMapper {
	public List<Restaurant> list(Restaurant restaurant);
	public void insert(Restaurant restaurant);
	public void delete(int no);
	public void update(Restaurant restaurant);
	public int count(Restaurant restaurant);
	public List<Restaurant> listMap(Restaurant restaurant);
}
