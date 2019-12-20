package com.java.member.dao;

import java.util.List;

import com.java.food.dto.FoodDto;
import com.java.member.dto.MemberDto;

public interface MemberDao {
	public int memberInsert(MemberDto memberDto);
	
	public int login(String mail, String pwd);

	public MemberDto memberUpdate(String memberCode);

	public int insertKakao(String nickname, String mail);

	public int emailCheck(String memberCode);

	public int memberUpdateOk(MemberDto memberDto);

	public int foodInsert(FoodDto foodDto);

	public MemberDto getMemberCode(String mail);

	public List<FoodDto> getMyFood(String memberCode);

	public int myFoodDel(String foodCode);


	
}
