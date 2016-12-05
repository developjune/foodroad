package com.foodload.persistence;

import java.util.List;

import com.foodload.domain.Picture;

public interface PictureMapper {
	public List<Picture> list(Picture picture);
	public Picture select(Picture picture);
	public void insert(Picture picture);
	public void delete(Picture picture);
}
