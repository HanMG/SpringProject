package com.java.admin.dao;

import java.util.List;

import com.java.admin.dto.AdminFoodDto;
import com.java.admin.dto.AdminFoodReadDto;

public interface AdminDao {

	public AdminFoodDto foodCnt();

	public List<AdminFoodReadDto> foodReadRank();

	

}
