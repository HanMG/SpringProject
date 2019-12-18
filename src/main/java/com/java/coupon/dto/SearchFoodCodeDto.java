package com.java.coupon.dto;

/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 14.
 * @작업 내용 : coupon insert시 필요한 foodcode 가져오는 SearchFoodCodeDto 생성
*/
public class SearchFoodCodeDto {
	private String foodCode;
	private String foodName;
	private String foodAddr;
	public SearchFoodCodeDto() {}
	public SearchFoodCodeDto(String foodCode, String foodName, String foodAddr) {
		this.foodCode = foodCode;
		this.foodName = foodName;
		this.foodAddr = foodAddr;
	}
	public String getFoodCode() {
		return foodCode;
	}
	public void setFoodCode(String foodCode) {
		this.foodCode = foodCode;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getFoodAddr() {
		return foodAddr;
	}
	public void setFoodAddr(String foodAddr) {
		this.foodAddr = foodAddr;
	}
	@Override
	public String toString() {
		return "SearchFoodCodeDto [foodCode=" + foodCode + ", foodName=" + foodName + ", foodAddr=" + foodAddr + "]";
	}
	
}
