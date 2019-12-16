package com.java.favorite.dto;

import java.util.Date;

/**
 * @작성자 : 한문구
 * @작성일 : 2019. 12. 12.
 * @설명 : 즐겨찾기 (가고싶다) DTO
 */
public class FavoriteDto {
	private String food_code;
	private String member_code;
	private Date favorite_date;
	
	public FavoriteDto() {}
	
	public FavoriteDto(String food_code, String member_code, Date favorite_date) {
		super();
		this.food_code = food_code;
		this.member_code = member_code;
		this.favorite_date = favorite_date;
	}

	public String getFood_code() {
		return food_code;
	}

	public void setFood_code(String food_code) {
		this.food_code = food_code;
	}

	public String getMember_code() {
		return member_code;
	}

	public void setMember_code(String member_code) {
		this.member_code = member_code;
	}

	public Date getFavorite_date() {
		return favorite_date;
	}

	public void setFavorite_date(Date favorite_date) {
		this.favorite_date = favorite_date;
	}

	@Override
	public String toString() {
		return "FavoriteDto [food_code=" + food_code + ", member_code=" + member_code + ", favorite_date="
				+ favorite_date + "]";
	}
	
}
