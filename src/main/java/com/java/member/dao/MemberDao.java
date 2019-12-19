package com.java.member.dao;

import com.java.food.dto.FoodDto;
import com.java.member.dto.MemberDto;

public interface MemberDao {
	public int memberInsert(MemberDto memberDto);
	
	public int login(String mail, String pwd);

	public MemberDto memberUpdate(String memberCode);

	public int insertKakao(String nickname, String mail);

	public int emailCheck(String mail);

	public int memberUpdateOk(MemberDto memberDto);

	public int foodInsert(FoodDto foodDto);

	public MemberDto getMemberCode(String mail);

	public FoodDto foodInfo(String memberCode);
}
