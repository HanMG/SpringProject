package com.java.review.dao;

import com.java.review.dto.ReviewDto;

public interface ReviewDao {

	public int reviewInsertOk(ReviewDto reviewDto);

	public String getFoodName(String foodCode);

}
