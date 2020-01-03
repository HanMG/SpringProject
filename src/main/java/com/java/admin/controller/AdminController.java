package com.java.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.food.service.FoodService;
import com.java.member.service.MemberService;
import com.java.review.service.ReviewService;
import com.java.admin.service.AdminService;
import com.java.coupon.service.CouponService;
import com.java.purchase.service.PurchaseService;

@Controller
public class AdminController {
	@Autowired
	private FoodService foodService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private PurchaseService purchaseService;
	
	@Autowired
	private AdminService adminService;
	
	
	
	// 관리자 로그인 페이지
	@RequestMapping(value = "/admin/login.go", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/login.empty");		
		return mav;		
	}
	
	// 관리자 메인페이지 이동
	@RequestMapping(value = "/admin/main.go", method= RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		adminService.getMainData(mav);
				
		return mav;		
	}
	// 관리자 메인페이지 이동
	@RequestMapping(value = "/admin/loginOk.go", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView loginOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		adminService.adminLogin(mav);
		
		return mav;		
	}
	// 관리자 로그아웃
	@RequestMapping(value = "/admin/logout.go", method= {RequestMethod.GET,RequestMethod.POST})
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		
		return "admin/logout.empty";		
	}
	
	
	// 관리자 음식점페이지로 이동 및 리스트 불러오기
	@RequestMapping(value = "/admin/food.go", method = RequestMethod.GET)
	public ModelAndView food(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();		
		foodService.adminFoodList(mav);				
		return mav;		
	}
	// 관리자 쿠폰페이지로 이동 및 리스트 불러오기
	@RequestMapping(value = "/admin/coupon.go", method = RequestMethod.GET)
	public ModelAndView coupon(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		couponService.couponListAdmin(mav);
		mav.setViewName("admin/coupon.admin");		
		return mav;		
	}
	// 관리자 구매내역페이지로 이동 및 리스트 불러오기
	@RequestMapping(value = "/admin/purchase.go", method = RequestMethod.GET)
	public ModelAndView memberBoard(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		purchaseService.purchaseListAll(mav);
		
		mav.setViewName("admin/purchase.admin");		
		return mav;		
	}
	// 관리자 리뷰페이지로 이동 및 리스트 불러오기
	@RequestMapping(value = "/admin/review.go", method = RequestMethod.GET)
	public ModelAndView review(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		reviewService.adminReviewList(mav);
		return mav;		
	}	
}