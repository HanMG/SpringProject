package com.java.food.dto;

import java.util.Date;
import java.util.List;

import com.java.image.dto.ImageDto;

/**
 * @작성자 : 한문구
 * @작성일 : 2019. 12. 17.
 * @설명 : 음식점상세페이지에서 사용될 리뷰 리스트 DTO 
 */

public class FoodReviewDto {
	private String reviewCode;	// 리뷰 코드	
	private String memberCode;	// 멤버 코드				
	private Date reviewDate;	// 리뷰 날짜
	private String reviewCont;	// 리뷰 내용
	private int reviewScore;	// 리뷰 점수 5,3,1
	private	String imageName; // 리뷰 이미지 리스트
	
	public FoodReviewDto() {}

	public FoodReviewDto(String reviewCode, String memberCode, Date reviewDate, String reviewCont, int reviewScore,
			String imageName) {
		super();
		this.reviewCode = reviewCode;
		this.memberCode = memberCode;
		this.reviewDate = reviewDate;
		this.reviewCont = reviewCont;
		this.reviewScore = reviewScore;
		this.imageName = imageName;
	}

	public String getReviewCode() {
		return reviewCode;
	}

	public void setReviewCode(String reviewCode) {
		this.reviewCode = reviewCode;
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

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	@Override
	public String toString() {
		return "FoodReviewDto [reviewCode=" + reviewCode + ", memberCode=" + memberCode + ", reviewDate=" + reviewDate
				+ ", reviewCont=" + reviewCont + ", reviewScore=" + reviewScore + ", imageName=" + imageName + "]";
	}	
}
