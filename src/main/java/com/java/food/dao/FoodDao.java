package com.java.food.dao;

import java.util.List;

import com.java.coupon.dto.CouponDto;
import com.java.food.dto.FoodDto;
import com.java.food.dto.FoodReviewDto;
import com.java.review.dto.ReviewCountDto;

public interface FoodDao {

	public int foodInsert(FoodDto foodDto);

	public String foodMax();

	public FoodDto foodRead(String foodCode);

	public int foodDelete(String foodCode);

	public int foodUpdate(FoodDto foodDto);

	public void foodReadUpdate(String foodCode);

	public ReviewCountDto foodReivewCount(String foodCode);

	public List<FoodReviewDto> foodReviewList(String foodCode, String selScore);

	public List<CouponDto> foodCouponList(String foodCode);

	public List<FoodReviewDto> reviewList(String foodCode);
	
	public float foodReviewAvg(String foodCode);

	public List<FoodDto> foodDtoList();

	public int foodFavorite(String foodCode);

}
