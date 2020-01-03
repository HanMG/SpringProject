package com.java.search.service;

import org.springframework.web.servlet.ModelAndView;

public interface SearchService {

	void searchKeyword(ModelAndView mav);

	String foodList(ModelAndView mav);

	String keywordAuto(ModelAndView mav);

	int searchCount(ModelAndView mav);

	String searchResult(ModelAndView mav);

	String popularList(ModelAndView mav);

	String countCont(ModelAndView mav);

}
