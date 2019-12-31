package com.java.admin.dto;

public class AdminCouponReadDto {
	private String couponCode; 	 // 쿠폰 코드
	private String couponName; 	 // 쿠폰명 
	private String foodCode;	 // 음식점 코드 
	private int	purchaseCnt;	 // 판매수
	private int rank;	// 순위		
	
	public AdminCouponReadDto() {}

	public AdminCouponReadDto(String couponCode, String couponName, int purchaseCnt, int rank) {
		super();
		this.couponCode = couponCode;
		this.couponName = couponName;
		this.purchaseCnt = purchaseCnt;
		this.rank = rank;
	}

	public String getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public int getPurchaseCnt() {
		return purchaseCnt;
	}

	public void setPurchaseCnt(int purchaseCnt) {
		this.purchaseCnt = purchaseCnt;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	@Override
	public String toString() {
		return "AdminCouponReadDto [couponCode=" + couponCode + ", couponName=" + couponName + ", purchaseCnt="
				+ purchaseCnt + ", rank=" + rank + "]";
	}
}
