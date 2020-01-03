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
		
		String keyword = (String) map.get("keyword");
		JejuAspect.logger.info(JejuAspect.logMsg + keyword);
		if (keyword == null) {
			keyword = "";
		}
		
		// 쿠폰 수
		int couponCount = searchDao.couponCount(keyword);
		JejuAspect.logger.info(JejuAspect.logMsg + couponCount);
		
		List<SearchCouponDto> couponList = new ArrayList<SearchCouponDto>();
		if (couponCount > 0) {
			couponList = searchDao.couponList(keyword);
		}
		JejuAspect.logger.info(JejuAspect.logMsg + couponList.size());

		mav.addObject("couponCount", couponCount);
		mav.addObject("couponList", couponList);
		
		mav.setViewName("search/search.tiles");
	}

	@Override
	public String foodList(ModelAndView mav) {

		Map<String, Object> map = mav.getModelMap();
		
		String tagValue = (String) map.get("tagValue");
		String tagType = (String) map.get("tagType");
		String pageNumber = (String) map.get("pageNumber");
		JejuAspect.logger.info(JejuAspect.logMsg + tagValue + " || " + tagType);
		
		int count = searchDao.tagListCount(tagValue, tagType);
		JejuAspect.logger.info(JejuAspect.logMsg + "tagListCount: " + count);
		
		if (pageNumber == null)
			pageNumber = "1";
		int currentPage = Integer.parseInt(pageNumber);
		int scrollSize = 12;
		int startRow = (currentPage - 1) * scrollSize + 1;
		int endRow = currentPage * scrollSize;
		if (endRow > count) {
			endRow = count;
		}


		List<SearchFoodDto> foodList = new ArrayList<SearchFoodDto>();
		if (count > 0 && count >= startRow) {
			foodList = searchDao.tagList(tagValue, tagType, startRow, endRow);
			JejuAspect.logger.info(JejuAspect.logMsg + foodList.size());
		}

		JSONArray arr = new JSONArray();
		for(SearchFoodDto sFoodDto : foodList) {
			HashMap<String, Object> jMap = new HashMap<String, Object>();
			jMap.put("foodCode", sFoodDto.getFoodCode());
			jMap.put("foodName", sFoodDto.getFoodName());
			jMap.put("foodMenu", sFoodDto.getFoodMenu());
			jMap.put("foodKind", sFoodDto.getFoodKind());
			jMap.put("foodAddr", sFoodDto.getFoodAddr());
			jMap.put("foodArea", sFoodDto.getFoodArea());
			jMap.put("imageName", sFoodDto.getImageName());
			jMap.put("imagePath", sFoodDto.getImagePath());
			arr.add(jMap);
//			JejuAspect.logger.info(JejuAspect.logMsg + jMap.toString());
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
		String addrType = (String) map.get("addrType");
		String kindType = (String) map.get("kindType");
		
		String[] addrArr = null;
		String[] kindArr = null;
		if (addrType != null) {
			addrArr = addrType.split(",");
		}
		if (kindType != null) {
			kindArr = kindType.split(",");
		}
		JejuAspect.logger.info(JejuAspect.logMsg + "arrLength : " + kindArr.length);
		int searchCount = searchDao.searchCount(keyword, addrArr, kindArr);
		
		return searchCount;
	}

	@Override
	public String searchResult(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		String keyword = (String) map.get("keyword");
		String currentPage = (String) map.get("currentPage");
		String orderType = (String) map.get("orderType");
		String addrType = (String) map.get("addrType");
		String kindType = (String) map.get("kindType");
		JejuAspect.logger.info(JejuAspect.logMsg + keyword + " || " + currentPage + " || " + orderType + " || " + addrType + " || " + kindType);
		
		// 검색 조건 Arr 변환
		String[] addrArr = null;
		String[] kindArr = null;
		if (addrType != null) {
			addrArr = addrType.split(",");
		}
		if (kindType != null) {
			kindArr = kindType.split(",");
		}
		
		int pageNumber = Integer.parseInt(currentPage); 		// 요청페이지 번호 (def.1)
		int boardSize = 10; 									// 페이지당 출력할 게시물 수
		int startRow = boardSize * (pageNumber - 1) + 1;		// 시작번호
		int endRow = boardSize * pageNumber;
		
		int searchCount = searchDao.searchCount(keyword, addrArr, kindArr);
		
		List<SearchFoodDto> searchResultList = new ArrayList<SearchFoodDto>();
		if (searchCount > 0) {
			searchResultList = searchDao.searchResult(keyword, orderType, addrArr, kindArr, startRow, endRow);
		}
		
		JejuAspect.logger.info(JejuAspect.logMsg + searchCount + " / " + searchResultList.size());

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
//			JejuAspect.logger.info(JejuAspect.logMsg + jMap.toString());
		}
		String jsonText = JSONValue.toJSONString(arr);
		JejuAspect.logger.info(JejuAspect.logMsg + "JSONtext : " + jsonText);
		
		return jsonText;
	}

	@Override
	public String popularList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		List<SearchFoodDto> popularList = new ArrayList<SearchFoodDto>();
		popularList = searchDao.popularList();
		
		JejuAspect.logger.info(JejuAspect.logMsg + "popularList : " + popularList.size());

		JSONArray arr = new JSONArray();
		for(SearchFoodDto sFoodDto : popularList) {
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
//			JejuAspect.logger.info(JejuAspect.logMsg + jMap.toString());
		}
		String jsonText = JSONValue.toJSONString(arr);
		JejuAspect.logger.info(JejuAspect.logMsg + "JSONtext : " + jsonText);
		
		return jsonText;
	}

	@Override
	public String countCont(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		String countFood = Integer.toString(searchDao.countFood());
		String countReview = Integer.toString(searchDao.countReview());
		
		JejuAspect.logger.info(JejuAspect.logMsg + "countFood : " + countFood + "countReview : " + countReview);

		HashMap<String, String> jMap = new HashMap<String, String>();
		jMap.put("countFood", countFood);
		jMap.put("countReview", countReview);

		String jsonText = JSONValue.toJSONString(jMap);
		JejuAspect.logger.info(JejuAspect.logMsg + "JSONtext : " + jsonText);
		
		return jsonText;
	}
}
