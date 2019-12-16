package com.java.food.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.food.dto.FoodDto;

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

	
	
	
}
