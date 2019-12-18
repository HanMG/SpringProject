package com.java.member.service;

import org.springframework.web.servlet.ModelAndView;

public interface MemberService {
	public void memberSignInOk(ModelAndView mav);
	
	public void memberMailLoginOk(ModelAndView mav);
	
	public void memberUpdate(ModelAndView mav);
	
	public void insertKakao(ModelAndView mav);

	public void memberMypage(ModelAndView mav);

	public void memberUpdateOk(ModelAndView mav);

	public void myFood(ModelAndView mav);

	public void myFoodWrite(ModelAndView mav);

	public void myEd(ModelAndView mav);

	public void myReView(ModelAndView mav);

	public void myFavorite(ModelAndView mav);
	
}
