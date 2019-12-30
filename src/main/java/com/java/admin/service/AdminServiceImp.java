package com.java.admin.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.java.admin.dao.AdminDao;

@Component
public class AdminServiceImp implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Override
	public void adminLogin(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String adminId = request.getParameter("adminId");
		String adminPwd = request.getParameter("adminPwd");
		
		int check = adminDao.loginCheck(adminId, adminPwd);
		
		mav.addObject("check", check);
		mav.setViewName("admin/adminLoginOk.empty");
		
		
	}

}
