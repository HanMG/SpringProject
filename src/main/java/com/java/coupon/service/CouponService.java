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
	public void searchFoodCode(ModelAndView mav);
	
	//쿠폰 리스트
	public void couponList(ModelAndView mav);
	
	//쿠폰 상세페이지
	public void couponRead(ModelAndView mav);
	
	//쿠폰 수정 페이지
	public void couponUpdate(ModelAndView mav);
}
