package com.java.favorite.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.favorite.service.FavoriteService;


@Controller
public class FavoriteController {
	
	@Autowired
	private FavoriteService favoriteService;

	// 즐겨찾기 상태 확인
	@RequestMapping(value = "/favorite/check.do")
	@ResponseBody
	public String favorCheck(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("memberCode", request.getParameter("memberCode"));
		mav.addObject("foodCode", request.getParameter("foodCode"));
		mav.addObject("request", request);
		
		int count = favoriteService.favorCheck(mav);
		String status = "";
		if (count > 0) {
			status = "on";
		} else {
			status = "off";
		}
		return status;
	}

	// 즐겨찾기 상태 변경
	@RequestMapping(value = "/favorite/switch.do")
	@ResponseBody
	public String favorSwitch(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("memberCode", request.getParameter("memberCode"));
		mav.addObject("foodCode", request.getParameter("foodCode"));
		mav.addObject("favorStatus", request.getParameter("favorStatus"));
		mav.addObject("request", request);
		
		int count = favoriteService.favorSwitch(mav);
		String status = "";
		if (count > 0) {
			status = "on";
		} else {
			status = "off";
		}
		return status;
	}
}
