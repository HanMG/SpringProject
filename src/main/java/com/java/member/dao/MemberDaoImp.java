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
	public MemberDto memberUpdate(String mail) {
		
		return sqlSessionTemplate.selectOne("memberMapper.memberInfo", mail);
	}

	@Override
	public int insertKakao(String nickname, String mail) {
		Map<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("nickname", nickname);
		hashMap.put("mail", mail);
		
		
		
		return sqlSessionTemplate.insert("memberMapper.insertKakao", hashMap);
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
	}
}
