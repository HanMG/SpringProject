package com.java.food.dto;

import java.util.Date;

/**
 * @작성자 : 한문구
 * @작성일 : 2019. 12. 12.
 * @설명 : 음식점 DTO(VO) 
 */

public class FoodDto {
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
	private String foodStatus;	//	음식점 상태  ex) y : 완료, n : 검토중	
	private String memberCode;	// 등록자 
	
	public FoodDto() {}

	public FoodDto(String foodCode, String foodName, String foodAddr, String foodArea, String foodPhone,
			String foodKind, String foodMenu, String foodTime, String foodBreak, String foodIntro, Date foodDate,
			int foodRead, String foodStatus, String memberCode) {
		super();
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
		this.memberCode = memberCode;
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

	public String getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}

	@Override
	public String toString() {
		return "FoodDto [foodCode=" + foodCode + ", foodName=" + foodName + ", foodAddr=" + foodAddr + ", foodArea="
				+ foodArea + ", foodPhone=" + foodPhone + ", foodKind=" + foodKind + ", foodMenu=" + foodMenu
				+ ", foodTime=" + foodTime + ", foodBreak=" + foodBreak + ", foodIntro=" + foodIntro + ", foodDate="
				+ foodDate + ", foodRead=" + foodRead + ", foodStatus=" + foodStatus + ", memberCode=" + memberCode
				+ "]";

	}	
}
