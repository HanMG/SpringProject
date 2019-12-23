package com.java.search.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
	public List<SearchFoodDto> tagList(String tagValue, String tagType) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("tagValue", tagValue);
		map.put("tagType", tagType);
		return sqlSessionTemplate.selectList("tagList", map);
	}

	@Override
	public List<SearchFoodDto> keywordList(String keyword) {
		return sqlSessionTemplate.selectList("keywordList", keyword);
	}


}
