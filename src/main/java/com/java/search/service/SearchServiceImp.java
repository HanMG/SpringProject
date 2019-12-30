package com.java.search.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONValue;
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
//		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String keyword = (String) map.get("keyword");
		JejuAspect.logger.info(JejuAspect.logMsg + keyword);
		
		/*
		 * String pageNumber = request.getParameter("pageNumber");
		 * 
		 * if(pageNumber == null) { pageNumber = "1"; }
		 * 
		 * int currentPage = Integer.parseInt(pageNumber); // 요청페이지 번호 (def.1) int
		 * boardSize = 10; // 페이지당 출력할 게시물 수 int startRow = boardSize * (currentPage -
		 * 1) + 1; // 시작번호 int endRow = boardSize * currentPage; // 끝번호
		 * 
		 * // 음식점 수 int foodCount = searchDao.foodCount(keyword);
		 * JejuAspect.logger.info(JejuAspect.logMsg + foodCount);
		 * 
		 * List<SearchFoodDto> foodList = new ArrayList<SearchFoodDto>(); if (foodCount
		 * > 0) { foodList = searchDao.foodList(keyword, startRow, endRow); }
		 * JejuAspect.logger.info(JejuAspect.logMsg + foodList.size());
		 * JejuAspect.logger.info(JejuAspect.logMsg + foodList.toString());
		 */
		
		// 쿠폰 수
		int couponCount = searchDao.couponCount(keyword);
		JejuAspect.logger.info(JejuAspect.logMsg + couponCount);
		
		List<SearchCouponDto> couponList = new ArrayList<SearchCouponDto>();
		if (couponCount > 0) {
			couponList = searchDao.couponList(keyword);
		}
		JejuAspect.logger.info(JejuAspect.logMsg + couponList.size());

		
		
		/*
		 * mav.addObject("currentPage", currentPage); mav.addObject("boardSize",
		 * boardSize); mav.addObject("foodCount", foodCount); mav.addObject("foodList",
		 * foodList);
		 */
		mav.addObject("couponCount", couponCount);
		mav.addObject("couponList", couponList);
		
		mav.setViewName("search/searchResult.tiles");
	}

	@Override
	public String foodList(ModelAndView mav) {

		Map<String, Object> map = mav.getModelMap();
		
		String tagValue = (String) map.get("tagValue");
		String tagType = (String) map.get("tagType");
		JejuAspect.logger.info(JejuAspect.logMsg + tagValue + " || " + tagType);
		
		List<SearchFoodDto> foodList = new ArrayList<SearchFoodDto>();
		foodList = searchDao.tagList(tagValue, tagType);
		JejuAspect.logger.info(JejuAspect.logMsg + foodList.size());

		JSONArray arr = new JSONArray();
		for(SearchFoodDto sFoodDto : foodList) {
			HashMap<String, Object> jMap = new HashMap<String, Object>();
			jMap.put("foodCode", sFoodDto.getFoodCode());
			jMap.put("foodName", sFoodDto.getFoodName());
			jMap.put("foodMenu", sFoodDto.getFoodMenu());
			jMap.put("foodKind", sFoodDto.getFoodKind());
			jMap.put("foodAddr", sFoodDto.getFoodAddr());
			jMap.put("imageName", sFoodDto.getImageName());
			jMap.put("imagePath", sFoodDto.getImagePath());
			arr.add(jMap);
			JejuAspect.logger.info(JejuAspect.logMsg + jMap.toString());
		}
		String jsonText = JSONValue.toJSONString(arr);
		JejuAspect.logger.info(JejuAspect.logMsg + "JSONtext : " + jsonText);
		
		return jsonText;
	}

	@Override
	public String keywordAuto(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		String keyword = (String) map.get("keyword");
		JejuAspect.logger.info(JejuAspect.logMsg + "keyword: " + keyword);
		
		List<SearchFoodDto> keywordList = new ArrayList<SearchFoodDto>();
		keywordList = searchDao.keywordList(keyword);
		JejuAspect.logger.info(JejuAspect.logMsg + keywordList.size());

		JSONArray arr = new JSONArray();
		for(SearchFoodDto sFoodDto : keywordList) {
			arr.add(sFoodDto.getFoodName());
		}
		String jsonText = JSONValue.toJSONString(arr);
		JejuAspect.logger.info(JejuAspect.logMsg + "JSONtext : " + jsonText);
		
		return jsonText;
	}

	@Override
	public int searchCount(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		String keyword = (String) map.get("keyword");
		String areaType = (String) map.get("areaType");
		String kindType = (String) map.get("kindType");
		JejuAspect.logger.info(JejuAspect.logMsg + keyword + "/" + areaType + "/" + kindType);
		
		String[] areaArr = null;
		String[] kindArr = null;
		if (areaType != null) {
			areaArr = areaType.split(",");
		}
		if (kindType != null) {
			kindArr = kindType.split(",");
		}
//		JejuAspect.logger.info(JejuAspect.logMsg + areaArr.length + "/" + areaArr[0].toString());
		int searchCount = searchDao.searchCount(keyword, areaArr, kindArr);
		
		return searchCount;
	}

	@Override
	public String searchResult(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		String keyword = (String) map.get("keyword");
		String currentPage = (String) map.get("currentPage");
		String orderType = (String) map.get("orderType");
		String areaType = (String) map.get("areaType");
		String kindType = (String) map.get("kindType");
		JejuAspect.logger.info(JejuAspect.logMsg + keyword + " || " + currentPage + " || " + orderType + " || " + areaType + " || " + kindType);
		
		// 검색 조건 Arr 변환
		String[] areaArr = null;
		String[] kindArr = null;
		if (areaType != null) {
			areaArr = areaType.split(",");
		}
		if (kindType != null) {
			kindArr = kindType.split(",");
		}
		
		int pageNumber = Integer.parseInt(currentPage); 		// 요청페이지 번호 (def.1)
		int boardSize = 10; 									// 페이지당 출력할 게시물 수
		int startRow = boardSize * (pageNumber - 1) + 1;		// 시작번호
		int endRow = boardSize * pageNumber;
		
		int searchCount = searchDao.searchCount(keyword, areaArr, kindArr);
		
		List<SearchFoodDto> searchResultList = new ArrayList<SearchFoodDto>();
		if (searchCount > 0) {
			searchResultList = searchDao.searchResult(keyword, orderType, areaArr, kindArr, startRow, endRow);
		}
		
		JejuAspect.logger.info(JejuAspect.logMsg + searchResultList.size());

		JSONArray arr = new JSONArray();
		for(SearchFoodDto sFoodDto : searchResultList) {
			HashMap<String, Object> jMap = new HashMap<String, Object>();
			jMap.put("foodCode", sFoodDto.getFoodCode());
			jMap.put("foodName", sFoodDto.getFoodName());
			jMap.put("foodMenu", sFoodDto.getFoodMenu());
			jMap.put("foodKind", sFoodDto.getFoodKind());
			jMap.put("foodAddr", sFoodDto.getFoodAddr());
			jMap.put("foodArea", sFoodDto.getFoodArea());
			jMap.put("foodRead", sFoodDto.getFoodRead());
			jMap.put("reviewCount", sFoodDto.getReviewCount());
			jMap.put("reviewScore", sFoodDto.getReviewScore());
			jMap.put("imageName", sFoodDto.getImageName());
			jMap.put("imagePath", sFoodDto.getImagePath());
			arr.add(jMap);
			JejuAspect.logger.info(JejuAspect.logMsg + jMap.toString());
		}
		String jsonText = JSONValue.toJSONString(arr);
		JejuAspect.logger.info(JejuAspect.logMsg + "JSONtext : " + jsonText);
		
		return jsonText;
	}
}
