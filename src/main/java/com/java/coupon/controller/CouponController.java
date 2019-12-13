package com.java.coupon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.coupon.dto.CouponDto;
import com.java.coupon.service.CouponService;

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
	public void couponInsertOk(HttpServletRequest request, HttpServletResponse reponse, CouponDto couponDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("couponDto",couponDto);
		
		couponService.couponInsertOk(mav);
		
		//return mav;
	}
	
	
	
	
}
