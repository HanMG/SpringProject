package com.java.coupon.dao;

import org.springframework.stereotype.Component;

import com.java.coupon.dto.CouponDto;

/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 12.
 * @작업 내용 : CouponDao 생성
 */

@Component
public interface CouponDao {
	public String couponInsert(CouponDto couponDto);

}
