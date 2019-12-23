package com.java.search.dao;

import java.util.List;

import com.java.search.dto.SearchCouponDto;
import com.java.search.dto.SearchFoodDto;

public interface SearchDao {

	int foodCount(String keyword);

	List<SearchFoodDto> foodList(String keyword, int startRow, int endRow);

	int couponCount(String keyword);

	List<SearchCouponDto> couponList(String keyword);

	List<SearchFoodDto> tagList(String tagValue, String tagType);

	List<SearchFoodDto> keywordList(String keyword);

}
