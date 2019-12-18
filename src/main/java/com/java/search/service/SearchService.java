package com.java.search.service;

import org.springframework.web.servlet.ModelAndView;

public interface SearchService {

	void searchKeyword(ModelAndView mav);

	void foodList(ModelAndView mav);

}
