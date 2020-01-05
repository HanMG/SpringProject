package com.java.review.service;

import org.springframework.web.servlet.ModelAndView;

public interface ReviewService {

	public void reviewInsert(ModelAndView mav);
	
	public void reviewInsertOk(ModelAndView mav);

	public void reviewUpdate(ModelAndView mav);

	public void reviewUpdateOk(ModelAndView mav);

	//public void imageDelete(ModelAndView mav);

	public void reviewDelete(ModelAndView mav);

	public void reviewRead(ModelAndView mav);

	public void adminReviewList(ModelAndView mav);

	//public void adminReviewRead(ModelAndView mav);

	public void getReview(ModelAndView mav);

	public void userReviewDelete(ModelAndView mav);

	public void myUserReviewDelete(ModelAndView mav);

	public void reviewMyUpdate(ModelAndView mav);

	public void reviewMyUpdateOk(ModelAndView mav);

	
	
}
