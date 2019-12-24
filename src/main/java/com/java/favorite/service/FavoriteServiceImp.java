package com.java.favorite.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.JejuAspect;
import com.java.favorite.dao.FavoriteDao;

@Component
public class FavoriteServiceImp implements FavoriteService {

	@Autowired
	private FavoriteDao favoriteDao;
	
	@Override
	public int favorCheck(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		String memberCode = (String) map.get("memberCode");
		String foodCode = (String) map.get("foodCode");
		JejuAspect.logger.info(JejuAspect.logMsg + memberCode + " || " + foodCode);
		
		int check = favoriteDao.favorCheck(memberCode, foodCode);
		JejuAspect.logger.info(JejuAspect.logMsg + "favorCheck : " + check);

		return check;
	}

	@Override
	public int favorSwitch(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		String memberCode = (String) map.get("memberCode");
		String foodCode = (String) map.get("foodCode");
		String favorStatus = (String) map.get("favorStatus");
		JejuAspect.logger.info(JejuAspect.logMsg + memberCode + " || " + foodCode+ " || " + favorStatus);
		
		int check = favoriteDao.favorSwitch(memberCode, foodCode, favorStatus);
		JejuAspect.logger.info(JejuAspect.logMsg + "favorCheck : " + check);

		return check;
	}

}
