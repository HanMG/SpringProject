package com.java.favorite.dto;

import java.sql.Date;

public class FavoriteDto {
	private String memberCode;
	private String foodCode;
	private Date favoriteDate;
	
	public FavoriteDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FavoriteDto(String memberCode, String foodCode, Date favoriteDate) {
		super();
		this.memberCode = memberCode;
		this.foodCode = foodCode;
		this.favoriteDate = favoriteDate;
	}
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getFoodCode() {
		return foodCode;
	}
	public void setFoodCode(String foodCode) {
		this.foodCode = foodCode;
	}
	public Date getFavoriteDate() {
		return favoriteDate;
	}
	public void setFavoriteDate(Date favoriteDate) {
		this.favoriteDate = favoriteDate;
	}
	@Override
	public String toString() {
		return "FavoriteDto [memberCode=" + memberCode + ", foodCode=" + foodCode + ", favoriteDate=" + favoriteDate
				+ "]";
	}
	
}
