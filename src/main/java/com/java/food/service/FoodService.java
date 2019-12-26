package com.java.food.service;

import org.springframework.web.servlet.ModelAndView;

public interface FoodService {

	public void foodInsertOk(ModelAndView mav);

	public void foodRead(ModelAndView mav);

	public void foodUpdate(ModelAndView mav);

	public void foodDelete(ModelAndView mav);

	public void foodUpdateOk(ModelAndView mav);	

	public void foodReviewList(ModelAndView mav);

	public void adminFoodList(ModelAndView mav);

	public void getFood(ModelAndView mav);

}
