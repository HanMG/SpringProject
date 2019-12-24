package com.java.review.dao;

import java.util.List;

import com.java.review.dto.ReviewDto;

public interface ReviewDao {

	public int reviewInsertOk(ReviewDto reviewDto);

	public String getFoodName(String foodCode);

	public String getReviewCode();

	public ReviewDto reviewUpdate(String reviewCode);

	public int reviewUpdateOk(ReviewDto reviewDto);

	public int reviewDelete(String reviewCode);	

	public List<ReviewDto> reviewDtoList();

}
