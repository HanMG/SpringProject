package com.java.review.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.JejuAspect;
import com.java.review.dao.ReviewDao;
import com.java.review.dto.ReviewDto;

@Component
public class ReviewServiceImp implements ReviewService {

	@Autowired	
	private ReviewDao reviewDao;
	
	
	@Override
	public void reviewInsert(ModelAndView mav) {
		Map<String,Object>map = mav.getModel();
		HttpServletRequest request =(HttpServletRequest) map.get("request");
		String foodCode = request.getParameter("foodCode");
		String foodName = reviewDao.getFoodName(foodCode);
		mav.addObject("foodName",foodName);
		mav.setViewName("review/insert.tiles");	
	}
	
	@Override
	public void reviewInsertOk(ModelAndView mav) {
		Map<String,Object>map = mav.getModel();
		MultipartHttpServletRequest request =(MultipartHttpServletRequest) map.get("request");
		List<MultipartFile> upFile = request.getFiles("imgFile");
		ReviewDto reviewDto=(ReviewDto) map.get("reviewDto");		
		reviewDto.setReviewDate(new Date());
		JejuAspect.logger.info(JejuAspect.logMsg+reviewDto);
		int check = reviewDao.reviewInsertOk(reviewDto);
		
		mav.addObject("check",check);
		mav.setViewName("review/insertOk.tiles");
	}	
	
	
	 
}
