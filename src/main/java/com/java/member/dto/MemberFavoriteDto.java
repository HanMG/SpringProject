package com.java.member.dto;

public class MemberFavoriteDto {	// 내가 등록한 가고싶다
	private String foodCode;		// 음식점 코드
	private String favoriteCode;	// 즐겨찾기 코드
	private String memberCode;		// 회원 코드
	private String reviewCode;		// 리뷰 코드
	private String foodArea;		// 음식점 지역군
	private String foodName;		// 음식점 이름
	private String foodRead;		// 음식점 조회수
	private String imageName;		// 음식점 사진
	private String imagePath;		// 음식점 사진 경로
	private int count;				// 리뷰수
	private float avg;				// 평점
	
	public MemberFavoriteDto() {}

	public MemberFavoriteDto(String foodCode, String favoriteCode, String memberCode, String reviewCode,
			String foodArea, String foodName, String foodRead, String imageName, String imagePath, int count,
			float avg) {
		this.foodCode = foodCode;
		this.favoriteCode = favoriteCode;
		this.memberCode = memberCode;
		this.reviewCode = reviewCode;
		this.foodArea = foodArea;
		this.foodName = foodName;
		this.foodRead = foodRead;
		this.imageName = imageName;
		this.imagePath = imagePath;
		this.count = count;
		this.avg = avg;
	}

	public String getFoodCode() {
		return foodCode;
	}

	public void setFoodCode(String foodCode) {
		this.foodCode = foodCode;
	}

	public String getFavoriteCode() {
		return favoriteCode;
	}

	public void setFavoriteCode(String favoriteCode) {
		this.favoriteCode = favoriteCode;
	}

	public String getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}

	public String getReviewCode() {
		return reviewCode;
	}

	public void setReviewCode(String reviewCode) {
		this.reviewCode = reviewCode;
	}

	public String getFoodArea() {
		return foodArea;
	}

	public void setFoodArea(String foodArea) {
		this.foodArea = foodArea;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public String getFoodRead() {
		return foodRead;
	}

	public void setFoodRead(String foodRead) {
		this.foodRead = foodRead;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public float getAvg() {
		return avg;
	}

	public void setAvg(float avg) {
		this.avg = avg;
	}

	@Override
	public String toString() {
		return "MemberFavoriteDto [foodCode=" + foodCode + ", favoriteCode=" + favoriteCode + ", memberCode="
				+ memberCode + ", reviewCode=" + reviewCode + ", foodArea=" + foodArea + ", foodName=" + foodName
				+ ", foodRead=" + foodRead + ", imageName=" + imageName + ", imagePath=" + imagePath + ", count="
				+ count + ", avg=" + avg + "]";
	}

	
	
	
	
}
