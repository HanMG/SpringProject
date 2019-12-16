package com.java.food.dao;

import com.java.food.dto.FoodDto;

public interface FoodDao {

	public int foodInsert(FoodDto foodDto);

	public String foodMax();

	public FoodDto foodRead(String foodCode);

	public int foodDelete(String foodCode);

	public int foodUpdate(FoodDto foodDto);

	public void foodReadUpdate(String foodCode);

}
