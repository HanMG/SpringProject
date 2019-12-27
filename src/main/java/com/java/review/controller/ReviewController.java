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
	
	@Autowired
	private ReviewService reviewService;
	 
	
	// 리뷰 등록 관련
	@RequestMapping(value = "/review/insert.go", method = RequestMethod.GET)
	public ModelAndView reviewInsert(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		reviewService.reviewInsert(mav);		
		return mav;				
	}
	
	@RequestMapping(value = "/review/insertOk.go", method = RequestMethod.POST)
	public ModelAndView reviewInsertOk(HttpServletRequest request, ReviewDto reviewDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("reviewDto",reviewDto);		
		// 서비스에 model and view 보냄
		reviewService.reviewInsertOk(mav);	
		return mav;
	}
	
	// 리뷰 업로드 관련
	@RequestMapping(value = "/review/update.go", method = RequestMethod.GET)
	public ModelAndView reviewUpdate(HttpServletRequest request, HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		reviewService.reviewUpdate(mav);
		return mav;
	}
	
	@RequestMapping(value = "/review/updateOk.go", method = RequestMethod.POST)
	public ModelAndView reviewUpdateOk(HttpServletRequest request, ReviewDto reviewDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);		
		mav.addObject("reviewDto",reviewDto);
		// 서비스에 model and view 보냄
		reviewService.reviewUpdateOk(mav);
		return mav;
	}
	@RequestMapping(value = "/review/read.go", method = RequestMethod.GET)
	public void reviewRead(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("response",response);
		reviewService.reviewRead(mav);
	}
	
	// 리뷰 삭제
	@RequestMapping(value = "/review/delete.go", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView reviewDelete(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);	
		reviewService.reviewDelete(mav);
		return mav;
	}
	
	@RequestMapping(value = "/review/userDelete.go", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView userReviewDelete(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("response",response);
		reviewService.userReviewDelete(mav);
		return mav;
	}
	
	@RequestMapping(value="/review/imageDelete.go", method = RequestMethod.GET)
	public ModelAndView imageDelete(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);		
		reviewService.imageDelete(mav);
		return mav;
	}	
	
	@RequestMapping(value="/review/adminReviewRead.go",method = RequestMethod.GET)
	public ModelAndView adminReviewRead(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request",request);
		reviewService.adminReviewRead(mav);
		return mav;
	}
	
	@RequestMapping(value="/admin/getReview.go", method = RequestMethod.GET)
	public void getReview(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		reviewService.getReview(mav);	
	}
	
}
