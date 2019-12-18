package com.java.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.food.dto.FoodDto;
import com.java.member.dto.MemberDto;

@Component
public class MemberDaoImp implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int memberInsert(MemberDto memberDto) {
	
		return sqlSessionTemplate.insert("insert", memberDto);
	}

	@Override
	public int login(String mail, String pwd) {
		Map<String, String> hMap=new HashMap<String, String>();
		hMap.put("mail", mail);
		hMap.put("pwd", pwd);
		return sqlSessionTemplate.selectOne("login", hMap);
	}
	
	@Override
	public MemberDto memberUpdate(String mail) {
		
		return sqlSessionTemplate.selectOne("memberInfo", mail);
	}

	@Override
	public int insertKakao(String nickname, String mail) {
		Map<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("nickname", nickname);
		hashMap.put("mail", mail);
		
		
		
		return sqlSessionTemplate.insert("insertKakao", hashMap);
	}
	
	@Override
	public int emailCheck(String mail) {
		
		return sqlSessionTemplate.selectOne("emailCheck", mail);
	}
	
	@Override
	public int memberUpdateOk(MemberDto memberDto) {
		
		return sqlSessionTemplate.update("memberUpdate", memberDto);
	}
	
	@Override
	public int foodInsert(FoodDto foodDto) {
		return sqlSessionTemplate.insert("foodInsert", foodDto);
	}
}
