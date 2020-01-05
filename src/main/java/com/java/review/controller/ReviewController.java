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

/**
 * @작성자 : 한문구
 * @작성일 : 2019. 12. 19.
 * @설명 : 리뷰 컨트롤러
 */

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	// 리뷰 등록시 페이지로 이동
	@RequestMapping(value = "/review/insert.go", method = RequestMethod.GET)
	public ModelAndView reviewInsert(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		reviewService.reviewInsert(mav);
		return mav;
	}

	// 리뷰 등록시 정보 입력
	@RequestMapping(value = "/review/insertOk.go", method = RequestMethod.POST)
	public ModelAndView reviewInsertOk(HttpServletRequest request, HttpServletResponse response, ReviewDto reviewDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("reviewDto", reviewDto);
		// 서비스에 model and view 보냄
		reviewService.reviewInsertOk(mav);
		return mav;
	}

	// 리뷰 수정시 페이지 이동
	@RequestMapping(value = "/review/update.go", method = RequestMethod.GET)
	public ModelAndView reviewUpdate(HttpServletRequest request, HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		reviewService.reviewUpdate(mav);
		return mav;
	}
	
	// 리뷰 수정시 페이지 이동
	@RequestMapping(value = "/review/myUpdate.go", method = RequestMethod.GET)
	public ModelAndView reviewMyUpdate(HttpServletRequest request, HttpServletResponse reponse) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		reviewService.reviewMyUpdate(mav);
		return mav;
	}

	// 리뷰 수정시 정보 입력
	@RequestMapping(value = "/review/updateOk.go", method = RequestMethod.POST)
	public ModelAndView reviewUpdateOk(HttpServletRequest request, HttpServletResponse reponse, ReviewDto reviewDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("reviewDto", reviewDto);
		// 서비스에 model and view 보냄
		reviewService.reviewUpdateOk(mav);
		return mav;
	}
	
	// 리뷰 수정시 정보 입력
	@RequestMapping(value = "/review/MyUpdateOk.go", method = RequestMethod.POST)
	public ModelAndView reviewMyUpdateOk(HttpServletRequest request, HttpServletResponse reponse, ReviewDto reviewDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("reviewDto", reviewDto);
		// 서비스에 model and view 보냄
		reviewService.reviewMyUpdateOk(mav);
		return mav;
	}

	// 리뷰 상세 페이지
	@RequestMapping(value = "/review/read.go", method = RequestMethod.GET)
	public void reviewRead(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		reviewService.reviewRead(mav);
	}

	// 관리자 페이지 리뷰 삭제
	@RequestMapping(value = "/review/delete.go", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView reviewDelete(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		reviewService.reviewDelete(mav);
		return mav;
	}

	// 상세 페이지 유저가 리뷰 삭제
	@RequestMapping(value = "/review/userDelete.go", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView userReviewDelete(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		reviewService.userReviewDelete(mav);
		return mav;
	}
	
	// 마이 페이지 유저가 리뷰 삭제
	@RequestMapping(value = "/review/myUserDelete.go", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myUserDelete(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		reviewService.myUserReviewDelete(mav);
		return mav;
	}
	
	/*
	 * // 이미지 바로 삭제 ( 사용 X )
	 * 
	 * @RequestMapping(value = "/review/imageDelete.go", method = RequestMethod.GET)
	 * public ModelAndView imageDelete(HttpServletRequest request) { ModelAndView
	 * mav = new ModelAndView(); mav.addObject("request", request);
	 * reviewService.imageDelete(mav); return mav; }
	 */

	// 관리자 페이지 게시글 클릭시 update페이지로 이동 ( 사용 X ) 
	/*
	 * @RequestMapping(value = "/review/adminReviewRead.go", method =
	 * RequestMethod.GET) public ModelAndView adminReviewRead(HttpServletRequest
	 * request) { ModelAndView mav = new ModelAndView(); mav.addObject("request",
	 * request); reviewService.adminReviewRead(mav); return mav; }
	 */

	// 관리자 페이지 게시글 클릭시 Ajax로 리뷰 정보 가져오기  
	@RequestMapping(value = "/admin/getReview.go", method = RequestMethod.GET)
	public void getReview(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		reviewService.getReview(mav);
	}

}
