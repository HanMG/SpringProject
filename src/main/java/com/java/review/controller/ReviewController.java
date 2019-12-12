package com.java.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.review.dto.ReviewDto;
import com.java.review.service.ReviewService;

@Controller
public class ReviewController {
	/*
	 * @Autowired private ReviewService reviewService;
	 */
	
	// 리뷰 등록 관련
	@RequestMapping(value = "review/register.go", method = RequestMethod.GET)
	public ModelAndView reviewRegister(HttpServletRequest request, HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("review/register.tiles");	
		return mav;				
	}
	
	@RequestMapping(value = "review/registerOk.go", method = RequestMethod.POST)
	public ModelAndView reviewRegisterOk(HttpServletRequest request, HttpServletResponse reponse, ReviewDto reviewDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("reviewDto",reviewDto);
		// 서비스에 model and view 보냄
		return mav;
	}
	
	// 리뷰 업로드 관련
	@RequestMapping(value = "review/update.go", method = RequestMethod.GET)
	public ModelAndView reviewUpdate(HttpServletRequest request, HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);		
		return mav;
	}
	
	@RequestMapping(value = "review/updateOk.go", method = RequestMethod.POST)
	public ModelAndView reviewUpdateOk(HttpServletRequest request, HttpServletResponse reponse, ReviewDto reviewDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);		
		mav.addObject("reviewDto",reviewDto);
		// 서비스에 model and view 보냄
		return mav;
	}
	
	// 리뷰 삭제
	@RequestMapping(value = "review/delete.go", method = RequestMethod.GET)
	public ModelAndView reviewDelete(HttpServletRequest request, HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);		
		return mav;
	}
	
	
}
