package com.java.review.dto;

import java.util.Date;

public class ReviewDto {
	private String reviewCode;	// 리뷰 코드
	private String foodCode;	// 음식점 코드
	private String memberCode;	// 멤버 코드
	private Date reviewDate;	// 리뷰 등록일
	private String reviewCont;	// 리뷰 내용
	private int reviewScore;	// 리뷰 점수
	
	public ReviewDto() {}
	
	public ReviewDto(String review_code, String food_code, String member_code, Date review_date, String review_cont,
			int review_score) {
		super();
		this.reviewCode = review_code;
		this.foodCode = food_code;
		this.memberCode = member_code;
		this.reviewDate = review_date;
		this.reviewCont = review_cont;
		this.reviewScore = review_score;
	}

	public void setReviewCode(String reviewCode) {
		this.reviewCode = reviewCode;
	}

	public void setFoodCode(String foodCode) {
		this.foodCode = foodCode;
	}

	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public void setReviewCont(String reviewCont) {
		this.reviewCont = reviewCont;
	}

	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}	

	public String getReviewCode() {
		return reviewCode;
	}

	public String getFoodCode() {
		return foodCode;
	}

	public String getMemberCode() {
		return memberCode;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public String getReviewCont() {
		return reviewCont;
	}

	public int getReviewScore() {
		return reviewScore;
	}

	@Override
	public String toString() {
		return "ReviewDto [reviewCode=" + reviewCode + ", foodCode=" + foodCode + ", memberCode=" + memberCode
				+ ", reviewDate=" + reviewDate + ", reviewCont=" + reviewCont + ", reviewScore=" + reviewScore + "]";
	}

	

}
