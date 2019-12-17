package com.java.purchase.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.JejuAspect;
import com.java.coupon.dao.CouponDao;
import com.java.coupon.dto.CouponDto;
import com.java.image.dao.ImageDao;
import com.java.image.dto.ImageDto;
import com.java.purchase.dao.PurchaseDao;


/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 17.
 * @작업 내용 :  PurchaseServiceImp
*/

@Component
public class PurchaseServiceImp implements PurchaseService {
	//@Autowired
	//private PurchaseDao purchaseDao;
	
	@Autowired
	private CouponDao couponDao;
	
	// TODO Auto-generated method stub
	// 구매 페이지 연결
	@Override
	public void purchaseInsert(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String couponCode = request.getParameter("couponCode");
		JejuAspect.logger.info(JejuAspect.logMsg + "couponCode: "+ couponCode);
		
		CouponDto couponDto = couponDao.purchaseSelect(couponCode);
		JejuAspect.logger.info(JejuAspect.logMsg + "couponDto: "+ couponDto.toString());
		
		//세션으로 회원정보 가져오기
		//HttpSession httpSession =  request.getSession(true);
		//MemberDto memberDto = (MemberDto) httpSession.getAttribute("memberDto");
		//if(memberDto != null) {memberDto.getMemberCode();}
		
		String memberCode = request.getRequestedSessionId();
		
		mav.addObject("couponDto", couponDto);
		mav.setViewName("purchase/purchaseDetail.tiles");
	}
	
}
