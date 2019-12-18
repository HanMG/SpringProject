package com.java.search.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.JejuAspect;
import com.java.search.dto.SearchCouponDto;
import com.java.search.dto.SearchFoodDto;
import com.java.search.dao.SearchDao;

@Component
public class SearchServiceImp implements SearchService {
	
	@Autowired
	private SearchDao searchDao;

	@Override
	public void searchKeyword(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String keyword = (String) map.get("keyword");
		JejuAspect.logger.info(JejuAspect.logMsg + keyword);
		
		String pageNumber = request.getParameter("pageNumber");
		
		if(pageNumber == null) {
			pageNumber = "1";
		}
		
		int currentPage = Integer.parseInt(pageNumber); 		// 요청페이지 번호 (def.1)
		int boardSize = 10; 									// 페이지당 출력할 게시물 수
		int startRow = boardSize * (currentPage - 1) + 1;		// 시작번호
		int endRow = boardSize * currentPage;					// 끝번호
		
		// 음식점 수
		int foodCount = searchDao.foodCount(keyword);
		JejuAspect.logger.info(JejuAspect.logMsg + foodCount);
		
		List<SearchFoodDto> foodList = new ArrayList<SearchFoodDto>();
		if (foodCount > 0) {
			foodList = searchDao.foodList(keyword, startRow, endRow);
		}
		JejuAspect.logger.info(JejuAspect.logMsg + foodList.size());
		JejuAspect.logger.info(JejuAspect.logMsg + foodList.toString());
		
		// 쿠폰 수
		int couponCount = searchDao.couponCount(keyword);
		JejuAspect.logger.info(JejuAspect.logMsg + couponCount);
		
		List<SearchCouponDto> couponList = new ArrayList<SearchCouponDto>();
		if (couponCount > 0) {
			couponList = searchDao.couponList(keyword);
		}
		JejuAspect.logger.info(JejuAspect.logMsg + couponList.size());

		
		
		mav.addObject("currentPage", currentPage);
		mav.addObject("boardSize", boardSize);
		mav.addObject("foodCount", foodCount);
		mav.addObject("foodList", foodList);
		mav.addObject("couponCount", couponCount);
		mav.addObject("couponList", couponList);
		
		mav.setViewName("search/searchResult.tiles");
	}

	@Override
	public void foodList(ModelAndView mav) {

		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String tagValue = (String) map.get("tagValue");
		String tagType = (String) map.get("tagType");
		JejuAspect.logger.info(JejuAspect.logMsg + tagValue + " || " + tagType);
		
		List<SearchFoodDto> foodList = new ArrayList<SearchFoodDto>();
		foodList = searchDao.tagList(tagValue, tagType);
		JejuAspect.logger.info(JejuAspect.logMsg + foodList.size());
		
		mav.setViewName("food/list.tiles");		
	}

}
