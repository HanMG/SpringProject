package com.java.review.dto;

import java.util.Date;

/**
 * @작성자 : 한문구
 * @작성일 : 2019. 12. 19.
 * @설명 : 리뷰 용 VO
 */

public class ReviewDto {
	private String reviewCode;	// 리뷰 코드
	private String foodCode;	// 음식점 코드
	private String memberCode;	// 멤버 코드
	private Date reviewDate;	// 리뷰 등록일
	private String reviewCont;	// 리뷰 내용
	private int reviewScore;	// 리뷰 점수	
	
	
	public ReviewDto() {}

	public ReviewDto(String reviewCode, String foodCode, String memberCode, Date reviewDate, String reviewCont,
			int reviewScore, String foodName) {
		super();
		this.reviewCode = reviewCode;
		this.foodCode = foodCode;
		this.memberCode = memberCode;
		this.reviewDate = reviewDate;
		this.reviewCont = reviewCont;
		this.reviewScore = reviewScore;
	
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

	

	@Override
	public String toString() {
		return "ReviewDto [reviewCode=" + reviewCode + ", foodCode=" + foodCode + ", memberCode=" + memberCode
				+ ", reviewDate=" + reviewDate + ", reviewCont=" + reviewCont + ", reviewScore=" + reviewScore
				+ "]";
	}

}
