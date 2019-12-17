package com.java.purchase.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
}
