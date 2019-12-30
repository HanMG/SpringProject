package com.java.admin.dto;

public class AdminFoodReadDto {
	private String foodCode; // 음식점 코드
	private String foodName; // 음식점 수
	private int	foodRead;	// 조회수
	private int rank;	// 순위		
	
	public AdminFoodReadDto() {}

	public AdminFoodReadDto(String foodCode, String foodName, int foodRead, int rank) {
		super();
		this.foodCode = foodCode;
		this.foodName = foodName;
		this.foodRead = foodRead;
		this.rank = rank;
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
		return "AdminFoodReadDto [foodCode=" + foodCode + ", foodName=" + foodName + ", foodRead=" + foodRead
				+ ", rank=" + rank + "]";
	}	
}
