package com.java.review.service;

import org.springframework.web.servlet.ModelAndView;

public interface ReviewService {

	public void reviewInsert(ModelAndView mav);
	
	public void reviewInsertOk(ModelAndView mav);

	public void reviewUpdate(ModelAndView mav);

	public void reviewUpdateOk(ModelAndView mav);

	public void imageDelete(ModelAndView mav);

	public void reviewDelete(ModelAndView mav);

	public void reviewRead(ModelAndView mav);

	
	
}