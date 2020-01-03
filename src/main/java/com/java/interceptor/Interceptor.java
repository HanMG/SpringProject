package com.java.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class Interceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
//		String requestUrl = request.getRequestURL().toString();
//		if(requestUrl.contains("/main.tiles")){
//			return true;
//		}
//		if (request.getSession().getAttribute("memberCode") != null) {
//			System.out.println("�솗�씤�슜");
//			return true;
//		} else {
//			System.out.println("�솗�씤�슜2");
//			response.sendRedirect("main.jsp");
//			return false;
//		}
		return true;
		//return super.preHandle(request, response, handler);
	}
}
