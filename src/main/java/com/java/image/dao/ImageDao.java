package com.java.image.dao;

import java.util.List;

import com.java.image.dto.ImageDto;


public interface ImageDao {	

	public int imgInsert(ImageDto imageDto);

	public ImageDto imgRead(String foodCode);

	public int imgDelete(String foodCode);

	public int imgUpdate(ImageDto imageDto);

	public int imgInsertReview(ImageDto imageDto);

	public List<ImageDto> imgList(String reviewCode);	
	
	public ImageDto imgSelect(ImageDto imageDelDto);

	public int imgSelectDelete(ImageDto imageDto);	
	
	public int couponImageInsert(ImageDto imageDto);

}
