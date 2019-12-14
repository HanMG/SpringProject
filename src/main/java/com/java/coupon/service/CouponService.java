package com.java.coupon.service;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 13.
 * @작업 내용 :  CouponService 생성
*/
@Component
public interface CouponService {
	//쿠폰 사용 등록
	public void couponInsertOk(ModelAndView mav);
	
	//식당 코드 검색
	public void searchFoodCodeOk(ModelAndView mav);
}
