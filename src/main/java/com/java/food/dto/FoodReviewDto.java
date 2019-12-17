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
	private String memberName;	// 닉네임
	private int reviewCount;	// 리뷰 전체 숫자	
	private int reviewTotalScore;	// 리뷰 총 점수
	private Date reviewDate;	// 리뷰 날짜
	private String reviewCont;	// 리뷰 내용
	private int reviewScore;	// 리뷰 점수 5,3,1
	private	List<ImageDto> imageList; // 리뷰 이미지 리스트
	
	public FoodReviewDto() {}

	public FoodReviewDto(String reviewCode, String memberCode, String memberName, int reviewCount, int reviewTotalScore,
			Date reviewDate, String reviewCont, int reviewScore, List<ImageDto> imageList) {
		super();
		this.reviewCode = reviewCode;
		this.memberCode = memberCode;
		this.memberName = memberName;
		this.reviewCount = reviewCount;
		this.reviewTotalScore = reviewTotalScore;
		this.reviewDate = reviewDate;
		this.reviewCont = reviewCont;
		this.reviewScore = reviewScore;
		this.imageList = imageList;
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

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public int getReviewTotalScore() {
		return reviewTotalScore;
	}

	public void setReviewTotalScore(int reviewTotalScore) {
		this.reviewTotalScore = reviewTotalScore;
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

	public List<ImageDto> getImageList() {
		return imageList;
	}

	public void setImageList(List<ImageDto> imageList) {
		this.imageList = imageList;
	}

	@Override
	public String toString() {
		return "FoodReviewDto [reviewCode=" + reviewCode + ", memberCode=" + memberCode + ", memberName=" + memberName
				+ ", reviewCount=" + reviewCount + ", reviewTotalScore=" + reviewTotalScore + ", reviewDate="
				+ reviewDate + ", reviewCont=" + reviewCont + ", reviewScore=" + reviewScore + ", imageList="
				+ imageList + "]";
	}
	
}
