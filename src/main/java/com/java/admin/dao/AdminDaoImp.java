package com.java.admin.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AdminDaoImp implements AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int loginCheck(String adminId, String adminPwd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("adminId", adminId);		
		map.put("adminPwd", adminPwd);		
		
		return sqlSessionTemplate.selectOne("memberMapper.loginCheck", map);
	}

}
