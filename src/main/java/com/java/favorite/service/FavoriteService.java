package com.java.favorite.service;

import org.springframework.web.servlet.ModelAndView;

public interface FavoriteService {

	int favorCheck(ModelAndView mav);

	int favorSwitch(ModelAndView mav);

}
