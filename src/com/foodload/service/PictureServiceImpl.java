package com.foodload.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.foodload.domain.Picture;
import com.foodload.persistence.PictureMapper;

@Service
public class PictureServiceImpl implements PictureService {
	private static String parentPath = "C:/Users/jsm/workspace/foodroad/WebContent/img";

	@Resource
	private PictureMapper pictureMapper;

	@Override
	public List<Picture> find(Picture picture) {
		return this.pictureMapper.list(picture);
	}

	@Override
	public Picture view(Picture picture) {
		return this.pictureMapper.select(picture);
	}

	@Override
	public void add(Picture picture) {
		this.pictureMapper.insert(picture);
	}

	@Override
	public void removeAll(int nos) {
		Picture picture = new Picture();
		picture.setNo(nos);

		picture = this.pictureMapper.select(picture);

		File file = new File(parentPath + "/" + picture.getLogicalName() + "_" + picture.getPhysicalName());
		file.delete();

		this.pictureMapper.delete(picture);
	}
}
