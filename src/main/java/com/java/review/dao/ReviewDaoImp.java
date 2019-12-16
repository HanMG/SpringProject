package com.java.review.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.review.dto.ReviewDto;

@Component
public class ReviewDaoImp implements ReviewDao{
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public int reviewInsertOk(ReviewDto reviewDto) {		
		return sqlSession.insert("dao.ReviewMapper.reviewInsert",reviewDto);
	}


	@Override
	public String getFoodName(String foodCode) {		
		return sqlSession.selectOne("dao.ReviewMapper.reviewFoodName", foodCode);
	}
	
}
