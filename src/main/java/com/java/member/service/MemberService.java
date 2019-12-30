package com.java.member.service;

import java.io.IOException;

import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;

public interface MemberService {
	public void memberSignInOk(ModelAndView mav);
	
	public void memberMailLoginOk(ModelAndView mav);
	
	public void insertKakao(ModelAndView mav);

	public void memberMypage(ModelAndView mav);

	public void memberUpdateOk(ModelAndView mav);

	public void myFoodWrite(ModelAndView mav);

	public void myFoodDel(ModelAndView mav);

	public void adminMember(ModelAndView mav);

	public void insertNaver(String json,ModelAndView mav) throws JsonParseException, JsonMappingException, IOException;

	public void getMember(ModelAndView mav);

	public void adminUpdateOk(ModelAndView mav);

	public void mailCheck(ModelAndView mav);

}
