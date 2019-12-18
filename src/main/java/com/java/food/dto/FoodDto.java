package com.java.food.dto;

public class FoodDto {
	private String foodCode;
	private String foodName;
	private String foodAddr;
	private String foodKind;
	private String foodStatus;
	
	public FoodDto(){}

	public FoodDto(String foodCode, String foodName, String foodAddr, String foodKind, String foodStatus) {
		super();
		this.foodCode = foodCode;
		this.foodName = foodName;
		this.foodAddr = foodAddr;
		this.foodKind = foodKind;
		this.foodStatus = foodStatus;
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

	public String getFoodKind() {
		return foodKind;
	}

	public void setFoodKind(String foodKind) {
		this.foodKind = foodKind;
	}

	public String getFoodStatus() {
		return foodStatus;
	}

	public void setFoodStatus(String foodStatus) {
		this.foodStatus = foodStatus;
	}

	@Override
	public String toString() {
		return "FoodDto [foodCode=" + foodCode + ", foodName=" + foodName + ", foodAddr=" + foodAddr + ", foodKind="
				+ foodKind + ", foodStatus=" + foodStatus + "]";
	}

	
}
