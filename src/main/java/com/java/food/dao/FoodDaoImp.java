package com.java.food.dao;

import java.util.HashMap;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.coupon.dto.CouponDto;
import com.java.food.dto.FoodDto;
import com.java.food.dto.FoodReviewDto;
import com.java.review.dto.ReviewCountDto;

/**
 * @작성자 : 한문구
 * @작성일 : 2019. 12. 13.
 * @설명 : 음식점 DAO
 */

@Component
public class FoodDaoImp implements FoodDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	 	
	@Override
	public int foodInsert(FoodDto foodDto) {
		return sqlSession.insert("dao.FoodMapper.foodInsert", foodDto);		
	}

	@Override
	public String foodMax() {		
		return sqlSession.selectOne("dao.FoodMapper.foodMax");
	}

	@Override
	public FoodDto foodRead(String foodCode) {		
		return sqlSession.selectOne("dao.FoodMapper.foodRead", foodCode);
	}

	@Override
	public int foodDelete(String foodCode) {		
		return sqlSession.delete("dao.FoodMapper.foodDelete", foodCode);
	}

	@Override
	public int foodUpdate(FoodDto foodDto) {		
		return sqlSession.update("dao.FoodMapper.foodUpadte", foodDto);
	}

	@Override
	public void foodReadUpdate(String foodCode) {		
		sqlSession.update("dao.FoodMapper.foodReadUpdate",foodCode);
	}

	@Override
	public List<FoodReviewDto> foodReviewList(String foodCode, String selScore) {
		HashMap<String, Object> hMap = new HashMap<String, Object>(); 
		hMap.put("foodCode", foodCode);
		hMap.put("selScore", selScore);
		
		if(selScore.equals("0")) {
			return sqlSession.selectList("dao.FoodMapper.foodReviewList", foodCode);
		}
		else {
			return sqlSession.selectList("dao.FoodMapper.foodReviewListScore", hMap);
		}
		
	}

	@Override
	public List<CouponDto> foodCouponList(String foodCode) {		
		return sqlSession.selectList("dao.FoodMapper.foodCouponList", foodCode);
	}

	@Override
	public ReviewCountDto foodReivewCount(String foodCode) {
		return sqlSession.selectOne("dao.FoodMapper.foodReviewCount", foodCode);
	}

	@Override
	public float foodReviewAvg(String foodCode) {		
		return sqlSession.selectOne("dao.FoodMapper.foodReviewAvg", foodCode);
	}	
	@Override
	public List<FoodReviewDto> reviewList(String foodCode) {
		return sqlSession.selectList("dao.FoodMapper.foodReviewList", foodCode);
	}

	@Override
	public List<FoodDto> foodDtoList() {		
		return sqlSession.selectList("dao.FoodMapper.adminfoodList");
	}

	@Override
	public int foodFavorite(String foodCode) {		
		return sqlSession.selectOne("dao.FoodMapper.foodFavorite",foodCode);
	}		
}
