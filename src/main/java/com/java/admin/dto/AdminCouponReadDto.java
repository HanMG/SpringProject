package com.java.admin.dto;

public class AdminCouponReadDto {
	private String couponCode; // 음식점 코드
	private String foodName; // 음식점 수
	private int	foodRead;	// 조회수
	private int rank;	// 순위		
	
	public AdminCouponReadDto() {}

	public AdminCouponReadDto(String couponCode, String foodName, int foodRead, int rank) {
		super();
		this.couponCode = couponCode;
		this.foodName = foodName;
		this.foodRead = foodRead;
		this.rank = rank;
	}

	public String getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public int getFoodRead() {
		return foodRead;
	}

	public void setFoodRead(int foodRead) {
		this.foodRead = foodRead;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	@Override
	public String toString() {
		return "AdminCouponReadDto [couponCode=" + couponCode + ", foodName=" + foodName + ", foodRead=" + foodRead
				+ ", rank=" + rank + "]";
	}

	
}
