package com.java.coupon.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.java.coupon.dto.CouponDto;
import com.java.coupon.dto.SearchFoodCodeDto;

/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 12.
 * @작업 내용 : CouponDao 생성
 */

@Component
public interface CouponDao {
	//쿠폰상품 등록
	public String couponInsert(CouponDto couponDto);
	
	//식당코드 검색
	public List<SearchFoodCodeDto> searchFoodCode(String foodName);

}
