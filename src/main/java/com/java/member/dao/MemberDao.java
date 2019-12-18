package com.java.member.dao;

import com.java.food.dto.FoodDto;
import com.java.member.dto.MemberDto;

public interface MemberDao {
	public int memberInsert(MemberDto memberDto);
	
	public int login(String mail, String pwd);

	public MemberDto memberUpdate(String mail);

	public int insertKakao(String nickname, String mail);

	public int emailCheck(String mail);

	public int memberUpdateOk(MemberDto memberDto);

	public int foodInsert(FoodDto foodDto);

	
}
