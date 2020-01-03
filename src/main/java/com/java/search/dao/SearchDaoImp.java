package com.java.search.dao;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.aop.JejuAspect;
import com.java.search.dto.SearchCouponDto;
import com.java.search.dto.SearchFoodDto;

@Component
public class SearchDaoImp implements SearchDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;


	@Override
	public int foodCount(String keyword) {
		return sqlSessionTemplate.selectOne("foodCount", keyword);
	}

	@Override
	public List<SearchFoodDto> foodList(String keyword, int startRow, int endRow) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSessionTemplate.selectList("foodList", map);
	}

	@Override
	public int couponCount(String keyword) {
		return sqlSessionTemplate.selectOne("dao.mapper.SearchMapper.couponCount", keyword);
	}

	@Override
	public List<SearchCouponDto> couponList(String keyword) {
		return sqlSessionTemplate.selectList("dao.mapper.SearchMapper.couponList", keyword);

	}

	@Override
	public int tagListCount(String tagValue, String tagType) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tagValue", tagValue);
		map.put("tagType", tagType);
		return sqlSessionTemplate.selectOne("tagListCount", map);
	}
	
	@Override
	public List<SearchFoodDto> tagList(String tagValue, String tagType, int startRow, int endRow) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tagValue", tagValue);
		map.put("tagType", tagType);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSessionTemplate.selectList("tagList", map);
	}
	
	@Override
	public SearchFoodDto getReviewScore(String foodCode) {
		return sqlSessionTemplate.selectOne("getReviewScore", foodCode);
	}

	@Override
	public List<SearchFoodDto> keywordList(String keyword) {
		return sqlSessionTemplate.selectList("keywordList", keyword);
	}

	@Override
	public int searchCount(String keyword, String[] addrArr, String[] kindArr) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("addrArr", addrArr);
		map.put("kindArr", kindArr);
		return sqlSessionTemplate.selectOne("searchCount", map);
	}

	@Override
	public List<SearchFoodDto> searchResult(String keyword, String orderType, String[] addrArr, String[] kindArr,
			int startRow, int endRow) {
		JejuAspect.logger.info(JejuAspect.logMsg + Arrays.toString(kindArr));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("orderType", orderType);
		map.put("addrArr", addrArr);
		map.put("kindArr", kindArr);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSessionTemplate.selectList("searchResult", map);
	}

	@Override
	public List<SearchFoodDto> popularList() {
		return sqlSessionTemplate.selectList("popularList");
	}

	@Override
	public int countFood() {
		return sqlSessionTemplate.selectOne("countFood");
	}

	@Override
	public int countReview() {
		return sqlSessionTemplate.selectOne("countReview");
	}



}
