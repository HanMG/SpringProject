package com.java.review.dto;


public class ReviewImgDto extends ReviewDto {
	private ReviewDto reviewDto;
	private String imgList;
	
	public ReviewImgDto(ReviewDto reviewDto, String imgList) {
		this.reviewDto = reviewDto;
		this.imgList = imgList;
	}
	ReviewDto getReviewDto() {
		return reviewDto;
	}
	void setReviewDto(ReviewDto reviewDto) {
		this.reviewDto = reviewDto;
	}
	String getImgList() {
		return imgList;
	}
	void setImgList(String imgList) {
		this.imgList = imgList;
	}

	@Override
	public String toString() {
		return "[reviewDto=" + reviewDto + ", imgList=" + imgList + "]";
	}
	

	
	
	
}
