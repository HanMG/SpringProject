package com.java.admion.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class AdminController {
	
	// 음식점 정보 등록 관련
	@RequestMapping(value = "/admin/main.go", method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/main.admin");		
		return mav;		
	}
	
	// 음식점 정보 등록 관련
	@RequestMapping(value = "/admin/food.go", method = RequestMethod.GET)
	public ModelAndView food(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/food.admin");		
		return mav;		
	}
	// 음식점 정보 등록 관련
	@RequestMapping(value = "/admin/coupon.go", method = RequestMethod.GET)
	public ModelAndView coupon(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/coupon.admin");		
		return mav;		
	}
	// 음식점 정보 등록 관련
	@RequestMapping(value = "/admin/purchase.go", method = RequestMethod.GET)
	public ModelAndView memberBoard(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/purchase.admin");		
		return mav;		
	}
	
}