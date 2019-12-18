package com.java.coupon.dto;

import java.util.Date;

/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 12.
 * @작업 내용 :  CouponDto 생성
 */
public class CouponDto {
	private int coupon_code;				// 쿠폰코드
	private int food_code;				// 식당코드
	private String coupon_name;			// 쿠폰명(상품명)
	private Date coupon_startdate;		// 쿠폰유효기간(시작)
	private Date coupon_enddate;			// 쿠폰유효기간(마감)
	private String coupon_intro;			// 쿠폰소개
	private int coupon_costori;			// 쿠폰 원가
	private int coupon_costsale;			// 쿠폰 할인가
	private int coupon_salerate;				// 쿠폰 할인률
	
	public CouponDto() {}
	
	public int getCoupon_code() {
		return coupon_code;
	}

	public void setCoupon_code(int coupon_code) {
		this.coupon_code = coupon_code;
	}

	public int getFood_code() {
		return food_code;
	}

	public void setFood_code(int food_code) {
		this.food_code = food_code;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	public Date getCoupon_startdate() {
		return coupon_startdate;
	}

	public void setCoupon_startdate(Date coupon_startdate) {
		this.coupon_startdate = coupon_startdate;
	}

	public Date getCoupon_enddate() {
		return coupon_enddate;
	}

	public void setCoupon_enddate(Date coupon_enddate) {
		this.coupon_enddate = coupon_enddate;
	}

	public String getCoupon_intro() {
		return coupon_intro;
	}

	public void setCoupon_intro(String coupon_intro) {
		this.coupon_intro = coupon_intro;
	}

	public int getCoupon_costori() {
		return coupon_costori;
	}

	public void setCoupon_costori(int coupon_costori) {
		this.coupon_costori = coupon_costori;
	}

	public int getCoupon_costsale() {
		return coupon_costsale;
	}

	public void setCoupon_costsale(int coupon_costsale) {
		this.coupon_costsale = coupon_costsale;
	}

	public int getCoupon_salerate() {
		return coupon_salerate;
	}

	public void setCoupon_salerate(int coupon_salerate) {
		this.coupon_salerate = coupon_salerate;
	}

	@Override
	public String toString() {
		return "CouponDto [coupon_code=" + coupon_code + ", food_code=" + food_code + ", coupon_name=" + coupon_name
				+ ", coupon_startdate=" + coupon_startdate + ", coupon_enddate=" + coupon_enddate + ", coupon_intro="
				+ coupon_intro + ", coupon_costori=" + coupon_costori + ", coupon_costsale=" + coupon_costsale
				+ ", coupon_salerate=" + coupon_salerate + "]";
	}
}
