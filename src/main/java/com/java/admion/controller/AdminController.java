package com.java.admion.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.food.service.FoodService;
import com.java.review.service.ReviewService;


@Controller
public class AdminController {
	@Autowired
	private FoodService foodService;
	
	@Autowired
	private ReviewService reviewService;
	
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
		foodService.adminFoodList(mav);				
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
	// 리뷰 관련
	@RequestMapping(value = "/admin/review.go", method = RequestMethod.GET)
	public ModelAndView review(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		reviewService.adminReviewList(mav);
		return mav;		
	}	
	
	@RequestMapping(value="/admin/getReview.go", method = RequestMethod.GET)
	public void getReview(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		reviewService.getReview(mav);	
	}
	
	@RequestMapping(value="/admin/getFood.go", method= RequestMethod.GET)
	public void getFood(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		foodService.getFood(mav);
	}

	
}