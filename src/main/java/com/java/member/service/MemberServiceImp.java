package com.java.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.java.aop.JejuAspect;
import com.java.coupon.dto.CouponDto;
import com.java.food.dao.FoodDao;
import com.java.food.dto.FoodDto;
import com.java.food.dto.FoodReviewDto;
import com.java.member.dao.MemberDao;
import com.java.member.dto.MemberDto;
import com.java.member.dto.MemberFavoriteDto;
import com.java.purchase.dao.PurchaseDao;
import com.java.purchase.dto.PurchaseListDto;
import com.java.review.dto.ReviewDto;

@Component
public class MemberServiceImp implements MemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private PurchaseDao purchaseDao;
	

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
	//이메일 중복 체크
	@Override
	public void mailCheck(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		String mail=request.getParameter("mail");
		int check=memberDao.emailCheck(mail);
		JejuAspect.logger.info(JejuAspect.logMsg + check);
		
		response.setContentType("application/text;charset=utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(check);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//mav.addObject("check", check);
		//mav.setViewName("member/emailCheckOk.empty");
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
			JejuAspect.logger.info(JejuAspect.logMsg + memberDto.toString());
		}
		
		JejuAspect.logger.info(JejuAspect.logMsg + check);
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
		JejuAspect.logger.info(JejuAspect.logMsg + mail);
		// DB 저장하기전에 카카오에서 주는 mail값으로 현재 DB에 있는지 체크한다.
		int emailCheck = memberDao.emailCheck(mail);
		int check = 0;
		// 만약 emailCheck 0이면 DB에 존재하지 않으므로 DB에 추가하는 과정을 하고 
		if (emailCheck == 0) {
			check = memberDao.insertKakao(nickname, mail);
			// emailCheck 이미 존재해서 체크값이 1이면 그 값을 체크값에 주어서 넘어간다
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
	// 네이버 로그인
	@Override
	public void insertNaver(String json,ModelAndView mav) throws JsonParseException, JsonMappingException, IOException {
		ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> map = mapper.readValue(json, Map.class);
        Map<String,Object> data = (Map<String, Object>) map.get("response");
     


        String email = (String)data.get("email");
        
        JejuAspect.logger.info(JejuAspect.logMsg + email);
        
        int emailCheck = memberDao.emailCheck(email);
        int check = 0;
        		
        if (emailCheck == 0) check = memberDao.insertNaver(data);
        else check = emailCheck;
        
        MemberDto memberDto = null;
		if (check == 1) {
			memberDto = memberDao.getMemberCode(email);
		}
		
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
		
		String couponCount = memberDao.couponCount(memberCode);
		String reviewCount = memberDao.reviewCount(memberCode);
		String favoriteCount = memberDao.favoriteCount(memberCode);
		mav.addObject("couponCount", couponCount);
		mav.addObject("reviewCount", reviewCount);
		mav.addObject("favoriteCount", favoriteCount);
		
		JejuAspect.logger.info(JejuAspect.logMsg + memberCode);
		// 개인정보를 보기 위한
		MemberDto memberDto = memberDao.memberUpdate(memberCode);
		JejuAspect.logger.info(JejuAspect.logMsg + memberDto.toString());
		mav.addObject("memberDto", memberDto);
		
		// 내가 등록한 식당 리스트를 보기 위한 
		List<FoodDto> foodList = memberDao.getMyFood(memberCode);
		JejuAspect.logger.info(JejuAspect.logMsg + foodList.size());
		JejuAspect.logger.info(JejuAspect.logMsg + foodList.toString());
		mav.addObject("foodList", foodList);
		
		// 가고싶다
		List<MemberFavoriteDto> favoriteList = memberDao.getMyFavorite(memberCode);
		JejuAspect.logger.info(JejuAspect.logMsg + favoriteList.size());
		JejuAspect.logger.info(JejuAspect.logMsg + favoriteList.toString());
		mav.addObject("favoriteList", favoriteList);
		
		// 리뷰
		List<FoodReviewDto> reviewList = memberDao.getMyReview(memberCode);
		JejuAspect.logger.info(JejuAspect.logMsg + reviewList.size());
		JejuAspect.logger.info(JejuAspect.logMsg + reviewList.toString());
		mav.addObject("reviewList",reviewList);
		
		// EAT딜
		List<PurchaseListDto> couponList = purchaseDao.purchaseSelectAll(memberCode);
		//List<CouponDto> couponList = memberDao.getMyCoupon(memberCode);
		JejuAspect.logger.info(JejuAspect.logMsg + couponList.size());
		JejuAspect.logger.info(JejuAspect.logMsg + couponList.toString());
		mav.addObject("couponList", couponList);
		
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
	
	//관리자
	@Override
	public void adminMember(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		MemberDto memberDto = (MemberDto) map.get("memberDto");
		List<MemberDto> memberList = memberDao.getMember(memberDto);
		mav.addObject("memberList", memberList);
	}
	
	@Override
	public void getMember(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		String memberCode=request.getParameter("memberCode");
		JejuAspect.logger.info(JejuAspect.logMsg + memberCode);
		
		MemberDto memberDto = new MemberDto();
		memberDto = memberDao.memberUpdate(memberCode);
		
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		String memberDate =  date.format(memberDto.getMemberDate());
		JejuAspect.logger.info(JejuAspect.logMsg + "memberDate : " + memberDate);
		
		JSONObject jsonMemberDto = new JSONObject();
		JejuAspect.logger.info(JejuAspect.logMsg + memberDto.toString());
		
		jsonMemberDto.put("memberCode", memberDto.getMemberCode());
		jsonMemberDto.put("memberDate", memberDate);
		jsonMemberDto.put("memberMail", memberDto.getMemberMail());
		jsonMemberDto.put("memberName", memberDto.getMemberName());
		jsonMemberDto.put("memberPhone", memberDto.getMemberPhone());
		jsonMemberDto.put("memberStatus", memberDto.getMemberStatus());
		String jsonText = jsonMemberDto.toJSONString();
		JejuAspect.logger.info(JejuAspect.logMsg + "jsontext" + jsonText);
		
		response.setContentType("application/x-json;charset=utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(jsonText);
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void adminUpdateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		MemberDto memberDto = (MemberDto) map.get("memberDto");
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		JejuAspect.logger.info(JejuAspect.logMsg + memberDto.toString());
		
		int check = memberDao.adminUpdateOk(memberDto);
		JejuAspect.logger.info(JejuAspect.logMsg + check);
		mav.addObject("check", check);
		mav.setViewName("member/adminUpdateOk.tiles");
	}
	
	
	
}



