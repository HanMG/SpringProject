package com.java.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.admin.dao.AdminDao;
import com.java.admin.dto.AdminFoodDto;
import com.java.admin.dto.AdminFoodReadDto;

@Component
public class AdminServiceImp implements AdminService {
	
	@Autowired
	private AdminDao adminDao;

	@Override
	public void getMainData(ModelAndView mav) {
		AdminFoodDto adminFoodDto = new AdminFoodDto();
		adminFoodDto = adminDao.foodCnt();		
		System.out.println(adminFoodDto.toString());		
		List<AdminFoodReadDto> adminFoodRank = adminDao.foodReadRank();
		System.out.println(adminFoodRank.toString());
		if(adminFoodDto!=null) {
			mav.addObject("adminFoodDto", adminFoodDto);
		}
		if(adminFoodRank!=null) {
			mav.addObject("adminFoodRank",adminFoodRank);
		}
		mav.setViewName("admin/main.admin");	
	}

}
