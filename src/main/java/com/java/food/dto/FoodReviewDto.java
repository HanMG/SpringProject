package com.java.food.dto;

import java.util.Date;

/**
 * @작성자 : 한문구
 * @작성일 : 2019. 12. 17.
 * @설명 : 음식점상세페이지에서 사용될 리뷰 리스트 DTO 
 */

public class FoodReviewDto {
	private String reviewCode;	// 리뷰 코드
	private String foodCode;	// 음식점 코드
	private String memberCode;	// 멤버 코드	
	private String memberName;	// 멤버 이름
	private Date reviewDate;	// 리뷰 날짜
	private String reviewCont;	// 리뷰 내용
	private int reviewScore;	// 리뷰 점수 5,3,1
	private String referCode; 	// 참조 코드
	private	String imageName; // 리뷰 이미지 리스트
	
	public FoodReviewDto() {}

	public FoodReviewDto(String reviewCode, String foodCode, String memberCode, String memberName, Date reviewDate,
			String reviewCont, int reviewScore, String referCode, String imageName) {
		super();
		this.reviewCode = reviewCode;
		this.foodCode = foodCode;
		this.memberCode = memberCode;
		this.memberName = memberName;
		this.reviewDate = reviewDate;
		this.reviewCont = reviewCont;
		this.reviewScore = reviewScore;
		this.referCode = referCode;
		this.imageName = imageName;
	}

	public String getReviewCode() {
		return reviewCode;
	}

	public void setReviewCode(String reviewCode) {
		this.reviewCode = reviewCode;
	}

	public String getFoodCode() {
		return foodCode;
	}

	public void setFoodCode(String foodCode) {
		this.foodCode = foodCode;
	}

	public String getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReviewCont() {
		return reviewCont;
	}

	public void setReviewCont(String reviewCont) {
		this.reviewCont = reviewCont;
	}

	public int getReviewScore() {
		return reviewScore;
	}

	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}

	public String getReferCode() {
		return referCode;
	}

	public void setReferCode(String referCode) {
		this.referCode = referCode;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	@Override
	public String toString() {
		return "FoodReviewDto [reviewCode=" + reviewCode + ", foodCode=" + foodCode + ", memberCode=" + memberCode
				+ ", memberName=" + memberName + ", reviewDate=" + reviewDate + ", reviewCont=" + reviewCont
				+ ", reviewScore=" + reviewScore + ", referCode=" + referCode + ", imageName=" + imageName + "]";
	}
}
