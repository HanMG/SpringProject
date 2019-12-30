package com.java.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.admin.dto.AdminFoodDto;
import com.java.admin.dto.AdminFoodReadDto;

@Component
public class AdminDaoImp implements AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public AdminFoodDto foodCnt() {		
		return sqlSession.selectOne("dao.AdminMapper.foodCnt");
	}

	@Override
	public List<AdminFoodReadDto> foodReadRank() {
		return sqlSession.selectList("dao.AdminMapper.foodReadRank");
	}

}
