package com.java.search.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.JejuAspect;
import com.java.search.service.SearchService;


/**
 * @작업자 : 준혁
 * @작업일 : 2019. 12. 12.
 * @작업내용 : SearchController 생성
 */

@Controller
public class SearchController {
	
	@Autowired
	private SearchService searchService;

	// 음식점 리스트
	@RequestMapping(value="/food/list.go", method = RequestMethod.GET)
	public String foodList(HttpServletRequest request, HttpServletResponse response) {
		return "food/list.tiles";
	}
	
	// 인기 음식점 리스트 AJAX
	@RequestMapping(value="/searchPopularAjax.do")
	@ResponseBody
	public void searchPopularAjax(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		String jsonText = searchService.popularList(mav);
		
		if (jsonText != null) {
			response.setContentType("application/x-json;charset=utf-8");
			try {
				PrintWriter out;
				out = response.getWriter();
				out.print(jsonText);
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	// 컨텐츠 수 AJAX
	@RequestMapping(value="/countContAjax.do")
	@ResponseBody
	public void countContentsAjax(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		String jsonText = searchService.countCont(mav);
		
		if (jsonText != null) {
			response.setContentType("application/x-json;charset=utf-8");
			try {
				PrintWriter out;
				out = response.getWriter();
				out.print(jsonText);
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	// 음식점 리스트 AJAX
	@RequestMapping(value="/food/listAjax.go")
	@ResponseBody
	public void foodListAjax(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("tagType", request.getParameter("tagType"));
		mav.addObject("tagValue", request.getParameter("tagValue"));
		mav.addObject("pageNumber", request.getParameter("pageNumber"));
		mav.addObject("request", request);
		
		String jsonText = searchService.foodList(mav);
		
		if (jsonText != null) {
			response.setContentType("application/x-json;charset=utf-8");
			try {
				PrintWriter out;
				out = response.getWriter();
				out.print(jsonText);
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	// 키워드 검색
	@RequestMapping(value="/search.go", method= RequestMethod.GET)
	public ModelAndView searchKeyword(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		String keyword = request.getParameter("keyword");
		String foodKind = request.getParameter("foodKind");
		
		mav.addObject("request", request);
		mav.addObject("keyword", keyword);
		mav.addObject("foodKind", foodKind);
		
		searchService.searchKeyword(mav);
		return mav;
	}
	
	// 검색 결과 카운트 AJAX
	@RequestMapping(value = "/searchCountAjax.do")
	@ResponseBody
	public String searchCount(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("keyword", request.getParameter("keyword"));
		mav.addObject("addrType", request.getParameter("addrType"));
		mav.addObject("kindType", request.getParameter("kindType"));
		
		return Integer.toString(searchService.searchCount(mav));
	}
	
	// 검색 결과 리스트 AJAX
	@RequestMapping(value = "/searchResultAjax.do")
	@ResponseBody
	public void searchResult(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		String keyword = request.getParameter("keyword");
		String currentPage = request.getParameter("currentPage");
		String orderType = request.getParameter("orderType");
		String addrType = request.getParameter("addrType");
		String kindType = request.getParameter("kindType");

		mav.addObject("keyword", keyword);
		mav.addObject("currentPage", currentPage);
		mav.addObject("orderType", orderType);
		mav.addObject("addrType", addrType);
		mav.addObject("kindType", kindType);
		
		String jsonText = searchService.searchResult(mav);
		
		if (jsonText != null) {
			response.setContentType("application/x-json;charset=utf-8");
			try {
				PrintWriter out;
				out = response.getWriter();
				out.print(jsonText);
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
	}
	
	// 키워드 자동완성 AJAX
	@RequestMapping(value = "/searchAutoAjax.do")
	@ResponseBody
	public void searchAutoComplete(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();

		String keyword = request.getParameter("keyword");
		mav.addObject("keyword", keyword);
		JejuAspect.logger.info(JejuAspect.logMsg + "keyword: " + keyword);
		
		String jsonText = searchService.keywordAuto(mav);
		
		if (jsonText != null) {
			response.setContentType("application/x-json;charset=utf-8");
			try {
				PrintWriter out;
				out = response.getWriter();
				out.print(jsonText);
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
