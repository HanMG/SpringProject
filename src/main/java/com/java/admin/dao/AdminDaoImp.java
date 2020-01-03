package com.java.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.admin.dto.AdminCouponDto;
import com.java.admin.dto.AdminCouponReadDto;
import com.java.admin.dto.AdminDto;
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
	@Override
	public int loginCheck(String adminId, String adminPwd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("adminId", adminId);		
		map.put("adminPwd", adminPwd);		
		
		return sqlSession.selectOne("memberMapper.loginCheck", map);
	}

	// 구매쿠폰 top10
	@Override
	public List<AdminCouponReadDto> couponReadRank() {
		return sqlSession.selectList("dao.AdminMapper.couponReadRank");	
	}
	
	// 월간 쿠폰 구매 카운트
	@Override
	public AdminCouponDto couponCount() {
		return sqlSession.selectOne("dao.AdminMapper.couponCnt");
	}
	// 세션
	@Override
	public AdminDto getAdminCode(String adminId) {
		return sqlSession.selectOne("dao.AdminMapper.adminCode", adminId);
	}
}
