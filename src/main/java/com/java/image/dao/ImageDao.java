package com.java.image.dao;

import com.java.image.dto.ImageDto;

public interface ImageDao {	

	public int imgInsert(ImageDto imageDto);

	public ImageDto imgRead(String foodCode);

	public int imgDelete(String foodCode);

	public int imgUpdate(ImageDto imageDto);
}
