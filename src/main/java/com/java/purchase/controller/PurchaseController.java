package com.java.purchase.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.purchase.dto.PurchaseDto;
import com.java.purchase.service.PurchaseService;

/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 17.
 * @작업 내용 :  PurchaseController
*/
@Controller
public class PurchaseController {
	
	@Autowired
	private PurchaseService purchaseService;
	
	
	//구매 페이지 연결
	@RequestMapping(value="/purchase/purchaseInsert.go", method = RequestMethod.GET)
	public ModelAndView purchaseInsert(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		purchaseService.purchaseInsert(mav);
		
		return mav;
	}
	
	//구매하기
	@RequestMapping(value="/purchase/purchaseInsertOk.go", method = RequestMethod.POST)
	public ModelAndView purchaseInsertOk(HttpServletRequest request, HttpServletResponse response, PurchaseDto purchaseDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("purchaseDto", purchaseDto);
		
		purchaseService.purchaseInsertOk(mav);
		
		return mav;
	}
	
	//구매내역
	@RequestMapping(value="/purchase/purchaseList.go", method= RequestMethod.GET)
	public ModelAndView purchaseList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		purchaseService.purchaseListAll(mav);
		
		return mav;
	}

	//구매 취소
	@RequestMapping(value="/purchase/purchaseDelete.go", method=RequestMethod.GET)
	public ModelAndView purchaseDelete(HttpServletRequest request, HttpServletResponse response) {
		String couponCode = request.getParameter("couponCode");
		String couponName = request.getParameter("couponName");
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		
		ModelAndView mav =  new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("couponCode", couponCode);
		mav.addObject("couponName", couponName);
		mav.addObject("pageNumber", pageNumber);
		
		mav.setViewName("purchase/purchaseDelete.empty");
		
		return mav;
	}
	@RequestMapping(value="/purchase/purchaseDeleteOk.go", method=RequestMethod.POST)
	public ModelAndView purchaseDeleteOk(HttpServletRequest request, HttpServletResponse response) {
		String couponCode = request.getParameter("couponCode");
		String couponName = request.getParameter("couponName");
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		
		ModelAndView mav =  new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("couponCode", couponCode);
		mav.addObject("couponName", couponName);
		mav.addObject("pageNumber", pageNumber);
		
		purchaseService.purchaseDeleteOk(mav);
		
		return mav;
	}
}

