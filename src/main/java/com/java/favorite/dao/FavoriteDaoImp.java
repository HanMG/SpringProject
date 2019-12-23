package com.java.favorite.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class FavoriteDaoImp implements FavoriteDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int favorCheck(String memberCode, String foodCode) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberCode", memberCode);
		map.put("foodCode", foodCode);
		return sqlSessionTemplate.selectOne("favorCheck", map);
	}

	@Override
	public int favorSwitch(String memberCode, String foodCode, String favorStatus) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberCode", memberCode);
		map.put("foodCode", foodCode);
		System.out.println(favorStatus);
		int countBefore = sqlSessionTemplate.selectOne("favorCheck", map);
		if (favorStatus.equals("on") && countBefore > 0) {
			sqlSessionTemplate.delete("favorDelete", map);
		} else if (favorStatus.equals("off") && countBefore == 0) {
			sqlSessionTemplate.insert("favorInsert", map);
		}
		int countAfter = sqlSessionTemplate.selectOne("favorCheck", map);
		return countAfter;
	}

}
