package com.java.admin.dao;


import java.util.List;

import org.springframework.stereotype.Component;

import com.java.admin.dto.AdminCouponDto;
import com.java.admin.dto.AdminCouponReadDto;
import com.java.admin.dto.AdminDto;
import com.java.admin.dto.AdminFoodDto;
import com.java.admin.dto.AdminFoodReadDto;

@Component
public interface AdminDao {

	public AdminFoodDto foodCnt();

	public List<AdminFoodReadDto> foodReadRank();

	public List<AdminCouponReadDto> couponReadRank();
	
	int loginCheck(String adminId, String adminPwd);
	
	public AdminCouponDto couponCount();

	public AdminDto getAdminCode(String adminId);
	

}
