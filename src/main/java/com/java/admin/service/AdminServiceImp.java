package com.java.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.admin.dao.AdminDao;
import com.java.admin.dto.AdminCouponReadDto;
import com.java.admin.dto.AdminFoodDto;
import com.java.admin.dto.AdminFoodReadDto;
import com.java.aop.JejuAspect;

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
		
		List<AdminCouponReadDto> adminCouponRank = adminDao.couponReadRank();
		JejuAspect.logger.info(JejuAspect.logMsg + "adminCouponRank:" +adminCouponRank.toString());
		
		
		
		
		mav.setViewName("admin/main.admin");	
	}
	@Override
	
	public void adminLogin(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String adminId = request.getParameter("adminId");
		String adminPwd = request.getParameter("adminPwd");
		
		int check = adminDao.loginCheck(adminId, adminPwd);
		
		mav.addObject("check", check);
		mav.setViewName("admin/adminLoginOk.empty");
	}

}
