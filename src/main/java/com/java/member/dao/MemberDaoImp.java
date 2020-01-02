package com.java.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.coupon.dto.CouponDto;
import com.java.food.dto.FoodDto;
import com.java.food.dto.FoodReviewDto;
import com.java.member.dto.MemberDto;
import com.java.member.dto.MemberFavoriteDto;
import com.java.review.dto.ReviewDto;

@Component
public class MemberDaoImp implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int memberInsert(MemberDto memberDto) {
	
		return sqlSessionTemplate.insert("memberMapper.insert", memberDto);
	}

	@Override
	public int login(String mail, String pwd) {
		Map<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("mail", mail);
		hashMap.put("pwd", pwd);
		return sqlSessionTemplate.selectOne("memberMapper.login", hashMap);
	}
	
	@Override
	public MemberDto memberUpdate(String memberCode) {
		return sqlSessionTemplate.selectOne("memberMapper.memberInfo", memberCode);
	}

	@Override
	public int insertKakao(String nickname, String mail) {
		Map<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("nickname", nickname);
		hashMap.put("mail", mail);
		return sqlSessionTemplate.insert("memberMapper.insertKakao", hashMap);
	}
	
	@Override
	public int insertNaver(Map<String,Object> map) {
		return sqlSessionTemplate.insert("memberMapper.insertNaver", map);
	}
	
	@Override
	public int emailCheck(String mail) {
		
		return sqlSessionTemplate.selectOne("memberMapper.emailCheck", mail);
	}
	
	@Override
	public int memberUpdateOk(MemberDto memberDto) {
		
		return sqlSessionTemplate.update("memberMapper.memberUpdate", memberDto);
	}
	
	@Override
	public int foodInsert(FoodDto foodDto) {
		return sqlSessionTemplate.insert("memberMapper.foodInsert", foodDto);
	}
	@Override
	public MemberDto getMemberCode(String mail) {
		return sqlSessionTemplate.selectOne("memberMapper.getMemberCode", mail);
	}@Override
	public List<FoodDto> getMyFood(String memberCode) {
		return sqlSessionTemplate.selectList("memberMapper.getMyFood", memberCode);
	}
	@Override
	public int myFoodDel(String foodCode) {
		return sqlSessionTemplate.delete("memberMapper.myFoodDel", foodCode);
	}
	@Override
	public List<CouponDto> getMyCoupon(String memberCode) {
		return sqlSessionTemplate.selectList("memberMapper.getMyCoupon", memberCode);
	}
	
	@Override
	public List<FoodReviewDto> getMyReview(String memberCode) {
		return sqlSessionTemplate.selectList("memberMapper.getMyReview", memberCode);
	}
	
	@Override
	public List<MemberFavoriteDto> getMyFavorite(String memberCode) {
		return sqlSessionTemplate.selectList("memberMapper.getMyFavorite", memberCode);
	}
	
	@Override
	public String couponCount(String memberCode) {
		return sqlSessionTemplate.selectOne("memberMapper.getCouponCount", memberCode);
	}
	@Override
	public String favoriteCount(String memberCode) {
		return sqlSessionTemplate.selectOne("memberMapper.getFavoriteCount", memberCode);
	}
	@Override
	public String reviewCount(String memberCode) {
		return sqlSessionTemplate.selectOne("memberMapper.getReviewCount", memberCode);
	}
	
	//관리자
	@Override
	public List<MemberDto> getMember(MemberDto memberDto) {
		return sqlSessionTemplate.selectList("memberMapper.getMember", memberDto);
	}
	@Override
	public int adminUpdateOk(MemberDto memberDto) {
		return sqlSessionTemplate.update("memberMapper.adminUpdate", memberDto);
	}

}
