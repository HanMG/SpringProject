package com.java.member.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.java.aop.JejuAspect;
import com.java.food.dto.FoodDto;
import com.java.member.dto.MemberDto;
import com.java.member.service.MemberService;
import com.java.member.naver.NaverLoginManager;

@Controller
public class Membercontroller {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private NaverLoginManager naverLoginManager;
	
	// 네이버 로그인
	@RequestMapping(value = "/auth/naverCallback.go", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView callback(HttpServletRequest request, HttpServletResponse response,@RequestParam Map<String,Object> data)
            throws IOException {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String memberCode = (String)session.getAttribute("memberCode");
		String code = (String) data.get("code");
		String state = (String) data.get("state");
		boolean isRedirectState = false;
		
		if(memberCode != null) isRedirectState = true; 
		else if(code.equals("") || code == null) isRedirectState = true; 
		else if(state.equals("") || state == null) isRedirectState = true; 

		if(isRedirectState) {
			mav.setViewName("redirect:/jeju.go");
			return mav;
		}
		
        OAuth2AccessToken oauthToken = naverLoginManager.getAccessToken(session,code,state);
        String apiResult = naverLoginManager.getUserProfile(oauthToken);
        
        
        memberService.insertNaver(apiResult,mav);
        
        mav.addObject("result", apiResult);

        return mav;
    }
	
	// 카카오로 로그인	
	@RequestMapping(value="/kakaoLogin.go", method = RequestMethod.GET)
	public ModelAndView insertKakao(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		memberService.insertKakao(mav);
		return mav;
	}
	// 회원가입
	@RequestMapping(value="/member/signInOk.go", method=RequestMethod.POST)
	public ModelAndView memberSignInOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		memberService.memberSignInOk(mav);
		return mav;
	}
	//이메일 중복 체크
	@RequestMapping(value="/member/mailCheck.go", method= {RequestMethod.GET,RequestMethod.POST})
	public void mailCheck(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		memberService.mailCheck(mav);
	}
	// 카카오, 이메일 성공시
	@RequestMapping(value="/member/mailLoginOk.go", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView memberMailLoginOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		memberService.memberMailLoginOk(mav);
		return mav;
	}
	// 메인하면 가면서 세션 다 끊기
	@RequestMapping(value="/member/main.go", method=RequestMethod.GET)
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
//		HttpSession session=request.getSession();
//		request.getSession().invalidate();
		
		return "/member/main.tiles";
	}
	// 로그아웃
	@RequestMapping(value="/member/logout.go", method=RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return "/member/logout.tiles";
	}
	// 마이페이지
	@RequestMapping(value="/member/myPage.go", method=RequestMethod.GET)
	public ModelAndView memberMyPage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		memberService.memberMypage(mav);
		return mav;
	}
	// 개인정보 수정
	@RequestMapping(value="/member/memberUpdateOk.go", method=RequestMethod.POST)
	public ModelAndView memberUpdateOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		memberService.memberUpdateOk(mav);
		return mav;
	}
	// 내가 등록한 식당
	@RequestMapping(value="/member/myFoodWrite.go", method=RequestMethod.POST)
	public ModelAndView myFoodWrite(HttpServletRequest request, HttpServletResponse response, FoodDto foodDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("foodDto", foodDto);
		memberService.myFoodWrite(mav);
		return mav;
	}
	
	// 내가 등록한 식당 삭제
	@RequestMapping(value="/myFoodDel.go", method=RequestMethod.GET) 
	public void myFoodDel(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		memberService.myFoodDel(mav);
	}
	
	
	// 관리자
	
	// 회원 관리 관련
	@RequestMapping(value = "/admin/member.go", method = RequestMethod.GET)
	public ModelAndView member(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		memberService.adminMember(mav);
		mav.setViewName("admin/member.admin");		
		return mav;		
	}
	
	@RequestMapping(value = "/admin/getMember.go", method = RequestMethod.GET)
	public void getMember(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		memberService.getMember(mav);
	}
	// 회원정보 수정
	@RequestMapping(value = "/admin/adminUpdateOk.go", method=RequestMethod.POST)
	public ModelAndView adminUpdateOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto){
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		memberService.adminUpdateOk(mav);
		return mav;
	}
}




