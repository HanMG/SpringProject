package com.java.search.dto;

import java.util.Date;

/**
 * @작성자 : 한문구
 * @작성일 : 2019. 12. 12.
 * @설명 : 음식점 DTO(VO) 
 */

public class SearchFoodDto {
	private String member_code;

	private String foodCode;	// 음식점코드
	private String foodName;	// 음식점 명
	private String foodAddr;	// 음식점 주소
	private String foodArea;	// 음식점 지역
	private String foodPhone;	// 음식점 전화번호
	private String foodKind;	// 음식 분류  ex) 한식, 중식, 
	private String foodMenu;	// 음식 대표메뉴
	private String foodTime;	// 음식점 영업시간
	private String foodBreak;	// 음식점 휴일
	private String foodIntro;	// 음식점 소개
	private Date foodDate;	// 음식점 등록일
	private int foodRead;	// 음식점 조회 카운트
	private String foodStatus;	//	음식점 상태  ex) 검토중, 완료
	
	private String reviewCode;
	private String reviewDate;
	private String reviewCont;
	private float reviewScore;
	private String reviewCount;
	
	private String imageCode;	//	이미지 코드
	private String referCode;
	private String imageName;	//	이미지 이름
	private long imageSize;		//	이미지 사이즈		
	private String imagePath;	//	이미지 경로
	
	public SearchFoodDto() {}
	

	public String getReviewCount() {
		return reviewCount;
	}


	public void setReviewCount(String reviewCount) {
		this.reviewCount = reviewCount;
	}


	public SearchFoodDto(String member_code, String foodCode, String foodName, String foodAddr, String foodArea,
			String foodPhone, String foodKind, String foodMenu, String foodTime, String foodBreak, String foodIntro,
			Date foodDate, int foodRead, String foodStatus, String reviewCode, String reviewDate, String reviewCont,
			float reviewScore, String reviewCount, String imageCode, String referCode, String imageName,
			long imageSize, String imagePath) {
		super();
		this.member_code = member_code;
		this.foodCode = foodCode;
		this.foodName = foodName;
		this.foodAddr = foodAddr;
		this.foodArea = foodArea;
		this.foodPhone = foodPhone;
		this.foodKind = foodKind;
		this.foodMenu = foodMenu;
		this.foodTime = foodTime;
		this.foodBreak = foodBreak;
		this.foodIntro = foodIntro;
		this.foodDate = foodDate;
		this.foodRead = foodRead;
		this.foodStatus = foodStatus;
		this.reviewCode = reviewCode;
		this.reviewDate = reviewDate;
		this.reviewCont = reviewCont;
		this.reviewScore = reviewScore;
		this.reviewCount = reviewCount;
		this.imageCode = imageCode;
		this.referCode = referCode;
		this.imageName = imageName;
		this.imageSize = imageSize;
		this.imagePath = imagePath;
	}


	public String getMember_code() {
		return member_code;
	}
	public void setMember_code(String member_code) {
		this.member_code = member_code;
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
	public String getFoodArea() {
		return foodArea;
	}
	public void setFoodArea(String foodArea) {
		this.foodArea = foodArea;
	}
	public String getFoodPhone() {
		return foodPhone;
	}
	public void setFoodPhone(String foodPhone) {
		this.foodPhone = foodPhone;
	}
	public String getFoodKind() {
		return foodKind;
	}
	public void setFoodKind(String foodKind) {
		this.foodKind = foodKind;
	}
	public String getFoodMenu() {
		return foodMenu;
	}
	public void setFoodMenu(String foodMenu) {
		this.foodMenu = foodMenu;
	}
	public String getFoodTime() {
		return foodTime;
	}
	public void setFoodTime(String foodTime) {
		this.foodTime = foodTime;
	}
	public String getFoodBreak() {
		return foodBreak;
	}
	public void setFoodBreak(String foodBreak) {
		this.foodBreak = foodBreak;
	}
	public String getFoodIntro() {
		return foodIntro;
	}
	public void setFoodIntro(String foodIntro) {
		this.foodIntro = foodIntro;
	}
	public Date getFoodDate() {
		return foodDate;
	}
	public void setFoodDate(Date foodDate) {
		this.foodDate = foodDate;
	}
	public int getFoodRead() {
		return foodRead;
	}
	public void setFoodRead(int foodRead) {
		this.foodRead = foodRead;
	}
	public String getFoodStatus() {
		return foodStatus;
	}
	public void setFoodStatus(String foodStatus) {
		this.foodStatus = foodStatus;
	}
	public String getReviewCode() {
		return reviewCode;
	}
	public void setReviewCode(String reviewCode) {
		this.reviewCode = reviewCode;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewCont() {
		return reviewCont;
	}
	public void setReviewCont(String reviewCont) {
		this.reviewCont = reviewCont;
	}
	public float getReviewScore() {
		return reviewScore;
	}
	public void setReviewScore(float reviewScore) {
		this.reviewScore = reviewScore;
	}
	public String getImageCode() {
		return imageCode;
	}
	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
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
	public long getImageSize() {
		return imageSize;
	}
	public void setImageSize(long imageSize) {
		this.imageSize = imageSize;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	@Override
	public String toString() {
		return "SearchFoodDto [member_code=" + member_code + ", foodCode=" + foodCode + ", foodName=" + foodName
				+ ", foodAddr=" + foodAddr + ", foodArea=" + foodArea + ", foodPhone=" + foodPhone + ", foodKind="
				+ foodKind + ", foodMenu=" + foodMenu + ", foodTime=" + foodTime + ", foodBreak=" + foodBreak
				+ ", foodIntro=" + foodIntro + ", foodDate=" + foodDate + ", foodRead=" + foodRead + ", foodStatus="
				+ foodStatus + ", reviewCode=" + reviewCode + ", reviewDate=" + reviewDate + ", reviewCont="
				+ reviewCont + ", reviewScore=" + reviewScore + ", reviewCount=" + reviewCount + ", imageCode="
				+ imageCode + ", referCode=" + referCode + ", imageName=" + imageName + ", imageSize=" + imageSize
				+ ", imagePath=" + imagePath + "]";
	}
	
}
