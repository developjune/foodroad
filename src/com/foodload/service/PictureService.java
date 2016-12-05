package com.foodload.service;

import java.util.List;

import com.foodload.domain.Picture;

public interface PictureService {
	public List<Picture> find(Picture picture);
	public Picture view(Picture picture);
	public void add(Picture picture);
	public void removeAll(int[] nos);
}