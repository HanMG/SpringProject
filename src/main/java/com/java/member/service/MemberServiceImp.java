package com.java.member.service;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.JejuAspect;
import com.java.food.dto.FoodDto;
import com.java.member.dao.MemberDao;
import com.java.member.dto.MemberDto;

@Component
public class MemberServiceImp implements MemberService{
	
	@Autowired
	private MemberDao memberDao;


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


	@Override
	public void memberMailLoginOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String mail=request.getParameter("mail");
		String pwd=request.getParameter("pwd");
		
		JejuAspect.logger.info(JejuAspect.logMsg + mail + "\t\t" + pwd);
		int check=memberDao.login(mail, pwd);
		
		JejuAspect.logger.info(JejuAspect.logMsg + check);
		mav.addObject("check", check);
		mav.addObject("mail", mail);
		mav.setViewName("member/mailLoginOk.tiles");
	}


	@Override
	public void memberUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession session = request.getSession();
		String mail = (String) session.getAttribute("mail");
		
		JejuAspect.logger.info(JejuAspect.logMsg + mail);
		
		MemberDto memberDto = memberDao.memberUpdate(mail);
		JejuAspect.logger.info(JejuAspect.logMsg + memberDto.toString());
		mav.addObject("memberDto", memberDto);
		
		mav.setViewName("member/memberUpdate.tiles");
		
	}
	
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
		
		JejuAspect.logger.info(JejuAspect.logMsg + check);
		JejuAspect.logger.info(JejuAspect.logMsg + mail);
		mav.addObject("check", check);
		mav.addObject("mail", mail);
		mav.setViewName("member/mailLoginOk.tiles");
		
	}


	@Override
	public void memberMypage(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession session = request.getSession();
		String mail = (String) session.getAttribute("mail");
		
		JejuAspect.logger.info(JejuAspect.logMsg + mail);
		
		MemberDto memberDto = memberDao.memberUpdate(mail);
		JejuAspect.logger.info(JejuAspect.logMsg + memberDto.toString());
		mav.addObject("memberDto", memberDto);
		
		mav.setViewName("member/myPage.tiles");
		
	}
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
	@Override
	public void myFood(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		mav.setViewName("member/myFood.tiles");
	}

	@Override
	public void myFoodWrite(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		FoodDto foodDto=(FoodDto)map.get("foodDto");
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		JejuAspect.logger.info(JejuAspect.logMsg + foodDto.toString());
		int check=memberDao.foodInsert(foodDto);
		JejuAspect.logger.info(JejuAspect.logMsg + check);
		mav.addObject("check", check);
	}
	
	@Override
	public void myEd(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		String mail = (String) session.getAttribute("mail");
		JejuAspect.logger.info(JejuAspect.logMsg + mail);
		mav.setViewName("member/myEd.tiles");
	}
	@Override
	public void myReView(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		String mail = (String) session.getAttribute("mail");
		JejuAspect.logger.info(JejuAspect.logMsg + mail);
		mav.setViewName("member/myReView.tiles");
	}
	@Override
	public void myFavorite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		String mail = (String) session.getAttribute("mail");
		JejuAspect.logger.info(JejuAspect.logMsg + mail);
		mav.setViewName("member/myFavorite.tiles");
	}
	
}



