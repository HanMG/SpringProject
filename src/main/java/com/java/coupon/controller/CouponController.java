package com.java.coupon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.JejuAspect;
import com.java.coupon.dto.CouponDto;
import com.java.coupon.service.CouponService;
import com.java.image.dto.ImageDto;

/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 12.
 * @작업 내용 : CouponController 생성
 */
@Controller
public class CouponController {
	@Autowired
	private CouponService couponService;
	
	//쿠폰상품 등록 페이지
	@RequestMapping(value="/coupon/couponInsert.go", method= RequestMethod.GET)
	public ModelAndView couponInsert(HttpServletRequest request, HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("coupon/couponInsert.tiles");
		
		return mav;
	}
	
	//쿠폰상품 등록
	@RequestMapping(value="/coupon/couponInsertOk.go", method= RequestMethod.POST)
	public ModelAndView couponInsertOk(HttpServletRequest request, HttpServletResponse reponse, CouponDto couponDto) {
		String imageFile = request.getParameter("imageFile");
		//JejuAspect.logger.info(JejuAspect.logMsg + "imageFile: "+ imageFile);
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("couponDto", couponDto);
		mav.addObject("imageFile", imageFile);
		
		couponService.couponInsertOk(mav);
		
		return mav;
	}
	
	//식당코드 검색 
	@RequestMapping(value="/coupon/searchFoodCode.go", method=RequestMethod.GET)
	public ModelAndView readFoodCode(HttpServletRequest request, HttpServletResponse reponse, CouponDto couponDto) {
		String foodName = request.getParameter("foodName");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("foodName", foodName);
		couponService.searchFoodCode(mav);
		
		return mav;
	}
	
	//쿠폰리스트
	@RequestMapping(value="/coupon/couponList.go", method=RequestMethod.GET)
	public ModelAndView couponList(HttpServletRequest request, HttpServletResponse reponse, CouponDto couponDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		couponService.couponList(mav);
		
		return mav;
	}
	
	//쿠폰 상세페이지
	@RequestMapping(value="/coupon/couponRead.go", method=RequestMethod.GET)
	public ModelAndView couponRead(HttpServletRequest request, HttpServletResponse reponse, CouponDto couponDto) {
		ModelAndView mav= new ModelAndView();
		mav.addObject("request", request);
		
		couponService.couponRead(mav);
		
		return mav;
	}
	
	//쿠폰상품 수정
	@RequestMapping(value="/coupon/couponUpdate.go", method=RequestMethod.GET)
	public ModelAndView couponUpdate(HttpServletRequest request, HttpServletResponse reponse, CouponDto couponDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		couponService.couponUpdate(mav);
		
		return mav;
	}
	
	
}
