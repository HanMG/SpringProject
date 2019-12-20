package com.java.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.JejuAspect;
import com.java.food.dao.FoodDao;
import com.java.food.dto.FoodDto;
import com.java.member.dao.MemberDao;
import com.java.member.dto.MemberDto;

@Component
public class MemberServiceImp implements MemberService{
	
	@Autowired
	private MemberDao memberDao;

	// 회원가입 과정
	@Override
	public void memberSignInOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		MemberDto memberDto=(MemberDto) map.get("memberDto");
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		memberDto.setMemberMail(request.getParameter("mail"));
		memberDto.setMemberName(request.getParameter("name"));
		memberDto.setMemberPwd(request.getParameter("pwd"));
		memberDto.setMemberDate(new Date());
		memberDto.setMemberPhone(request.getParameter("phone"));
		JejuAspect.logger.info(JejuAspect.logMsg + memberDto.toString());
		int check=memberDao.memberInsert(memberDto);
		JejuAspect.logger.info(JejuAspect.logMsg + check);
		mav.addObject("check",check);
		mav.setViewName("member/signInOk.tiles");
	}
	// 이메일 로그인 성공 과정
	@Override
	public void memberMailLoginOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String pwd=request.getParameter("pwd");
		String mail=request.getParameter("mail");
		
		int check=memberDao.login(mail, pwd);
		MemberDto memberDto = null;
		if (check == 1) {
			memberDto = memberDao.getMemberCode(mail);
		}
		
		JejuAspect.logger.info(JejuAspect.logMsg + check);
		JejuAspect.logger.info(JejuAspect.logMsg + memberDto.toString());
		mav.addObject("check", check);
		mav.addObject("memberDto", memberDto);
		mav.setViewName("member/mailLoginOk.tiles");
	}
	// 카카오 로그인시 카카오닉네임 이메일 입력
	@Override
	public void insertKakao(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String nickname = request.getParameter("nickname");
		String mail = request.getParameter("mail");
		int emailCheck = memberDao.emailCheck(mail);
		int check = 0;
		if (emailCheck == 0) {
			check = memberDao.insertKakao(nickname, mail);
		} else {
			check = emailCheck;
		}
		MemberDto memberDto = null;
		if (check == 1) {
			memberDto = memberDao.getMemberCode(mail);
		}
		
		JejuAspect.logger.info(JejuAspect.logMsg + check);
		JejuAspect.logger.info(JejuAspect.logMsg + mail);
		mav.addObject("check", check);
		mav.addObject("memberDto", memberDto);
		mav.setViewName("member/mailLoginOk.tiles");
		
	}
	// 마이페이지
	@Override
	public void memberMypage(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		String memberCode = (String) session.getAttribute("memberCode");
		
		JejuAspect.logger.info(JejuAspect.logMsg + memberCode);
		// 개인정보를 보기 위한
		MemberDto memberDto = memberDao.memberUpdate(memberCode);
		JejuAspect.logger.info(JejuAspect.logMsg + memberDto.toString());
		mav.addObject("memberDto", memberDto);
		
		// 내가 등록한 식당 리스트를 보기 위한 
		List<FoodDto> foodList = memberDao.getMyFood(memberCode);
		JejuAspect.logger.info(JejuAspect.logMsg + foodList.size());
		mav.addObject("foodList", foodList);
		
		// 가고싶다
		
		// 리뷰
		
		// EAT딜
		
		mav.setViewName("member/myPage.tiles");
		
	}
	// 개인정보 수정
	@Override
	public void memberUpdateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		MemberDto memberDto = (MemberDto) map.get("memberDto");
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		JejuAspect.logger.info(JejuAspect.logMsg + memberDto.toString());
		int check = memberDao.memberUpdateOk(memberDto);

		JejuAspect.logger.info(JejuAspect.logMsg + check);
		mav.addObject("check", check);	
		mav.setViewName("member/memberUpdateOk.tiles");
	}
	// 내가 등록한 식당
	@Override
	public void myFoodWrite(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		FoodDto foodDto=(FoodDto)map.get("foodDto");
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		String memberCode = (String) session.getAttribute("memberCode");
		foodDto.setMemberCode(memberCode);
		JejuAspect.logger.info(JejuAspect.logMsg + foodDto.toString());
		int check=memberDao.foodInsert(foodDto);
		JejuAspect.logger.info(JejuAspect.logMsg + check);
		mav.addObject("check", check);
		mav.setViewName("member/myFoodOk.tiles");
	}
	// 내가 등록한 식당 삭제
	@Override
	public void myFoodDel(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		String foodCode = request.getParameter("foodCode");
		
		JejuAspect.logger.info(JejuAspect.logMsg + "foodCode : " + foodCode);
		int check = memberDao.myFoodDel(foodCode);
		JejuAspect.logger.info(JejuAspect.logMsg + check);
		
		response.setContentType("application/text;charset=utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(foodCode);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
}



