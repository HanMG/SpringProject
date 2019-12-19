package com.java.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.JejuAspect;
import com.java.food.dto.FoodDto;
import com.java.member.dto.MemberDto;
import com.java.member.service.MemberService;

@Controller
public class Membercontroller {
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping(value="member/login.go", method=RequestMethod.GET)
	public ModelAndView memberLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/login.tiles");
		return mav;
	}
	@RequestMapping(value="member/mailLogin.go", method=RequestMethod.GET)
	public ModelAndView memberMailLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/mailLogin.tiles");
		return mav;
	}
	
	@RequestMapping(value="/kakaoLogin.go", method = RequestMethod.GET)
	public ModelAndView insertKakao(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		memberService.insertKakao(mav);
		return mav;
	}
	@RequestMapping(value="/member/signIn.go", method=RequestMethod.GET)
	public ModelAndView memberSignIn(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/signIn.tiles");
		return mav;
	}
	
	@RequestMapping(value="/member/signInOk.go", method=RequestMethod.POST)
	public ModelAndView memberSignInOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		memberService.memberSignInOk(mav);
		return mav;
	}
	
	@RequestMapping(value="/member/mailLoginOk.go", method=RequestMethod.POST)
	public ModelAndView memberMailLoginOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		memberService.memberMailLoginOk(mav);
		return mav;
	}
	
	@RequestMapping(value="/member/main.go", method=RequestMethod.GET)
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session=request.getSession();
		request.getSession().invalidate();
//		if(!session.isNew()) {
//			JejuAspect.logger.info(JejuAspect.logMsg + (Integer) session.getAttribute("check"));
//		}
		return "/member/main.tiles";
	}
	
	@RequestMapping(value="/member/logout.go", method=RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return "/member/logout.tiles";
	}
	
	@RequestMapping(value="/member/myPage.go", method=RequestMethod.GET)
	public ModelAndView memberMyPage(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		memberService.memberMypage(mav);
		return mav;
	}

	
	@RequestMapping(value="/member/memberUpdate.go", method=RequestMethod.GET)
	public ModelAndView memberUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		memberService.memberUpdate(mav);
		return mav;
	
	}
	
	@RequestMapping(value="/member/memberUpdateOk.go", method=RequestMethod.POST)
	public ModelAndView memberUpdateOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		memberService.memberUpdateOk(mav);
		return mav;
	}
	
	@RequestMapping(value="/member/myFood.go", method=RequestMethod.GET)
	public ModelAndView myFood(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		memberService.myFood(mav);
		return mav;
	}
	
	@RequestMapping(value="/member/myFoodIn.go", method=RequestMethod.GET)
	public String myFoodIn(HttpServletRequest request, HttpServletResponse response) {
		return "/member/myFoodIn.tiles";
	}
	@RequestMapping(value="/member/myFoodWrite.go", method=RequestMethod.POST)
	public ModelAndView myFoodWrite(HttpServletRequest request, HttpServletResponse response, FoodDto foodDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("foodDto", foodDto);
		memberService.myFoodWrite(mav);
		return mav;
		
	}
	@RequestMapping(value="/member/myEd.go", method=RequestMethod.GET)
	public ModelAndView myEd(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		memberService.myEd(mav);
		return mav;
	}
	@RequestMapping(value="/member/myReView.go", method=RequestMethod.GET)
	public ModelAndView myReView(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		memberService.myReView(mav);
		return mav;
	}
	@RequestMapping(value="/member/myFavorite.go", method=RequestMethod.GET)
	public ModelAndView myFavorite(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		memberService.myFavorite(mav);
		return mav;
	}
	
}




