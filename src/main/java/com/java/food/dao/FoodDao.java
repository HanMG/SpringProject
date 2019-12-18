package com.java.food.dao;

import java.util.List;

import com.java.food.dto.FoodDto;
import com.java.food.dto.FoodReviewDto;

public interface FoodDao {

	public int foodInsert(FoodDto foodDto);

	public String foodMax();

	public FoodDto foodRead(String foodCode);

	public int foodDelete(String foodCode);

	public int foodUpdate(FoodDto foodDto);

	public void foodReadUpdate(String foodCode);

	public int foodReivewCount(String foodCode);

	public List<FoodReviewDto> foodReviewList(String foodCode);

}
