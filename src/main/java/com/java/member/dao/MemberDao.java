package com.java.member.dao;

import java.util.List;
import java.util.Map;

import com.java.coupon.dto.CouponDto;
import com.java.food.dto.FoodDto;
import com.java.food.dto.FoodReviewDto;
import com.java.member.dto.MemberDto;
import com.java.member.dto.MemberFavoriteDto;
import com.java.review.dto.ReviewDto;

public interface MemberDao {
	public int memberInsert(MemberDto memberDto);
	
	public int login(String mail, String pwd);

	public MemberDto memberUpdate(String memberCode);

	public int insertKakao(String nickname, String mail);
	
	public int insertNaver(Map<String, Object> map);
	
	public int emailCheck(String memberCode);

	public int memberUpdateOk(MemberDto memberDto);

	public int foodInsert(FoodDto foodDto);

	public MemberDto getMemberCode(String mail);

	public List<FoodDto> getMyFood(String memberCode);

	public int myFoodDel(String foodCode);

	public List<MemberDto> getMember(MemberDto memberDto);

	public List<FoodReviewDto> getMyReview(String memberCode);

	public List<CouponDto> getMyCoupon(String memberCode);

	public List<MemberFavoriteDto> getMyFavorite(String memberCode);

	public int adminUpdateOk(MemberDto memberDto);

	public String couponCount(String memberCode);

	public String reviewCount(String memberCode);

	public String favoriteCount(String memberCode);


}
