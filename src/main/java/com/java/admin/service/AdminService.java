package com.java.admin.service;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Component
public interface AdminService {

	void adminLogin(ModelAndView mav);

}
