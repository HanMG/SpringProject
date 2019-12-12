package com.java.coupon.service;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 12.
 * @작업 내용 :  CouponService 생성
 */

@Component
public interface CouponService {
	
	//쿠폰상품 등록 페이지
	public void couponInsert(ModelAndView mav);
	
	//쿠폰상품 등록
	public void couponInsertOk(ModelAndView mav);
	
}
